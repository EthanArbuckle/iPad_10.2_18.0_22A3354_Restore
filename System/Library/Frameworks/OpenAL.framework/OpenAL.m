void OALBuffer::OALBuffer(OALBuffer *this, int a2)
{
  CAGuard *v3;
  _QWORD *v4;
  char *v5;

  *(_DWORD *)this = a2;
  v3 = (OALBuffer *)((char *)this + 144);
  CAGuard::CAGuard((OALBuffer *)((char *)this + 8), "OALBuffer::SourceListGuard");
  CAGuard::CAGuard(v3, "OALBuffer::EditLock");
  *((_DWORD *)this + 70) = 0;
  *((_QWORD *)this + 36) = 0;
  *((_BYTE *)this + 296) = 0;
  *(_OWORD *)((char *)this + 300) = 0u;
  *(_OWORD *)((char *)this + 316) = 0u;
  *(_OWORD *)((char *)this + 332) = 0u;
  *(_QWORD *)((char *)this + 345) = 0;
  v4 = (_QWORD *)operator new();
  *v4 = 0;
  v4[1] = 0;
  v4[2] = 0;
  *((_QWORD *)this + 43) = v4;
  v5 = (char *)operator new(0x800uLL);
  *v4 = v5;
  v4[1] = v5;
  v4[2] = v5 + 2048;
}

void sub_215C2E648(_Unwind_Exception *a1)
{
  CAGuard *v1;

  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

void sub_215C2E65C(_Unwind_Exception *a1)
{
  CAGuard *v1;
  CAGuard *v2;

  CAGuard::~CAGuard(v2);
  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void OALBuffer::~OALBuffer(OALBuffer *this)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!*((_BYTE *)this + 296))
  {
    v2 = (void *)*((_QWORD *)this + 36);
    if (v2)
      free(v2);
  }
  v3 = *((_QWORD *)this + 43);
  if (v3)
  {
    v4 = *(void **)v3;
    if (*(_QWORD *)v3)
    {
      *(_QWORD *)(v3 + 8) = v4;
      operator delete(v4);
    }
    MEMORY[0x2199EEC7C](v3, 0x20C40960023A9);
    *((_QWORD *)this + 43) = 0;
  }
  CAGuard::~CAGuard((OALBuffer *)((char *)this + 144));
  CAGuard::~CAGuard((OALBuffer *)((char *)this + 8));
}

uint64_t OALBuffer::CanBeRemovedFromBufferMap(OALBuffer *this)
{
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  OALSource **v6;
  OALSource **v7;
  uint64_t result;

  v1 = *(_QWORD *)(*((_QWORD *)this + 43) + 8) - **((_QWORD **)this + 43);
  if ((v1 & 0xFFFFFFFF0) == 0)
    return 1;
  v3 = 0;
  v4 = (v1 >> 4);
  while (1)
  {
    v5 = (_QWORD *)*((_QWORD *)this + 43);
    v6 = (OALSource **)v5[1];
    v7 = (OALSource **)(*v5 + (v3 >> 44));
    if (v7 != v6)
    {
      if (*v7)
      {
        result = OALSource::IsSourceTransitioningToFlushQ(*v7);
        if (!(_DWORD)result)
          break;
      }
    }
    v3 += 0x1000000000000;
    if (!--v4)
    {
      if (*((_BYTE *)this + 296))
        WaitOneRenderCycle();
      return 1;
    }
  }
  return result;
}

BOOL OALBuffer::IsPurgable(OALBuffer *this)
{
  _BOOL8 result;

  if (((*(_QWORD *)(*((_QWORD *)this + 43) + 8) - **((_QWORD **)this + 43)) & 0xFFFFFFFF0) != 0)
    return 0;
  result = CAMutex::IsFree((OALBuffer *)((char *)this + 144));
  if (result)
    return *((int *)this + 70) <= 0 && *((_BYTE *)this + 352) == 0;
  return result;
}

uint64_t OALBuffer::AddAudioDataStatic(OALBuffer *this, char *a2, int a3, unsigned int a4, unsigned int a5)
{
  _QWORD *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = (_QWORD *)((char *)this + 144);
  v11 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 18) + 16))((char *)this + 144);
  if (((*(_QWORD *)(v10[25] + 8) - *(_QWORD *)v10[25]) & 0xFFFFFFFF0) != 0)
  {
    WaitOneRenderCycle();
    if (((*(_QWORD *)(*((_QWORD *)this + 43) + 8) - **((_QWORD **)this + 43)) & 0xFFFFFFFF0) != 0)
    {
      v12 = 40964;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        goto LABEL_12;
LABEL_11:
      v14 = *(unsigned int *)this;
      v16 = 136315906;
      v17 = "oalBuffer.cpp";
      v18 = 1024;
      v19 = 166;
      v20 = 2048;
      v21 = v14;
      v22 = 1024;
      v23 = v12;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d OALBuffer::AddAudioDataStatic Failed - OALBuffer = %ld, err = %d\n", (uint8_t *)&v16, 0x22u);
      goto LABEL_12;
    }
  }
  if (!IsFormatSupported(a4))
  {
    v12 = 40963;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!*((_BYTE *)this + 296))
  {
    v13 = (void *)*((_QWORD *)this + 36);
    if (v13)
    {
      free(v13);
      *((_QWORD *)this + 36) = 0;
      *((_DWORD *)this + 75) = 0;
    }
  }
  FillInASBD((uint64_t)this + 304, a4, a5);
  v12 = 0;
  *((_QWORD *)this + 36) = a2;
  *((_DWORD *)this + 75) = a3;
  *((_BYTE *)this + 296) = 1;
LABEL_12:
  if (v11)
    (*(void (**)(_QWORD *))(*v10 + 24))(v10);
  return v12;
}

void sub_215C2E9D0(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t OALBuffer::AddAudioData(OALBuffer *this, char *a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  _QWORD *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = (_QWORD *)((char *)this + 144);
  v11 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 18) + 16))((char *)this + 144);
  if (((*(_QWORD *)(v10[25] + 8) - *(_QWORD *)v10[25]) & 0xFFFFFFFF0) != 0)
  {
    WaitOneRenderCycle();
    if (((*(_QWORD *)(*((_QWORD *)this + 43) + 8) - **((_QWORD **)this + 43)) & 0xFFFFFFFF0) != 0)
      goto LABEL_9;
  }
  if (IsFormatSupported(a4))
  {
    if (*((_BYTE *)this + 296))
    {
      *((_QWORD *)this + 36) = 0;
      *((_DWORD *)this + 75) = 0;
      *((_BYTE *)this + 296) = 0;
    }
    else
    {
      v15 = (void *)*((_QWORD *)this + 36);
      if (v15)
      {
        if (*((_DWORD *)this + 75) == a3)
          goto LABEL_8;
        v12 = malloc_type_realloc(v15, a3, 0x27DF818DuLL);
LABEL_7:
        *((_QWORD *)this + 36) = v12;
        if (v12)
        {
LABEL_8:
          FillInASBD((uint64_t)this + 304, a4, a5);
          *((_DWORD *)this + 75) = a3;
          memcpy(*((void **)this + 36), a2, a3);
          v13 = 0;
          goto LABEL_11;
        }
LABEL_9:
        v13 = 40964;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        goto LABEL_10;
      }
    }
    v12 = malloc_type_malloc(a3, 0xCC039032uLL);
    goto LABEL_7;
  }
  v13 = 40963;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
LABEL_10:
    v16 = 136315650;
    v17 = "oalBuffer.cpp";
    v18 = 1024;
    v19 = 232;
    v20 = 1024;
    v21 = v13;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d OALBuffer::AddAudioData Failed - err = %d\n", (uint8_t *)&v16, 0x18u);
  }
LABEL_11:
  if (v11)
    (*(void (**)(_QWORD *))(*v10 + 24))(v10);
  return v13;
}

void sub_215C2EBF4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALBuffer::GetFrameCount(OALBuffer *this)
{
  unsigned int v1;

  v1 = *((_DWORD *)this + 80);
  if (v1)
    v1 = *((_DWORD *)this + 75) / v1;
  return *((_DWORD *)this + 81) * v1;
}

uint64_t OALBuffer::UseThisBuffer(OALBuffer *this, OALSource *a2)
{
  CAMutex *v4;
  int v5;
  char **v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v11;

  v4 = (OALBuffer *)((char *)this + 8);
  v5 = CAMutex::Lock((OALBuffer *)((char *)this + 8));
  v6 = (char **)*((_QWORD *)this + 43);
  v7 = *v6;
  v8 = v6[1];
  if (*v6 == v8)
  {
LABEL_5:
    *(_QWORD *)&v11 = a2;
    DWORD2(v11) = 1;
    AttachedSourceList::Add(v6, &v11);
  }
  else
  {
    v9 = *v6;
    while (*(OALSource **)v9 != a2)
    {
      v9 += 16;
      if (v9 == v8)
        goto LABEL_5;
    }
    while (*(OALSource **)v7 != a2)
    {
      v7 += 16;
      if (v7 == v8)
        goto LABEL_9;
    }
    ++*((_DWORD *)v7 + 2);
  }
LABEL_9:
  if (v5)
    CAMutex::Unlock(v4);
  return 0;
}

void AttachedSourceList::Add(char **a1, _OWORD *a2)
{
  unint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;

  v5 = a1[1];
  v4 = (unint64_t)a1[2];
  if ((unint64_t)v5 < v4)
  {
    *(_OWORD *)v5 = *a2;
    v6 = v5 + 16;
LABEL_3:
    a1[1] = v6;
    return;
  }
  v7 = *a1;
  v8 = (v5 - *a1) >> 4;
  v9 = v8 + 1;
  if ((unint64_t)(v8 + 1) >> 60)
    std::vector<SourceAttachedInfo>::__throw_length_error[abi:ne180100]();
  v10 = v4 - (_QWORD)v7;
  if (v10 >> 3 > v9)
    v9 = v10 >> 3;
  if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
    v11 = 0xFFFFFFFFFFFFFFFLL;
  else
    v11 = v9;
  if (v11)
  {
    if (v11 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v12 = (char *)operator new(16 * v11);
  }
  else
  {
    v12 = 0;
  }
  v13 = &v12[16 * v8];
  *(_OWORD *)v13 = *a2;
  v6 = v13 + 16;
  if (v5 != v7)
  {
    do
    {
      *((_OWORD *)v13 - 1) = *((_OWORD *)v5 - 1);
      v13 -= 16;
      v5 -= 16;
    }
    while (v5 != v7);
    v5 = *a1;
  }
  *a1 = v13;
  a1[1] = v6;
  a1[2] = &v12[16 * v11];
  if (!v5)
    goto LABEL_3;
  operator delete(v5);
  a1[1] = v6;
}

uint64_t OALBuffer::ReleaseBuffer(OALBuffer *this, OALSource *a2)
{
  CAMutex *v4;
  int v5;
  int v6;
  OALSource ***v7;
  OALSource **v8;
  OALSource **v9;
  OALSource **v10;
  OALSource **v11;
  int v12;
  uint64_t v13;
  uint64_t v15;
  OALSource **v16;
  OALSource **v17;
  int64_t v18;

  v4 = (OALBuffer *)((char *)this + 8);
  v5 = CAMutex::Lock((OALBuffer *)((char *)this + 8));
  v6 = v5;
  v7 = (OALSource ***)*((_QWORD *)this + 43);
  v9 = *v7;
  v8 = v7[1];
  if (*v7 != v8)
  {
    v10 = *v7;
    while (*v10 != a2)
    {
      v10 += 2;
      if (v10 == v8)
        goto LABEL_11;
    }
    v11 = *v7;
    while (*v11 != a2)
    {
      v11 += 2;
      if (v11 == v8)
        goto LABEL_14;
    }
    v12 = *((_DWORD *)v11 + 2) - 1;
    *((_DWORD *)v11 + 2) = v12;
    if (v12)
      goto LABEL_11;
LABEL_14:
    v15 = 0;
    while (v9[v15] != a2)
    {
      v15 += 2;
      if (&v9[v15] == v8)
      {
        v13 = 1;
        if (!v5)
          return v13;
        goto LABEL_12;
      }
    }
    v16 = &v9[v15];
    v17 = &v9[v15 + 2];
    v18 = (char *)v8 - (char *)v17;
    if (v8 != v17)
      memmove(&v9[v15], v17, (char *)v8 - (char *)v17);
    v7[1] = (OALSource **)((char *)v16 + v18);
    v13 = 1;
    if (!v6)
      return v13;
    goto LABEL_12;
  }
LABEL_11:
  v13 = 0;
  if (v5)
LABEL_12:
    CAMutex::Unlock(v4);
  return v13;
}

void std::vector<SourceAttachedInfo>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D4650B8, MEMORY[0x24BEDAAF0]);
}

void sub_215C2EF78(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void OALContext::OALContext(OALContext *this, uint64_t a2, OALDevice *a3, const int *a4, unsigned int *a5, double *a6)
{
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  _DWORD *v21;
  uint64_t v22;
  int v23;
  _QWORD *v24;
  _QWORD *v25;

  *(_QWORD *)this = a2;
  *((_BYTE *)this + 8) = 1;
  *((_QWORD *)this + 2) = a3;
  *((_DWORD *)this + 6) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  CAGuard::CAGuard((OALContext *)((char *)this + 48), "OALContext:SourceMapLock");
  *((_QWORD *)this + 23) = 0;
  CAGuard::CAGuard((OALContext *)((char *)this + 192), "OALContext:SourceMapLock");
  *((_QWORD *)this + 41) = 0x43ABA6660000D002;
  __asm { FMOV            V0.2S, #1.0 }
  *((_QWORD *)this + 42) = _D0;
  *((_DWORD *)this + 92) = 1065353216;
  *((_DWORD *)this + 99) = 0;
  *((_QWORD *)this + 50) = 0;
  *((_BYTE *)this + 408) = 1;
  *((_QWORD *)this + 52) = 0x3FF0000000000000;
  *((_QWORD *)this + 53) = 1919183983;
  v15 = *a5;
  *((_DWORD *)this + 108) = v15;
  *((_BYTE *)this + 436) = 0;
  *((double *)this + 56) = *a6;
  *((_QWORD *)this + 57) = 0x47C350003F800000;
  *((_BYTE *)this + 464) = 0;
  *((_QWORD *)this + 60) = 0;
  *(_QWORD *)((char *)this + 492) = 0xFFFFFFFF00000000;
  *(_OWORD *)((char *)this + 500) = xmmword_215C55D70;
  *((_QWORD *)this + 65) = 0;
  *((_QWORD *)this + 59) = malloc_type_calloc(1uLL, 12 * v15, 0x1000040D836D830uLL);
  if (a4)
  {
    v16 = 0;
    v17 = 0;
    v18 = 1;
    while (1)
    {
      while (1)
      {
        v19 = a4[v16];
        if (v19 <= 4111)
          break;
        if (v19 == 4112)
        {
          *((_BYTE *)this + 464) = 1;
          goto LABEL_4;
        }
        if (v19 == 4113)
        {
          *((_BYTE *)this + 464) = 1;
          v18 = a4[v16 + 1];
          v16 += 2;
        }
        else
        {
LABEL_4:
          v16 += 2;
        }
      }
      if (v19 != 4103)
      {
        if (!v19)
        {
          if (v17)
          {
            *((_DWORD *)this + 99) = v16 + 1;
            v21 = malloc_type_calloc(1uLL, 4 * (v16 + 1), 0x100004052888210uLL);
            *((_QWORD *)this + 50) = v21;
            v22 = v16;
          }
          else
          {
            *((_DWORD *)this + 99) = v16 + 3;
            v21 = malloc_type_calloc(1uLL, 4 * (v16 + 3), 0x100004052888210uLL);
            *((_QWORD *)this + 50) = v21;
            v22 = v16;
            v21[v16] = 4103;
            v21[(v16 + 1)] = (int)*((double *)this + 56);
            v21[(v16 + 2)] = 0;
          }
          memcpy(v21, a4, 4 * v22);
          goto LABEL_18;
        }
        goto LABEL_4;
      }
      v20 = a4[v16 + 1];
      if (v20 < 8000)
        goto LABEL_4;
      *((double *)this + 56) = (double)v20;
      v17 = 1;
      v16 += 2;
    }
  }
  v18 = 1;
LABEL_18:
  *((_QWORD *)this + 43) = 0;
  *((_QWORD *)this + 44) = 0;
  *((_QWORD *)this + 45) = 0;
  *(_OWORD *)((char *)this + 372) = xmmword_215C55D80;
  *(_QWORD *)((char *)this + 388) = 1065353216;
  v23 = OALContext::InitializeMixer(this, v18);
  if (!v23)
  {
    v24 = (_QWORD *)operator new();
    v24[2] = 0;
    v24[1] = 0;
    *v24 = v24 + 1;
    *((_QWORD *)this + 5) = v24;
    v25 = (_QWORD *)operator new();
    v25[2] = 0;
    v25[1] = 0;
    *v25 = v25 + 1;
    *((_QWORD *)this + 23) = v25;
  }
  *((_BYTE *)this + 488) = v23 == 0;
}

void sub_215C2F2C8(_Unwind_Exception *a1)
{
  CAGuard *v1;
  CAGuard *v2;

  CAGuard::~CAGuard(v2);
  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

uint64_t OALContext::InitializeMixer(OALContext *this, unsigned int a2)
{
  uint64_t Property;
  AudioUnit *v5;
  int DesiredRenderChannelCount;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  UInt32 v13;
  unsigned int v14;
  _OWORD v15[2];
  uint64_t v16;
  AudioComponentDescription inDescription;
  _OWORD inData[2];
  uint64_t v19;
  __int128 ioDataSize;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  LODWORD(ioDataSize) = 0;
  v19 = 0;
  memset(inData, 0, sizeof(inData));
  inDescription.componentFlagsMask = 0;
  *(_OWORD *)&inDescription.componentType = xmmword_215C55D90;
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  Property = AUGraphAddNode(*(AUGraph *)(*((_QWORD *)this + 2) + 16), &inDescription, (AUNode *)this + 6);
  if ((_DWORD)Property)
    goto LABEL_27;
  v5 = (AudioUnit *)((char *)this + 32);
  Property = AUGraphNodeInfo(*(AUGraph *)(*((_QWORD *)this + 2) + 16), *((_DWORD *)this + 6), 0, (AudioUnit *)this + 4);
  if ((_DWORD)Property)
    goto LABEL_27;
  LODWORD(ioDataSize) = 12;
  if (!AudioUnitGetProperty(*v5, 0xBC2u, 1u, 1u, (char *)&ioDataSize + 4, (UInt32 *)&ioDataSize))
    *((_QWORD *)this + 57) = *(_QWORD *)((char *)&ioDataSize + 4);
  AudioUnitGetProperty(*(AudioUnit *)(*((_QWORD *)this + 2) + 32), 8u, 2u, 0, inData, (UInt32 *)&ioDataSize);
  DesiredRenderChannelCount = OALDevice::GetDesiredRenderChannelCount(*((OALDevice **)this + 2));
  *(_OWORD *)((char *)inData + 8) = xmmword_215C55DA0;
  DWORD2(inData[1]) = 4;
  HIDWORD(inData[1]) = DesiredRenderChannelCount;
  v19 = 32;
  *(_QWORD *)&inData[0] = *((_QWORD *)this + 56);
  Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 2u, 0, inData, 0x28u);
  if ((_DWORD)Property)
    goto LABEL_27;
  v13 = 4;
  v14 = 0;
  AudioUnitGetProperty(*((AudioUnit *)this + 4), 0xEu, 0, 0, &v14, &v13);
  if (v14 < *(_DWORD *)(*((_QWORD *)this + 2) + 72))
  {
    v14 = *(_DWORD *)(*((_QWORD *)this + 2) + 72);
    Property = AudioUnitSetProperty(*v5, 0xEu, 0, 0, &v14, 4u);
    if ((_DWORD)Property)
      goto LABEL_27;
  }
  *(_QWORD *)&ioDataSize = 4;
  Property = AudioUnitGetProperty(*v5, 0xBu, 1u, 0, (char *)&ioDataSize + 4, (UInt32 *)&ioDataSize);
  if (!(_DWORD)Property)
  {
    if (*((_DWORD *)this + 108) == DWORD1(ioDataSize))
    {
      Property = 0;
    }
    else
    {
      Property = AudioUnitSetProperty(*v5, 0xBu, 1u, 0, (char *)this + 432, ioDataSize);
      if ((_DWORD)Property)
      {
        LODWORD(ioDataSize) = 4;
        AudioUnitGetProperty(*v5, 0xBu, 1u, 0, (char *)this + 432, (UInt32 *)&ioDataSize);
      }
    }
  }
  *(_QWORD *)&v15[0] = *((_QWORD *)this + 56);
  DWORD2(v15[1]) = 2;
  LODWORD(v16) = 16;
  *(_OWORD *)((char *)v15 + 8) = xmmword_215C55DB0;
  if (*((_DWORD *)this + 108))
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = v8 >= a2 ? 1 : 2;
      HIDWORD(v15[1]) = v9;
      if (AudioUnitSetProperty(*v5, 8u, 1u, v8, v15, 0x28u))
        break;
      v10 = *((_QWORD *)this + 59) + v7;
      *(_DWORD *)(v10 + 8) = HIDWORD(v15[1]);
      *(_DWORD *)v10 = -1;
      *(_BYTE *)(v10 + 4) = 0;
      ++v8;
      v7 += 12;
      if (v8 >= *((unsigned int *)this + 108))
        goto LABEL_20;
    }
  }
  else
  {
LABEL_20:
    OALContext::InitRenderQualityOnBusses(this);
  }
  if ((_DWORD)Property)
  {
LABEL_27:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)this;
      DWORD1(ioDataSize) = 136315906;
      *((_QWORD *)&ioDataSize + 1) = "oalContext.cpp";
      v21 = 1024;
      v22 = 372;
      v23 = 2048;
      v24 = v11;
      v25 = 2048;
      v26 = (int)Property;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::InitializeMixer FAILED - OALContext = %ld : result = %ld", (uint8_t *)&ioDataSize + 4, 0x26u);
    }
  }
  return Property;
}

void OALContext::~OALContext(OALContext *this)
{
  uint64_t v2;
  _QWORD *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t **v6;
  OALSource *v7;
  unsigned int Token;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  unsigned int v12;
  BOOL v13;
  uint64_t **v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  OALCaptureMixer *v20;
  void *v21;
  void *v22;

  v2 = *((_QWORD *)this + 5);
  if (v2)
  {
    v3 = (_QWORD *)(v2 + 16);
    if (*(_DWORD *)(v2 + 16))
    {
      v4 = 0;
      do
      {
        v6 = (uint64_t **)(v2 + 8);
        v5 = *(_QWORD *)v2;
        if (*(_QWORD *)v2 != v2 + 8)
        {
          v7 = *(OALSource **)(v5 + 40);
          if (v7)
          {
            Token = OALSource::GetToken(*(OALSource **)(v5 + 40));
            v9 = *v6;
            if (*v6)
            {
              v10 = v2 + 8;
              v11 = *v6;
              do
              {
                v12 = *((_DWORD *)v11 + 8);
                v13 = v12 >= Token;
                if (v12 >= Token)
                  v14 = (uint64_t **)v11;
                else
                  v14 = (uint64_t **)(v11 + 1);
                if (v13)
                  v10 = (uint64_t)v11;
                v11 = *v14;
              }
              while (*v14);
              if ((uint64_t **)v10 != v6 && *(_DWORD *)(v10 + 32) <= Token)
              {
                v15 = *(_QWORD **)(v10 + 8);
                v16 = (_QWORD *)v10;
                if (v15)
                {
                  do
                  {
                    v17 = v15;
                    v15 = (_QWORD *)*v15;
                  }
                  while (v15);
                }
                else
                {
                  do
                  {
                    v17 = (_QWORD *)v16[2];
                    v18 = *v17 == (_QWORD)v16;
                    v16 = v17;
                  }
                  while (!v18);
                }
                if (*(_QWORD *)v2 == v10)
                  *(_QWORD *)v2 = v17;
                --*v3;
                std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v9, (uint64_t *)v10);
                operator delete((void *)v10);
              }
            }
            OALSource::~OALSource(v7);
            MEMORY[0x2199EEC7C]();
            v2 = *((_QWORD *)this + 5);
          }
        }
        ++v4;
        v3 = (_QWORD *)(v2 + 16);
      }
      while (v4 < *(_DWORD *)(v2 + 16));
    }
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(v2, *(_QWORD **)(v2 + 8));
    MEMORY[0x2199EEC7C](v2, 0x1020C4062D53EE8);
    *((_QWORD *)this + 5) = 0;
  }
  if (*((_QWORD *)this + 23))
  {
    OALContext::CleanUpDeadSourceList((uint64_t)this);
    v19 = *((_QWORD *)this + 23);
    if (v19)
    {
      std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(*((_QWORD *)this + 23), *(_QWORD **)(v19 + 8));
      MEMORY[0x2199EEC7C](v19, 0x1020C4062D53EE8);
    }
    *((_QWORD *)this + 23) = 0;
  }
  v20 = (OALCaptureMixer *)*((_QWORD *)this + 65);
  if (v20)
  {
    OALCaptureMixer::~OALCaptureMixer(v20);
    MEMORY[0x2199EEC7C]();
    *((_QWORD *)this + 65) = 0;
  }
  OALDevice::RemoveContext(*((OALDevice **)this + 2), this);
  v21 = (void *)*((_QWORD *)this + 50);
  if (v21)
  {
    free(v21);
    *((_QWORD *)this + 50) = 0;
  }
  v22 = (void *)*((_QWORD *)this + 59);
  if (v22)
  {
    free(v22);
    *((_QWORD *)this + 59) = 0;
  }
  CAGuard::~CAGuard((OALContext *)((char *)this + 192));
  CAGuard::~CAGuard((OALContext *)((char *)this + 48));
}

uint64_t OALContext::CleanUpDeadSourceList(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  _QWORD *v5;
  unsigned int v6;
  unsigned int v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  unsigned int Token;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  BOOL v23;

  v1 = *(_QWORD *)(this + 184);
  if (v1 && *(_DWORD *)(v1 + 16))
  {
    v2 = this;
    v3 = 0;
    v4 = 0;
    do
    {
      while (1)
      {
        v5 = *(_QWORD **)v1;
        if (v4)
        {
          v6 = 0;
          do
          {
            v8 = (_QWORD *)(v1 + 8);
            v7 = v4;
            if (v5 != (_QWORD *)(v1 + 8))
            {
              v9 = (_QWORD *)v5[1];
              if (v9)
              {
                do
                {
                  v8 = v9;
                  v9 = (_QWORD *)*v9;
                }
                while (v9);
              }
              else
              {
                do
                {
                  v10 = v5;
                  v5 = (_QWORD *)v5[2];
                }
                while ((_QWORD *)*v5 != v10);
                v8 = v5;
              }
              v7 = v6;
            }
            v6 = v7 + 1;
            v5 = v8;
          }
          while (v7 + 1 < v4);
        }
        else
        {
          v8 = *(_QWORD **)v1;
        }
        if (v8 != (_QWORD *)(v1 + 8))
        {
          v11 = v8[5];
          if (v11)
          {
            if (*(_BYTE *)(v11 + 4))
            {
              if (!*(_DWORD *)(v11 + 72))
              {
                this = CAMutex::IsFree((CAMutex *)(v11 + 80));
                if ((_DWORD)this)
                  break;
              }
            }
          }
        }
        ++v4;
        ++v3;
        v1 = *(_QWORD *)(v2 + 184);
        if (v3 >= *(_DWORD *)(v1 + 16))
          return this;
      }
      v12 = *(_QWORD **)(v2 + 184);
      Token = OALSource::GetToken((OALSource *)v11);
      v14 = (uint64_t *)v12[1];
      if (v14)
      {
        v15 = v12 + 1;
        v16 = v12[1];
        do
        {
          v17 = *(_DWORD *)(v16 + 32);
          v18 = v17 >= Token;
          if (v17 >= Token)
            v19 = (uint64_t *)v16;
          else
            v19 = (uint64_t *)(v16 + 8);
          if (v18)
            v15 = (_QWORD *)v16;
          v16 = *v19;
        }
        while (*v19);
        if (v15 != v12 + 1 && *((_DWORD *)v15 + 8) <= Token)
        {
          v20 = (_QWORD *)v15[1];
          v21 = v15;
          if (v20)
          {
            do
            {
              v22 = v20;
              v20 = (_QWORD *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              v22 = (_QWORD *)v21[2];
              v23 = *v22 == (_QWORD)v21;
              v21 = v22;
            }
            while (!v23);
          }
          if ((_QWORD *)*v12 == v15)
            *v12 = v22;
          --v12[2];
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v14, v15);
          operator delete(v15);
        }
      }
      OALSource::~OALSource((OALSource *)v11);
      this = MEMORY[0x2199EEC7C]();
      ++v3;
      v1 = *(_QWORD *)(v2 + 184);
    }
    while (v3 < *(_DWORD *)(v1 + 16));
  }
  return this;
}

uint64_t OALContext::InitRenderQualityOnBusses(OALContext *this)
{
  int v2;
  AudioUnitElement v3;
  NSObject *v4;
  uint64_t Property;
  int v6;
  int inData;
  __int128 outData;
  __int128 v10;
  uint64_t v11;
  UInt32 ioDataSize;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  ioDataSize = 0;
  v11 = 0;
  outData = 0u;
  v10 = 0u;
  if (OALDevice::GetDesiredRenderChannelCount(*((OALDevice **)this + 2)) > 2)
  {
    *((_DWORD *)this + 107) = 3;
    if (!*((_DWORD *)this + 108))
      return 0;
    goto LABEL_10;
  }
  v2 = *((_DWORD *)this + 106);
  if (v2 == 1751412840)
  {
    *((_DWORD *)this + 107) = 1;
    if (*((_DWORD *)this + 108))
      goto LABEL_10;
    return 0;
  }
  if (v2 == 1919183983)
  {
    *((_DWORD *)this + 107) = 0;
    if (*((_DWORD *)this + 108))
      goto LABEL_10;
    return 0;
  }
  if (v2 != 1920034921)
  {
    Property = 0xFFFFFFFFLL;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      return Property;
LABEL_25:
    *(_DWORD *)buf = 136315650;
    v14 = "oalContext.cpp";
    v15 = 1024;
    v16 = 1004;
    v17 = 1024;
    v18 = Property;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::InitRenderQualityOnBusses() - Error setting kAudioUnitProperty_SpatializationAlgorithm: err= %d", buf, 0x18u);
    return Property;
  }
  *((_DWORD *)this + 107) = 2;
  if (!*((_DWORD *)this + 108))
    return 0;
LABEL_10:
  v3 = 0;
  v4 = MEMORY[0x24BDACB70];
  do
  {
    ioDataSize = 40;
    Property = AudioUnitGetProperty(*((AudioUnit *)this + 4), 8u, 1u, v3, &outData, &ioDataSize);
    if (!(_DWORD)Property)
    {
      if (HIDWORD(v10) == 2)
        v6 = 5;
      else
        v6 = *((_DWORD *)this + 107);
      inData = v6;
      Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0xBB8u, 1u, v3, &inData, 4u);
      if ((_DWORD)Property && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v14 = "oalContext.cpp";
        v15 = 1024;
        v16 = 998;
        v17 = 1024;
        v18 = v3;
        v19 = 1024;
        v20 = Property;
        _os_log_impl(&dword_215C2D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::InitRenderQualityOnBusses() - Error setting kAudioUnitProperty_SpatializationAlgorithm: bus = %d, err= %d", buf, 0x1Eu);
      }
    }
    ++v3;
  }
  while (v3 < *((_DWORD *)this + 108));
  if ((_DWORD)Property && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    goto LABEL_25;
  return Property;
}

uint64_t OALContext::ConfigureMixerFormat(AudioUnit *this)
{
  AudioUnit *v2;
  int DesiredRenderChannelCount;
  uint64_t inited;
  AudioUnit v5;
  UInt32 ioDataSize;
  _OWORD outData[2];
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AudioUnit v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  memset(outData, 0, sizeof(outData));
  ioDataSize = 40;
  v2 = this + 4;
  AudioUnitGetProperty(this[4], 8u, 2u, 0, outData, &ioDataSize);
  DesiredRenderChannelCount = OALDevice::GetDesiredRenderChannelCount(this[2]);
  *(_OWORD *)((char *)outData + 8) = xmmword_215C55DA0;
  DWORD2(outData[1]) = 4;
  HIDWORD(outData[1]) = DesiredRenderChannelCount;
  v9 = 32;
  *(_QWORD *)&outData[0] = this[56];
  inited = AudioUnitSetProperty(*v2, 8u, 2u, 0, outData, 0x28u);
  if ((_DWORD)inited || (inited = OALContext::InitRenderQualityOnBusses((OALContext *)this), (_DWORD)inited))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v5 = *this;
      *(_DWORD *)buf = 136315906;
      v11 = "oalContext.cpp";
      v12 = 1024;
      v13 = 405;
      v14 = 2048;
      v15 = v5;
      v16 = 2048;
      v17 = (int)inited;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::ConfigureMixerFormat FAILED - OALContext = %ld : result = %ld", buf, 0x26u);
    }
  }
  return inited;
}

void *OALContext::CopyAttributeList(const void **this, void *__dst)
{
  return memcpy(__dst, this[50], 4 * *((unsigned int *)this + 99));
}

uint64_t OALContext::AddSource(OALContext *this, unsigned int a2)
{
  OALSource *v4;
  int v5;
  uint64_t v6;
  uint64_t **v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  int v12;
  uint64_t result;
  __int128 v14;

  v4 = (OALSource *)operator new();
  OALSource::OALSource(v4, a2, this);
  v5 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 6) + 16))((char *)this + 48);
  v6 = *((_QWORD *)this + 5);
  v7 = (uint64_t **)(v6 + 8);
  v8 = *(_QWORD *)(v6 + 8);
  if (v8)
  {
    do
    {
      v9 = *(_DWORD *)(v8 + 32);
      v10 = v9 > a2;
      if (v9 <= a2)
        v11 = (uint64_t *)(v8 + 8);
      else
        v11 = (uint64_t *)v8;
      if (v10)
        v7 = (uint64_t **)v8;
      v8 = *v11;
    }
    while (*v11);
  }
  LODWORD(v14) = a2;
  *((_QWORD *)&v14 + 1) = v4;
  std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>((uint64_t ***)v6, v7, &v14);
  if (v5)
    (*(void (**)(char *))(*((_QWORD *)this + 6) + 24))((char *)this + 48);
  v12 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 24) + 16))((char *)this + 192);
  result = OALContext::CleanUpDeadSourceList((uint64_t)this);
  if (v12)
    return (*(uint64_t (**)(char *))(*((_QWORD *)this + 24) + 24))((char *)this + 192);
  return result;
}

void sub_215C2FFE4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::ProtectSource(OALContext *this, unsigned int a2)
{
  char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  uint64_t *v12;
  uint64_t v13;
  unsigned int *v15;
  unsigned int v16;

  v3 = (char *)this + 48;
  v4 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 6) + 16))((char *)this + 48);
  v5 = *((_QWORD *)v3 - 1);
  v8 = *(_QWORD *)(v5 + 8);
  v6 = v5 + 8;
  v7 = v8;
  if (!v8)
    goto LABEL_12;
  v9 = v6;
  do
  {
    v10 = *(_DWORD *)(v7 + 32);
    v11 = v10 >= a2;
    if (v10 >= a2)
      v12 = (uint64_t *)v7;
    else
      v12 = (uint64_t *)(v7 + 8);
    if (v11)
      v9 = v7;
    v7 = *v12;
  }
  while (*v12);
  if (v9 != v6 && *(_DWORD *)(v9 + 32) <= a2)
  {
    v13 = *(_QWORD *)(v9 + 40);
    if (v13)
    {
      v15 = (unsigned int *)(v13 + 72);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 + 1, v15));
    }
  }
  else
  {
LABEL_12:
    v13 = 0;
  }
  if (v4)
    (*(void (**)(char *))(*(_QWORD *)v3 + 24))(v3);
  return v13;
}

_QWORD *OALContext::RemoveSource(_QWORD *this, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  _QWORD *v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  uint64_t **v27;
  uint64_t v28;
  unsigned int v29;
  BOOL v30;
  uint64_t *v31;
  __int128 v32;

  v2 = this[5];
  v5 = *(_QWORD *)(v2 + 8);
  v3 = v2 + 8;
  v4 = v5;
  if (v5)
  {
    v7 = this;
    v8 = v3;
    do
    {
      v9 = *(_DWORD *)(v4 + 32);
      v10 = v9 >= a2;
      if (v9 >= a2)
        v11 = (uint64_t *)v4;
      else
        v11 = (uint64_t *)(v4 + 8);
      if (v10)
        v8 = v4;
      v4 = *v11;
    }
    while (*v11);
    if (v8 != v3 && *(_DWORD *)(v8 + 32) <= a2)
    {
      v12 = *(_QWORD *)(v8 + 40);
      if (v12)
      {
        OALSource::SetUpDeconstruction(*(OALSource **)(v8 + 40));
        v13 = (*(uint64_t (**)(_QWORD *))(v7[6] + 16))(v7 + 6);
        v14 = (_QWORD *)v7[5];
        v15 = (uint64_t *)v14[1];
        if (v15)
        {
          v16 = v14 + 1;
          v17 = v14[1];
          do
          {
            v18 = *(_DWORD *)(v17 + 32);
            v19 = v18 >= a2;
            if (v18 >= a2)
              v20 = (uint64_t *)v17;
            else
              v20 = (uint64_t *)(v17 + 8);
            if (v19)
              v16 = (_QWORD *)v17;
            v17 = *v20;
          }
          while (*v20);
          if (v16 != v14 + 1 && *((_DWORD *)v16 + 8) <= a2)
          {
            v21 = (_QWORD *)v16[1];
            if (v21)
            {
              do
              {
                v22 = v21;
                v21 = (_QWORD *)*v21;
              }
              while (v21);
            }
            else
            {
              v23 = v16;
              do
              {
                v22 = (_QWORD *)v23[2];
                v24 = *v22 == (_QWORD)v23;
                v23 = v22;
              }
              while (!v24);
            }
            if ((_QWORD *)*v14 == v16)
              *v14 = v22;
            --v14[2];
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v15, v16);
            operator delete(v16);
          }
        }
        if (v13)
          (*(void (**)(_QWORD *))(v7[6] + 24))(v7 + 6);
        v25 = (*(uint64_t (**)(_QWORD *))(v7[24] + 16))(v7 + 24);
        v26 = v7[23];
        v27 = (uint64_t **)(v26 + 8);
        v28 = *(_QWORD *)(v26 + 8);
        if (v28)
        {
          do
          {
            v29 = *(_DWORD *)(v28 + 32);
            v30 = v29 > a2;
            if (v29 <= a2)
              v31 = (uint64_t *)(v28 + 8);
            else
              v31 = (uint64_t *)v28;
            if (v30)
              v27 = (uint64_t **)v28;
            v28 = *v31;
          }
          while (*v31);
        }
        LODWORD(v32) = a2;
        *((_QWORD *)&v32 + 1) = v12;
        std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>((uint64_t ***)v26, v27, &v32);
        this = (_QWORD *)OALContext::CleanUpDeadSourceList((uint64_t)v7);
        if (v25)
          return (_QWORD *)(*(uint64_t (**)(_QWORD *))(v7[24] + 24))(v7 + 24);
      }
    }
  }
  return this;
}

void sub_215C302C8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::ConnectMixerToDevice(OALDevice **this)
{
  uint64_t v2;
  OALDevice *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  OALDevice *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = OALDevice::ConnectContext(this[2], (OALContext *)this);
  if ((_DWORD)v2
    || (v2 = AUGraphAddRenderNotify(*((AUGraph *)this[2] + 2), (AURenderCallback)OALContext::ContextNotificationProc, this), (_DWORD)v2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v3 = *this;
      v5 = 136315906;
      v6 = "oalContext.cpp";
      v7 = 1024;
      v8 = 573;
      v9 = 2048;
      v10 = v3;
      v11 = 2048;
      v12 = (int)v2;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::ConnectMixerToDevice FAILED - OALContext = %ld : result = %ld", (uint8_t *)&v5, 0x26u);
    }
  }
  return v2;
}

uint64_t OALContext::ContextNotificationProc(OALContext *this, _DWORD *a2, unsigned int *a3, const AudioTimeStamp *a4, unsigned int a5, unsigned int a6, AudioBufferList *a7)
{
  if ((*a2 & 4) != 0)
  {
    *((_QWORD *)this + 60) = pthread_self();
    return 0;
  }
  else
  {
    if ((*a2 & 8) != 0)
      OALContext::DoPostRender(this);
    return 0;
  }
}

uint64_t OALContext::DisconnectMixerFromDevice(OALContext *this)
{
  uint64_t v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OALDevice::DisconnectContext(*((_QWORD *)this + 2), this);
  v2 = AUGraphRemoveRenderNotify(*(AUGraph *)(*((_QWORD *)this + 2) + 16), (AURenderCallback)OALContext::ContextNotificationProc, this);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "oalContext.cpp";
    v6 = 1024;
    v7 = 584;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::DisconnectMixerFromDevice : Disconnecting now", (uint8_t *)&v4, 0x12u);
  }
  return v2;
}

uint64_t OALContext::SetDistanceModel(uint64_t this, int a2)
{
  uint64_t v3;
  int v4;
  AudioUnitElement v5;
  AudioUnitElement v6;
  AudioUnitElement v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  int inData;

  if (*(_DWORD *)(this + 328) != a2)
  {
    v3 = this;
    inData = 0;
    if ((a2 - 53249) > 5)
    {
      if (!a2)
        *(_BYTE *)(this + 408) = 0;
    }
    else
    {
      v4 = 1 << (a2 - 1);
      if ((v4 & 3) != 0)
      {
        *(_BYTE *)(this + 408) = 1;
        inData = 2;
        if (*(_DWORD *)(this + 432))
        {
          v6 = 0;
          do
            this = AudioUnitSetProperty(*(AudioUnit *)(v3 + 32), 0xBC5u, 1u, v6++, &inData, 4u);
          while (v6 < *(_DWORD *)(v3 + 432));
        }
      }
      else if ((v4 & 0xC) != 0)
      {
        *(_BYTE *)(this + 408) = 1;
        inData = 3;
        if (*(_DWORD *)(this + 432))
        {
          v5 = 0;
          do
            this = AudioUnitSetProperty(*(AudioUnit *)(v3 + 32), 0xBC5u, 1u, v5++, &inData, 4u);
          while (v5 < *(_DWORD *)(v3 + 432));
        }
      }
      else
      {
        *(_BYTE *)(this + 408) = 1;
        inData = 1;
        if (*(_DWORD *)(this + 432))
        {
          v7 = 0;
          do
            this = AudioUnitSetProperty(*(AudioUnit *)(v3 + 32), 0xBC5u, 1u, v7++, &inData, 4u);
          while (v7 < *(_DWORD *)(v3 + 432));
        }
      }
    }
    *(_DWORD *)(v3 + 328) = a2;
    if (*(_QWORD *)(v3 + 40))
    {
      v9 = *(_QWORD *)(v3 + 48);
      v8 = v3 + 48;
      this = (*(uint64_t (**)(uint64_t))(v9 + 16))(v8);
      v10 = this;
      v11 = *(_QWORD **)(v8 - 8);
      v14 = (_QWORD *)*v11;
      v12 = v11 + 1;
      v13 = v14;
      if (v14 != v12)
      {
        do
        {
          this = OALSource::SetChannelParameters((OALSource *)v13[5]);
          v15 = (_QWORD *)v13[1];
          if (v15)
          {
            do
            {
              v16 = v15;
              v15 = (_QWORD *)*v15;
            }
            while (v15);
          }
          else
          {
            do
            {
              v16 = (_QWORD *)v13[2];
              v17 = *v16 == (_QWORD)v13;
              v13 = v16;
            }
            while (!v17);
          }
          v13 = v16;
        }
        while (v16 != v12);
      }
      if (v10)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
    }
  }
  return this;
}

void sub_215C30700(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

_QWORD *OALSourceMap::MarkAllSourcesForRecalculation(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  BOOL v5;

  v1 = this + 1;
  v2 = (_QWORD *)*this;
  if ((_QWORD *)*this != this + 1)
  {
    do
    {
      this = (_QWORD *)OALSource::SetChannelParameters((OALSource *)v2[5]);
      v3 = (_QWORD *)v2[1];
      if (v3)
      {
        do
        {
          v4 = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          v4 = (_QWORD *)v2[2];
          v5 = *v4 == (_QWORD)v2;
          v2 = v4;
        }
        while (!v5);
      }
      v2 = v4;
    }
    while (v4 != v1);
  }
  return this;
}

uint64_t OALContext::SetDopplerFactor(uint64_t this, float a2)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;

  if (*(float *)(this + 336) != a2)
  {
    *(float *)(this + 336) = a2;
    if (*(_QWORD *)(this + 40))
    {
      v2 = this + 48;
      this = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(this + 48) + 16))(this + 48);
      v3 = this;
      v4 = *(_QWORD **)(v2 - 8);
      v7 = (_QWORD *)*v4;
      v5 = v4 + 1;
      v6 = v7;
      if (v7 != v5)
      {
        do
        {
          this = OALSource::SetChannelParameters((OALSource *)v6[5]);
          v8 = (_QWORD *)v6[1];
          if (v8)
          {
            do
            {
              v9 = v8;
              v8 = (_QWORD *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              v9 = (_QWORD *)v6[2];
              v10 = *v9 == (_QWORD)v6;
              v6 = v9;
            }
            while (!v10);
          }
          v6 = v9;
        }
        while (v9 != v5);
      }
      if (v3)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return this;
}

void sub_215C3084C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::SetDopplerVelocity(uint64_t this, float a2)
{
  if (*(float *)(this + 340) != a2)
    *(float *)(this + 340) = a2;
  return this;
}

uint64_t OALContext::SetSpeedOfSound(uint64_t this, float a2)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;

  if (*(float *)(this + 332) != a2)
  {
    *(float *)(this + 332) = a2;
    if (*(_QWORD *)(this + 40))
    {
      v2 = this + 48;
      this = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(this + 48) + 16))(this + 48);
      v3 = this;
      v4 = *(_QWORD **)(v2 - 8);
      v7 = (_QWORD *)*v4;
      v5 = v4 + 1;
      v6 = v7;
      if (v7 != v5)
      {
        do
        {
          this = OALSource::SetChannelParameters((OALSource *)v6[5]);
          v8 = (_QWORD *)v6[1];
          if (v8)
          {
            do
            {
              v9 = v8;
              v8 = (_QWORD *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              v9 = (_QWORD *)v6[2];
              v10 = *v9 == (_QWORD)v6;
              v6 = v9;
            }
            while (!v10);
          }
          v6 = v9;
        }
        while (v9 != v5);
      }
      if (v3)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return this;
}

void sub_215C30940(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::SetListenerGain(OALContext *this, float a2)
{
  float v3;

  if (*((float *)this + 92) != a2)
  {
    *((float *)this + 92) = a2;
    v3 = log10f(a2);
    AudioUnitSetParameter(*((AudioUnit *)this + 4), 3u, 2u, 0, v3 * 20.0, 0);
  }
  return 0;
}

uint64_t OALContext::GetSourceCount(OALContext *this)
{
  char *v1;
  int v2;
  uint64_t v3;

  if (!*((_QWORD *)this + 5))
    return 0;
  v1 = (char *)this + 48;
  v2 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 6) + 16))((char *)this + 48);
  v3 = *(unsigned int *)(*((_QWORD *)v1 - 1) + 16);
  if (v2)
    (*(void (**)(char *))(*(_QWORD *)v1 + 24))(v1);
  return v3;
}

uint64_t OALContext::SetListenerPosition(OALContext *this, float a2, float a3, float a4)
{
  char *v4;
  int v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;

  if (*((float *)this + 86) != a2 || *((float *)this + 87) != a3 || *((float *)this + 88) != a4)
  {
    *((float *)this + 86) = a2;
    *((float *)this + 87) = a3;
    *((float *)this + 88) = a4;
    if (*((_QWORD *)this + 5))
    {
      v4 = (char *)this + 48;
      v5 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 6) + 16))((char *)this + 48);
      v6 = (_QWORD *)*((_QWORD *)v4 - 1);
      v9 = (_QWORD *)*v6;
      v7 = v6 + 1;
      v8 = v9;
      if (v9 != v7)
      {
        do
        {
          OALSource::SetChannelParameters((OALSource *)v8[5]);
          v11 = (_QWORD *)v8[1];
          if (v11)
          {
            do
            {
              v12 = v11;
              v11 = (_QWORD *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              v12 = (_QWORD *)v8[2];
              v13 = *v12 == (_QWORD)v8;
              v8 = v12;
            }
            while (!v13);
          }
          v8 = v12;
        }
        while (v12 != v7);
      }
      if (v5)
        (*(void (**)(char *))(*(_QWORD *)v4 + 24))(v4);
    }
  }
  return 0;
}

void sub_215C30B24(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::SetListenerVelocity(OALContext *this, float a2, float a3, float a4)
{
  char *v4;
  int v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;

  *((float *)this + 89) = a2;
  *((float *)this + 90) = a3;
  *((float *)this + 91) = a4;
  if (*((_QWORD *)this + 5))
  {
    v4 = (char *)this + 48;
    v5 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 6) + 16))((char *)this + 48);
    v6 = (_QWORD *)*((_QWORD *)v4 - 1);
    v9 = (_QWORD *)*v6;
    v7 = v6 + 1;
    v8 = v9;
    if (v9 != v7)
    {
      do
      {
        OALSource::SetChannelParameters((OALSource *)v8[5]);
        v11 = (_QWORD *)v8[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v8[2];
            v13 = *v12 == (_QWORD)v8;
            v8 = v12;
          }
          while (!v13);
        }
        v8 = v12;
      }
      while (v12 != v7);
    }
    if (v5)
      (*(void (**)(char *))(*(_QWORD *)v4 + 24))(v4);
  }
  return 0;
}

void sub_215C30C04(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::SetListenerOrientation(OALContext *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  char *v7;
  int v8;

  if (*((float *)this + 93) != a2
    || *((float *)this + 94) != a3
    || *((float *)this + 95) != a4
    || *((float *)this + 96) != a5
    || *((float *)this + 97) != a6
    || *((float *)this + 98) != a7)
  {
    *((float *)this + 93) = a2;
    *((float *)this + 94) = a3;
    *((float *)this + 95) = a4;
    *((float *)this + 96) = a5;
    *((float *)this + 97) = a6;
    *((float *)this + 98) = a7;
    if (*((_QWORD *)this + 5))
    {
      v7 = (char *)this + 48;
      v8 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 6) + 16))((char *)this + 48);
      OALSourceMap::MarkAllSourcesForRecalculation(*((_QWORD **)v7 - 1));
      if (v8)
        (*(void (**)(char *))(*(_QWORD *)v7 + 24))(v7);
    }
  }
  return 0;
}

void sub_215C30D04(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::SetBusAzimuth(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 0, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusElevation(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 1u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusDistance(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 2u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusInputGain(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 3u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusMinGain(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 6u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusMaxGain(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 7u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusPlaybackRate(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 4u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusEnable(AudioUnit *this, AudioUnitElement inElement, int a3)
{
  float v3;

  v3 = 0.0;
  if (a3)
    v3 = 1.0;
  return AudioUnitSetParameter(this[4], 5u, 1u, inElement, v3, 0);
}

uint64_t OALContext::SetBusDistanceParams(AudioUnit *this, AudioUnitElement inElement, const MixerDistanceParams *inData)
{
  return AudioUnitSetProperty(this[4], 0xBC2u, 1u, inElement, inData, 0xCu);
}

uint64_t OALContext::SetBusFormat(uint64_t a1, AudioUnitElement inElement, void *inData)
{
  return AudioUnitSetProperty(*(AudioUnit *)(a1 + 32), 8u, 1u, inElement, inData, 0x28u);
}

uint64_t OALContext::SetBusRenderProc(AudioUnit *this, AudioUnitElement inElement, const AURenderCallbackStruct *inData)
{
  return AudioUnitSetProperty(this[4], 0x17u, 1u, inElement, inData, 0x10u);
}

uint64_t OALContext::SetMixerOutputFormat(uint64_t a1, void *inData)
{
  return AudioUnitSetProperty(*(AudioUnit *)(a1 + 32), 8u, 2u, 0, inData, 0x28u);
}

uint64_t OALContext::GetBusDistanceParams(AudioUnit *this, AudioUnitElement inElement, MixerDistanceParams *outData)
{
  UInt32 ioDataSize;

  ioDataSize = 12;
  return AudioUnitGetProperty(this[4], 0xBC2u, 1u, inElement, outData, &ioDataSize);
}

uint64_t OALContext::GetBusFormat(uint64_t a1, AudioUnitElement inElement, void *outData)
{
  UInt32 ioDataSize;

  ioDataSize = 40;
  return AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 8u, 1u, inElement, outData, &ioDataSize);
}

uint64_t OALContext::InitRenderQualityOnSources(OALContext *this)
{
  _DWORD *v1;
  unsigned int v3;
  char *v4;
  OALSource *v5;
  unsigned int Token;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;

  v1 = (_DWORD *)*((_QWORD *)this + 5);
  if (v1 && v1[4])
  {
    v3 = 0;
    v4 = (char *)this + 48;
    do
    {
      if (*(_DWORD **)v1 != v1 + 2)
      {
        v5 = *(OALSource **)(*(_QWORD *)v1 + 40);
        if (v5)
        {
          Token = OALSource::GetToken(*(OALSource **)(*(_QWORD *)v1 + 40));
          v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 6) + 16))(v4);
          v8 = *((_QWORD *)this + 5);
          v11 = *(_QWORD *)(v8 + 8);
          v9 = v8 + 8;
          v10 = v11;
          if (v11)
          {
            v12 = v9;
            do
            {
              v13 = *(_DWORD *)(v10 + 32);
              v14 = v13 >= Token;
              if (v13 >= Token)
                v15 = (uint64_t *)v10;
              else
                v15 = (uint64_t *)(v10 + 8);
              if (v14)
                v12 = v10;
              v10 = *v15;
            }
            while (*v15);
            if (v12 != v9 && *(_DWORD *)(v12 + 32) <= Token)
            {
              v16 = *(_QWORD *)(v12 + 40);
              if (v16)
              {
                v17 = (unsigned int *)(v16 + 72);
                do
                  v18 = __ldaxr(v17);
                while (__stlxr(v18 + 1, v17));
              }
            }
          }
          if (v7)
            (*(void (**)(char *))(*(_QWORD *)v4 + 24))(v4);
          OALSource::SetRenderQuality(v5, *((_DWORD *)this + 106));
          v19 = (unsigned int *)((char *)v5 + 72);
          do
            v20 = __ldaxr(v19);
          while (__stlxr(v20 - 1, v19));
          v1 = (_DWORD *)*((_QWORD *)this + 5);
        }
      }
      ++v3;
    }
    while (v3 < v1[4]);
  }
  return 0;
}

OALContext *OALContext::SetRenderQuality(OALContext *this, unsigned int a2)
{
  OALContext *v3;
  uint64_t v4;
  _DWORD *exception;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)this + 106) != a2)
  {
    v3 = this;
    if (!IsValidRenderQuality(a2))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v4 = *(_QWORD *)v3;
        v6 = 136315906;
        v7 = "oalContext.cpp";
        v8 = 1024;
        v9 = 1040;
        v10 = 2048;
        v11 = v4;
        v12 = 2048;
        v13 = a2;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::SetRenderQuality() - Error: Invalid Render Quality Requested - OALContext:inRenderQuality = %ld:%ld", (uint8_t *)&v6, 0x26u);
      }
      exception = __cxa_allocate_exception(4uLL);
      *exception = 40963;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
    *((_DWORD *)v3 + 106) = a2;
    OALContext::InitRenderQualityOnBusses(v3);
    return (OALContext *)OALContext::InitRenderQualityOnSources(v3);
  }
  return this;
}

uint64_t OALContext::SetSourceDesiredRenderQualityOnBus(AudioUnit *this, int a2, AudioUnitElement a3)
{
  AudioUnit v7;
  OSStatus Property;
  int v9;
  NSObject *i;
  UInt32 ioDataSize;
  __int128 outData;
  __int128 v13;
  uint64_t v14;
  int inData;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  AudioUnitElement v21;
  __int16 v22;
  OSStatus v23;
  __int16 v24;
  AudioUnitElement v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (OALDevice::GetDesiredRenderChannelCount(this[2]) <= 2)
  {
    inData = -1;
    v14 = 0;
    outData = 0u;
    v13 = 0u;
    ioDataSize = 40;
    if (IsValidRenderQuality(a2))
    {
      if (a2 == 1751412840)
      {
        v9 = 1;
      }
      else
      {
        if (a2 != 1920034921)
        {
          if (a2 == 1919183983)
          {
            inData = 0;
LABEL_14:
            Property = AudioUnitGetProperty(this[4], 8u, 1u, a3, &outData, &ioDataSize);
            if (!Property)
            {
              if (HIDWORD(v13) != 1)
                return 0;
              Property = AudioUnitSetProperty(this[4], 0xBB8u, 1u, a3, &inData, 4u);
              if (!Property)
                return 0;
            }
LABEL_15:
            for (i = MEMORY[0x24BDACB70];
                  ;
                  _os_log_impl(&dword_215C2D000, i, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::SetSourceDesiredRenderQualityOnBus() - Error setting kAudioUnitProperty_SpatializationAlgorithm: bus = %d, err = %d", buf, 0x1Eu))
            {
              while (!os_log_type_enabled(i, OS_LOG_TYPE_DEBUG))
                ;
              *(_DWORD *)buf = 136315906;
              v17 = "oalContext.cpp";
              v18 = 1024;
              v19 = 1110;
              v20 = 1024;
              v21 = a3;
              v22 = 1024;
              v23 = Property;
            }
          }
LABEL_10:
          Property = -50;
          goto LABEL_15;
        }
        v9 = 2;
      }
      inData = v9;
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v7 = *this;
      *(_DWORD *)buf = 136316162;
      v17 = "oalContext.cpp";
      v18 = 1024;
      v19 = 1070;
      v20 = 1024;
      v21 = v7;
      v22 = 1024;
      v23 = a2;
      v24 = 1024;
      v25 = a3;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::SetSourceDesiredRenderQualityOnBus() - Error: Invalid Render Quality Requested - OALContext:inRenderQuality:inBus = %d:%d:%d", buf, 0x24u);
    }
    goto LABEL_10;
  }
  return 0;
}

uint64_t OALContext::GetAvailableMonoBus(OALContext *this, int a2)
{
  uint64_t v2;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  _DWORD *v9;
  int inData;
  _BYTE buf[24];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *((unsigned int *)this + 108);
  if (!(_DWORD)v2)
    goto LABEL_12;
  v5 = 0;
  v6 = (_DWORD *)*((_QWORD *)this + 59);
  do
  {
    if (*v6 == -1 && v6[2] == 1)
    {
      *v6 = a2;
LABEL_7:
      AudioUnitSetParameter(*((AudioUnit *)this + 4), 5u, 1u, v5, 1.0, 0);
      return v5;
    }
    ++v5;
    v6 += 3;
  }
  while (v2 != v5);
  if (*((_BYTE *)this + 464))
  {
LABEL_12:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "oalContext.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1220;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::GetAvailableMonoBus: COULD NOT GET A MONO BUS", buf, 0x12u);
    }
  }
  else
  {
    v7 = 0;
    v5 = 0;
    while (*(_DWORD *)(*((_QWORD *)this + 59) + v7) != -1)
    {
      v5 = (v5 + 1);
      v7 += 12;
      if ((_DWORD)v2 == (_DWORD)v5)
        goto LABEL_12;
    }
    v13 = 0;
    *(_QWORD *)buf = *((_QWORD *)this + 56);
    *(_OWORD *)&buf[8] = xmmword_215C55DC0;
    v12 = 0x100000002;
    LODWORD(v13) = 16;
    if (!AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 1u, v5, buf, 0x28u))
    {
      v9 = (_DWORD *)(*((_QWORD *)this + 59) + v7);
      *v9 = a2;
      v9[2] = 1;
      AudioUnitSetProperty(*((AudioUnit *)this + 4), 0xBB8u, 1u, v5, (char *)this + 428, 4u);
      inData = 4;
      AudioUnitSetProperty(*((AudioUnit *)this + 4), 0xBBBu, 1u, v5, &inData, 4u);
      goto LABEL_7;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t OALContext::GetAvailableStereoBus(OALContext *this, int a2)
{
  uint64_t v2;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  _DWORD *v9;
  int inData;
  _BYTE buf[24];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *((unsigned int *)this + 108);
  if (!(_DWORD)v2)
    goto LABEL_12;
  v5 = 0;
  v6 = (_DWORD *)*((_QWORD *)this + 59);
  do
  {
    if (*v6 == -1 && v6[2] == 2)
    {
      *v6 = a2;
LABEL_7:
      AudioUnitSetParameter(*((AudioUnit *)this + 4), 5u, 1u, v5, 1.0, 0);
      return v5;
    }
    ++v5;
    v6 += 3;
  }
  while (v2 != v5);
  if (*((_BYTE *)this + 464))
  {
LABEL_12:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "oalContext.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1291;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: GetAvailableStereoBus: COULD NOT GET A STEREO BUS", buf, 0x12u);
    }
  }
  else
  {
    v7 = 0;
    v5 = 0;
    while (*(_DWORD *)(*((_QWORD *)this + 59) + v7) != -1)
    {
      v5 = (v5 + 1);
      v7 += 12;
      if ((_DWORD)v2 == (_DWORD)v5)
        goto LABEL_12;
    }
    v13 = 0;
    *(_QWORD *)buf = *((_QWORD *)this + 56);
    *(_OWORD *)&buf[8] = xmmword_215C55DB0;
    v12 = 0x200000002;
    LODWORD(v13) = 16;
    if (!AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 1u, v5, buf, 0x28u))
    {
      v9 = (_DWORD *)(*((_QWORD *)this + 59) + v7);
      *v9 = a2;
      v9[2] = 2;
      inData = 5;
      AudioUnitSetProperty(*((AudioUnit *)this + 4), 0xBB8u, 1u, v5, &inData, 4u);
      goto LABEL_7;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t OALContext::SetBusAsAvailable(uint64_t this, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 472) + 12 * a2;
  *(_DWORD *)v2 = -1;
  *(_BYTE *)(v2 + 4) = 0;
  return this;
}

uint64_t OALContext::SetBusNeedsPostRender(uint64_t this, unsigned int a2, int a3)
{
  if (*(_DWORD *)(this + 432) > a2)
  {
    *(_BYTE *)(*(_QWORD *)(this + 472) + 12 * a2 + 4) = a3;
    if (a3)
      *(_BYTE *)(this + 436) = 1;
  }
  return this;
}

uint64_t OALContext::DoPostRender(OALContext *this)
{
  unint64_t v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;
  uint64_t *v15;
  unsigned int *v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  BOOL v25;
  uint64_t *v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int *v31;
  unsigned int v32;
  __int16 v34;

  if (*((_BYTE *)this + 436))
  {
    *((_BYTE *)this + 436) = 0;
    v2 = *((unsigned int *)this + 108);
    if ((_DWORD)v2)
    {
      v3 = 0;
      v4 = (char *)this + 48;
      do
      {
        v5 = *((_QWORD *)this + 59);
        if (*(_BYTE *)(v5 + 12 * v3 + 4))
        {
          v6 = *(_DWORD *)(v5 + 12 * v3);
          v34 = 0;
          v7 = (*(uint64_t (**)(char *, __int16 *))(*(_QWORD *)v4 + 32))((char *)this + 48, &v34);
          HIBYTE(v34) = v7;
          if (!v7)
            goto LABEL_18;
          v8 = *((_QWORD *)this + 5);
          v11 = *(_QWORD *)(v8 + 8);
          v9 = v8 + 8;
          v10 = v11;
          if (!v11)
            goto LABEL_18;
          v12 = v9;
          do
          {
            v13 = *(_DWORD *)(v10 + 32);
            v14 = v13 >= v6;
            if (v13 >= v6)
              v15 = (uint64_t *)v10;
            else
              v15 = (uint64_t *)(v10 + 8);
            if (v14)
              v12 = v10;
            v10 = *v15;
          }
          while (*v15);
          if (v12 != v9 && *(_DWORD *)(v12 + 32) <= v6)
          {
            v16 = *(unsigned int **)(v12 + 40);
            if (v16)
            {
              v29 = v16 + 18;
              do
                v30 = __ldaxr(v29);
              while (__stlxr(v30 + 1, v29));
            }
          }
          else
          {
LABEL_18:
            v16 = 0;
          }
          if ((_BYTE)v34)
            (*(void (**)(char *))(*((_QWORD *)this + 6) + 24))((char *)this + 48);
          if (!v16)
          {
            v17 = *(_DWORD *)(*((_QWORD *)this + 59) + 12 * v3);
            v34 = 0;
            v18 = (*(uint64_t (**)(char *, __int16 *))(*((_QWORD *)this + 24) + 32))((char *)this + 192, &v34);
            HIBYTE(v34) = v18;
            if (!v18)
              goto LABEL_34;
            v19 = *((_QWORD *)this + 23);
            v22 = *(_QWORD *)(v19 + 8);
            v20 = v19 + 8;
            v21 = v22;
            if (!v22)
              goto LABEL_34;
            v23 = v20;
            do
            {
              v24 = *(_DWORD *)(v21 + 32);
              v25 = v24 >= v17;
              if (v24 >= v17)
                v26 = (uint64_t *)v21;
              else
                v26 = (uint64_t *)(v21 + 8);
              if (v25)
                v23 = v21;
              v21 = *v26;
            }
            while (*v26);
            if (v23 != v20 && *(_DWORD *)(v23 + 32) <= v17)
            {
              v16 = *(unsigned int **)(v23 + 40);
              if (v16)
              {
                v31 = v16 + 18;
                do
                  v32 = __ldaxr(v31);
                while (__stlxr(v32 + 1, v31));
              }
            }
            else
            {
LABEL_34:
              v16 = 0;
            }
            if ((_BYTE)v34)
              (*(void (**)(char *))(*((_QWORD *)this + 24) + 24))((char *)this + 192);
            if (!v16)
              return 0;
            OALSource::ClearMessageQueue(v16);
            OALSource::AddPlaybackMessage((OALSource *)v16, 9, 0, 0);
          }
          OALSource::DoPostRender((OALSource *)v16);
          v27 = v16 + 18;
          do
            v28 = __ldaxr(v27);
          while (__stlxr(v28 - 1, v27));
          v2 = *((unsigned int *)this + 108);
        }
        ++v3;
      }
      while (v3 < v2);
    }
  }
  return 0;
}

uint64_t OALContext::SetReverbRoomType(uint64_t this, int a2)
{
  int v2;
  _DWORD *exception;

  if (*(_DWORD *)(this + 496) != a2)
  {
    *(_DWORD *)(this + 496) = a2;
    this = AudioUnitSetProperty(*(AudioUnit *)(this + 32), 0xAu, 0, 0, (const void *)(this + 496), 4u);
    if ((_DWORD)this)
    {
      v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      *exception = v2;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
  }
  return this;
}

uint64_t OALContext::SetReverbLevel(uint64_t this, AudioUnitParameterValue a2)
{
  int v2;
  _DWORD *exception;

  if (*(float *)(this + 500) != a2)
  {
    *(AudioUnitParameterValue *)(this + 500) = a2;
    this = AudioUnitSetParameter(*(AudioUnit *)(this + 32), 9u, 0, 0, a2, 0);
    if ((_DWORD)this)
    {
      v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      *exception = v2;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
  }
  return this;
}

void OALContext::SetReverbState(OALContext *this, int a2)
{
  _DWORD *v3;
  OSStatus v4;
  OSStatus v5;
  OSStatus v6;
  OSStatus v7;
  _DWORD *exception;
  int inData;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  OSStatus v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)this + 123) != a2)
  {
    v3 = (_DWORD *)((char *)this + 492);
    *((_DWORD *)this + 123) = a2;
    v4 = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x3EDu, 0, 0, (char *)this + 492, 4u);
    if (v4)
    {
      v7 = v4;
      exception = __cxa_allocate_exception(4uLL);
      *exception = v7;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
    if (*v3 == 1)
    {
      inData = 1;
      v5 = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x11F8u, 0, 0, &inData, 4u);
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v11 = "oalContext.cpp";
          v12 = 1024;
          v13 = 1521;
          v14 = 1024;
          v15 = v6;
          _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d Could not enable old 3D mixer reverb behavior, %d", buf, 0x18u);
        }
      }
    }
  }
}

uint64_t OALContext::SetReverbEQGain(uint64_t this, AudioUnitParameterValue a2)
{
  int v2;
  _DWORD *exception;

  if (*(float *)(this + 504) != a2)
  {
    *(AudioUnitParameterValue *)(this + 504) = a2;
    this = AudioUnitSetParameter(*(AudioUnit *)(this + 32), 0x10u, 0, 0, a2, 0);
    if ((_DWORD)this)
    {
      v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      *exception = v2;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
  }
  return this;
}

uint64_t OALContext::SetReverbEQBandwidth(uint64_t this, AudioUnitParameterValue a2)
{
  int v2;
  _DWORD *exception;

  if (*(float *)(this + 508) != a2)
  {
    *(AudioUnitParameterValue *)(this + 508) = a2;
    this = AudioUnitSetParameter(*(AudioUnit *)(this + 32), 0xFu, 0, 0, a2, 0);
    if ((_DWORD)this)
    {
      v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      *exception = v2;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
  }
  return this;
}

uint64_t OALContext::SetReverbEQFrequency(uint64_t this, AudioUnitParameterValue a2)
{
  int v2;
  _DWORD *exception;

  if (*(float *)(this + 512) != a2)
  {
    *(AudioUnitParameterValue *)(this + 512) = a2;
    this = AudioUnitSetParameter(*(AudioUnit *)(this + 32), 0xEu, 0, 0, a2, 0);
    if ((_DWORD)this)
    {
      v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      *exception = v2;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
  }
  return this;
}

float OALContext::GetReverbEQGain(OALContext *this)
{
  char *v1;
  OSStatus Parameter;
  float result;

  v1 = (char *)this + 504;
  Parameter = AudioUnitGetParameter(*((AudioUnit *)this + 4), 0x10u, 0, 0, (AudioUnitParameterValue *)this + 126);
  result = 0.0;
  if (!Parameter)
    return *(float *)v1;
  return result;
}

float OALContext::GetReverbEQBandwidth(OALContext *this)
{
  char *v1;
  OSStatus Parameter;
  float result;

  v1 = (char *)this + 508;
  Parameter = AudioUnitGetParameter(*((AudioUnit *)this + 4), 0xFu, 0, 0, (AudioUnitParameterValue *)this + 127);
  result = 0.0;
  if (!Parameter)
    return *(float *)v1;
  return result;
}

float OALContext::GetReverbEQFrequency(OALContext *this)
{
  char *v1;
  OSStatus Parameter;
  float result;

  v1 = (char *)this + 512;
  Parameter = AudioUnitGetParameter(*((AudioUnit *)this + 4), 0xEu, 0, 0, (AudioUnitParameterValue *)this + 128);
  result = 0.0;
  if (!Parameter)
    return *(float *)v1;
  return result;
}

uint64_t OALContext::OutputCapturerCreate(OALContext *this, double a2, unsigned int a3, unsigned int a4)
{
  OALCaptureMixer *v8;
  OALCaptureMixer *v9;
  _DWORD *exception;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = (OALCaptureMixer *)*((_QWORD *)this + 65);
  if (v8)
  {
    if (*((_DWORD *)v8 + 20))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v12 = 136315394;
        v13 = "oalContext.cpp";
        v14 = 1024;
        v15 = 1672;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::OutputCapturerCreate FAILED - output capturer is currently capturing!", (uint8_t *)&v12, 0x12u);
      }
      exception = __cxa_allocate_exception(4uLL);
      *exception = -1;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
    OALCaptureMixer::~OALCaptureMixer(v8);
    MEMORY[0x2199EEC7C]();
    *((_QWORD *)this + 65) = 0;
    v9 = (OALCaptureMixer *)operator new();
    OALCaptureMixer::OALCaptureMixer(v9, *((OpaqueAudioComponentInstance **)this + 4), a2, a3, a4);
  }
  else
  {
    v9 = (OALCaptureMixer *)operator new();
    OALCaptureMixer::OALCaptureMixer(v9, *((OpaqueAudioComponentInstance **)this + 4), a2, a3, a4);
  }
  *((_QWORD *)this + 65) = v9;
  return 0;
}

void sub_215C32020(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  uint64_t v3;
  OALCaptureMixer *v6;
  OALCaptureMixer *v7;

  if (a2)
  {
    MEMORY[0x2199EEC7C](v3, 0x1020C4037481C38);
    __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      v6 = *(OALCaptureMixer **)(v2 + 520);
      if (v6)
      {
        OALCaptureMixer::~OALCaptureMixer(v6);
        MEMORY[0x2199EEC7C]();
      }
    }
    else
    {
      v7 = *(OALCaptureMixer **)(v2 + 520);
      if (v7)
      {
        OALCaptureMixer::~OALCaptureMixer(v7);
        MEMORY[0x2199EEC7C]();
      }
    }
    *(_QWORD *)(v2 + 520) = 0;
    __cxa_end_catch();
    JUMPOUT(0x215C31F60);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::OutputCapturerStart(OALContext *this)
{
  AudioUnit *v1;

  v1 = (AudioUnit *)*((_QWORD *)this + 65);
  if (!v1)
    return 0xFFFFFFFFLL;
  OALCaptureMixer::StartCapture(v1);
  return 0;
}

uint64_t OALContext::OutputCapturerStop(OALContext *this)
{
  AudioUnit *v1;

  v1 = (AudioUnit *)*((_QWORD *)this + 65);
  if (!v1)
    return 0xFFFFFFFFLL;
  OALCaptureMixer::StopCapture(v1);
  return 0;
}

uint64_t OALContext::OutputCapturerGetFrames(OALContext *this, unsigned int a2, unsigned __int8 *a3)
{
  OALCaptureMixer *v3;

  v3 = (OALCaptureMixer *)*((_QWORD *)this + 65);
  if (v3)
    return OALCaptureMixer::GetFrames(v3, a2, a3);
  else
    return 0xFFFFFFFFLL;
}

OALCaptureMixer *OALContext::OutputCapturerAvailableFrames(OALContext *this)
{
  OALCaptureMixer *result;

  result = (OALCaptureMixer *)*((_QWORD *)this + 65);
  if (result)
    return (OALCaptureMixer *)OALCaptureMixer::AvailableFrames(result);
  return result;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t **v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_10;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (!v2)
  {
    v5 = 1;
    v6 = (uint64_t **)v3[2];
    v7 = *v6;
    if (*v6 == v3)
      goto LABEL_6;
LABEL_11:
    v6[1] = (uint64_t *)v2;
    v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2)
      goto LABEL_16;
    goto LABEL_12;
  }
LABEL_10:
  v5 = 0;
  *(_QWORD *)(v2 + 16) = v3[2];
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 != v3)
    goto LABEL_11;
LABEL_6:
  *v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    v7 = v6[1];
    v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2)
      goto LABEL_16;
LABEL_12:
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
    goto LABEL_16;
  }
  v7 = 0;
  result = (uint64_t *)v2;
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
    goto LABEL_12;
LABEL_16:
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v14 = (uint64_t **)v7[2];
    if (*v14 == v7)
      break;
    if (*((_BYTE *)v7 + 24))
    {
      v15 = (_QWORD *)*v7;
      if (!*v7)
        goto LABEL_38;
    }
    else
    {
      *((_BYTE *)v7 + 24) = 1;
      *((_BYTE *)v14 + 24) = 0;
      v17 = v14[1];
      v18 = (uint64_t *)*v17;
      v14[1] = (uint64_t *)*v17;
      if (v18)
        v18[2] = (uint64_t)v14;
      v17[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (_QWORD)v14] = (uint64_t)v17;
      *v17 = (uint64_t)v14;
      v14[2] = v17;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
      v15 = (_QWORD *)*v7;
      if (!*v7)
        goto LABEL_38;
    }
    if (!*((_BYTE *)v15 + 24))
    {
      v19 = (uint64_t *)v7[1];
      if (!v19)
        goto LABEL_64;
LABEL_63:
      if (*((_BYTE *)v19 + 24))
      {
LABEL_64:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v23 = v15[1];
        *v7 = v23;
        if (v23)
          *(_QWORD *)(v23 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v19 = v7;
      }
      else
      {
        v15 = v7;
      }
      v27 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v27 + 24);
      *(_BYTE *)(v27 + 24) = 1;
      *((_BYTE *)v19 + 24) = 1;
      v28 = *(uint64_t **)(v27 + 8);
      v29 = *v28;
      *(_QWORD *)(v27 + 8) = *v28;
      if (v29)
        *(_QWORD *)(v29 + 16) = v27;
      v28[2] = *(_QWORD *)(v27 + 16);
      *(_QWORD *)(*(_QWORD *)(v27 + 16) + 8 * (**(_QWORD **)(v27 + 16) != v27)) = v28;
      *v28 = v27;
      *(_QWORD *)(v27 + 16) = v28;
      return result;
    }
LABEL_38:
    v19 = (uint64_t *)v7[1];
    if (v19 && !*((_BYTE *)v19 + 24))
      goto LABEL_63;
    *((_BYTE *)v7 + 24) = 0;
    v12 = (uint64_t *)v7[2];
    if (v12 == result)
    {
      v12 = result;
LABEL_61:
      *((_BYTE *)v12 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v12 + 24))
      goto LABEL_61;
LABEL_24:
    v7 = *(uint64_t **)(v12[2] + 8 * (*(_QWORD *)v12[2] == (_QWORD)v12));
  }
  if (*((_BYTE *)v7 + 24))
  {
    v16 = (_QWORD *)*v7;
    if (!*v7)
      goto LABEL_49;
LABEL_48:
    if (!*((_BYTE *)v16 + 24))
      goto LABEL_67;
  }
  else
  {
    *((_BYTE *)v7 + 24) = 1;
    *((_BYTE *)v14 + 24) = 0;
    v20 = (uint64_t *)v7[1];
    *v14 = v20;
    if (v20)
      v20[2] = (uint64_t)v14;
    v7[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (_QWORD)v14] = (uint64_t)v7;
    v7[1] = (uint64_t)v14;
    v14[2] = v7;
    if (result == (uint64_t *)v14)
      result = v7;
    v7 = *v14;
    v16 = (_QWORD *)**v14;
    if (v16)
      goto LABEL_48;
  }
LABEL_49:
  v21 = (uint64_t *)v7[1];
  if (!v21 || *((_BYTE *)v21 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v12 = (uint64_t *)v7[2];
    if (*((_BYTE *)v12 + 24))
      v13 = v12 == result;
    else
      v13 = 1;
    if (v13)
      goto LABEL_61;
    goto LABEL_24;
  }
  if (v16 && !*((_BYTE *)v16 + 24))
  {
LABEL_67:
    v21 = v7;
  }
  else
  {
    *((_BYTE *)v21 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v22 = *v21;
    v7[1] = *v21;
    if (v22)
      *(_QWORD *)(v22 + 16) = v7;
    v21[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v21;
    *v21 = (uint64_t)v7;
    v7[2] = (uint64_t)v21;
    v16 = v7;
  }
  v24 = (uint64_t *)v21[2];
  *((_BYTE *)v21 + 24) = *((_BYTE *)v24 + 24);
  *((_BYTE *)v24 + 24) = 1;
  *((_BYTE *)v16 + 24) = 1;
  v25 = *v24;
  v26 = *(_QWORD *)(*v24 + 8);
  *v24 = v26;
  if (v26)
    *(_QWORD *)(v26 + 16) = v24;
  *(_QWORD *)(v25 + 16) = v24[2];
  *(_QWORD *)(v24[2] + 8 * (*(_QWORD *)v24[2] != (_QWORD)v24)) = v25;
  *(_QWORD *)(v25 + 8) = v24;
  v24[2] = v25;
  return result;
}

void std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

char *std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>(uint64_t ***a1, uint64_t **a2, _OWORD *a3)
{
  char *v6;
  char *v7;
  unsigned int *v8;
  uint64_t **v9;
  unsigned int v10;
  uint64_t *v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t **v15;
  uint64_t **v16;
  BOOL v17;
  unsigned int v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;

  v6 = (char *)operator new(0x30uLL);
  v7 = v6;
  v8 = (unsigned int *)(v6 + 32);
  *((_OWORD *)v6 + 2) = *a3;
  v9 = (uint64_t **)(a1 + 1);
  if (a1 + 1 != (uint64_t ***)a2)
  {
    v10 = *v8;
    if (*((_DWORD *)a2 + 8) < *v8)
    {
      while (1)
      {
        v11 = *v9;
        v12 = v9;
        if (!*v9)
          goto LABEL_25;
        while (1)
        {
          v9 = (uint64_t **)v11;
          if (*((_DWORD *)v11 + 8) >= v10)
            break;
          v11 = (uint64_t *)v11[1];
          if (!v11)
            goto LABEL_19;
        }
      }
    }
  }
  v13 = *a2;
  if (*a1 == a2)
  {
    v15 = a2;
    goto LABEL_20;
  }
  if (v13)
  {
    v14 = *a2;
    do
    {
      v15 = (uint64_t **)v14;
      v14 = (uint64_t *)v14[1];
    }
    while (v14);
  }
  else
  {
    v16 = a2;
    do
    {
      v15 = (uint64_t **)v16[2];
      v17 = *v15 == (uint64_t *)v16;
      v16 = v15;
    }
    while (v17);
  }
  v18 = *v8;
  if (*v8 >= *((_DWORD *)v15 + 8))
  {
LABEL_20:
    v12 = v15 + 1;
    if (v13)
      v9 = v15;
    else
      v9 = a2;
    if (!v13)
      v12 = a2;
    goto LABEL_25;
  }
  while (1)
  {
    v19 = *v9;
    v12 = v9;
    if (!*v9)
      break;
    while (1)
    {
      v9 = (uint64_t **)v19;
      if (v18 < *((_DWORD *)v19 + 8))
        break;
      v19 = (uint64_t *)v19[1];
      if (!v19)
      {
LABEL_19:
        v12 = v9 + 1;
        goto LABEL_25;
      }
    }
  }
LABEL_25:
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = v9;
  *v12 = (uint64_t *)v6;
  v20 = **a1;
  v21 = (uint64_t *)v6;
  if (v20)
  {
    *a1 = (uint64_t **)v20;
    v21 = *v12;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)a1[1], v21);
  a1[2] = (uint64_t **)((char *)a1[2] + 1);
  return v7;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 == result)
    return result;
  while (1)
  {
    v2 = a2[2];
    if (*(_BYTE *)(v2 + 24))
      return result;
    v3 = *(uint64_t **)(v2 + 16);
    v4 = *v3;
    if (*v3 != v2)
      break;
    v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(_BYTE *)(v2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
          goto LABEL_15;
      }
      else
      {
        v9 = *(uint64_t **)(v2 + 8);
        v10 = *v9;
        *(_QWORD *)(v2 + 8) = *v9;
        if (v10)
        {
          *(_QWORD *)(v10 + 16) = v2;
          v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = v9;
        *v9 = v2;
        *(_QWORD *)(v2 + 16) = v9;
        v3 = (uint64_t *)v9[2];
        v2 = *v3;
        *((_BYTE *)v9 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
LABEL_15:
          *(_QWORD *)(v11 + 16) = v3;
      }
      *(_QWORD *)(v2 + 16) = v3[2];
      *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
      *(_QWORD *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(_BYTE *)(v2 + 24) = 1;
    a2 = v3;
    *((_BYTE *)v3 + 24) = v3 == result;
    *v5 = 1;
    if (v3 == result)
      return result;
  }
  if (v4)
  {
    v6 = *(unsigned __int8 *)(v4 + 24);
    v5 = (_BYTE *)(v4 + 24);
    if (!v6)
      goto LABEL_3;
  }
  if (*(uint64_t **)v2 == a2)
  {
    v12 = a2[1];
    *(_QWORD *)v2 = v12;
    if (v12)
    {
      *(_QWORD *)(v12 + 16) = v2;
      v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(_QWORD *)(v2 + 16) = a2;
    v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((_BYTE *)a2 + 24) = 1;
  *((_BYTE *)v3 + 24) = 0;
  v13 = (uint64_t *)v3[1];
  v14 = *v13;
  v3[1] = *v13;
  if (v14)
    *(_QWORD *)(v14 + 16) = v3;
  v13[2] = v3[2];
  *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v13;
  *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t OALDevice::InitializeGraph(AUGraph *outGraph, const char *a2)
{
  AUGraph *v2;
  uint64_t Property;
  AudioUnit *v5;
  uint64_t v6;
  AudioComponentDescription v8;
  UInt32 ioDataSize;
  _OWORD outData[2];
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = outGraph + 2;
  if (outGraph[2])
    return 1768843636;
  v11 = 0;
  memset(outData, 0, sizeof(outData));
  ioDataSize = 40;
  Property = NewAUGraph(outGraph + 2);
  if ((_DWORD)Property)
    goto LABEL_18;
  v8.componentFlagsMask = 0;
  *(_OWORD *)&v8.componentType = xmmword_215C55DE0;
  Property = AUGraphAddNode(outGraph[2], &v8, (AUNode *)outGraph + 6);
  if ((_DWORD)Property)
    goto LABEL_18;
  Property = AUGraphOpen(*v2);
  if ((_DWORD)Property)
    goto LABEL_18;
  v5 = outGraph + 4;
  Property = AUGraphNodeInfo(outGraph[2], *((_DWORD *)outGraph + 6), 0, outGraph + 4);
  if ((_DWORD)Property)
    goto LABEL_18;
  Property = AudioUnitGetProperty(*v5, 8u, 2u, 0, outData, &ioDataSize);
  if ((_DWORD)Property)
    goto LABEL_18;
  if (*(double *)outData == 0.0)
    *(_QWORD *)&outData[0] = 0x40E5888000000000;
  Property = AudioUnitSetProperty(*v5, 8u, 1u, 0, outData, ioDataSize);
  if ((_DWORD)Property
    || (Property = AudioUnitInitialize(*v5), (_DWORD)Property)
    || (Property = AudioUnitAddPropertyListener(outGraph[4], 8u, (AudioUnitPropertyListenerProc)OALDevice::GraphFormatPropertyListener, outGraph), (_DWORD)Property))
  {
LABEL_18:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v6 = (uint64_t)*outGraph;
      *(_DWORD *)buf = 136315906;
      v13 = "oalDevice.cpp";
      v14 = 1024;
      v15 = 338;
      v16 = 2048;
      v17 = v6;
      v18 = 2048;
      v19 = (int)Property;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALDevice::InitializeGraph FAILED - OALDevice = %ld : result = %ld", buf, 0x26u);
    }
  }
  return Property;
}

void OALDevice::OALDevice(OALDevice *this, const char *a2, uint64_t a3)
{
  const char *v4;

  *(_QWORD *)this = a3;
  *((_DWORD *)this + 2) = 0;
  *((_BYTE *)this + 12) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0x40E5888000000000;
  *((_QWORD *)this + 8) = 0x72636D6300000002;
  *((_QWORD *)this + 9) = 512;
  *((_BYTE *)this + 80) = 0;
  CAGuard::CAGuard((OALDevice *)((char *)this + 88), "OALDevice:GraphLock");
  *((_BYTE *)this + 80) = OALDevice::InitializeGraph((AUGraph *)this, v4) == 0;
}

void sub_215C32AE8(_Unwind_Exception *a1)
{
  CAGuard *v1;

  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

void OALDevice::~OALDevice(OALDevice *this)
{
  OpaqueAUGraph *v2;
  Boolean outIsRunning;

  v2 = (OpaqueAUGraph *)*((_QWORD *)this + 2);
  if (v2)
  {
    AUGraphStop(v2);
    outIsRunning = 0;
    do
      AUGraphIsRunning(*((AUGraph *)this + 2), &outIsRunning);
    while (outIsRunning);
    DisposeAUGraph(*((AUGraph *)this + 2));
    *((_QWORD *)this + 2) = 0;
  }
  CAGuard::~CAGuard((OALDevice *)((char *)this + 88));
}

uint64_t OALDevice::SetError(uint64_t this, int a2)
{
  if (*(_DWORD *)(this + 8))
    *(_DWORD *)(this + 8) = a2;
  return this;
}

uint64_t OALDevice::StopGraph(AUGraph *this)
{
  uint64_t result;
  Boolean outIsRunning;

  AUGraphStop(this[2]);
  outIsRunning = 0;
  do
    result = AUGraphIsRunning(this[2], &outIsRunning);
  while (outIsRunning);
  return result;
}

uint64_t OALDevice::ResetRenderChannelSettings(OALDevice *this)
{
  int DesiredRenderChannelCount;
  uint64_t Property;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v10;
  AUNode v11;
  int inData;
  uint64_t v13;
  UInt32 ioDataSize;
  Boolean outIsRunning[40];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  DesiredRenderChannelCount = OALDevice::GetDesiredRenderChannelCount(this);
  if (*((_DWORD *)this + 16) == DesiredRenderChannelCount)
    return 0;
  v4 = *((_QWORD *)this + 11);
  *((_DWORD *)this + 16) = DesiredRenderChannelCount;
  v5 = (*(uint64_t (**)(char *))(v4 + 16))((char *)this + 88);
  outIsRunning[0] = 0;
  AUGraphIsRunning(*((AUGraph *)this + 2), outIsRunning);
  v6 = outIsRunning[0];
  if (outIsRunning[0])
  {
    AUGraphStop(*((AUGraph *)this + 2));
    outIsRunning[0] = 0;
    do
      AUGraphIsRunning(*((AUGraph *)this + 2), outIsRunning);
    while (outIsRunning[0]);
  }
  if (!*((_DWORD *)this + 10)
    || (Property = AUGraphDisconnectNodeInput(*((AUGraph *)this + 2), *((_DWORD *)this + 6), 0), !(_DWORD)Property)
    && (Property = AUGraphUpdate(*((AUGraph *)this + 2), 0), !(_DWORD)Property))
  {
    memset(outIsRunning, 0, sizeof(outIsRunning));
    ioDataSize = 40;
    Property = AudioUnitGetProperty(*((AudioUnit *)this + 4), 8u, 1u, 0, outIsRunning, &ioDataSize);
    if (!(_DWORD)Property)
    {
      v7 = *((_DWORD *)this + 16);
      *(_OWORD *)&outIsRunning[8] = xmmword_215C55DA0;
      *(_DWORD *)&outIsRunning[24] = 4;
      *(_DWORD *)&outIsRunning[28] = v7;
      *(_QWORD *)&outIsRunning[32] = 32;
      Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 1u, 0, outIsRunning, 0x28u);
      if (!(_DWORD)Property)
      {
        if (*((_DWORD *)this + 16) < 3u
          || (v10 = *((_DWORD *)this + 11),
              v13 = 0,
              inData = v10,
              Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x13u, 1u, 0, &inData, 0x20u),
              !(_DWORD)Property))
        {
          ReconfigureContextsOfThisDevice(*(_QWORD *)this);
          v11 = *((_DWORD *)this + 10);
          if (!v11)
            goto LABEL_26;
          if (*((_BYTE *)this + 12))
          {
            Property = AUGraphUninitialize(*((AUGraph *)this + 2));
            if ((_DWORD)Property)
              goto LABEL_11;
            *((_BYTE *)this + 12) = 0;
            v11 = *((_DWORD *)this + 10);
          }
          Property = AUGraphConnectNodeInput(*((AUGraph *)this + 2), v11, 0, *((_DWORD *)this + 6), 0);
          if ((_DWORD)Property)
            goto LABEL_11;
          Property = AUGraphUpdate(*((AUGraph *)this + 2), 0);
          if ((_DWORD)Property)
            goto LABEL_11;
          if (!*((_BYTE *)this + 12))
          {
            Property = AUGraphInitialize(*((AUGraph *)this + 2));
            if ((_DWORD)Property)
              goto LABEL_11;
            *((_BYTE *)this + 12) = 1;
            if (!v6)
              goto LABEL_28;
          }
          else
          {
LABEL_26:
            if (!v6)
            {
LABEL_28:
              Property = 0;
              goto LABEL_11;
            }
          }
          Property = AUGraphStart(*((AUGraph *)this + 2));
          if (!(_DWORD)Property)
            goto LABEL_28;
        }
      }
    }
  }
LABEL_11:
  if (v5)
    (*(void (**)(char *))(*((_QWORD *)this + 11) + 24))((char *)this + 88);
  if ((_DWORD)Property && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)this;
    *(_DWORD *)outIsRunning = 136315906;
    *(_QWORD *)&outIsRunning[4] = "oalDevice.cpp";
    *(_WORD *)&outIsRunning[12] = 1024;
    *(_DWORD *)&outIsRunning[14] = 224;
    *(_WORD *)&outIsRunning[18] = 2048;
    *(_QWORD *)&outIsRunning[20] = v8;
    *(_WORD *)&outIsRunning[28] = 1024;
    *(_DWORD *)&outIsRunning[30] = Property;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALDevice::ResetRenderChannelSettings FAILED - OALDevice = %lu : result = %d", outIsRunning, 0x22u);
  }
  return Property;
}

void sub_215C32EB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALDevice::GetDesiredRenderChannelCount(OALDevice *this)
{
  AudioChannelLayout *v1;
  uint64_t v2;
  OSStatus PropertyInfo;
  OSStatus v5;
  uint64_t v6;
  OALDevice *Property;
  int mChannelLayoutTag;
  uint64_t mNumberChannelDescriptions;
  AudioChannelDescription *mChannelDescriptions;
  AudioChannelLabel v12;
  AudioChannelLabel mChannelLabel;
  UInt32 outDataSize;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  outDataSize = 0;
  if (*((_DWORD *)this + 17) == 1919120244)
  {
    v1 = 0;
    v2 = 2;
    goto LABEL_7;
  }
  PropertyInfo = AudioUnitGetPropertyInfo(*((AudioUnit *)this + 4), 0x13u, 2u, 0, &outDataSize, 0);
  if (PropertyInfo)
  {
    v5 = PropertyInfo;
    v2 = 2;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)this;
      *(_DWORD *)buf = 136315906;
      v17 = "oalDevice.cpp";
      v18 = 1024;
      v19 = 434;
      v20 = 2048;
      v21 = v6;
      v22 = 2048;
      v23 = v5;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALDevice::GetDesiredRenderChannelCount: Cannot get audio channel layout -> defaulting to stereo: OALDevice = %ld : result = %ld", buf, 0x26u);
    }
    v1 = 0;
    goto LABEL_7;
  }
  v1 = (AudioChannelLayout *)malloc_type_calloc(1uLL, outDataSize, 0xDF4BB07DuLL);
  if (!v1)
    goto LABEL_37;
  v2 = 2;
  Property = (OALDevice *)AudioUnitGetProperty(*((AudioUnit *)this + 4), 0x13u, 2u, 0, v1, &outDataSize);
  if ((_DWORD)Property)
    goto LABEL_7;
  mChannelLayoutTag = v1->mChannelLayoutTag;
  if (v1->mChannelLayoutTag)
  {
    *((_DWORD *)this + 11) = mChannelLayoutTag;
    if (mChannelLayoutTag <= 8192006)
    {
      if (mChannelLayoutTag > 7733252)
      {
        v2 = 5;
        if (mChannelLayoutTag == 7733253 || mChannelLayoutTag == 7929862)
          goto LABEL_7;
      }
      else
      {
        if (mChannelLayoutTag == 7077892)
        {
          v2 = 4;
          goto LABEL_7;
        }
        if (mChannelLayoutTag == 7274504)
        {
          v2 = 8;
          goto LABEL_7;
        }
      }
    }
    else
    {
      if (mChannelLayoutTag > 9109509)
      {
        if (mChannelLayoutTag != 9699335 && mChannelLayoutTag != 9175047)
        {
          if (mChannelLayoutTag != 9109510)
            goto LABEL_37;
LABEL_38:
          v2 = 6;
          goto LABEL_7;
        }
        goto LABEL_36;
      }
      if (mChannelLayoutTag == 8192007)
        goto LABEL_38;
      if (mChannelLayoutTag == 8388616)
      {
LABEL_36:
        v2 = 7;
        goto LABEL_7;
      }
    }
LABEL_37:
    v2 = 2;
    goto LABEL_7;
  }
  mNumberChannelDescriptions = v1->mNumberChannelDescriptions;
  if (mNumberChannelDescriptions >= 3)
  {
    LODWORD(v2) = 0;
    mChannelDescriptions = v1->mChannelDescriptions;
    do
    {
      mChannelLabel = mChannelDescriptions->mChannelLabel;
      ++mChannelDescriptions;
      v12 = mChannelLabel;
      if (mChannelLabel == -1 || v12 == 4)
        v2 = v2;
      else
        v2 = (v2 + 1);
      --mNumberChannelDescriptions;
    }
    while (mNumberChannelDescriptions);
  }
  *((_DWORD *)this + 11) = OALDevice::GetLayoutTagForLayout(Property, v1, v2);
LABEL_7:
  free(v1);
  return v2;
}

OALDevice *OALDevice::GraphFormatPropertyListener(OALDevice *this, void *a2, OpaqueAudioComponentInstance *a3, int a4, int a5)
{
  if (a4 == 2 && !a5)
    return (OALDevice *)OALDevice::ResetRenderChannelSettings(this);
  return this;
}

void sub_215C331C8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

uint64_t OALDevice::SetRenderChannelSetting(OALDevice *this, int a2)
{
  unsigned int v2;

  if (a2 != 1919120244 && a2 != 1919118691)
    return 40963;
  if (*((_DWORD *)this + 17) != a2)
  {
    *((_DWORD *)this + 17) = a2;
    v2 = *((_DWORD *)this + 16);
    if (a2 == 1919120244)
    {
      if (v2 == 2)
        return 0;
      goto LABEL_9;
    }
    if (v2 <= 2)
LABEL_9:
      OALDevice::ResetRenderChannelSettings(this);
  }
  return 0;
}

uint64_t OALDevice::GetLayoutTagForLayout(OALDevice *this, AudioChannelLayout *a2, int a3)
{
  uint64_t result;
  uint64_t mNumberChannelDescriptions;
  AudioChannelDescription *mChannelDescriptions;
  AudioChannelLabel mChannelLabel;

  result = 7733253;
  switch(a3)
  {
    case 4:
      result = 7077892;
      break;
    case 5:
      return result;
    case 6:
      result = 9109510;
      break;
    case 7:
      result = 9699335;
      mNumberChannelDescriptions = a2->mNumberChannelDescriptions;
      if ((_DWORD)mNumberChannelDescriptions)
      {
        mChannelDescriptions = a2->mChannelDescriptions;
        while (1)
        {
          mChannelLabel = mChannelDescriptions->mChannelLabel;
          ++mChannelDescriptions;
          if (mChannelLabel - 33 < 2)
            break;
          if (!--mNumberChannelDescriptions)
            return result;
        }
        result = 9175047;
      }
      break;
    case 8:
      result = 7274504;
      break;
    default:
      result = 6619138;
      break;
  }
  return result;
}

uint64_t OALDevice::ConnectContext(OALDevice *this, OALContext *a2)
{
  uint64_t Property;
  OALContext *v5;
  int DesiredRenderChannelCount;
  int v7;
  BOOL v8;
  int v9;
  int v10;
  uint64_t v11;
  int v13;
  BOOL v14;
  AUNode v15;
  OpaqueAUGraph *v16;
  int inData;
  uint64_t v18;
  UInt32 ioDataSize;
  _BYTE outData[40];
  uint64_t v21;

  Property = 0;
  v21 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return Property;
  v5 = (OALContext *)*((_QWORD *)this + 6);
  if (v5 == a2)
    return Property;
  DesiredRenderChannelCount = OALDevice::GetDesiredRenderChannelCount(this);
  v7 = *((_DWORD *)this + 16);
  v8 = v7 != DesiredRenderChannelCount;
  if (v7 != DesiredRenderChannelCount)
    *((_DWORD *)this + 16) = DesiredRenderChannelCount;
  v9 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 11) + 16))((char *)this + 88);
  if (*((_QWORD *)this + 6) && *((_DWORD *)a2 + 6) != *((_DWORD *)this + 10))
  {
    Property = AUGraphDisconnectNodeInput(*((AUGraph *)this + 2), *((_DWORD *)this + 6), 0);
    if ((_DWORD)Property)
      goto LABEL_12;
    *((_DWORD *)this + 10) = 0;
    *((_QWORD *)this + 6) = 0;
    v8 = 1;
  }
  memset(outData, 0, sizeof(outData));
  ioDataSize = 40;
  Property = AudioUnitGetProperty(*((AudioUnit *)this + 4), 8u, 1u, 0, outData, &ioDataSize);
  if ((_DWORD)Property)
    goto LABEL_12;
  v10 = *((_DWORD *)this + 16);
  *(_OWORD *)&outData[8] = xmmword_215C55DA0;
  *(_DWORD *)&outData[24] = 4;
  *(_DWORD *)&outData[28] = v10;
  *(_QWORD *)&outData[32] = 32;
  *(_QWORD *)outData = *((_QWORD *)a2 + 56);
  Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 1u, 0, outData, 0x28u);
  if ((_DWORD)Property)
    goto LABEL_12;
  Property = OALContext::SetMixerOutputFormat((uint64_t)a2, outData);
  if ((_DWORD)Property)
    goto LABEL_12;
  if (*((_DWORD *)this + 16) >= 3u)
  {
    v13 = *((_DWORD *)this + 11);
    v18 = 0;
    inData = v13;
    Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x13u, 1u, 0, &inData, 0x20u);
    if ((_DWORD)Property)
      goto LABEL_12;
  }
  if (*((_BYTE *)this + 12))
    v14 = v8;
  else
    v14 = 0;
  if (v14)
  {
    Property = AUGraphUninitialize(*((AUGraph *)this + 2));
    if ((_DWORD)Property)
      goto LABEL_12;
    *((_BYTE *)this + 12) = 0;
  }
  v15 = *((_DWORD *)a2 + 6);
  *((_DWORD *)this + 10) = v15;
  Property = AUGraphConnectNodeInput(*((AUGraph *)this + 2), v15, 0, *((_DWORD *)this + 6), 0);
  if (!(_DWORD)Property)
  {
    *((_QWORD *)this + 6) = a2;
    v16 = (OpaqueAUGraph *)*((_QWORD *)this + 2);
    if (*((_BYTE *)this + 12))
    {
      Property = AUGraphUpdate(v16, 0);
      if (!(_DWORD)Property)
        goto LABEL_32;
    }
    else
    {
      Property = AUGraphInitialize(v16);
      if (!(_DWORD)Property)
      {
        *((_BYTE *)this + 12) = 1;
LABEL_32:
        outData[0] = 0;
        AUGraphIsRunning(*((AUGraph *)this + 2), outData);
        if (outData[0] || (Property = AUGraphStart(*((AUGraph *)this + 2)), !(_DWORD)Property))
          Property = 0;
      }
    }
  }
LABEL_12:
  if (v9)
    (*(void (**)(char *))(*((_QWORD *)this + 11) + 24))((char *)this + 88);
  if ((_DWORD)Property)
  {
    *((_QWORD *)this + 6) = v5;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)this;
      *(_DWORD *)outData = 136315906;
      *(_QWORD *)&outData[4] = "oalDevice.cpp";
      *(_WORD *)&outData[12] = 1024;
      *(_DWORD *)&outData[14] = 564;
      *(_WORD *)&outData[18] = 2048;
      *(_QWORD *)&outData[20] = v11;
      *(_WORD *)&outData[28] = 2048;
      *(_QWORD *)&outData[30] = (int)Property;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALDevice::ConnectContext FAILED - OALDevice = %ld : result = %ld", outData, 0x26u);
    }
  }
  return Property;
}

void sub_215C33600(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALDevice::DisconnectContext(uint64_t this, OALContext *a2)
{
  uint64_t v2;
  Boolean outIsRunning;

  if (a2)
  {
    v2 = this;
    if (*(OALContext **)(this + 48) == a2)
    {
      *(_QWORD *)(this + 48) = 0;
      AUGraphDisconnectNodeInput(*(AUGraph *)(this + 16), *(_DWORD *)(this + 24), 0);
      outIsRunning = 0;
      AUGraphIsRunning(*(AUGraph *)(v2 + 16), &outIsRunning);
      if (outIsRunning)
        AUGraphStop(*(AUGraph *)(v2 + 16));
      return AUGraphUpdate(*(AUGraph *)(v2 + 16), 0);
    }
  }
  return this;
}

uint64_t OALDevice::RemoveContext(OALDevice *this, OALContext *a2)
{
  if (*((OALContext **)this + 6) == a2)
    *((_QWORD *)this + 6) = 0;
  AUGraphRemoveNode(*((AUGraph *)this + 2), *((_DWORD *)a2 + 6));
  return AUGraphUpdate(*((AUGraph *)this + 2), 0);
}

uint64_t WaitOneRenderCycle(void)
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  BOOL v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;

  if (gOALContextMap)
  {
    v0 = *(_QWORD **)(gOALContextMap + 8);
    if (v0)
    {
      v1 = gOALContextMap + 8;
      do
      {
        v2 = v0[4];
        v3 = v2 >= gCurrentContext;
        if (v2 >= gCurrentContext)
          v4 = v0;
        else
          v4 = v0 + 1;
        if (v3)
          v1 = (uint64_t)v0;
        v0 = (_QWORD *)*v4;
      }
      while (*v4);
      if (v1 != gOALContextMap + 8 && *(_QWORD *)(v1 + 32) <= (unint64_t)gCurrentContext)
      {
        v5 = *(_QWORD *)(v1 + 40);
        if (v5)
          return usleep(2* ((float)*(unsigned int *)(*(_QWORD *)(v5 + 16) + 72)/ (*(double *)(v5 + 448)/ 1000.0)* 1000.0));
      }
    }
  }
  return result;
}

void ErrorKeyInitializer(void)
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = pthread_key_create((pthread_key_t *)&gALErrorKey, 0);
  if (v0)
  {
    v1 = v0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315650;
      v5 = "oalImp.cpp";
      v6 = 1024;
      v7 = 240;
      v8 = 1024;
      v9 = v1;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d pthread_key_create FAILED for gALErrorKey with result %d\n", (uint8_t *)&v4, 0x18u);
    }
  }
  v2 = pthread_key_create((pthread_key_t *)&gALCErrorKey, 0);
  if (v2)
  {
    v3 = v2;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315650;
      v5 = "oalImp.cpp";
      v6 = 1024;
      v7 = 244;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d pthread_key_create FAILED for gALCErrorKey with result %d\n", (uint8_t *)&v4, 0x18u);
    }
  }
}

void *alSetError(int a1)
{
  void *result;

  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  result = pthread_getspecific(gALErrorKey);
  if (!result)
    return (void *)pthread_setspecific(gALErrorKey, (const void *)a1);
  return result;
}

void CleanUpDeadBufferList(void)
{
  int v0;
  int v1;
  unsigned int v2;
  _QWORD *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  OALBuffer *v9;
  uint64_t v10;
  uint64_t *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  BOOL v21;

  if (gDeadOALBufferMap)
  {
    v0 = *(_DWORD *)(gDeadOALBufferMap + 16);
    if (v0)
    {
      v1 = 0;
      v2 = 0;
      do
      {
        while (1)
        {
          v3 = *(_QWORD **)gDeadOALBufferMap;
          if (v2)
          {
            v4 = 0;
            do
            {
              v6 = gDeadOALBufferMap + 8;
              v5 = v2;
              if (v3 != (_QWORD *)(gDeadOALBufferMap + 8))
              {
                v7 = (_QWORD *)v3[1];
                if (v7)
                {
                  do
                  {
                    v6 = (uint64_t)v7;
                    v7 = (_QWORD *)*v7;
                  }
                  while (v7);
                }
                else
                {
                  do
                  {
                    v8 = v3;
                    v3 = (_QWORD *)v3[2];
                  }
                  while ((_QWORD *)*v3 != v8);
                  v6 = (uint64_t)v3;
                }
                v5 = v4;
              }
              v4 = v5 + 1;
              v3 = (_QWORD *)v6;
            }
            while (v5 + 1 < v2);
          }
          else
          {
            v6 = *(_QWORD *)gDeadOALBufferMap;
          }
          if (v6 != gDeadOALBufferMap + 8)
          {
            v9 = *(OALBuffer **)(v6 + 40);
            if (v9)
            {
              if (OALBuffer::IsPurgable(*(OALBuffer **)(v6 + 40)))
                break;
            }
          }
          ++v2;
          if (++v1 == v0)
            return;
        }
        v10 = gDeadOALBufferMap;
        v11 = *(uint64_t **)(gDeadOALBufferMap + 8);
        if (v11)
        {
          v12 = *(_DWORD *)v9;
          v13 = gDeadOALBufferMap + 8;
          v14 = *(_QWORD *)(gDeadOALBufferMap + 8);
          do
          {
            v15 = *(_DWORD *)(v14 + 32);
            v16 = v15 >= v12;
            if (v15 >= v12)
              v17 = (uint64_t *)v14;
            else
              v17 = (uint64_t *)(v14 + 8);
            if (v16)
              v13 = v14;
            v14 = *v17;
          }
          while (*v17);
          if (v13 != gDeadOALBufferMap + 8 && *(_DWORD *)(v13 + 32) <= v12)
          {
            v18 = *(_QWORD **)(v13 + 8);
            v19 = (_QWORD *)v13;
            if (v18)
            {
              do
              {
                v20 = v18;
                v18 = (_QWORD *)*v18;
              }
              while (v18);
            }
            else
            {
              do
              {
                v20 = (_QWORD *)v19[2];
                v21 = *v20 == (_QWORD)v19;
                v19 = v20;
              }
              while (!v21);
            }
            if (*(_QWORD *)gDeadOALBufferMap == v13)
              *(_QWORD *)gDeadOALBufferMap = v20;
            --*(_QWORD *)(v10 + 16);
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v11, (uint64_t *)v13);
            operator delete((void *)v13);
          }
        }
        OALBuffer::~OALBuffer(v9);
        MEMORY[0x2199EEC7C]();
        ++v1;
      }
      while (v1 != v0);
    }
  }
}

uint64_t ProtectContextObject(unint64_t a1)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int *v11;
  unsigned int v12;

  if (!gOALContextMap)
    return 0;
  v2 = gContextMapLock;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v4 = *(_QWORD **)(gOALContextMap + 8);
  if (!v4)
    goto LABEL_13;
  v5 = gOALContextMap + 8;
  do
  {
    v6 = v4[4];
    v7 = v6 >= a1;
    if (v6 >= a1)
      v8 = v4;
    else
      v8 = v4 + 1;
    if (v7)
      v5 = (uint64_t)v4;
    v4 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 != gOALContextMap + 8 && *(_QWORD *)(v5 + 32) <= a1)
  {
    v9 = *(_QWORD *)(v5 + 40);
    if (v9)
    {
      v11 = (unsigned int *)(v9 + 440);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 + 1, v11));
    }
  }
  else
  {
LABEL_13:
    v9 = 0;
  }
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  return v9;
}

uint64_t InitializeBufferMap(void)
{
  _QWORD *v0;
  CAGuard *v1;
  _QWORD *v2;
  OALBuffer *v3;
  uint64_t v4;
  int v5;
  uint64_t **v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  uint64_t *v10;
  __int128 v12;

  pthread_mutex_lock(&InitializeBufferMap(void)::sInitLock);
  if (!gOALBufferMap)
  {
    v0 = (_QWORD *)operator new();
    v0[2] = 0;
    v0[1] = 0;
    *v0 = v0 + 1;
    gOALBufferMap = (uint64_t)v0;
    v1 = (CAGuard *)operator new();
    CAGuard::CAGuard(v1, "OAL:BufferMapLock");
    gBufferMapLock = (uint64_t)v1;
    v2 = (_QWORD *)operator new();
    v2[2] = 0;
    v2[1] = 0;
    *v2 = v2 + 1;
    gDeadOALBufferMap = (uint64_t)v2;
    v3 = (OALBuffer *)operator new();
    OALBuffer::OALBuffer(v3, 0);
    v4 = gBufferMapLock;
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gBufferMapLock + 16))(gBufferMapLock);
    v6 = (uint64_t **)(gOALBufferMap + 8);
    v7 = *(_QWORD *)(gOALBufferMap + 8);
    if (v7)
    {
      do
      {
        v8 = *(_DWORD *)(v7 + 32);
        v9 = v8 == 0;
        if (v8)
          v10 = (uint64_t *)v7;
        else
          v10 = (uint64_t *)(v7 + 8);
        if (!v9)
          v6 = (uint64_t **)v7;
        v7 = *v10;
      }
      while (*v10);
    }
    LODWORD(v12) = 0;
    *((_QWORD *)&v12 + 1) = v3;
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>((uint64_t ***)gOALBufferMap, v6, &v12);
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  }
  return pthread_mutex_unlock(&InitializeBufferMap(void)::sInitLock);
}

void sub_215C33D34(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t DeleteContextsOfThisDevice(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t **v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v9;
  uint64_t *v10;
  BOOL v11;
  OALContext *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  BOOL v18;
  uint64_t **v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;

  v2 = gContextMapLock;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v4 = (uint64_t **)gOALContextMap;
  if (!gOALContextMap)
    goto LABEL_39;
  if (*(_DWORD *)(gOALContextMap + 16))
  {
    v5 = 0;
    while (1)
    {
      v6 = *v4;
      if (v5)
      {
        v7 = v5;
        do
        {
          v9 = (uint64_t *)v6[1];
          if (v9)
          {
            do
            {
              v10 = v9;
              v9 = (uint64_t *)*v9;
            }
            while (v9);
          }
          else
          {
            do
            {
              v10 = (uint64_t *)v6[2];
              v11 = *v10 == (_QWORD)v6;
              v6 = v10;
            }
            while (!v11);
          }
          v6 = v10;
        }
        while (v7-- > 1);
      }
      else
      {
        v10 = *v4;
      }
      if (v10 == (uint64_t *)(v4 + 1))
        break;
      v12 = (OALContext *)v10[5];
      if (!v12)
        break;
      if (**((_QWORD **)v12 + 2) == a1)
      {
        v13 = v10[4];
        if (v13 == gCurrentContext)
        {
          alcMakeContextCurrent(0);
          v4 = (uint64_t **)gOALContextMap;
        }
        v14 = v4[1];
        if (v14)
        {
          v15 = (uint64_t *)(v4 + 1);
          v16 = v4[1];
          do
          {
            v17 = v16[4];
            v18 = v17 >= v13;
            if (v17 >= v13)
              v19 = (uint64_t **)v16;
            else
              v19 = (uint64_t **)(v16 + 1);
            if (v18)
              v15 = v16;
            v16 = *v19;
          }
          while (*v19);
          if (v15 != (uint64_t *)(v4 + 1) && v15[4] <= v13)
          {
            v20 = (uint64_t *)v15[1];
            v21 = v15;
            if (v20)
            {
              do
              {
                v22 = v20;
                v20 = (uint64_t *)*v20;
              }
              while (v20);
            }
            else
            {
              do
              {
                v22 = (uint64_t *)v21[2];
                v11 = *v22 == (_QWORD)v21;
                v21 = v22;
              }
              while (!v11);
            }
            if (*v4 == v15)
              *v4 = v22;
            v4[2] = (uint64_t *)((char *)v4[2] - 1);
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v14, v15);
            operator delete(v15);
            OALContext::~OALContext(v12);
            MEMORY[0x2199EEC7C]();
            --v5;
            v4 = (uint64_t **)gOALContextMap;
          }
        }
      }
      if (++v5 >= *((_DWORD *)v4 + 4))
        goto LABEL_41;
    }
LABEL_39:
    v23 = 40964;
    if (v3)
      goto LABEL_42;
    return v23;
  }
LABEL_41:
  v23 = 0;
  if (v3)
LABEL_42:
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  return v23;
}

void sub_215C33F9C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

ALCBOOLean alcMakeContextCurrent(ALCcontext *context)
{
  unint64_t v2;
  BOOL v4;
  ALCenum v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  _QWORD *v12;
  OALContext *v13;
  OALDevice **v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  BOOL v22;
  _QWORD *v23;
  uint64_t v24;
  char v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  const ALCchar *String;
  unsigned int *v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  BOOL v35;
  _QWORD *v36;
  uint64_t v37;
  int v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  ALCcontext *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v38 = 136315650;
    v39 = "oalImp.cpp";
    v40 = 1024;
    v41 = 840;
    v42 = 2048;
    v43 = context;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcMakeContextCurrent--> context = %ld", (uint8_t *)&v38, 0x1Cu);
  }
  v2 = gCurrentContext;
  if ((ALCcontext *)gCurrentContext == context)
    return 1;
  if (gOALContextMap)
    v4 = gOALDeviceMap == 0;
  else
    v4 = 1;
  if (!v4)
  {
    if (gCurrentContext)
    {
      v6 = gContextMapLock;
      v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
      v8 = *(_QWORD **)(gOALContextMap + 8);
      if (!v8)
        goto LABEL_24;
      v9 = gOALContextMap + 8;
      do
      {
        v10 = v8[4];
        v11 = v10 >= v2;
        if (v10 >= v2)
          v12 = v8;
        else
          v12 = v8 + 1;
        if (v11)
          v9 = (uint64_t)v8;
        v8 = (_QWORD *)*v12;
      }
      while (*v12);
      if (v9 != gOALContextMap + 8 && *(_QWORD *)(v9 + 32) <= v2)
      {
        v13 = *(OALContext **)(v9 + 40);
        if (v13)
        {
          v31 = (unsigned int *)((char *)v13 + 440);
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 + 1, v31));
        }
      }
      else
      {
LABEL_24:
        v13 = 0;
      }
      if (v7)
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
      if (!context)
      {
        gCurrentDevice = 0;
        gCurrentContext = 0;
        if (!v13)
          return 1;
        v5 = OALContext::DisconnectMixerFromDevice(v13);
        v14 = 0;
        goto LABEL_50;
      }
    }
    else
    {
      if (!context)
      {
        gCurrentDevice = 0;
        gCurrentContext = 0;
        return 1;
      }
      v13 = 0;
    }
    v15 = gContextMapLock;
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v17 = gOALContextMap + 8;
    v18 = *(_QWORD **)(gOALContextMap + 8);
    if (!v18)
      goto LABEL_43;
    v19 = gOALContextMap + 8;
    v20 = *(_QWORD **)(gOALContextMap + 8);
    do
    {
      v21 = v20[4];
      v22 = v21 >= (unint64_t)context;
      if (v21 >= (unint64_t)context)
        v23 = v20;
      else
        v23 = v20 + 1;
      if (v22)
        v19 = (uint64_t)v20;
      v20 = (_QWORD *)*v23;
    }
    while (*v23);
    if (v19 != v17 && *(_QWORD *)(v19 + 32) <= (unint64_t)context)
    {
      v14 = *(OALDevice ***)(v19 + 40);
      if (v14)
      {
        v33 = gOALContextMap + 8;
        do
        {
          v34 = v18[4];
          v35 = v34 >= (unint64_t)context;
          if (v34 >= (unint64_t)context)
            v36 = v18;
          else
            v36 = v18 + 1;
          if (v35)
            v33 = (uint64_t)v18;
          v18 = (_QWORD *)*v36;
        }
        while (*v36);
        if (v33 == v17 || *(_QWORD *)(v33 + 32) > (unint64_t)context || (v37 = *(_QWORD *)(v33 + 40)) == 0)
        {
          v25 = 0;
          v5 = 0;
          v24 = 0;
        }
        else
        {
          v25 = 0;
          v5 = 0;
          v24 = **(_QWORD **)(v37 + 16);
        }
LABEL_45:
        if (v16)
          (*(void (**)(uint64_t))(*(_QWORD *)v15 + 24))(v15);
        if ((v25 & 1) == 0)
        {
          gCurrentDevice = v24;
          gCurrentContext = (uint64_t)context;
          v5 = OALContext::ConnectMixerToDevice(v14);
        }
        if (!v13)
        {
LABEL_52:
          if (v14)
          {
            v28 = (unsigned int *)(v14 + 55);
            do
              v29 = __ldaxr(v28);
            while (__stlxr(v29 - 1, v28));
          }
          if (v5)
            goto LABEL_56;
          return 1;
        }
LABEL_50:
        v26 = (unsigned int *)((char *)v13 + 440);
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        goto LABEL_52;
      }
    }
    else
    {
LABEL_43:
      v14 = 0;
    }
    v24 = 0;
    v5 = 40962;
    v25 = 1;
    goto LABEL_45;
  }
  v5 = 40964;
LABEL_56:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    String = alcGetString(0, v5);
    v38 = 136315650;
    v39 = "oalImp.cpp";
    v40 = 1024;
    v41 = 894;
    v42 = 2080;
    v43 = (ALCcontext *)String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcMakeContextCurrent FAILED = %s\n", (uint8_t *)&v38, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALCErrorKey))
    pthread_setspecific(gALCErrorKey, (const void *)v5);
  return 0;
}

void sub_215C343A0(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t ReconfigureContextsOfThisDevice(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;

  if (gOALContextMap)
  {
    v1 = result;
    v2 = gContextMapLock;
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v3 = result;
    v4 = gOALContextMap;
    if (*(_DWORD *)(gOALContextMap + 16))
    {
      v5 = 0;
      do
      {
        v6 = *(_QWORD **)v4;
        if (v5)
        {
          v7 = v5;
          do
          {
            v9 = (_QWORD *)v6[1];
            if (v9)
            {
              do
              {
                v10 = v9;
                v9 = (_QWORD *)*v9;
              }
              while (v9);
            }
            else
            {
              do
              {
                v10 = (_QWORD *)v6[2];
                v11 = *v10 == (_QWORD)v6;
                v6 = v10;
              }
              while (!v11);
            }
            v6 = v10;
          }
          while (v7-- > 1);
        }
        else
        {
          v10 = *(_QWORD **)v4;
        }
        if (v10 != (_QWORD *)(v4 + 8))
        {
          result = v10[5];
          if (result)
          {
            if (**(_QWORD **)(result + 16) == v1)
            {
              result = OALContext::ConfigureMixerFormat((AudioUnit *)result);
              v4 = gOALContextMap;
            }
          }
        }
        ++v5;
      }
      while (v5 < *(unsigned int *)(v4 + 16));
    }
    if (v3)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  }
  return result;
}

void sub_215C344C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

ALCdevice *__cdecl alcCaptureOpenDevice(const ALCchar *devicename, ALCuint frequency, ALCenum format, ALCsizei buffersize)
{
  const char *v8;
  _QWORD *v9;
  CAGuard *v10;
  ALCdevice *v11;
  OALCaptureDevice *v12;
  uint64_t v13;
  int v14;
  uint64_t **v15;
  _QWORD *v16;
  unint64_t v17;
  BOOL v18;
  _QWORD *v19;
  const ALCchar *String;
  _BYTE v22[18];
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    if ((format - 4352) > 3)
      v8 = "UNKNOWN FORMAT";
    else
      v8 = off_24D4652B0[format - 4352];
    *(_DWORD *)v22 = 136316162;
    *(_QWORD *)&v22[4] = "oalImp.cpp";
    *(_WORD *)&v22[12] = 1024;
    *(_DWORD *)&v22[14] = 510;
    v23 = 2080;
    v24 = v8;
    v25 = 2048;
    v26 = frequency;
    v27 = 2048;
    v28 = buffersize;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCaptureOpenDevice: format %s : sample rate = %ld : buffer size = %ld", v22, 0x30u);
  }
  if (format >> 2 == 1088)
  {
    pthread_mutex_lock(&stru_254DFD9D8);
    if (!gOALCaptureDeviceMap)
    {
      v9 = (_QWORD *)operator new();
      v9[2] = 0;
      v9[1] = 0;
      *v9 = v9 + 1;
      gOALCaptureDeviceMap = (uint64_t)v9;
      v10 = (CAGuard *)operator new();
      CAGuard::CAGuard(v10, "OAL:CaptureLock");
      gCaptureDeviceMapLock = (uint64_t)v10;
    }
    pthread_mutex_unlock(&stru_254DFD9D8);
    v11 = (ALCdevice *)_MergedGlobals++;
    v12 = (OALCaptureDevice *)operator new();
    OALCaptureDevice::OALCaptureDevice(v12, devicename, (unint64_t)v11, frequency, format, buffersize);
    v13 = gCaptureDeviceMapLock;
    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
    v15 = (uint64_t **)(gOALCaptureDeviceMap + 8);
    v16 = *(_QWORD **)(gOALCaptureDeviceMap + 8);
    if (v16)
    {
      do
      {
        v17 = v16[4];
        v18 = v17 > (unint64_t)v11;
        if (v17 <= (unint64_t)v11)
          v19 = v16 + 1;
        else
          v19 = v16;
        if (v18)
          v15 = (uint64_t **)v16;
        v16 = (_QWORD *)*v19;
      }
      while (*v19);
    }
    *(_QWORD *)v22 = v11;
    *(_QWORD *)&v22[8] = v12;
    std::__tree<std::__value_type<unsigned long,OALCaptureDevice *>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,OALCaptureDevice *>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,OALCaptureDevice *>>>::__emplace_hint_multi<std::pair<unsigned long const,OALCaptureDevice *>>((uint64_t ***)gOALCaptureDeviceMap, v15, v22);
    if (v14)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alcGetString(0, 40963);
      *(_DWORD *)v22 = 136315650;
      *(_QWORD *)&v22[4] = "oalImp.cpp";
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = 538;
      v23 = 2080;
      v24 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureOpenDevice FAILED = %s\n", v22, 0x1Cu);
    }
    return 0;
  }
  return v11;
}

void sub_215C347CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EEC7C](v1, 0x10F1C4021999281);
  _Unwind_Resume(a1);
}

void sub_215C347F0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

BOOL IsFormatSupported(unsigned int a1)
{
  return a1 >> 2 == 1088;
}

const ALCchar *__cdecl alcGetString(ALCdevice *device, ALCenum param)
{
  const char *v4;
  unsigned int v5;
  char *v6;
  __int128 v7;
  char *v8;
  size_t v9;
  const char *v10;
  const ALCchar *String;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const ALCchar *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          v4 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          v4 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          v4 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          v4 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            v4 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101)
              goto LABEL_17;
            v4 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        v4 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (param == 4100)
      {
        v4 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!param)
      {
        v4 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (param == 784)
      {
        v4 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        v13 = 136315650;
        v14 = "oalImp.cpp";
        v15 = 1024;
        v16 = 1019;
        v17 = 2080;
        v18 = v4;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetString-->  %s", (uint8_t *)&v13, 0x1Cu);
        goto LABEL_23;
      }
    }
LABEL_17:
    v4 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  v5 = 40964;
  if (param <= 4100)
  {
    if (param <= 784)
    {
      if (!param)
        return "No Error";
      if (param == 784)
      {
        v6 = (char *)gDefaultInputDeviceName;
        strcpy((char *)gDefaultInputDeviceName, "Default Audio Device");
        if (!device)
LABEL_46:
          v6[strlen(v6) + 1] = 0;
        return v6;
      }
LABEL_48:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)v5);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        if (param <= 4101)
        {
LABEL_56:
          v10 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
        }
        else
        {
          switch(param)
          {
            case 40961:
              v10 = "ALC_INVALID_DEVICE";
              break;
            case 40962:
              v10 = "ALC_INVALID_CONTEXT";
              break;
            case 40963:
              v10 = "ALC_INVALID_ENUM";
              break;
            case 40964:
              v10 = "ALC_INVALID_VALUE";
              break;
            default:
              if (param != 4102)
                goto LABEL_56;
              v10 = "ALC_EXTENSIONS";
              break;
          }
        }
        String = alcGetString(0, v5);
        v13 = 136315906;
        v14 = "oalImp.cpp";
        v15 = 1024;
        v16 = 1097;
        v17 = 2080;
        v18 = v10;
        v19 = 2080;
        v20 = String;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcGetString FAILED - attribute = %s error = %s\n", (uint8_t *)&v13, 0x26u);
      }
      return 0;
    }
    if (param == 785)
    {
      v7 = *(_OWORD *)"Default Audio Device";
      v6 = (char *)gDefaultInputDeviceName;
    }
    else
    {
      if (param != 4100)
        goto LABEL_48;
      v7 = *(_OWORD *)"Default Audio Device";
      v6 = (char *)gDefaultOutputDeviceName;
    }
    *(_OWORD *)v6 = v7;
    strcpy(v6 + 13, " Device");
    return v6;
  }
  switch(param)
  {
    case 40961:
      v6 = "ALC Invalid Device";
      break;
    case 40962:
      v6 = "ALC Invalid Context";
      break;
    case 40963:
      v6 = "Invalid Enum";
      break;
    case 40964:
      v6 = "Invalid Value";
      break;
    default:
      if (param == 4101)
      {
        v6 = (char *)gDefaultOutputDeviceName;
        strcpy((char *)gDefaultOutputDeviceName, "Default Audio Device");
        if (!device)
          goto LABEL_46;
      }
      else
      {
        if (param != 4102)
          goto LABEL_48;
        if (!device)
        {
          v5 = 40961;
          goto LABEL_48;
        }
        v6 = (char *)alcExtensions;
        if (!alcExtensions)
        {
          v8 = (char *)malloc_type_malloc(0x34uLL, 0x607E9530uLL);
          alcExtensions = (uint64_t)v8;
          strcpy(v8, "ALC_EXT_CAPTURE ALC_ENUMERATION_EXT ALC_EXT_MAC_OSX");
          v9 = strlen(v8);
          v6 = (char *)malloc_type_realloc(v8, v9 + 37, 0xAB49D99FuLL);
          alcExtensions = (uint64_t)v6;
          strcat(v6, " ALC_EXT_ASA");
          strcat(v6, " ALC_EXT_OUTPUT_CAPTURER");
        }
      }
      break;
  }
  return v6;
}

ALCBOOLean alcCaptureCloseDevice(ALCdevice *device)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  OALCaptureDevice *v12;
  ALCenum v13;
  _BOOL4 v14;
  const ALCchar *String;
  uint64_t *v16;
  _QWORD *v17;
  unint64_t v18;
  BOOL v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  BOOL v24;
  uint64_t v25;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const ALCchar *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v27 = 136315394;
    v28 = "oalImp.cpp";
    v29 = 1024;
    v30 = 553;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCaptureCloseDevice", (uint8_t *)&v27, 0x12u);
  }
  if (!gOALCaptureDeviceMap || !*(_QWORD *)(gOALCaptureDeviceMap + 16))
  {
    v13 = 40964;
    goto LABEL_22;
  }
  v2 = gCaptureDeviceMapLock;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
  v4 = gOALCaptureDeviceMap;
  v6 = gOALCaptureDeviceMap + 8;
  v5 = *(uint64_t **)(gOALCaptureDeviceMap + 8);
  if (!v5)
    goto LABEL_16;
  v7 = gOALCaptureDeviceMap + 8;
  v8 = *(_QWORD **)(gOALCaptureDeviceMap + 8);
  do
  {
    v9 = v8[4];
    v10 = v9 >= (unint64_t)device;
    if (v9 >= (unint64_t)device)
      v11 = v8;
    else
      v11 = v8 + 1;
    if (v10)
      v7 = (uint64_t)v8;
    v8 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v7 == v6 || *(_QWORD *)(v7 + 32) > (unint64_t)device)
  {
LABEL_16:
    LOBYTE(v12) = 0;
    goto LABEL_17;
  }
  v12 = *(OALCaptureDevice **)(v7 + 40);
  if (!v12)
  {
LABEL_17:
    v13 = 40963;
    if (!v3)
      goto LABEL_19;
    goto LABEL_18;
  }
  v16 = (uint64_t *)(gOALCaptureDeviceMap + 8);
  v17 = *(_QWORD **)(gOALCaptureDeviceMap + 8);
  do
  {
    v18 = v17[4];
    v19 = v18 >= (unint64_t)device;
    if (v18 >= (unint64_t)device)
      v20 = v17;
    else
      v20 = v17 + 1;
    if (v19)
      v16 = v17;
    v17 = (_QWORD *)*v20;
  }
  while (*v20);
  if (v16 != (uint64_t *)v6 && v16[4] <= (unint64_t)device)
  {
    v21 = (uint64_t *)v16[1];
    if (v21)
    {
      do
      {
        v22 = v21;
        v21 = (uint64_t *)*v21;
      }
      while (v21);
    }
    else
    {
      v23 = v16;
      do
      {
        v22 = (uint64_t *)v23[2];
        v24 = *v22 == (_QWORD)v23;
        v23 = v22;
      }
      while (!v24);
    }
    if (*(uint64_t **)gOALCaptureDeviceMap == v16)
      *(_QWORD *)gOALCaptureDeviceMap = v22;
    --*(_QWORD *)(v4 + 16);
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v5, v16);
    operator delete(v16);
  }
  while (*((_DWORD *)v12 + 30))
    usleep(0x2710u);
  OALCaptureDevice::~OALCaptureDevice(v12);
  MEMORY[0x2199EEC7C]();
  v25 = gOALCaptureDeviceMap;
  if (*(_QWORD *)(gOALCaptureDeviceMap + 16))
  {
    v13 = 0;
    LOBYTE(v12) = 1;
    if (v3)
LABEL_18:
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  }
  else
  {
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(gOALCaptureDeviceMap, *(_QWORD **)(gOALCaptureDeviceMap + 8));
    MEMORY[0x2199EEC7C](v25, 0x1020C4062D53EE8);
    v13 = 0;
    gOALCaptureDeviceMap = 0;
    LOBYTE(v12) = 1;
    if (v3)
      goto LABEL_18;
  }
LABEL_19:
  if ((v12 & 1) != 0)
  {
    LOBYTE(v14) = 1;
    return v14;
  }
LABEL_22:
  v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    String = alcGetString(0, v13);
    v27 = 136315650;
    v28 = "oalImp.cpp";
    v29 = 1024;
    v30 = 585;
    v31 = 2080;
    v32 = String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureCloseDevice FAILED = %s", (uint8_t *)&v27, 0x1Cu);
    LOBYTE(v14) = 0;
  }
  return v14;
}

void sub_215C350A0(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void alcCaptureStart(ALCdevice *device)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  AudioUnit *v9;
  unsigned int *v10;
  unsigned int v11;
  const ALCchar *String;
  unsigned int *v13;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const ALCchar *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v15 = 136315394;
    v16 = "oalImp.cpp";
    v17 = 1024;
    v18 = 599;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCaptureStart", (uint8_t *)&v15, 0x12u);
  }
  if (!gOALCaptureDeviceMap)
    goto LABEL_33;
  v2 = gCaptureDeviceMapLock;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
  v4 = *(_QWORD **)(gOALCaptureDeviceMap + 8);
  if (!v4)
    goto LABEL_15;
  v5 = gOALCaptureDeviceMap + 8;
  do
  {
    v6 = v4[4];
    v7 = v6 >= (unint64_t)device;
    if (v6 >= (unint64_t)device)
      v8 = v4;
    else
      v8 = v4 + 1;
    if (v7)
      v5 = (uint64_t)v4;
    v4 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 != gOALCaptureDeviceMap + 8 && *(_QWORD *)(v5 + 32) <= (unint64_t)device)
  {
    v9 = *(AudioUnit **)(v5 + 40);
    if (v9)
    {
      v13 = (unsigned int *)(v9 + 15);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
  }
  else
  {
LABEL_15:
    v9 = 0;
  }
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (v9)
  {
    OALCaptureDevice::StartCapture(v9);
    v10 = (unsigned int *)(v9 + 15);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
  }
  else
  {
LABEL_33:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alcGetString(0, 40964);
      v15 = 136315650;
      v16 = "oalImp.cpp";
      v17 = 1024;
      v18 = 611;
      v19 = 2080;
      v20 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureStart FAILED = %s", (uint8_t *)&v15, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
}

void sub_215C35304(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alcCaptureStop(ALCdevice *device)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  AudioUnit *v9;
  unsigned int *v10;
  unsigned int v11;
  const ALCchar *String;
  unsigned int *v13;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const ALCchar *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v15 = 136315394;
    v16 = "oalImp.cpp";
    v17 = 1024;
    v18 = 622;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCaptureStop", (uint8_t *)&v15, 0x12u);
  }
  if (!gOALCaptureDeviceMap)
    goto LABEL_33;
  v2 = gCaptureDeviceMapLock;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
  v4 = *(_QWORD **)(gOALCaptureDeviceMap + 8);
  if (!v4)
    goto LABEL_15;
  v5 = gOALCaptureDeviceMap + 8;
  do
  {
    v6 = v4[4];
    v7 = v6 >= (unint64_t)device;
    if (v6 >= (unint64_t)device)
      v8 = v4;
    else
      v8 = v4 + 1;
    if (v7)
      v5 = (uint64_t)v4;
    v4 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 != gOALCaptureDeviceMap + 8 && *(_QWORD *)(v5 + 32) <= (unint64_t)device)
  {
    v9 = *(AudioUnit **)(v5 + 40);
    if (v9)
    {
      v13 = (unsigned int *)(v9 + 15);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
  }
  else
  {
LABEL_15:
    v9 = 0;
  }
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (v9)
  {
    OALCaptureDevice::StopCapture(v9);
    v10 = (unsigned int *)(v9 + 15);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
  }
  else
  {
LABEL_33:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alcGetString(0, 40964);
      v15 = 136315650;
      v16 = "oalImp.cpp";
      v17 = 1024;
      v18 = 634;
      v19 = 2080;
      v20 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureStop FAILED = %s", (uint8_t *)&v15, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
}

void sub_215C35538(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alcCaptureSamples(ALCdevice *device, ALCvoid *buffer, ALCsizei samples)
{
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  _QWORD *v14;
  OALCaptureDevice *v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const ALCchar *String;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!gOALCaptureDeviceMap)
    goto LABEL_31;
  v6 = gCaptureDeviceMapLock;
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
  v10 = *(_QWORD **)(gOALCaptureDeviceMap + 8);
  if (!v10)
    goto LABEL_13;
  v11 = gOALCaptureDeviceMap + 8;
  do
  {
    v12 = v10[4];
    v13 = v12 >= (unint64_t)device;
    if (v12 >= (unint64_t)device)
      v14 = v10;
    else
      v14 = v10 + 1;
    if (v13)
      v11 = (uint64_t)v10;
    v10 = (_QWORD *)*v14;
  }
  while (*v14);
  if (v11 != gOALCaptureDeviceMap + 8 && *(_QWORD *)(v11 + 32) <= (unint64_t)device)
  {
    v15 = *(OALCaptureDevice **)(v11 + 40);
    if (v15)
    {
      v18 = (unsigned int *)((char *)v15 + 120);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 + 1, v18));
    }
  }
  else
  {
LABEL_13:
    v15 = 0;
  }
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
  if (v15)
  {
    OALCaptureDevice::GetFrames(v15, samples, (unsigned __int8 *)buffer, v8, v9);
    v16 = (unsigned int *)((char *)v15 + 120);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
  }
  else
  {
LABEL_31:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v20 = 136315650;
      v21 = "oalImp.cpp";
      v22 = 1024;
      v23 = 657;
      v24 = 2080;
      String = alcGetString(0, 40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureSamples FAILED = %s\n", (uint8_t *)&v20, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
}

void sub_215C35720(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

ALCdevice *__cdecl alcOpenDevice(const ALCchar *devicename)
{
  _QWORD *v2;
  CAGuard *v3;
  ALCdevice *v4;
  OALDevice *v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  _QWORD *v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  _BYTE v14[18];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)&v14[4] = "oalImp.cpp";
    *(_WORD *)&v14[12] = 1024;
    *(_DWORD *)&v14[14] = 674;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOpenDevice", v14, 0x12u);
  }
  pthread_mutex_lock(&stru_254DFDA18);
  if (!gOALDeviceMap)
  {
    v2 = (_QWORD *)operator new();
    v2[2] = 0;
    v2[1] = 0;
    *v2 = v2 + 1;
    gOALDeviceMap = (uint64_t)v2;
    v3 = (CAGuard *)operator new();
    CAGuard::CAGuard(v3, "OAL:DeviceLock");
    gDeviceMapLock = (uint64_t)v3;
  }
  pthread_mutex_unlock(&stru_254DFDA18);
  if (*(_QWORD *)(gOALDeviceMap + 16))
    return 0;
  v4 = (ALCdevice *)_MergedGlobals++;
  v6 = (OALDevice *)operator new();
  OALDevice::OALDevice(v6, devicename, (uint64_t)v4);
  if (!*((_BYTE *)v6 + 80))
    goto LABEL_25;
  v7 = gDeviceMapLock;
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
  v9 = (uint64_t **)(gOALDeviceMap + 8);
  v10 = *(_QWORD **)(gOALDeviceMap + 8);
  if (v10)
  {
    do
    {
      v11 = v10[4];
      v12 = v11 > (unint64_t)v4;
      if (v11 <= (unint64_t)v4)
        v13 = v10 + 1;
      else
        v13 = v10;
      if (v12)
        v9 = (uint64_t **)v10;
      v10 = (_QWORD *)*v13;
    }
    while (*v13);
  }
  *(_QWORD *)v14 = v4;
  *(_QWORD *)&v14[8] = v6;
  std::__tree<std::__value_type<unsigned long,OALCaptureDevice *>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,OALCaptureDevice *>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,OALCaptureDevice *>>>::__emplace_hint_multi<std::pair<unsigned long const,OALCaptureDevice *>>((uint64_t ***)gOALDeviceMap, v9, v14);
  gCurrentDevice = (uint64_t)v4;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  if (!*((_BYTE *)v6 + 80))
  {
LABEL_25:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v14 = 136315394;
      *(_QWORD *)&v14[4] = "oalImp.cpp";
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = 699;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOpenDevice FAILED\n", v14, 0x12u);
    }
    OALDevice::~OALDevice(v6);
    MEMORY[0x2199EEC7C]();
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    return 0;
  }
  return v4;
}

void sub_215C359F0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

ALCBOOLean alcCloseDevice(ALCdevice *device)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  _QWORD *v6;
  OALDevice *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  ALCenum v19;
  const ALCchar *String;
  uint64_t *v22;
  BOOL v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const ALCchar *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315394;
    v25 = "oalImp.cpp";
    v26 = 1024;
    v27 = 712;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCloseDevice", (uint8_t *)&v24, 0x12u);
  }
  if (!gOALDeviceMap)
    goto LABEL_30;
  v2 = *(_QWORD **)(gOALDeviceMap + 8);
  if (!v2)
    goto LABEL_30;
  v3 = gOALDeviceMap + 8;
  do
  {
    v4 = v2[4];
    v5 = v4 >= (unint64_t)device;
    if (v4 >= (unint64_t)device)
      v6 = v2;
    else
      v6 = v2 + 1;
    if (v5)
      v3 = (uint64_t)v2;
    v2 = (_QWORD *)*v6;
  }
  while (*v6);
  if (v3 != gOALDeviceMap + 8
    && *(_QWORD *)(v3 + 32) <= (unint64_t)device
    && (v7 = *(OALDevice **)(v3 + 40)) != 0)
  {
    v8 = gDeviceMapLock;
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
    v10 = gOALDeviceMap;
    v11 = *(uint64_t **)(gOALDeviceMap + 8);
    if (v11)
    {
      v12 = (uint64_t *)(gOALDeviceMap + 8);
      v13 = *(_QWORD **)(gOALDeviceMap + 8);
      do
      {
        v14 = v13[4];
        v15 = v14 >= (unint64_t)device;
        if (v14 >= (unint64_t)device)
          v16 = v13;
        else
          v16 = v13 + 1;
        if (v15)
          v12 = v13;
        v13 = (_QWORD *)*v16;
      }
      while (*v16);
      if (v12 != (uint64_t *)(gOALDeviceMap + 8) && v12[4] <= (unint64_t)device)
      {
        v17 = (uint64_t *)v12[1];
        if (v17)
        {
          do
          {
            v18 = v17;
            v17 = (uint64_t *)*v17;
          }
          while (v17);
        }
        else
        {
          v22 = v12;
          do
          {
            v18 = (uint64_t *)v22[2];
            v23 = *v18 == (_QWORD)v22;
            v22 = v18;
          }
          while (!v23);
        }
        if (*(uint64_t **)gOALDeviceMap == v12)
          *(_QWORD *)gOALDeviceMap = v18;
        --*(_QWORD *)(v10 + 16);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v11, v12);
        operator delete(v12);
      }
    }
    v19 = DeleteContextsOfThisDevice((uint64_t)device);
    if (!v19)
    {
      OALDevice::~OALDevice(v7);
      MEMORY[0x2199EEC7C]();
    }
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
    if (!v19)
      return 1;
  }
  else
  {
LABEL_30:
    v19 = 40963;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    String = alcGetString(0, v19);
    v24 = 136315650;
    v25 = "oalImp.cpp";
    v26 = 1024;
    v27 = 738;
    v28 = 2080;
    v29 = String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCloseDevice FAILED = %s\n", (uint8_t *)&v24, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALCErrorKey))
    pthread_setspecific(gALCErrorKey, (const void *)v19);
  return 0;
}

void sub_215C35D5C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

ALCenum alcGetError(ALCdevice *device)
{
  void *v1;

  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  v1 = pthread_getspecific(gALCErrorKey);
  if (v1)
    pthread_setspecific(gALCErrorKey, 0);
  return (int)v1;
}

ALCcontext *__cdecl alcCreateContext(ALCdevice *device, const ALCint *attrlist)
{
  _QWORD *v4;
  CAGuard *v5;
  ALCcontext *v6;
  unsigned int v7;
  ALCint v8;
  ALCint v9;
  const ALCint *v10;
  ALCint v11;
  ALCint v12;
  ALCint v13;
  int v14;
  unsigned int v15;
  uint64_t v17;
  int v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  _QWORD *v23;
  unsigned int *v24;
  uint64_t v25;
  OALContext *v26;
  uint64_t v27;
  int v28;
  uint64_t **v29;
  _QWORD *v30;
  unint64_t v31;
  BOOL v32;
  _QWORD *v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int v37;
  const ALCchar *String;
  unsigned int *v40;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;
  _BYTE buf[18];
  __int16 v45;
  ALCdevice *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v43 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "oalImp.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 787;
    v45 = 2048;
    v46 = device;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCreateContext--> device = %ld", buf, 0x1Cu);
  }
  pthread_mutex_lock(&stru_254DFDA58);
  if (!gOALContextMap)
  {
    v4 = (_QWORD *)operator new();
    v4[2] = 0;
    v4[1] = 0;
    *v4 = v4 + 1;
    gOALContextMap = (uint64_t)v4;
    v5 = (CAGuard *)operator new();
    CAGuard::CAGuard(v5, "OAL:ContextMapLock");
    gContextMapLock = (uint64_t)v5;
  }
  pthread_mutex_unlock(&stru_254DFDA58);
  v6 = (ALCcontext *)_MergedGlobals++;
  v7 = gMaximumMixerBusCount;
  if (attrlist)
  {
    v8 = 0;
    v9 = 0;
    v10 = attrlist + 1;
    v11 = *attrlist;
    if (*attrlist != 4112)
      goto LABEL_8;
    do
    {
LABEL_7:
      v12 = *v10;
      v10 += 2;
      v8 = v12;
      v11 = *(v10 - 1);
    }
    while (v11 == 4112);
    while (1)
    {
LABEL_8:
      while (v11 == 4113)
      {
        v13 = *v10;
        v10 += 2;
        v9 = v13;
        v11 = *(v10 - 1);
        if (v11 == 4112)
          goto LABEL_7;
      }
      if (!v11)
        break;
      v10 += 2;
      v11 = *(v10 - 1);
      if (v11 == 4112)
        goto LABEL_7;
    }
    v14 = v8 | v9;
    v15 = v9 + v8;
    if (v15 <= gMaximumMixerBusCount && v15 <= 0x20)
      v15 = gMaximumMixerBusCount;
    if (v14)
      v7 = v15;
  }
  v42 = v7;
  if (gOALDeviceMap)
  {
    v17 = gDeviceMapLock;
    v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
    v19 = *(_QWORD **)(gOALDeviceMap + 8);
    if (!v19)
      goto LABEL_33;
    v20 = gOALDeviceMap + 8;
    do
    {
      v21 = v19[4];
      v22 = v21 >= (unint64_t)device;
      if (v21 >= (unint64_t)device)
        v23 = v19;
      else
        v23 = v19 + 1;
      if (v22)
        v20 = (uint64_t)v19;
      v19 = (_QWORD *)*v23;
    }
    while (*v23);
    if (v20 != gOALDeviceMap + 8 && *(_QWORD *)(v20 + 32) <= (unint64_t)device)
    {
      v24 = *(unsigned int **)(v20 + 40);
      if (v24)
      {
        v40 = v24 + 19;
        do
          v41 = __ldaxr(v40);
        while (__stlxr(v41 + 1, v40));
      }
    }
    else
    {
LABEL_33:
      v24 = 0;
    }
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 24))(v17);
    if (v24)
    {
      v25 = gUsersMixerOutputRate;
      if (*(double *)&gUsersMixerOutputRate <= 0.0)
        v25 = *((_QWORD *)v24 + 7);
      v43 = v25;
      v26 = (OALContext *)operator new();
      OALContext::OALContext(v26, (unint64_t)v6, (OALDevice *)v24, attrlist, &v42, (double *)&v43);
      if (*((_BYTE *)v26 + 488))
      {
        v27 = gContextMapLock;
        v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
        v29 = (uint64_t **)(gOALContextMap + 8);
        v30 = *(_QWORD **)(gOALContextMap + 8);
        if (v30)
        {
          do
          {
            v31 = v30[4];
            v32 = v31 > (unint64_t)v6;
            if (v31 <= (unint64_t)v6)
              v33 = v30 + 1;
            else
              v33 = v30;
            if (v32)
              v29 = (uint64_t **)v30;
            v30 = (_QWORD *)*v33;
          }
          while (*v33);
        }
        *(_QWORD *)buf = v6;
        *(_QWORD *)&buf[8] = v26;
        std::__tree<std::__value_type<unsigned long,OALCaptureDevice *>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,OALCaptureDevice *>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,OALCaptureDevice *>>>::__emplace_hint_multi<std::pair<unsigned long const,OALCaptureDevice *>>((uint64_t ***)gOALContextMap, v29, buf);
        if (v28)
          (*(void (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
        v34 = v24 + 19;
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        return v6;
      }
      v36 = v24 + 19;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    String = alcGetString(0, 40964);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "oalImp.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 828;
    v45 = 2080;
    v46 = (ALCdevice *)String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCreateContext FAILED = %s\n", buf, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALCErrorKey))
    pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  return 0;
}

void sub_215C36220(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void alcProcessContext(ALCcontext *context)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  ALCcontext *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315650;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 906;
    v6 = 2048;
    v7 = context;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcProcessContext--> context = %ld", (uint8_t *)&v2, 0x1Cu);
  }
}

ALCcontext *alcGetCurrentContext(void)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v1 = 136315394;
    v2 = "oalImp.cpp";
    v3 = 1024;
    v4 = 914;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetCurrentContext", (uint8_t *)&v1, 0x12u);
  }
  return (ALCcontext *)gCurrentContext;
}

ALCdevice *__cdecl alcGetContextsDevice(ALCcontext *context)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  uint64_t v9;
  ALCdevice *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  ALCcontext *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315650;
    v13 = "oalImp.cpp";
    v14 = 1024;
    v15 = 923;
    v16 = 2048;
    v17 = context;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetContextsDevice--> context = %ld", (uint8_t *)&v12, 0x1Cu);
  }
  if (gOALContextMap)
  {
    v2 = gContextMapLock;
    v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v4 = *(_QWORD **)(gOALContextMap + 8);
    if (v4)
    {
      v5 = gOALContextMap + 8;
      do
      {
        v6 = v4[4];
        v7 = v6 >= (unint64_t)context;
        if (v6 >= (unint64_t)context)
          v8 = v4;
        else
          v8 = v4 + 1;
        if (v7)
          v5 = (uint64_t)v4;
        v4 = (_QWORD *)*v8;
      }
      while (*v8);
      if (v5 != gOALContextMap + 8 && *(_QWORD *)(v5 + 32) <= (unint64_t)context)
      {
        v9 = *(_QWORD *)(v5 + 40);
        if (v9)
        {
          v10 = **(ALCdevice ***)(v9 + 16);
          if (!v3)
            return v10;
          goto LABEL_19;
        }
      }
    }
    v10 = 0;
    if (v3)
LABEL_19:
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315394;
      v13 = "oalImp.cpp";
      v14 = 1024;
      v15 = 938;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcGetContextsDevice FAILED", (uint8_t *)&v12, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    return 0;
  }
  return v10;
}

void sub_215C36618(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alcSuspendContext(ALCcontext *context)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  ALCcontext *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315650;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 946;
    v6 = 2048;
    v7 = context;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcSuspendContext--> context = %ld", (uint8_t *)&v2, 0x1Cu);
  }
}

void alcDestroyContext(ALCcontext *context)
{
  BOOL v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  OALContext *v16;
  int v17;
  BOOL v18;
  _QWORD *v19;
  unint64_t v20;
  BOOL v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  BOOL v29;
  _QWORD *v30;
  AUGraph *v31;
  unsigned int *v32;
  unsigned int v33;
  const ALCchar *String;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v44;
  uint64_t v45;
  unsigned int *v46;
  unsigned int v47;
  int v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  ALCcontext *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v48 = 136315650;
    v49 = "oalImp.cpp";
    v50 = 1024;
    v51 = 954;
    v52 = 2048;
    v53 = context;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcDestroyContext--> context = %ld", (uint8_t *)&v48, 0x1Cu);
  }
  v2 = (ALCcontext *)gCurrentContext == context || gOALContextMap == 0;
  if (v2)
  {
    v3 = 40964;
LABEL_58:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alcGetString(0, v3);
      v48 = 136315650;
      v49 = "oalImp.cpp";
      v50 = 1024;
      v51 = 1004;
      v52 = 2080;
      v53 = (ALCcontext *)String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcDestroyContext FAILED = %s\n", (uint8_t *)&v48, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)v3);
    return;
  }
  v4 = gContextMapLock;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v6 = v5;
  v7 = gOALContextMap;
  v9 = gOALContextMap + 8;
  v8 = *(uint64_t **)(gOALContextMap + 8);
  if (!v8)
  {
    v16 = 0;
    v17 = 0;
    v18 = 1;
    v3 = 40962;
    if (!v6)
      goto LABEL_36;
    goto LABEL_35;
  }
  v10 = (uint64_t *)(gOALContextMap + 8);
  v11 = gOALContextMap + 8;
  v12 = *(_QWORD **)(gOALContextMap + 8);
  do
  {
    v13 = v12[4];
    v14 = v13 >= (unint64_t)context;
    if (v13 >= (unint64_t)context)
      v15 = v12;
    else
      v15 = v12 + 1;
    if (v14)
      v11 = (uint64_t)v12;
    v12 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v11 == v9 || *(_QWORD *)(v11 + 32) > (unint64_t)context)
    v16 = 0;
  else
    v16 = *(OALContext **)(v11 + 40);
  v19 = *(_QWORD **)(gOALContextMap + 8);
  do
  {
    v20 = v19[4];
    v21 = v20 >= (unint64_t)context;
    if (v20 >= (unint64_t)context)
      v22 = v19;
    else
      v22 = v19 + 1;
    if (v21)
      v10 = v19;
    v19 = (_QWORD *)*v22;
  }
  while (*v22);
  if (v10 == (uint64_t *)v9 || v10[4] > (unint64_t)context)
  {
    v17 = 0;
    v18 = 1;
    v3 = 40962;
    if (!v6)
      goto LABEL_36;
    goto LABEL_35;
  }
  v35 = (uint64_t *)v10[1];
  if (v35)
  {
    do
    {
      v36 = v35;
      v35 = (uint64_t *)*v35;
    }
    while (v35);
  }
  else
  {
    v37 = v10;
    do
    {
      v36 = (uint64_t *)v37[2];
      v2 = *v36 == (_QWORD)v37;
      v37 = v36;
    }
    while (!v2);
  }
  if (*(uint64_t **)gOALContextMap == v10)
    *(_QWORD *)gOALContextMap = v36;
  --*(_QWORD *)(v7 + 16);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v8, v10);
  operator delete(v10);
  v38 = *(unsigned int *)(gOALContextMap + 16);
  if (!*(_DWORD *)(gOALContextMap + 16))
  {
    v3 = 0;
    v18 = 1;
    v17 = 1;
    if (!v6)
      goto LABEL_36;
LABEL_35:
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
    goto LABEL_36;
  }
  v39 = 0;
  v18 = 0;
  do
  {
    v40 = *(_QWORD **)gOALContextMap;
    if (v39)
    {
      v41 = v39;
      v42 = *(_QWORD **)gOALContextMap;
      do
      {
        v44 = (_QWORD *)v42[1];
        if (v44)
        {
          do
          {
            v40 = v44;
            v44 = (_QWORD *)*v44;
          }
          while (v44);
        }
        else
        {
          do
          {
            v40 = (_QWORD *)v42[2];
            v2 = *v40 == (_QWORD)v42;
            v42 = v40;
          }
          while (!v2);
        }
        v42 = v40;
      }
      while (v41-- > 1);
    }
    if (v40 != (_QWORD *)(gOALContextMap + 8))
    {
      v45 = v40[5];
      if (v45)
      {
        if (**(_QWORD **)(v45 + 16) == **((_QWORD **)v16 + 2))
          break;
      }
    }
    v18 = ++v39 >= v38;
  }
  while (v39 != v38);
  v3 = 0;
  v17 = 1;
  if (v6)
    goto LABEL_35;
LABEL_36:
  if (!v17)
    goto LABEL_58;
  if (v18)
  {
    if (!gOALDeviceMap)
    {
LABEL_57:
      OALContext::~OALContext(v16);
      MEMORY[0x2199EEC7C]();
      return;
    }
    v23 = **((_QWORD **)v16 + 2);
    v24 = gDeviceMapLock;
    v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
    v26 = *(_QWORD **)(gOALDeviceMap + 8);
    if (!v26)
      goto LABEL_50;
    v27 = gOALDeviceMap + 8;
    do
    {
      v28 = v26[4];
      v29 = v28 >= v23;
      if (v28 >= v23)
        v30 = v26;
      else
        v30 = v26 + 1;
      if (v29)
        v27 = (uint64_t)v26;
      v26 = (_QWORD *)*v30;
    }
    while (*v30);
    if (v27 != gOALDeviceMap + 8 && *(_QWORD *)(v27 + 32) <= v23)
    {
      v31 = *(AUGraph **)(v27 + 40);
      if (v31)
      {
        v46 = (unsigned int *)v31 + 19;
        do
          v47 = __ldaxr(v46);
        while (__stlxr(v47 + 1, v46));
      }
    }
    else
    {
LABEL_50:
      v31 = 0;
    }
    if (v25)
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);
    if (v31)
    {
      OALDevice::StopGraph(v31);
      v32 = (unsigned int *)v31 + 19;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
    }
  }
  if (v16)
    goto LABEL_57;
}

void sub_215C36B78(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

const char *GetALCAttributeString(int a1)
{
  const char *result;

  if (a1 > 4100)
  {
    switch(a1)
    {
      case 40961:
        result = "ALC_INVALID_DEVICE";
        break;
      case 40962:
        result = "ALC_INVALID_CONTEXT";
        break;
      case 40963:
        result = "ALC_INVALID_ENUM";
        break;
      case 40964:
        result = "ALC_INVALID_VALUE";
        break;
      default:
        if (a1 == 4102)
        {
          result = "ALC_EXTENSIONS";
        }
        else
        {
          if (a1 != 4101)
            return "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
          result = "ALC_DEVICE_SPECIFIER";
        }
        break;
    }
  }
  else
  {
    if (a1 > 784)
    {
      if (a1 == 785)
        return "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
      if (a1 == 4100)
        return "ALC_DEFAULT_DEVICE_SPECIFIER";
    }
    else
    {
      if (!a1)
        return "ALC_NO_ERROR";
      if (a1 == 784)
        return "ALC_CAPTURE_DEVICE_SPECIFIER";
    }
    return "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
  }
  return result;
}

ALCBOOLean alcIsExtensionPresent(ALCdevice *device, const ALCchar *extname)
{
  size_t v3;
  char *v4;
  size_t v5;
  unsigned int v6;
  char *v7;
  char *v8;
  size_t v9;
  ALCBOOLean v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const ALCchar *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315650;
    v13 = "oalImp.cpp";
    v14 = 1024;
    v15 = 1106;
    v16 = 2080;
    v17 = extname;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcIsExtensionPresent-->  extension = %s", (uint8_t *)&v12, 0x1Cu);
  }
  if (extname)
  {
    v3 = strlen(extname);
    v4 = (char *)malloc_type_calloc(1uLL, v3 + 1, 0x100004077774924uLL);
    if (*extname)
    {
      v5 = 0;
      v6 = 1;
      do
      {
        v4[v5] = __toupper(extname[v5]);
        v5 = v6++;
      }
      while (strlen(extname) > v5);
    }
    v7 = (char *)alcExtensions;
    if (!alcExtensions)
    {
      v8 = (char *)malloc_type_malloc(0x34uLL, 0x607E9530uLL);
      alcExtensions = (uint64_t)v8;
      strcpy(v8, "ALC_EXT_CAPTURE ALC_ENUMERATION_EXT ALC_EXT_MAC_OSX");
      v9 = strlen(v8);
      v7 = (char *)malloc_type_realloc(v8, v9 + 37, 0xAB49D99FuLL);
      alcExtensions = (uint64_t)v7;
      strcat(v7, " ALC_EXT_ASA");
      strcat(v7, " ALC_EXT_OUTPUT_CAPTURER");
    }
    v10 = strstr(v7, v4) != 0;
    free(v4);
  }
  else
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    return 0;
  }
  return v10;
}

void *__cdecl alcGetProcAddress(ALCdevice *device, const ALCchar *funcname)
{
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const ALCchar *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315650;
    v5 = "oalImp.cpp";
    v6 = 1024;
    v7 = 1135;
    v8 = 2080;
    v9 = funcname;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetProcAddress--> function name = %s", (uint8_t *)&v4, 0x1Cu);
  }
  return alGetProcAddress(funcname);
}

void *__cdecl alGetProcAddress(const ALchar *fname)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const ALchar *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315650;
    v4 = "oalImp.cpp";
    v5 = 1024;
    v6 = 3778;
    v7 = 2080;
    v8 = fname;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetProcAddress function name = %s", (uint8_t *)&v3, 0x1Cu);
  }
  if (!fname)
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    return 0;
  }
  if (!strcmp("alcOpenDevice", fname))
    return alcOpenDevice;
  if (!strcmp("alcCloseDevice", fname))
    return alcCloseDevice;
  if (!strcmp("alcGetError", fname))
    return alcGetError;
  if (!strcmp("alcCreateContext", fname))
    return alcCreateContext;
  if (!strcmp("alcMakeContextCurrent", fname))
    return alcMakeContextCurrent;
  if (!strcmp("alcProcessContext", fname))
    return alcProcessContext;
  if (!strcmp("alcGetCurrentContext", fname))
    return alcGetCurrentContext;
  if (!strcmp("alcGetContextsDevice", fname))
    return alcGetContextsDevice;
  if (!strcmp("alcSuspendContext", fname))
    return alcSuspendContext;
  if (!strcmp("alcDestroyContext", fname))
    return alcDestroyContext;
  if (!strcmp("alcGetString", fname))
    return alcGetString;
  if (!strcmp("alcIsExtensionPresent", fname))
    return alcIsExtensionPresent;
  if (!strcmp("alcGetProcAddress", fname))
    return alcGetProcAddress;
  if (!strcmp("alcGetEnumValue", fname))
    return alcGetEnumValue;
  if (!strcmp("alcGetInteger", fname))
    return alcGetInteger;
  if (!strcmp("alcGetIntegerv", fname))
    return alcGetIntegerv;
  if (!strcmp("alGetError", fname))
    return alGetError;
  if (!strcmp("alGenBuffers", fname))
    return alGenBuffers;
  if (!strcmp("alDeleteBuffers", fname))
    return alDeleteBuffers;
  if (!strcmp("alIsBuffer", fname))
    return alIsBuffer;
  if (!strcmp("alBufferData", fname))
    return alBufferData;
  if (!strcmp("alBufferf", fname))
    return alBufferf;
  if (!strcmp("alBuffer3f", fname))
    return alBuffer3f;
  if (!strcmp("alBufferfv", fname))
    return alBufferfv;
  if (!strcmp("alBufferi", fname))
    return alBufferi;
  if (!strcmp("alBuffer3i", fname))
    return alBuffer3i;
  if (!strcmp("alBufferiv", fname))
    return alBufferiv;
  if (!strcmp("alGetBufferf", fname))
    return alGetBufferf;
  if (!strcmp("alGetBuffer3f", fname))
    return alGetBuffer3f;
  if (!strcmp("alGetBufferfv", fname))
    return alGetBufferfv;
  if (!strcmp("alGetBufferi", fname))
    return alGetBufferi;
  if (!strcmp("alGetBuffer3i", fname))
    return alGetBuffer3i;
  if (!strcmp("alGetBufferiv", fname))
    return alGetBufferiv;
  if (!strcmp("alGenSources", fname))
    return alGenSources;
  if (!strcmp("alDeleteSources", fname))
    return alDeleteSources;
  if (!strcmp("alIsSource", fname))
    return alIsSource;
  if (!strcmp("alSourcef", fname))
    return alSourcef;
  if (!strcmp("alSourcefv", fname))
    return alSourcefv;
  if (!strcmp("alSource3f", fname))
    return alSource3f;
  if (!strcmp("alSourcei", fname))
    return alSourcei;
  if (!strcmp("alSourceiv", fname))
    return alSourceiv;
  if (!strcmp("alSource3i", fname))
    return alSource3i;
  if (!strcmp("alGetSourcef", fname))
    return alGetSourcef;
  if (!strcmp("alGetSourcefv", fname))
    return alGetSourcefv;
  if (!strcmp("alGetSource3f", fname))
    return alGetSource3f;
  if (!strcmp("alGetSourcei", fname))
    return alGetSourcei;
  if (!strcmp("alGetSourceiv", fname))
    return alGetSourceiv;
  if (!strcmp("alGetSource3i", fname))
    return alGetSource3i;
  if (!strcmp("alSourcePlay", fname))
    return alSourcePlay;
  if (!strcmp("alSourcePause", fname))
    return alSourcePause;
  if (!strcmp("alSourceStop", fname))
    return alSourceStop;
  if (!strcmp("alSourceRewind", fname))
    return alSourceRewind;
  if (!strcmp("alSourcePlayv", fname))
    return alSourcePlayv;
  if (!strcmp("alSourcePausev", fname))
    return alSourcePausev;
  if (!strcmp("alSourceStopv", fname))
    return alSourceStopv;
  if (!strcmp("alSourceRewindv", fname))
    return alSourceRewindv;
  if (!strcmp("alSourceQueueBuffers", fname))
    return alSourceQueueBuffers;
  if (!strcmp("alSourceUnqueueBuffers", fname))
    return alSourceUnqueueBuffers;
  if (!strcmp("alListenerf", fname))
    return alListenerf;
  if (!strcmp("alListenerfv", fname))
    return alListenerfv;
  if (!strcmp("alListener3f", fname))
    return alListener3f;
  if (!strcmp("alListeneri", fname))
    return alListeneri;
  if (!strcmp("alListeneriv", fname))
    return alListeneriv;
  if (!strcmp("alListener3i", fname))
    return alListener3i;
  if (!strcmp("alGetListenerf", fname))
    return alGetListenerf;
  if (!strcmp("alGetListenerfv", fname))
    return alGetListenerfv;
  if (!strcmp("alGetListener3f", fname))
    return alGetListener3f;
  if (!strcmp("alGetListeneri", fname))
    return alGetListeneri;
  if (!strcmp("alGetListeneriv", fname))
    return alGetListeneriv;
  if (!strcmp("alGetListener3i", fname))
    return alGetListener3i;
  if (!strcmp("alDistanceModel", fname))
    return alDistanceModel;
  if (!strcmp("alDopplerFactor", fname))
    return alDopplerFactor;
  if (!strcmp("alDopplerVelocity", fname))
    return alDopplerVelocity;
  if (!strcmp("alSpeedOfSound", fname))
    return alSpeedOfSound;
  if (!strcmp("alGetString", fname))
    return alGetString;
  if (!strcmp("alGetEnumValue", fname))
    return alGetEnumValue;
  if (!strcmp("alGetBoolean", fname))
    return alGetBoolean;
  if (!strcmp("alGetBooleanv", fname))
    return alGetBooleanv;
  if (!strcmp("alGetFloat", fname))
    return alGetFloat;
  if (!strcmp("alGetFloatv", fname))
    return alGetFloatv;
  if (!strcmp("alGetDouble", fname))
    return alGetDouble;
  if (!strcmp("alGetDoublev", fname))
    return alGetDoublev;
  if (!strcmp("alGetInteger", fname))
    return alGetInteger;
  if (!strcmp("alGetIntegerv", fname))
    return alGetIntegerv;
  if (!strcmp("alGetProcAddress", fname))
    return alGetProcAddress;
  if (!strcmp("alIsExtensionPresent", fname))
    return alIsExtensionPresent;
  if (!strcmp("alDisable", fname))
    return alDisable;
  if (!strcmp("alEnable", fname))
    return alEnable;
  if (!strcmp("alIsEnabled", fname))
    return alIsEnabled;
  if (!strcmp("alcMacOSXRenderingQuality", fname))
    return alcMacOSXRenderingQuality;
  if (!strcmp("alMacOSXRenderChannelCount", fname))
    return alMacOSXRenderChannelCount;
  if (!strcmp("alcMacOSXMixerMaxiumumBusses", fname))
    return alcMacOSXMixerMaxiumumBusses;
  if (!strcmp("alcMacOSXMixerOutputRate", fname))
    return alcMacOSXMixerOutputRate;
  if (!strcmp("alcMacOSXGetRenderingQuality", fname))
    return alcMacOSXGetRenderingQuality;
  if (!strcmp("alMacOSXGetRenderChannelCount", fname))
    return alMacOSXGetRenderChannelCount;
  if (!strcmp("alcMacOSXGetMixerMaxiumumBusses", fname))
    return alcMacOSXGetMixerMaxiumumBusses;
  if (!strcmp("alcMacOSXGetMixerOutputRate", fname))
    return alcMacOSXGetMixerOutputRate;
  if (!strcmp("alcCaptureOpenDevice", fname))
    return alcCaptureOpenDevice;
  if (!strcmp("alcCaptureCloseDevice", fname))
    return alcCaptureCloseDevice;
  if (!strcmp("alcCaptureStart", fname))
    return alcCaptureStart;
  if (!strcmp("alcCaptureStop", fname))
    return alcCaptureStop;
  if (!strcmp("alcCaptureSamples", fname))
    return alcCaptureSamples;
  if (!strcmp("alBufferDataStatic", fname))
    return alBufferDataStatic;
  if (!strcmp("alSourceSetRenderCallback", fname))
    return alSourceSetRenderCallback;
  if (!strcmp("alSourceAddNotification", fname))
    return alSourceAddNotification;
  if (!strcmp("alSourceRemoveNotification", fname))
    return alSourceRemoveNotification;
  if (!strcmp("alcASASetListener", fname))
    return alcASASetListener;
  if (!strcmp("alcASAGetListener", fname))
    return alcASAGetListener;
  if (!strcmp("alcASASetSource", fname))
    return alcASASetSource;
  if (!strcmp("alcASAGetSource", fname))
    return alcASAGetSource;
  if (!strcmp("alSourceRenderingQuality", fname))
    return alSourceRenderingQuality;
  if (!strcmp("alSourceGetRenderingQuality", fname))
    return alSourceGetRenderingQuality;
  if (!strcmp("alcOutputCapturerPrepare", fname))
    return alcOutputCapturerPrepare;
  if (!strcmp("alcOutputCapturerStart", fname))
    return alcOutputCapturerStart;
  if (!strcmp("alcOutputCapturerStop", fname))
    return alcOutputCapturerStop;
  if (strcmp("alcOutputCapturerAvailableSamples", fname))
  {
    if (!strcmp("alcOutputCapturerSamples", fname))
      return alcOutputCapturerSamples;
    return 0;
  }
  return alcOutputCapturerAvailableSamples;
}

ALCenum alcGetEnumValue(ALCdevice *device, const ALCchar *enumname)
{
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const ALCchar *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315650;
    v5 = "oalImp.cpp";
    v6 = 1024;
    v7 = 1143;
    v8 = 2080;
    v9 = enumname;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetEnumValue--> enum name = %s", (uint8_t *)&v4, 0x1Cu);
  }
  return alGetEnumValue(enumname);
}

ALenum alGetEnumValue(const ALchar *ename)
{
  ALenum result;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const ALchar *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315650;
    v4 = "oalImp.cpp";
    v5 = 1024;
    v6 = 3433;
    v7 = 2080;
    v8 = ename;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetEnumValue: %s", (uint8_t *)&v3, 0x1Cu);
  }
  if (!strcmp("AL_INVALID", ename))
    return -1;
  result = strcmp("AL_NONE", ename);
  if (result)
  {
    result = strcmp("AL_FALSE", ename);
    if (result)
    {
      if (!strcmp("AL_TRUE", ename))
        return 1;
      if (!strcmp("AL_SOURCE_RELATIVE", ename))
        return 514;
      if (!strcmp("AL_CONE_INNER_ANGLE", ename))
        return 4097;
      if (!strcmp("AL_CONE_OUTER_ANGLE", ename))
        return 4098;
      if (!strcmp("AL_CONE_OUTER_GAIN", ename))
        return 4130;
      if (!strcmp("AL_PITCH", ename))
        return 4099;
      if (!strcmp("AL_POSITION", ename))
        return 4100;
      if (!strcmp("AL_DIRECTION", ename))
        return 4101;
      if (!strcmp("AL_VELOCITY", ename))
        return 4102;
      if (!strcmp("AL_LOOPING", ename))
        return 4103;
      if (!strcmp("AL_BUFFER", ename))
        return 4105;
      if (!strcmp("AL_GAIN", ename))
        return 4106;
      if (!strcmp("AL_MIN_GAIN", ename))
        return 4109;
      if (!strcmp("AL_MAX_GAIN", ename))
        return 4110;
      if (!strcmp("AL_ORIENTATION", ename))
        return 4111;
      if (!strcmp("AL_REFERENCE_DISTANCE", ename))
        return 4128;
      if (!strcmp("AL_ROLLOFF_FACTOR", ename))
        return 4129;
      if (!strcmp("AL_MAX_DISTANCE", ename))
        return 4131;
      if (!strcmp("AL_SOURCE_STATE", ename))
        return 4112;
      if (!strcmp("AL_INITIAL", ename))
        return 4113;
      if (!strcmp("AL_PLAYING", ename))
        return 4114;
      if (!strcmp("AL_PAUSED", ename))
        return 4115;
      if (!strcmp("AL_STOPPED", ename))
        return 4116;
      if (!strcmp("AL_BUFFERS_QUEUED", ename))
        return 4117;
      if (!strcmp("AL_BUFFERS_PROCESSED", ename))
        return 4118;
      if (!strcmp("AL_FORMAT_MONO8", ename))
        return 4352;
      if (!strcmp("AL_FORMAT_MONO16", ename))
        return 4353;
      if (!strcmp("AL_FORMAT_STEREO8", ename))
        return 4354;
      if (!strcmp("AL_FORMAT_STEREO16", ename))
        return 4355;
      if (!strcmp("AL_FREQUENCY", ename))
        return 8193;
      if (!strcmp("AL_SIZE", ename))
        return 8196;
      if (!strcmp("AL_UNUSED", ename))
        return 8208;
      if (!strcmp("AL_PENDING", ename))
        return 8209;
      if (!strcmp("AL_PROCESSED", ename))
        return 8210;
      result = strcmp("AL_NO_ERROR", ename);
      if (result)
      {
        if (!strcmp("AL_INVALID_NAME", ename))
          return 40961;
        if (!strcmp("AL_INVALID_ENUM", ename))
          return 40962;
        if (!strcmp("AL_INVALID_VALUE", ename))
          return 40963;
        if (!strcmp("AL_INVALID_OPERATION", ename))
          return 40964;
        if (!strcmp("AL_OUT_OF_MEMORY", ename))
          return 40965;
        if (!strcmp("AL_VENDOR", ename))
          return 45057;
        if (!strcmp("AL_VERSION", ename))
          return 45058;
        if (!strcmp("AL_RENDERER", ename))
          return 45059;
        if (!strcmp("AL_EXTENSIONS", ename))
          return 45060;
        if (!strcmp("AL_DOPPLER_FACTOR", ename))
          return 49152;
        if (!strcmp("AL_DOPPLER_VELOCITY", ename))
          return 49153;
        if (!strcmp("AL_DISTANCE_MODEL", ename))
          return 53248;
        if (!strcmp("AL_INVERSE_DISTANCE", ename))
          return 53249;
        if (!strcmp("AL_INVERSE_DISTANCE_CLAMPED", ename))
          return 53250;
        if (!strcmp("AL_LINEAR_DISTANCE", ename))
          return 53251;
        if (!strcmp("AL_LINEAR_DISTANCE_CLAMPED", ename))
          return 53252;
        if (!strcmp("AL_EXPONENT_DISTANCE", ename))
          return 53253;
        if (!strcmp("AL_EXPONENT_DISTANCE_CLAMPED", ename))
          return 53254;
        if (!strcmp("AL_SPEED_OF_SOUND", ename))
          return 49155;
        if (!strcmp("AL_SOURCE_TYPE", ename))
          return 4135;
        result = strcmp("ALC_INVALID", ename);
        if (result)
        {
          result = strcmp("ALC_FALSE", ename);
          if (result)
          {
            if (strcmp("ALC_TRUE", ename))
            {
              if (!strcmp("ALC_MAJOR_VERSION", ename))
                return 4096;
              if (strcmp("ALC_MINOR_VERSION", ename))
              {
                if (strcmp("ALC_ATTRIBUTES_SIZE", ename))
                {
                  if (strcmp("ALC_ALL_ATTRIBUTES", ename))
                  {
                    if (strcmp("ALC_DEFAULT_DEVICE_SPECIFIER", ename))
                    {
                      if (strcmp("ALC_DEVICE_SPECIFIER", ename))
                      {
                        if (strcmp("ALC_EXTENSIONS", ename))
                        {
                          if (strcmp("ALC_FREQUENCY", ename))
                          {
                            if (!strcmp("ALC_REFRESH", ename))
                              return 4104;
                            if (strcmp("ALC_SYNC", ename))
                            {
                              result = strcmp("ALC_NO_ERROR", ename);
                              if (!result)
                                return result;
                              if (strcmp("ALC_INVALID_DEVICE", ename))
                              {
                                if (strcmp("ALC_INVALID_CONTEXT", ename))
                                {
                                  if (strcmp("ALC_INVALID_ENUM", ename))
                                  {
                                    if (strcmp("ALC_INVALID_VALUE", ename))
                                    {
                                      if (strcmp("ALC_OUT_OF_MEMORY", ename))
                                      {
                                        if (strcmp("ALC_MONO_SOURCES", ename))
                                        {
                                          if (strcmp("ALC_STEREO_SOURCES", ename))
                                          {
                                            if (!strcmp("AL_SEC_OFFSET", ename))
                                              return 4132;
                                            if (!strcmp("AL_SAMPLE_OFFSET", ename))
                                              return 4133;
                                            if (!strcmp("AL_BYTE_OFFSET", ename))
                                              return 4134;
                                            if (!strcmp("ALC_CAPTURE_DEVICE_SPECIFIER", ename))
                                              return 784;
                                            if (!strcmp("ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER", ename))
                                              return 785;
                                            if (!strcmp("ALC_CAPTURE_SAMPLES", ename))
                                              return 786;
                                            if (!strcmp("ALC_SPATIAL_RENDERING_QUALITY", ename))
                                              return 61442;
                                            if (!strcmp("ALC_MIXER_OUTPUT_RATE", ename))
                                              return 61443;
                                            if (!strcmp("ALC_MIXER_MAXIMUM_BUSSES", ename))
                                              return 61444;
                                            if (!strcmp("ALC_RENDER_CHANNEL_COUNT", ename))
                                              return 61445;
                                            if (!strcmp("ALC_MAC_OSX_SPATIAL_RENDERING_QUALITY_HIGH", ename))
                                              return 1920034921;
                                            if (!strcmp("ALC_MAC_OSX_SPATIAL_RENDERING_QUALITY_LOW", ename))
                                              return 1919183983;
                                            if (!strcmp("ALC_IPHONE_SPATIAL_RENDERING_QUALITY_HEADPHONES", ename))
                                              return 1751412840;
                                            if (!strcmp("ALC_MAC_OSX_RENDER_CHANNEL_COUNT_STEREO", ename))
                                              return 1919120244;
                                            if (!strcmp("ALC_MAC_OSX_RENDER_CHANNEL_COUNT_MULTICHANNEL", ename))
                                              return 1919118691;
                                            if (!strcmp("AL_GAMEKIT", ename))
                                              return 1735095154;
                                            if (!strcmp("ALC_ASA_REVERB_ON", ename))
                                              return 1920364398;
                                            if (!strcmp("ALC_ASA_REVERB_EQ_GAIN", ename))
                                              return 1920361831;
                                            if (!strcmp("ALC_ASA_REVERB_EQ_BANDWITH", ename))
                                              return 1920361826;
                                            if (!strcmp("ALC_ASA_REVERB_EQ_FREQ", ename))
                                              return 1920361830;
                                            if (!strcmp("ALC_ASA_REVERB_ROOM_TYPE", ename))
                                              return 1920365172;
                                            if (!strcmp("ALC_ASA_REVERB_SEND_LEVEL", ename))
                                              return 1920365420;
                                            if (!strcmp("ALC_ASA_REVERB_GLOBAL_LEVEL", ename))
                                              return 1920362348;
                                            if (!strcmp("ALC_ASA_OCCLUSION", ename))
                                              return 1868784492;
                                            if (!strcmp("ALC_ASA_OBSTRUCTION", ename))
                                              return 1868723060;
                                            return -1;
                                          }
                                          return 4113;
                                        }
                                        return 4112;
                                      }
                                      return 40965;
                                    }
                                    return 40964;
                                  }
                                  return 40963;
                                }
                                return 40962;
                              }
                              return 40961;
                            }
                            return 4105;
                          }
                          return 4103;
                        }
                        return 4102;
                      }
                      return 4101;
                    }
                    return 4100;
                  }
                  return 4099;
                }
                return 4098;
              }
              return 4097;
            }
            return 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t alcGetInteger(ALCdevice_struct *a1, int a2)
{
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  OALCaptureDevice *v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  _QWORD *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t result;
  const char *v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  unint64_t v31;
  uint64_t v32;
  int v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  BOOL v37;
  _QWORD *v38;
  const ALCchar *String;
  unsigned int *v40;
  unsigned int v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int *v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int v47;
  int v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  ALCdevice_struct *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const ALCchar *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    if (a2 > 4100)
    {
      switch(a2)
      {
        case 40961:
          v6 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          v6 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          v6 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          v6 = "ALC_INVALID_VALUE";
          break;
        default:
          if (a2 == 4102)
          {
            v6 = "ALC_EXTENSIONS";
          }
          else
          {
            if (a2 != 4101)
              goto LABEL_17;
            v6 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (a2 > 784)
    {
      if (a2 == 785)
      {
        v6 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (a2 == 4100)
      {
        v6 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!a2)
      {
        v6 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (a2 == 784)
      {
        v6 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        v48 = 136315906;
        v49 = "oalImp.cpp";
        v50 = 1024;
        v51 = 1151;
        v52 = 2048;
        v53 = a1;
        v54 = 2080;
        v55 = v6;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetInteger--> device = %ld attribute name = %s", (uint8_t *)&v48, 0x26u);
        goto LABEL_23;
      }
    }
LABEL_17:
    v6 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  v7 = 0;
  if (!a1)
  {
    v8 = 0;
    if ((a2 - 4096) >= 2)
      goto LABEL_57;
LABEL_64:
    v24 = 0;
    result = 1;
    if (!v7)
      goto LABEL_124;
    goto LABEL_122;
  }
  v8 = 0;
  if (gOALDeviceMap)
  {
    v9 = gDeviceMapLock;
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
    v11 = *(_QWORD **)(gOALDeviceMap + 8);
    if (!v11)
      goto LABEL_36;
    v12 = gOALDeviceMap + 8;
    do
    {
      v13 = v11[4];
      v14 = v13 >= (unint64_t)a1;
      if (v13 >= (unint64_t)a1)
        v15 = v11;
      else
        v15 = v11 + 1;
      if (v14)
        v12 = (uint64_t)v11;
      v11 = (_QWORD *)*v15;
    }
    while (*v15);
    if (v12 != gOALDeviceMap + 8 && *(_QWORD *)(v12 + 32) <= (unint64_t)a1)
    {
      v7 = *(_QWORD *)(v12 + 40);
      if (v7)
      {
        v27 = (unsigned int *)(v7 + 76);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 + 1, v27));
      }
    }
    else
    {
LABEL_36:
      v7 = 0;
    }
    if (v10)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
    v8 = 0;
    if (!v7 && gOALCaptureDeviceMap)
    {
      v16 = gCaptureDeviceMapLock;
      v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
      v18 = *(_QWORD **)(gOALCaptureDeviceMap + 8);
      if (!v18)
        goto LABEL_52;
      v19 = gOALCaptureDeviceMap + 8;
      do
      {
        v20 = v18[4];
        v21 = v20 >= (unint64_t)a1;
        if (v20 >= (unint64_t)a1)
          v22 = v18;
        else
          v22 = v18 + 1;
        if (v21)
          v19 = (uint64_t)v18;
        v18 = (_QWORD *)*v22;
      }
      while (*v22);
      if (v19 != gOALCaptureDeviceMap + 8 && *(_QWORD *)(v19 + 32) <= (unint64_t)a1)
      {
        v8 = *(OALCaptureDevice **)(v19 + 40);
        if (v8)
        {
          v29 = (unsigned int *)((char *)v8 + 120);
          do
            v30 = __ldaxr(v29);
          while (__stlxr(v30 + 1, v29));
        }
      }
      else
      {
LABEL_52:
        v8 = 0;
      }
      if (v17)
        (*(void (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
      v7 = 0;
    }
  }
  if ((a2 - 4096) < 2)
    goto LABEL_64;
LABEL_57:
  if (a2 == 786)
  {
    if (v8)
    {
      result = OALCaptureDevice::AvailableFrames(v8, v4, v5);
      goto LABEL_77;
    }
    v23 = 40961;
    if (v7)
      goto LABEL_70;
    goto LABEL_135;
  }
  if (a2 != 4098)
  {
    v23 = 40963;
    goto LABEL_69;
  }
  v23 = 40961;
  if (!a1 || !v7)
  {
LABEL_69:
    if (v7)
      goto LABEL_70;
    if (v8)
    {
      OALDevice::SetError((uint64_t)v8, v23);
      goto LABEL_71;
    }
LABEL_135:
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v23);
LABEL_71:
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if ((_DWORD)result)
    {
      if (a2 > 4100)
      {
        switch(a2)
        {
          case 40961:
            v26 = "ALC_INVALID_DEVICE";
            break;
          case 40962:
            v26 = "ALC_INVALID_CONTEXT";
            break;
          case 40963:
            v26 = "ALC_INVALID_ENUM";
            break;
          case 40964:
            v26 = "ALC_INVALID_VALUE";
            break;
          default:
            if (a2 == 4102)
            {
              v26 = "ALC_EXTENSIONS";
            }
            else
            {
              if (a2 != 4101)
                goto LABEL_116;
              v26 = "ALC_DEVICE_SPECIFIER";
            }
            break;
        }
      }
      else
      {
        if (a2 > 784)
        {
          if (a2 == 785)
          {
            v26 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
            goto LABEL_121;
          }
          if (a2 == 4100)
          {
            v26 = "ALC_DEFAULT_DEVICE_SPECIFIER";
            goto LABEL_121;
          }
        }
        else
        {
          if (!a2)
          {
            v26 = "ALC_NO_ERROR";
            goto LABEL_121;
          }
          if (a2 == 784)
          {
            v26 = "ALC_CAPTURE_DEVICE_SPECIFIER";
            goto LABEL_121;
          }
        }
LABEL_116:
        v26 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
      }
LABEL_121:
      String = alcGetString(0, v23);
      v48 = 136316162;
      v49 = "oalImp.cpp";
      v50 = 1024;
      v51 = 1221;
      v52 = 2048;
      v53 = a1;
      v54 = 2080;
      v55 = v26;
      v56 = 2080;
      v57 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcGetInteger FAILED: device = %ld attribute name = %s error = %s", (uint8_t *)&v48, 0x30u);
      v24 = 0;
      result = 0;
      if (!v7)
        goto LABEL_124;
      goto LABEL_122;
    }
LABEL_77:
    v24 = 0;
    if (!v7)
      goto LABEL_124;
    goto LABEL_122;
  }
  if (alcGetContextsDevice((ALCcontext *)gCurrentContext) != a1)
  {
    v23 = 40961;
LABEL_70:
    OALDevice::SetError(v7, v23);
    goto LABEL_71;
  }
  if (!gOALContextMap)
  {
    v23 = 40964;
    goto LABEL_70;
  }
  v31 = gCurrentContext;
  v32 = gContextMapLock;
  v33 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v34 = *(_QWORD **)(gOALContextMap + 8);
  if (!v34)
    goto LABEL_109;
  v35 = gOALContextMap + 8;
  do
  {
    v36 = v34[4];
    v37 = v36 >= v31;
    if (v36 >= v31)
      v38 = v34;
    else
      v38 = v34 + 1;
    if (v37)
      v35 = (uint64_t)v34;
    v34 = (_QWORD *)*v38;
  }
  while (*v38);
  if (v35 != gOALContextMap + 8 && *(_QWORD *)(v35 + 32) <= v31)
  {
    v24 = *(_QWORD *)(v35 + 40);
    if (v24)
    {
      v46 = (unsigned int *)(v24 + 440);
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 + 1, v46));
    }
  }
  else
  {
LABEL_109:
    v24 = 0;
  }
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32);
  if (!v24)
  {
    v23 = 40964;
    goto LABEL_70;
  }
  result = *(unsigned int *)(v24 + 396);
LABEL_122:
  v40 = (unsigned int *)(v7 + 76);
  do
    v41 = __ldaxr(v40);
  while (__stlxr(v41 - 1, v40));
LABEL_124:
  if (v8)
  {
    v42 = (unsigned int *)((char *)v8 + 120);
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
  }
  if (v24)
  {
    v44 = (unsigned int *)(v24 + 440);
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
  }
  return result;
}

void sub_215C3925C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alcGetIntegerv(ALCdevice *device, ALCenum param, ALCsizei size, ALCint *data)
{
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  uint64_t v18;
  OALCaptureDevice *v19;
  uint64_t v20;
  int v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  _QWORD *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  uint64_t v32;
  const char *v33;
  const ALCchar *String;
  unsigned int *v35;
  unsigned int v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int *v43;
  unsigned int v44;
  int v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  ALCdevice *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const ALCchar *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          v10 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          v10 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          v10 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          v10 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            v10 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101)
              goto LABEL_17;
            v10 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        v10 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (param == 4100)
      {
        v10 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!param)
      {
        v10 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (param == 784)
      {
        v10 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        v45 = 136315906;
        v46 = "oalImp.cpp";
        v47 = 1024;
        v48 = 1234;
        v49 = 2048;
        v50 = device;
        v51 = 2080;
        v52 = v10;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetIntegerv--> device = %ld attribute name = %s", (uint8_t *)&v45, 0x26u);
        goto LABEL_23;
      }
    }
LABEL_17:
    v10 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  if (!gOALDeviceMap)
  {
    v18 = 0;
    v19 = 0;
LABEL_41:
    if (gOALCaptureDeviceMap)
    {
      v20 = gCaptureDeviceMapLock;
      v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
      v22 = *(_QWORD **)(gOALCaptureDeviceMap + 8);
      if (!v22)
        goto LABEL_53;
      v23 = gOALCaptureDeviceMap + 8;
      do
      {
        v24 = v22[4];
        v25 = v24 >= (unint64_t)device;
        if (v24 >= (unint64_t)device)
          v26 = v22;
        else
          v26 = v22 + 1;
        if (v25)
          v23 = (uint64_t)v22;
        v22 = (_QWORD *)*v26;
      }
      while (*v26);
      if (v23 != gOALCaptureDeviceMap + 8 && *(_QWORD *)(v23 + 32) <= (unint64_t)device)
      {
        v19 = *(OALCaptureDevice **)(v23 + 40);
        if (v19)
        {
          v30 = (unsigned int *)((char *)v19 + 120);
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 + 1, v30));
        }
      }
      else
      {
LABEL_53:
        v19 = 0;
      }
      if (v21)
        (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
    }
    goto LABEL_56;
  }
  v11 = gDeviceMapLock;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
  v13 = *(_QWORD **)(gOALDeviceMap + 8);
  if (!v13)
    goto LABEL_35;
  v14 = gOALDeviceMap + 8;
  do
  {
    v15 = v13[4];
    v16 = v15 >= (unint64_t)device;
    if (v15 >= (unint64_t)device)
      v17 = v13;
    else
      v17 = v13 + 1;
    if (v16)
      v14 = (uint64_t)v13;
    v13 = (_QWORD *)*v17;
  }
  while (*v17);
  if (v14 != gOALDeviceMap + 8 && *(_QWORD *)(v14 + 32) <= (unint64_t)device)
  {
    v18 = *(_QWORD *)(v14 + 40);
    if (v18)
    {
      v28 = (unsigned int *)(v18 + 76);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 + 1, v28));
    }
  }
  else
  {
LABEL_35:
    v18 = 0;
  }
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
  v19 = 0;
  if (!v18)
    goto LABEL_41;
LABEL_56:
  v27 = 40964;
  if (size && data)
  {
    switch(param)
    {
      case 4096:
      case 4097:
        *data = 1;
        goto LABEL_110;
      case 4098:
        v27 = 40961;
        if (!device || !v18)
          break;
        if (alcGetContextsDevice((ALCcontext *)gCurrentContext) != device)
          goto LABEL_82;
        v32 = ProtectContextObject(gCurrentContext);
        if (!v32)
          goto LABEL_122;
        *data = *(_DWORD *)(v32 + 396);
        goto LABEL_111;
      case 4099:
        v27 = 40961;
        if (!device || !v18)
          break;
        if (alcGetContextsDevice((ALCcontext *)gCurrentContext) != device)
        {
          v27 = 40961;
          goto LABEL_82;
        }
        v41 = ProtectContextObject(gCurrentContext);
        v42 = v41;
        if (!v41 || *(_DWORD *)(v41 + 396) > size)
        {
LABEL_122:
          v27 = 40964;
          goto LABEL_82;
        }
        OALContext::CopyAttributeList((const void **)v41, data);
        v43 = (unsigned int *)(v42 + 440);
        v32 = 0;
        do
          v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        goto LABEL_111;
      default:
        if (param != 786)
        {
          v27 = 40963;
          break;
        }
        if (v19)
        {
          *data = OALCaptureDevice::AvailableFrames(v19, v8, v9);
          goto LABEL_110;
        }
        if (!v18)
          goto LABEL_86;
        goto LABEL_82;
    }
  }
  if (v18)
  {
LABEL_82:
    OALDevice::SetError(v18, v27);
  }
  else if (v19)
  {
    OALDevice::SetError((uint64_t)v19, v27);
  }
  else
  {
LABEL_86:
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v27);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          v33 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          v33 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          v33 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          v33 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            v33 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101)
              goto LABEL_104;
            v33 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_109;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        v33 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_109;
      }
      if (param == 4100)
      {
        v33 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_109;
      }
    }
    else
    {
      if (!param)
      {
        v33 = "ALC_NO_ERROR";
        goto LABEL_109;
      }
      if (param == 784)
      {
        v33 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_109:
        String = alcGetString(0, v27);
        v45 = 136316162;
        v46 = "oalImp.cpp";
        v47 = 1024;
        v48 = 1301;
        v49 = 2048;
        v50 = device;
        v51 = 2080;
        v52 = v33;
        v53 = 2080;
        v54 = String;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcGetInteger FAILED: device = %ld attribute name = %s error = %s", (uint8_t *)&v45, 0x30u);
        goto LABEL_110;
      }
    }
LABEL_104:
    v33 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_109;
  }
LABEL_110:
  v32 = 0;
  if (v18)
  {
LABEL_111:
    v35 = (unsigned int *)(v18 + 76);
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
  }
  if (v19)
  {
    v37 = (unsigned int *)((char *)v19 + 120);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
  }
  if (v32)
  {
    v39 = (unsigned int *)(v32 + 440);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
  }
}

void sub_215C398D8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

ALenum alGetError(void)
{
  void *v0;

  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  v0 = pthread_getspecific(gALErrorKey);
  if (v0)
    pthread_setspecific(gALErrorKey, 0);
  return (int)v0;
}

void alGenBuffers(ALsizei n, ALuint *buffers)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  OALBuffer *v9;
  uint64_t **v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  uint64_t *v14;
  unsigned int v15;
  const ALchar *String;
  int v17;
  _BYTE v18[14];
  __int16 v19;
  _BYTE v20[10];
  const ALchar *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315650;
    *(_QWORD *)v18 = "oalImp.cpp";
    *(_WORD *)&v18[8] = 1024;
    *(_DWORD *)&v18[10] = 1348;
    v19 = 2048;
    *(_QWORD *)v20 = n;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGenBuffers--> requested buffers = %ld", (uint8_t *)&v17, 0x1Cu);
  }
  if (n < 0)
  {
    v15 = 40963;
    goto LABEL_25;
  }
  InitializeBufferMap();
  if (!gOALBufferMap)
  {
    v15 = 40964;
    goto LABEL_25;
  }
  v4 = gBufferMapLock;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gBufferMapLock + 16))(gBufferMapLock);
  CleanUpDeadBufferList();
  v6 = *(_DWORD *)(gOALBufferMap + 16);
  if (n <= 0x400 && (v6 + n) <= 0x400)
  {
    if (n)
    {
      v7 = 0;
      do
      {
        v8 = GetNewToken(void)::currentToken++;
        v9 = (OALBuffer *)operator new();
        OALBuffer::OALBuffer(v9, v8);
        v10 = (uint64_t **)(gOALBufferMap + 8);
        v11 = *(_QWORD *)(gOALBufferMap + 8);
        if (v11)
        {
          do
          {
            v12 = *(_DWORD *)(v11 + 32);
            v13 = v12 > v8;
            if (v12 <= v8)
              v14 = (uint64_t *)(v11 + 8);
            else
              v14 = (uint64_t *)v11;
            if (v13)
              v10 = (uint64_t **)v11;
            v11 = *v14;
          }
          while (*v14);
        }
        v17 = v8;
        *(_QWORD *)&v18[4] = v9;
        std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>((uint64_t ***)gOALBufferMap, v10, &v17);
        buffers[v7++] = v8;
      }
      while (v7 != n);
    }
    v15 = 0;
    if (!v5)
      goto LABEL_25;
LABEL_24:
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315906;
    *(_QWORD *)v18 = "oalImp.cpp";
    *(_WORD *)&v18[8] = 1024;
    *(_DWORD *)&v18[10] = 1363;
    v19 = 1024;
    *(_DWORD *)v20 = n;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v6;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGenBuffers ERROR --> requested buffers:gOALBufferMap->Size() = %d:%d", (uint8_t *)&v17, 0x1Eu);
  }
  v15 = 40963;
  if (v5)
    goto LABEL_24;
LABEL_25:
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v15);
      v17 = 136315906;
      *(_QWORD *)v18 = "oalImp.cpp";
      *(_WORD *)&v18[8] = 1024;
      *(_DWORD *)&v18[10] = 1383;
      v19 = 2048;
      *(_QWORD *)v20 = n;
      *(_WORD *)&v20[8] = 2080;
      v21 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGenBuffers FAILED: requested buffers = %ld error %s", (uint8_t *)&v17, 0x26u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v15);
  }
}

void sub_215C39C74(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

const ALchar *__cdecl alGetString(ALenum param)
{
  const ALchar *result;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *ALAttributeString;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315650;
    v4 = "oalImp.cpp";
    v5 = 1024;
    v6 = 3397;
    v7 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetString = %s", (uint8_t *)&v3, 0x1Cu);
  }
  if (param > 45056)
  {
    result = "Apple Inc.";
    switch(param)
    {
      case 45057:
        return result;
      case 45058:
        result = "1.1";
        break;
      case 45059:
        result = "Software";
        break;
      case 45060:
        result = (const ALchar *)alExtensions;
        if (!alExtensions)
        {
          result = (const ALchar *)malloc_type_malloc(0x8CuLL, 0x1C4BE439uLL);
          alExtensions = (uint64_t)result;
          strcpy((char *)result, "AL_EXT_OFFSET AL_EXT_LINEAR_DISTANCE AL_EXT_EXPONENT_DISTANCE AL_EXT_STATIC_BUFFER AL_EXT_SOURCE_NOTIFICATIONS AL_EXT_SOURCE_SPATIALIZATION");
        }
        break;
      default:
LABEL_19:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        result = 0;
        break;
    }
  }
  else
  {
    switch(param)
    {
      case 40961:
        result = "Invalid Name";
        break;
      case 40962:
        result = "Invalid Enum";
        break;
      case 40963:
        result = "Invalid Value";
        break;
      case 40964:
        result = "Invalid Operation";
        break;
      case 40965:
        result = "Out of Memory";
        break;
      default:
        if (param == -1)
        {
          result = "Unknown Internal Error";
        }
        else
        {
          if (param)
            goto LABEL_19;
          result = "No Error";
        }
        break;
    }
  }
  return result;
}

void alDeleteBuffers(ALsizei n, const ALuint *buffers)
{
  unsigned int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  const ALchar *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  uint64_t *v14;
  OALBuffer *v15;
  const ALchar *v16;
  uint64_t v17;
  uint64_t v18;
  ALuint v19;
  uint64_t v20;
  uint64_t v21;
  ALuint v22;
  BOOL v23;
  uint64_t *v24;
  OALBuffer *v25;
  uint64_t v26;
  uint64_t *v27;
  ALuint v28;
  uint64_t v29;
  uint64_t v30;
  ALuint v31;
  BOOL v32;
  uint64_t *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  BOOL v37;
  unsigned int v38;
  uint64_t **v39;
  uint64_t v40;
  unsigned int v41;
  BOOL v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  ALuint v46;
  uint64_t v47;
  uint64_t v48;
  ALuint v49;
  BOOL v50;
  uint64_t *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  const ALchar *String;
  int v56;
  uint8_t buf[4];
  _BYTE v58[14];
  __int16 v59;
  const ALchar *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  if (!n)
    return;
  v4 = 40963;
  if (n < 0 || !gOALBufferMap)
    goto LABEL_98;
  v5 = gBufferMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gBufferMapLock + 16))(gBufferMapLock);
  CleanUpDeadBufferList();
  v7 = 0;
  v8 = 1;
  while (1)
  {
    v9 = (const ALchar *)buffers[v7];
    if (!(_DWORD)v9)
      goto LABEL_5;
    v10 = *(_QWORD *)(gOALBufferMap + 8);
    if (!v10)
      break;
    v11 = gOALBufferMap + 8;
    do
    {
      v12 = *(_DWORD *)(v10 + 32);
      v13 = v12 >= v9;
      if (v12 >= v9)
        v14 = (uint64_t *)v10;
      else
        v14 = (uint64_t *)(v10 + 8);
      if (v13)
        v11 = v10;
      v10 = *v14;
    }
    while (*v14);
    if (v11 == gOALBufferMap + 8)
      break;
    if (*(_DWORD *)(v11 + 32) > v9)
      break;
    v15 = *(OALBuffer **)(v11 + 40);
    if (!v15)
      break;
    if ((OALBuffer::CanBeRemovedFromBufferMap(v15) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v16 = (const ALchar *)buffers[v7];
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v58 = "oalImp.cpp";
        *(_WORD *)&v58[8] = 1024;
        *(_DWORD *)&v58[10] = 1436;
        v59 = 2048;
        v60 = v16;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alDeleteBuffers: oalBuffer cannot currently be removed, a source is still attached, bid = %ld", buf, 0x1Cu);
        v4 = 40964;
        if (!v8)
          goto LABEL_30;
      }
      else
      {
        v4 = 40964;
        if (!v8)
          goto LABEL_30;
      }
      goto LABEL_27;
    }
LABEL_5:
    v8 = ++v7 < (unint64_t)n;
    if (v7 == n)
    {
      v4 = 0;
      goto LABEL_30;
    }
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v4 = 40961;
    if (!v8)
      goto LABEL_30;
LABEL_27:
    if (!v6)
      goto LABEL_98;
    goto LABEL_97;
  }
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)v58 = "oalImp.cpp";
  *(_WORD *)&v58[8] = 1024;
  *(_DWORD *)&v58[10] = 1431;
  v59 = 2048;
  v60 = v9;
  _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alDeleteBuffers: oalBuffer == NULL, bid = %ld", buf, 0x1Cu);
  v4 = 40961;
  if (v8)
    goto LABEL_27;
LABEL_30:
  v56 = v6;
  v17 = 0;
  if (n <= 1)
    v18 = 1;
  else
    v18 = n;
  do
  {
    v19 = buffers[v17];
    if (v19)
    {
      v20 = *(_QWORD *)(gOALBufferMap + 8);
      if (!v20)
        goto LABEL_47;
      v21 = gOALBufferMap + 8;
      do
      {
        v22 = *(_DWORD *)(v20 + 32);
        v23 = v22 >= v19;
        if (v22 >= v19)
          v24 = (uint64_t *)v20;
        else
          v24 = (uint64_t *)(v20 + 8);
        if (v23)
          v21 = v20;
        v20 = *v24;
      }
      while (*v24);
      if (v21 != gOALBufferMap + 8 && *(_DWORD *)(v21 + 32) <= v19)
        v25 = *(OALBuffer **)(v21 + 40);
      else
LABEL_47:
        v25 = 0;
      if (OALBuffer::IsPurgable(v25))
      {
        v26 = gOALBufferMap;
        v27 = *(uint64_t **)(gOALBufferMap + 8);
        if (v27)
        {
          v28 = buffers[v17];
          v29 = gOALBufferMap + 8;
          v30 = *(_QWORD *)(gOALBufferMap + 8);
          do
          {
            v31 = *(_DWORD *)(v30 + 32);
            v32 = v31 >= v28;
            if (v31 >= v28)
              v33 = (uint64_t *)v30;
            else
              v33 = (uint64_t *)(v30 + 8);
            if (v32)
              v29 = v30;
            v30 = *v33;
          }
          while (*v33);
          if (v29 != gOALBufferMap + 8 && *(_DWORD *)(v29 + 32) <= v28)
          {
            v34 = *(_QWORD **)(v29 + 8);
            v35 = (_QWORD *)v29;
            if (v34)
            {
              do
              {
                v36 = v34;
                v34 = (_QWORD *)*v34;
              }
              while (v34);
            }
            else
            {
              do
              {
                v36 = (_QWORD *)v35[2];
                v37 = *v36 == (_QWORD)v35;
                v35 = v36;
              }
              while (!v37);
            }
            if (*(_QWORD *)gOALBufferMap == v29)
              *(_QWORD *)gOALBufferMap = v36;
            --*(_QWORD *)(v26 + 16);
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v27, (uint64_t *)v29);
            operator delete((void *)v29);
          }
        }
        if (v25)
        {
          OALBuffer::~OALBuffer(v25);
          MEMORY[0x2199EEC7C]();
        }
      }
      else
      {
        v38 = *(_DWORD *)v25;
        v39 = (uint64_t **)(gDeadOALBufferMap + 8);
        v40 = *(_QWORD *)(gDeadOALBufferMap + 8);
        if (v40)
        {
          do
          {
            v41 = *(_DWORD *)(v40 + 32);
            v42 = v41 > v38;
            if (v41 <= v38)
              v43 = (uint64_t *)(v40 + 8);
            else
              v43 = (uint64_t *)v40;
            if (v42)
              v39 = (uint64_t **)v40;
            v40 = *v43;
          }
          while (*v43);
        }
        *(_DWORD *)buf = *(_DWORD *)v25;
        *(_QWORD *)&v58[4] = v25;
        std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>((uint64_t ***)gDeadOALBufferMap, v39, buf);
        v44 = gOALBufferMap;
        v45 = *(uint64_t **)(gOALBufferMap + 8);
        if (v45)
        {
          v46 = buffers[v17];
          v47 = gOALBufferMap + 8;
          v48 = *(_QWORD *)(gOALBufferMap + 8);
          do
          {
            v49 = *(_DWORD *)(v48 + 32);
            v50 = v49 >= v46;
            if (v49 >= v46)
              v51 = (uint64_t *)v48;
            else
              v51 = (uint64_t *)(v48 + 8);
            if (v50)
              v47 = v48;
            v48 = *v51;
          }
          while (*v51);
          if (v47 != gOALBufferMap + 8 && *(_DWORD *)(v47 + 32) <= v46)
          {
            v52 = *(_QWORD **)(v47 + 8);
            v53 = (_QWORD *)v47;
            if (v52)
            {
              do
              {
                v54 = v52;
                v52 = (_QWORD *)*v52;
              }
              while (v52);
            }
            else
            {
              do
              {
                v54 = (_QWORD *)v53[2];
                v37 = *v54 == (_QWORD)v53;
                v53 = v54;
              }
              while (!v37);
            }
            if (*(_QWORD *)gOALBufferMap == v47)
              *(_QWORD *)gOALBufferMap = v54;
            --*(_QWORD *)(v44 + 16);
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v45, (uint64_t *)v47);
            operator delete((void *)v47);
          }
        }
      }
    }
    ++v17;
  }
  while (v17 != v18);
  if (v56)
LABEL_97:
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
LABEL_98:
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v4);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v58 = "oalImp.cpp";
      *(_WORD *)&v58[8] = 1024;
      *(_DWORD *)&v58[10] = 1472;
      v59 = 2080;
      v60 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDeleteBuffers FAILED = %s", buf, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v4);
  }
}

void sub_215C3A44C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

ALBOOLean alIsBuffer(ALuint bid)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  ALuint v6;
  BOOL v7;
  uint64_t *v8;
  uint64_t v9;
  const ALchar *String;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const ALchar *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315650;
    v13 = "oalImp.cpp";
    v14 = 1024;
    v15 = 1480;
    v16 = 2048;
    v17 = bid;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alIsBuffer--> buffer %ld", (uint8_t *)&v12, 0x1Cu);
  }
  if (!bid)
    return 1;
  if (gOALBufferMap)
  {
    v2 = gBufferMapLock;
    v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gBufferMapLock + 16))(gBufferMapLock);
    CleanUpDeadBufferList();
    v4 = *(_QWORD *)(gOALBufferMap + 8);
    if (!v4)
      goto LABEL_16;
    v5 = gOALBufferMap + 8;
    do
    {
      v6 = *(_DWORD *)(v4 + 32);
      v7 = v6 >= bid;
      if (v6 >= bid)
        v8 = (uint64_t *)v4;
      else
        v8 = (uint64_t *)(v4 + 8);
      if (v7)
        v5 = v4;
      v4 = *v8;
    }
    while (*v8);
    if (v5 != gOALBufferMap + 8 && *(_DWORD *)(v5 + 32) <= bid)
    {
      v9 = *(_QWORD *)(v5 + 40);
      if (!v3)
        return v9 != 0;
    }
    else
    {
LABEL_16:
      v9 = 0;
      if (!v3)
        return v9 != 0;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
    return v9 != 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    String = alGetString(40964);
    v12 = 136315906;
    v13 = "oalImp.cpp";
    v14 = 1024;
    v15 = 1504;
    v16 = 2048;
    v17 = bid;
    v18 = 2080;
    v19 = String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alIsBuffer FAILED: buffer = %ld error = %s", (uint8_t *)&v12, 0x26u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA004);
  return 0;
}

void sub_215C3A6F8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void alBufferData(ALuint bid, ALenum format, const ALvoid *data, ALsizei size, ALsizei freq)
{
  uint64_t v10;
  uint64_t v11;
  ALuint v12;
  BOOL v13;
  uint64_t *v14;
  ALenum v15;
  uint64_t v16;
  ALenum v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  const char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const ALchar *String;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!gOALBufferMap)
    goto LABEL_13;
  CleanUpDeadBufferList();
  v10 = *(_QWORD *)(gOALBufferMap + 8);
  if (!v10)
    goto LABEL_13;
  v11 = gOALBufferMap + 8;
  do
  {
    v12 = *(_DWORD *)(v10 + 32);
    v13 = v12 >= bid;
    if (v12 >= bid)
      v14 = (uint64_t *)v10;
    else
      v14 = (uint64_t *)(v10 + 8);
    if (v13)
      v11 = v10;
    v10 = *v14;
  }
  while (*v14);
  if (v11 == gOALBufferMap + 8 || *(_DWORD *)(v11 + 32) > bid)
  {
LABEL_13:
    v15 = 40963;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
LABEL_31:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)v15);
      return;
    }
LABEL_27:
    if ((format - 4352) > 3)
      v22 = "UNKNOWN FORMAT";
    else
      v22 = off_24D4652B0[format - 4352];
    v23 = 136316674;
    v24 = "oalImp.cpp";
    v25 = 1024;
    v26 = 1540;
    v27 = 2048;
    v28 = bid;
    v29 = 2080;
    v30 = v22;
    v31 = 2048;
    v32 = size;
    v33 = 2048;
    v34 = freq;
    v35 = 2080;
    String = alGetString(v15);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alBufferData FAILED: buffer %ld : %s : %ld bytes : %ldHz error = %s", (uint8_t *)&v23, 0x44u);
    goto LABEL_31;
  }
  v16 = *(_QWORD *)(v11 + 40);
  if (!data || size < 1 || !v16)
  {
    if (!v16)
      goto LABEL_13;
    v20 = (unsigned int *)(v16 + 280);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    v15 = 40963;
LABEL_26:
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_31;
    goto LABEL_27;
  }
  v17 = OALBuffer::AddAudioData(*(OALBuffer **)(v11 + 40), (char *)data, size, format, freq);
  v15 = v17;
  v18 = (unsigned int *)(v16 + 280);
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  if (v17)
    goto LABEL_26;
}

void alBufferf(ALuint bid, ALenum param, ALfloat value)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "oalImp.cpp";
    v5 = 1024;
    v6 = 1548;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alBufferf--> there are currently no valid enums for this API", (uint8_t *)&v3, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alBuffer3f(ALuint bid, ALenum param, ALfloat value1, ALfloat value2, ALfloat value3)
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "oalImp.cpp";
    v7 = 1024;
    v8 = 1557;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alBuffer3f--> there are currently no valid enums for this API", (uint8_t *)&v5, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alBufferfv(ALuint bid, ALenum param, const ALfloat *values)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "oalImp.cpp";
    v5 = 1024;
    v6 = 1566;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alBufferfv--> there are currently no valid enums for this API", (uint8_t *)&v3, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alBufferi(ALuint bid, ALenum param, ALint value)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "oalImp.cpp";
    v5 = 1024;
    v6 = 1575;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alBufferi--> there are currently no valid enums for this API", (uint8_t *)&v3, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alBuffer3i(ALuint bid, ALenum param, ALint value1, ALint value2, ALint value3)
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "oalImp.cpp";
    v7 = 1024;
    v8 = 1584;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alBuffer3i--> there are currently no valid enums for this API", (uint8_t *)&v5, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alBufferiv(ALuint bid, ALenum param, const ALint *values)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "oalImp.cpp";
    v5 = 1024;
    v6 = 1593;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alBufferiv--> there are currently no valid enums for this API", (uint8_t *)&v3, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alGetBufferf(ALuint bid, ALenum param, ALfloat *value)
{
  uint64_t v6;
  uint64_t v7;
  ALuint v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  ALfloat v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int *v17;
  unsigned int v18;
  const char *v19;
  const ALchar *String;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *ALAttributeString;
  __int16 v29;
  const ALchar *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v21 = 136315906;
    v22 = "oalImp.cpp";
    v23 = 1024;
    v24 = 1602;
    v25 = 2048;
    v26 = bid;
    v27 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBufferf--> buffer %ld : property = %s", (uint8_t *)&v21, 0x26u);
  }
  if (gOALBufferMap)
  {
    CleanUpDeadBufferList();
    v6 = *(_QWORD *)(gOALBufferMap + 8);
    if (!v6)
    {
      v11 = 0;
      if (param == 8193)
      {
LABEL_17:
        v12 = *(double *)(v11 + 304);
        *value = v12;
        v13 = (unsigned int *)(v11 + 280);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        return;
      }
LABEL_22:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (pthread_getspecific(gALErrorKey))
      {
        v16 = 0;
        v15 = 0;
        if (v11)
        {
LABEL_24:
          v17 = (unsigned int *)(v11 + 280);
          do
            v18 = __ldaxr(v17);
          while (__stlxr(v18 - 1, v17));
          if ((v16 & 1) == 0)
            return;
          goto LABEL_31;
        }
      }
      else
      {
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
        v16 = 0;
        v15 = 0;
        if (v11)
          goto LABEL_24;
      }
      goto LABEL_30;
    }
    v7 = gOALBufferMap + 8;
    do
    {
      v8 = *(_DWORD *)(v6 + 32);
      v9 = v8 >= bid;
      if (v8 >= bid)
        v10 = (uint64_t *)v6;
      else
        v10 = (uint64_t *)(v6 + 8);
      if (v9)
        v7 = v6;
      v6 = *v10;
    }
    while (*v10);
    if (v7 == gOALBufferMap + 8 || *(_DWORD *)(v7 + 32) > bid)
    {
      v11 = 0;
      if (gOALBufferMap)
        goto LABEL_16;
    }
    else
    {
      v11 = *(_QWORD *)(v7 + 40);
      if (gOALBufferMap)
      {
LABEL_16:
        if (param == 8193)
          goto LABEL_17;
        goto LABEL_22;
      }
    }
    v15 = 40963;
    v16 = 1;
    if (v11)
      goto LABEL_24;
LABEL_30:
    if (!v16)
      return;
    goto LABEL_31;
  }
  v15 = 40963;
LABEL_31:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v19 = GetALAttributeString(param);
    String = alGetString(v15);
    v21 = 136316162;
    v22 = "oalImp.cpp";
    v23 = 1024;
    v24 = 1624;
    v25 = 2048;
    v26 = bid;
    v27 = 2080;
    ALAttributeString = v19;
    v29 = 2080;
    v30 = String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetBufferf FAILED: buffer %ld : property = %s error = %s", (uint8_t *)&v21, 0x30u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v15);
}

const char *GetALAttributeString(int a1)
{
  const char *result;

  if (a1 > 40960)
  {
    switch(a1)
    {
      case 53249:
        result = "AL_INVERSE_DISTANCE";
        break;
      case 53250:
        result = "AL_INVERSE_DISTANCE_CLAMPED";
        break;
      case 53251:
        result = "AL_LINEAR_DISTANCE";
        break;
      case 53252:
        result = "AL_LINEAR_DISTANCE_CLAMPED";
        break;
      case 53253:
        result = "AL_EXPONENT_DISTANCE";
        break;
      case 53254:
        result = "AL_EXPONENT_DISTANCE_CLAMPED";
        break;
      default:
        if (a1 == 40961)
          result = "AL_INVALID_NAME";
        else
LABEL_11:
          result = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 4097:
        return "AL_CONE_INNER_ANGLE";
      case 4098:
        return "AL_CONE_OUTER_ANGLE";
      case 4099:
        return "AL_PITCH";
      case 4100:
        return "AL_POSITION";
      case 4101:
        return "AL_DIRECTION";
      case 4102:
        return "AL_VELOCITY";
      case 4103:
        return "AL_LOOPING";
      case 4104:
      case 4107:
      case 4108:
      case 4113:
      case 4114:
      case 4115:
      case 4116:
      case 4119:
      case 4120:
      case 4121:
      case 4122:
      case 4123:
      case 4124:
      case 4125:
      case 4126:
      case 4127:
        goto LABEL_11;
      case 4105:
        return "AL_BUFFER";
      case 4106:
        return "AL_GAIN";
      case 4109:
        return "AL_MIN_GAIN";
      case 4110:
        return "AL_MAX_GAIN";
      case 4111:
        return "AL_ORIENTATION";
      case 4112:
        return "AL_SOURCE_STATE";
      case 4117:
        return "AL_BUFFERS_QUEUED";
      case 4118:
        return "AL_BUFFERS_PROCESSED";
      case 4128:
        return "AL_REFERENCE_DISTANCE";
      case 4129:
        return "AL_ROLLOFF_FACTOR";
      case 4130:
        return "AL_CONE_OUTER_GAIN";
      case 4131:
        return "AL_MAX_DISTANCE";
      case 4132:
        return "AL_SEC_OFFSET";
      case 4133:
        return "AL_SAMPLE_OFFSET";
      case 4134:
        return "AL_BYTE_OFFSET";
      case 4135:
        return "AL_SOURCE_TYPE";
      default:
        if (a1)
        {
          if (a1 != 514)
            goto LABEL_11;
          result = "AL_SOURCE_RELATIVE";
        }
        else
        {
          result = "AL_NONE";
        }
        break;
    }
  }
  return result;
}

void alGetBuffer3f(ALuint bid, ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3)
{
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *ALAttributeString;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315906;
    v8 = "oalImp.cpp";
    v9 = 1024;
    v10 = 1632;
    v11 = 2048;
    v12 = bid;
    v13 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBuffer3f--> buffer %ld : property = %s", (uint8_t *)&v7, 0x26u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alGetBufferfv(ALuint bid, ALenum param, ALfloat *values)
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *ALAttributeString;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315906;
    v6 = "oalImp.cpp";
    v7 = 1024;
    v8 = 1641;
    v9 = 2048;
    v10 = bid;
    v11 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBufferfv--> buffer %ld : property = %s", (uint8_t *)&v5, 0x26u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alGetBufferi(ALuint bid, ALenum param, ALint *value)
{
  uint64_t v6;
  uint64_t v7;
  ALuint v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  const ALchar *String;
  unsigned int *v14;
  unsigned int v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *ALAttributeString;
  __int16 v24;
  const ALchar *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315906;
    v17 = "oalImp.cpp";
    v18 = 1024;
    v19 = 1650;
    v20 = 2048;
    v21 = bid;
    v22 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBufferi--> buffer %ld : property = %s", (uint8_t *)&v16, 0x26u);
  }
  if (!gOALBufferMap)
    goto LABEL_32;
  CleanUpDeadBufferList();
  v6 = *(_QWORD *)(gOALBufferMap + 8);
  if (!v6)
    goto LABEL_32;
  v7 = gOALBufferMap + 8;
  do
  {
    v8 = *(_DWORD *)(v6 + 32);
    v9 = v8 >= bid;
    if (v8 >= bid)
      v10 = (uint64_t *)v6;
    else
      v10 = (uint64_t *)(v6 + 8);
    if (v9)
      v7 = v6;
    v6 = *v10;
  }
  while (*v10);
  if (v7 != gOALBufferMap + 8 && *(_DWORD *)(v7 + 32) <= bid && (v11 = *(_QWORD *)(v7 + 40)) != 0)
  {
    switch(param)
    {
      case 8193:
        *value = *(double *)(v11 + 304);
        break;
      case 8194:
        *value = *(_DWORD *)(v11 + 336);
        break;
      case 8195:
        *value = *(_DWORD *)(v11 + 332);
        break;
      case 8196:
        *value = *(_DWORD *)(v11 + 300);
        break;
      default:
        *value = 0;
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v14 = (unsigned int *)(v11 + 280);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
  }
  else
  {
LABEL_32:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v12 = GetALAttributeString(param);
      String = alGetString(40963);
      v16 = 136316162;
      v17 = "oalImp.cpp";
      v18 = 1024;
      v19 = 1682;
      v20 = 2048;
      v21 = bid;
      v22 = 2080;
      ALAttributeString = v12;
      v24 = 2080;
      v25 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetBufferi FAILED: buffer = %ld property = %s error = %s", (uint8_t *)&v16, 0x30u);
    }
    *value = 0;
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void alGetBuffer3i(ALuint bid, ALenum param, ALint *value1, ALint *value2, ALint *value3)
{
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *ALAttributeString;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315906;
    v8 = "oalImp.cpp";
    v9 = 1024;
    v10 = 1691;
    v11 = 2048;
    v12 = bid;
    v13 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBuffer3i--> buffer %ld : property = %s", (uint8_t *)&v7, 0x26u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alGetBufferiv(ALuint bid, ALenum param, ALint *values)
{
  uint64_t v6;
  uint64_t v7;
  ALuint v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  const ALchar *String;
  unsigned int *v14;
  unsigned int v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *ALAttributeString;
  __int16 v24;
  const ALchar *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315906;
    v17 = "oalImp.cpp";
    v18 = 1024;
    v19 = 1700;
    v20 = 2048;
    v21 = bid;
    v22 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBufferi--> buffer %ld : property = %s", (uint8_t *)&v16, 0x26u);
  }
  if (!gOALBufferMap)
    goto LABEL_32;
  CleanUpDeadBufferList();
  v6 = *(_QWORD *)(gOALBufferMap + 8);
  if (!v6)
    goto LABEL_32;
  v7 = gOALBufferMap + 8;
  do
  {
    v8 = *(_DWORD *)(v6 + 32);
    v9 = v8 >= bid;
    if (v8 >= bid)
      v10 = (uint64_t *)v6;
    else
      v10 = (uint64_t *)(v6 + 8);
    if (v9)
      v7 = v6;
    v6 = *v10;
  }
  while (*v10);
  if (v7 != gOALBufferMap + 8 && *(_DWORD *)(v7 + 32) <= bid && (v11 = *(_QWORD *)(v7 + 40)) != 0)
  {
    switch(param)
    {
      case 8193:
        *values = *(double *)(v11 + 304);
        break;
      case 8194:
        *values = *(_DWORD *)(v11 + 336);
        break;
      case 8195:
        *values = *(_DWORD *)(v11 + 332);
        break;
      case 8196:
        *values = *(_DWORD *)(v11 + 300);
        break;
      default:
        *values = 0;
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v14 = (unsigned int *)(v11 + 280);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
  }
  else
  {
LABEL_32:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v12 = GetALAttributeString(param);
      String = alGetString(40963);
      v16 = 136316162;
      v17 = "oalImp.cpp";
      v18 = 1024;
      v19 = 1731;
      v20 = 2048;
      v21 = bid;
      v22 = 2080;
      ALAttributeString = v12;
      v24 = 2080;
      v25 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetBufferiv FAILED: buffer = %ld property = %s error = %s", (uint8_t *)&v16, 0x30u);
    }
    *values = 0;
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void alGenSources(ALsizei n, ALuint *sources)
{
  char v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  _QWORD *v14;
  OALContext *v15;
  uint64_t v16;
  ALuint *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  const ALchar *String;
  unsigned int *v22;
  unsigned int v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const ALchar *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315650;
    v25 = "oalImp.cpp";
    v26 = 1024;
    v27 = 1747;
    v28 = 2048;
    v29 = n;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGenSources--> requested sources = %ld", (uint8_t *)&v24, 0x1Cu);
  }
  if (n)
  {
    v4 = 0;
    v5 = 40963;
    LODWORD(v6) = 0;
    if (n <= 0x100 && sources)
    {
      if (!gOALContextMap)
        goto LABEL_30;
      v7 = gCurrentContext;
      v8 = gContextMapLock;
      v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
      v10 = *(_QWORD **)(gOALContextMap + 8);
      if (!v10)
        goto LABEL_18;
      v11 = gOALContextMap + 8;
      do
      {
        v12 = v10[4];
        v13 = v12 >= v7;
        if (v12 >= v7)
          v14 = v10;
        else
          v14 = v10 + 1;
        if (v13)
          v11 = (uint64_t)v10;
        v10 = (_QWORD *)*v14;
      }
      while (*v14);
      if (v11 != gOALContextMap + 8 && *(_QWORD *)(v11 + 32) <= v7)
      {
        v15 = *(OALContext **)(v11 + 40);
        if (v15)
        {
          v22 = (unsigned int *)((char *)v15 + 440);
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 + 1, v22));
        }
      }
      else
      {
LABEL_18:
        v15 = 0;
      }
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
      if (v15)
      {
        if (n <= 1)
          v6 = 1;
        else
          v6 = n;
        v16 = v6;
        v17 = sources;
        do
        {
          v18 = GetNewToken(void)::currentToken++;
          OALContext::AddSource(v15, v18);
          *v17++ = v18;
          --v16;
        }
        while (v16);
        v19 = (unsigned int *)((char *)v15 + 440);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        v5 = 0;
        v4 = 1;
      }
      else
      {
LABEL_30:
        v4 = 0;
        LODWORD(v6) = 0;
        v5 = 40964;
      }
    }
    if ((v4 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        String = alGetString(v5);
        v24 = 136315906;
        v25 = "oalImp.cpp";
        v26 = 1024;
        v27 = 1778;
        v28 = 2048;
        v29 = n;
        v30 = 2080;
        v31 = String;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGenSources FAILED: source count = %ld error = %s", (uint8_t *)&v24, 0x26u);
      }
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)v5);
      alDeleteSources(v6, sources);
      if ((_DWORD)v6)
        bzero(sources, 4 * v6);
    }
  }
}

void sub_215C3BF18(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alDeleteSources(ALsizei n, const ALuint *sources)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  OALContext *v12;
  unsigned int SourceCount;
  _BOOL4 v15;
  uint64_t v16;
  ALuint *v17;
  unsigned int *v18;
  unsigned int v19;
  const ALchar *String;
  unsigned int *v21;
  unsigned int v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const ALchar *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v23 = 136315650;
    v24 = "oalImp.cpp";
    v25 = 1024;
    v26 = 1790;
    v27 = 2048;
    v28 = n;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alDeleteSources: count = %ld", (uint8_t *)&v23, 0x1Cu);
  }
  if (n)
  {
    if (!gOALContextMap)
      goto LABEL_33;
    v4 = gCurrentContext;
    v5 = gContextMapLock;
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v7 = *(_QWORD **)(gOALContextMap + 8);
    if (!v7)
      goto LABEL_16;
    v8 = gOALContextMap + 8;
    do
    {
      v9 = v7[4];
      v10 = v9 >= v4;
      if (v9 >= v4)
        v11 = v7;
      else
        v11 = v7 + 1;
      if (v10)
        v8 = (uint64_t)v7;
      v7 = (_QWORD *)*v11;
    }
    while (*v11);
    if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
    {
      v12 = *(OALContext **)(v8 + 40);
      if (v12)
      {
        v21 = (unsigned int *)((char *)v12 + 440);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 + 1, v21));
      }
    }
    else
    {
LABEL_16:
      v12 = 0;
    }
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
    if (v12)
    {
      SourceCount = OALContext::GetSourceCount(v12);
      v15 = n >= 0 && SourceCount >= n;
      if (v15)
      {
        if (n <= 1)
          v16 = 1;
        else
          v16 = n;
        v17 = (ALuint *)sources;
        do
        {
          alSourceStop(*v17);
          OALContext::RemoveSource(v12, *v17++);
          --v16;
        }
        while (v16);
      }
      else
      {
        LODWORD(v16) = 40963;
      }
      v18 = (unsigned int *)((char *)v12 + 440);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
    }
    else
    {
LABEL_33:
      LOBYTE(v15) = 0;
      LODWORD(v16) = 40964;
    }
    if (!v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        String = alGetString(v16);
        v23 = 136315906;
        v24 = "oalImp.cpp";
        v25 = 1024;
        v26 = 1825;
        v27 = 2048;
        v28 = n;
        v29 = 2080;
        v30 = String;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDeleteSources FAILED: source count = %ld error = %s", (uint8_t *)&v23, 0x26u);
      }
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)v16);
    }
  }
}

void sub_215C3C1E4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSourceStop(ALuint sid)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  OALContext *v10;
  OALSource *v11;
  OALSource *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  const ALchar *String;
  unsigned int *v20;
  unsigned int v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const ALchar *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315650;
    v23 = "oalImp.cpp";
    v24 = 1024;
    v25 = 2684;
    v26 = 2048;
    v27 = (const ALchar *)sid;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceStop--> source %ld", (uint8_t *)&v22, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_25;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_15;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(OALContext **)(v6 + 40);
    if (v10)
    {
      v20 = (unsigned int *)((char *)v10 + 440);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
    }
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (!v10)
    goto LABEL_25;
  v11 = (OALSource *)OALContext::ProtectSource(v10, sid);
  v12 = v11;
  v13 = (unsigned int *)((char *)v10 + 440);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v11)
  {
    OALSource::Stop(v11);
    v15 = (unsigned int *)((char *)v12 + 72);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    v17 = 0;
    v18 = 0;
  }
  else
  {
LABEL_25:
    v18 = 40963;
    v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v18);
      v22 = 136315650;
      v23 = "oalImp.cpp";
      v24 = 1024;
      v25 = 2698;
      v26 = 2080;
      v27 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceStop FAILED = %s\n", (uint8_t *)&v22, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v18);
  }
}

void sub_215C3C474(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

ALBOOLean alIsSource(ALuint sid)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  OALContext *v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v19 = 136315650;
    v20 = "oalImp.cpp";
    v21 = 1024;
    v22 = 1833;
    v23 = 2048;
    v24 = sid;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alIsSource--> source %ld", (uint8_t *)&v19, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_25;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_15;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(OALContext **)(v6 + 40);
    if (v10)
    {
      v16 = (unsigned int *)((char *)v10 + 440);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 + 1, v16));
    }
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (v10)
  {
    v11 = OALContext::ProtectSource(v10, sid);
    v12 = (unsigned int *)((char *)v10 + 440);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (v11)
    {
      v14 = (unsigned int *)(v11 + 72);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      LOBYTE(v11) = 1;
    }
  }
  else
  {
LABEL_25:
    LOBYTE(v11) = 0;
  }
  return v11;
}

void sub_215C3C638(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSourcef(ALuint sid, ALenum param, ALfloat value)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  int v19;
  ALenum v20;
  ALenum v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  int v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *ALAttributeString;
  __int16 v36;
  double v37;
  __int16 v38;
  const ALchar *String;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (gOALContextMap)
  {
    v6 = gCurrentContext;
    v7 = gContextMapLock;
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v9 = *(_QWORD **)(gOALContextMap + 8);
    if (!v9)
      goto LABEL_13;
    v10 = gOALContextMap + 8;
    do
    {
      v11 = v9[4];
      v12 = v11 >= v6;
      if (v11 >= v6)
        v13 = v9;
      else
        v13 = v9 + 1;
      if (v12)
        v10 = (uint64_t)v9;
      v9 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
    {
      v14 = *(OALContext **)(v10 + 40);
      if (v14)
      {
        v22 = (unsigned int *)((char *)v14 + 440);
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 + 1, v22));
      }
    }
    else
    {
LABEL_13:
      v14 = 0;
    }
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    if (v14)
    {
      v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
      v16 = v15;
      v17 = (unsigned int *)((char *)v14 + 440);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (v15)
      {
        v19 = 1;
        switch(param)
        {
          case 4097:
            v20 = OALSource::SetConeInnerAngle(v15, value);
            goto LABEL_48;
          case 4098:
            v20 = OALSource::SetConeOuterAngle(v15, value);
            goto LABEL_48;
          case 4099:
            v20 = OALSource::SetPitch(v15, value);
            goto LABEL_48;
          case 4106:
            v20 = OALSource::SetGain(v15, value);
            goto LABEL_48;
          case 4109:
            v20 = OALSource::SetMinGain(v15, value);
            goto LABEL_48;
          case 4110:
            v20 = OALSource::SetMaxGain(v15, value);
            goto LABEL_48;
          case 4128:
            v20 = OALSource::SetReferenceDistance(v15, value);
            goto LABEL_48;
          case 4129:
            v20 = OALSource::SetRollOffFactor(v15, value);
            goto LABEL_48;
          case 4130:
            v20 = OALSource::SetConeOuterGain(v15, value);
            goto LABEL_48;
          case 4131:
            v20 = OALSource::SetMaxDistance(v15, value);
            goto LABEL_48;
          case 4132:
            goto LABEL_47;
          case 4133:
            v19 = 2;
            goto LABEL_47;
          case 4134:
            v19 = 3;
LABEL_47:
            v20 = OALSource::SetQueueOffset(v15, v19, value);
LABEL_48:
            v21 = v20;
            v26 = (unsigned int *)((char *)v16 + 72);
            do
              v27 = __ldaxr(v26);
            while (__stlxr(v27 - 1, v26));
            if (!v20)
              return;
            goto LABEL_23;
          default:
            pthread_once(&gErrorOnce, ErrorKeyInitializer);
            if (!pthread_getspecific(gALErrorKey))
              pthread_setspecific(gALErrorKey, (const void *)0xA004);
            v24 = (unsigned int *)((char *)v16 + 72);
            do
              v25 = __ldaxr(v24);
            while (__stlxr(v25 - 1, v24));
            return;
        }
      }
    }
  }
  v21 = 40963;
LABEL_23:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v28 = 136316418;
    v29 = "oalImp.cpp";
    v30 = 1024;
    v31 = 1920;
    v32 = 2048;
    v33 = sid;
    v34 = 2080;
    ALAttributeString = GetALAttributeString(param);
    v36 = 2048;
    v37 = value;
    v38 = 2080;
    String = alGetString(v21);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR alSourcef FAILED: source %ld : property = %s : value = %.f2 : error = %s", (uint8_t *)&v28, 0x3Au);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v21);
}

void sub_215C3C9AC(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;
  unsigned int *v4;
  unsigned int v5;

  if (a2)
  {
    __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      __cxa_end_catch();
      JUMPOUT(0x215C3C95CLL);
    }
    __cxa_end_catch();
    v4 = (unsigned int *)(v2 + 72);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    JUMPOUT(0x215C3C76CLL);
  }
  _Unwind_Resume(a1);
}

void alSourcefv(ALuint sid, ALenum param, const ALfloat *values)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  ALenum v19;
  ALenum v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  float v25;
  int v26;
  unsigned int *v27;
  unsigned int v28;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const char *ALAttributeString;
  __int16 v37;
  const ALchar *String;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (gOALContextMap)
  {
    v6 = gCurrentContext;
    v7 = gContextMapLock;
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v9 = *(_QWORD **)(gOALContextMap + 8);
    if (!v9)
      goto LABEL_13;
    v10 = gOALContextMap + 8;
    do
    {
      v11 = v9[4];
      v12 = v11 >= v6;
      if (v11 >= v6)
        v13 = v9;
      else
        v13 = v9 + 1;
      if (v12)
        v10 = (uint64_t)v9;
      v9 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
    {
      v14 = *(OALContext **)(v10 + 40);
      if (v14)
      {
        v21 = (unsigned int *)((char *)v14 + 440);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 + 1, v21));
      }
    }
    else
    {
LABEL_13:
      v14 = 0;
    }
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    if (v14)
    {
      v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
      v16 = v15;
      v17 = (unsigned int *)((char *)v14 + 440);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (v15)
      {
        switch(param)
        {
          case 4097:
            v19 = OALSource::SetConeInnerAngle(v15, *values);
            goto LABEL_52;
          case 4098:
            v19 = OALSource::SetConeOuterAngle(v15, *values);
            goto LABEL_52;
          case 4099:
            v19 = OALSource::SetPitch(v15, *values);
            goto LABEL_52;
          case 4100:
            v19 = OALSource::SetPosition(v15, *values, values[1], values[2]);
            goto LABEL_52;
          case 4101:
            v19 = OALSource::SetDirection(v15, *values, values[1], values[2]);
            goto LABEL_52;
          case 4102:
            v19 = OALSource::SetVelocity(v15, *values, values[1], values[2]);
            goto LABEL_52;
          case 4106:
            v19 = OALSource::SetGain(v15, *values);
            goto LABEL_52;
          case 4109:
            v19 = OALSource::SetMinGain(v15, *values);
            goto LABEL_52;
          case 4110:
            v19 = OALSource::SetMaxGain(v15, *values);
            goto LABEL_52;
          case 4128:
            v19 = OALSource::SetReferenceDistance(v15, *values);
            goto LABEL_52;
          case 4129:
            v19 = OALSource::SetRollOffFactor(v15, *values);
            goto LABEL_52;
          case 4130:
            v19 = OALSource::SetConeOuterGain(v15, *values);
            goto LABEL_52;
          case 4131:
            v19 = OALSource::SetMaxDistance(v15, *values);
            goto LABEL_52;
          case 4132:
            v25 = *values;
            v26 = 1;
            goto LABEL_51;
          case 4133:
            v25 = *values;
            v26 = 2;
            goto LABEL_51;
          case 4134:
            v25 = *values;
            v26 = 3;
LABEL_51:
            v19 = OALSource::SetQueueOffset(v15, v26, v25);
LABEL_52:
            v20 = v19;
            v27 = (unsigned int *)((char *)v16 + 72);
            do
              v28 = __ldaxr(v27);
            while (__stlxr(v28 - 1, v27));
            if (!v19)
              return;
            goto LABEL_23;
          default:
            pthread_once(&gErrorOnce, ErrorKeyInitializer);
            if (!pthread_getspecific(gALErrorKey))
              pthread_setspecific(gALErrorKey, (const void *)0xA002);
            v23 = (unsigned int *)((char *)v16 + 72);
            do
              v24 = __ldaxr(v23);
            while (__stlxr(v24 - 1, v23));
            return;
        }
      }
    }
  }
  v20 = 40963;
LABEL_23:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v29 = 136316162;
    v30 = "oalImp.cpp";
    v31 = 1024;
    v32 = 1997;
    v33 = 2048;
    v34 = sid;
    v35 = 2080;
    ALAttributeString = GetALAttributeString(param);
    v37 = 2080;
    String = alGetString(v20);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR alSourcefv FAILED: source = %ld property = %s result = %s\n", (uint8_t *)&v29, 0x30u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v20);
}

void sub_215C3CD9C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSource3f(ALuint sid, ALenum param, ALfloat value1, ALfloat value2, ALfloat value3)
{
  unint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  OALContext *v18;
  OALSource *v19;
  OALSource *v20;
  unsigned int *v21;
  unsigned int v22;
  ALenum v23;
  ALenum v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  int v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const char *ALAttributeString;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  const ALchar *String;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_24;
  v10 = gCurrentContext;
  v11 = gContextMapLock;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v13 = *(_QWORD **)(gOALContextMap + 8);
  if (!v13)
    goto LABEL_13;
  v14 = gOALContextMap + 8;
  do
  {
    v15 = v13[4];
    v16 = v15 >= v10;
    if (v15 >= v10)
      v17 = v13;
    else
      v17 = v13 + 1;
    if (v16)
      v14 = (uint64_t)v13;
    v13 = (_QWORD *)*v17;
  }
  while (*v17);
  if (v14 != gOALContextMap + 8 && *(_QWORD *)(v14 + 32) <= v10)
  {
    v18 = *(OALContext **)(v14 + 40);
    if (v18)
    {
      v25 = (unsigned int *)((char *)v18 + 440);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 + 1, v25));
    }
  }
  else
  {
LABEL_13:
    v18 = 0;
  }
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
  if (!v18)
    goto LABEL_24;
  v19 = (OALSource *)OALContext::ProtectSource(v18, sid);
  v20 = v19;
  v21 = (unsigned int *)((char *)v18 + 440);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v19)
  {
LABEL_24:
    v24 = 40963;
LABEL_25:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v31 = 136316930;
      v32 = "oalImp.cpp";
      v33 = 1024;
      v34 = 2036;
      v35 = 2048;
      v36 = sid;
      v37 = 2080;
      ALAttributeString = GetALAttributeString(param);
      v39 = 2048;
      v40 = value1;
      v41 = 2048;
      v42 = value2;
      v43 = 2048;
      v44 = value3;
      v45 = 2080;
      String = alGetString(v24);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSource3f FAILED: source %ld : %s : values = %.f2:%.f2:%.f2 error = %s", (uint8_t *)&v31, 0x4Eu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v24);
    return;
  }
  switch(param)
  {
    case 4100:
      v23 = OALSource::SetPosition(v19, value1, value2, value3);
      goto LABEL_36;
    case 4102:
      v23 = OALSource::SetVelocity(v19, value1, value2, value3);
      goto LABEL_36;
    case 4101:
      v23 = OALSource::SetDirection(v19, value1, value2, value3);
LABEL_36:
      v24 = v23;
      v27 = (unsigned int *)((char *)v20 + 72);
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v23)
        return;
      goto LABEL_25;
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  v29 = (unsigned int *)((char *)v20 + 72);
  do
    v30 = __ldaxr(v29);
  while (__stlxr(v30 - 1, v29));
}

void sub_215C3D0BC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSourcei(ALuint sid, ALenum param, ALint value)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  ALenum v19;
  ALenum v20;
  unsigned int *v21;
  unsigned int v22;
  int SourceType;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  BOOL v29;
  uint64_t *v30;
  OALBuffer *v31;
  unsigned int *v32;
  unsigned int v33;
  float v34;
  int v35;
  unsigned int *v36;
  unsigned int v37;
  unsigned int *v38;
  unsigned int v39;
  int v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const char *ALAttributeString;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  const ALchar *String;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (gOALContextMap)
  {
    v6 = gCurrentContext;
    v7 = gContextMapLock;
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v9 = *(_QWORD **)(gOALContextMap + 8);
    if (!v9)
      goto LABEL_13;
    v10 = gOALContextMap + 8;
    do
    {
      v11 = v9[4];
      v12 = v11 >= v6;
      if (v11 >= v6)
        v13 = v9;
      else
        v13 = v9 + 1;
      if (v12)
        v10 = (uint64_t)v9;
      v9 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
    {
      v14 = *(OALContext **)(v10 + 40);
      if (v14)
      {
        v21 = (unsigned int *)((char *)v14 + 440);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 + 1, v21));
      }
    }
    else
    {
LABEL_13:
      v14 = 0;
    }
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    if (v14)
    {
      v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
      v16 = v15;
      v17 = (unsigned int *)((char *)v14 + 440);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (v15)
      {
        switch(param)
        {
          case 4097:
            v19 = OALSource::SetConeInnerAngle(v15, (float)value);
            goto LABEL_67;
          case 4098:
            v19 = OALSource::SetConeOuterAngle(v15, (float)value);
            goto LABEL_67;
          case 4099:
          case 4100:
          case 4101:
          case 4102:
          case 4104:
          case 4106:
          case 4107:
          case 4108:
          case 4109:
          case 4110:
          case 4111:
          case 4112:
          case 4113:
          case 4114:
          case 4115:
          case 4116:
          case 4117:
          case 4118:
          case 4119:
          case 4120:
          case 4121:
          case 4122:
          case 4123:
          case 4124:
          case 4125:
          case 4126:
          case 4127:
            goto LABEL_34;
          case 4103:
            v19 = OALSource::SetLooping(v15, value);
            goto LABEL_67;
          case 4105:
            SourceType = OALSource::GetSourceType(v15);
            if (value && SourceType == 4137 || !alIsBuffer(value))
            {
              v38 = (unsigned int *)((char *)v16 + 72);
              do
              {
                v39 = __ldaxr(v38);
                v20 = 40964;
              }
              while (__stlxr(v39 - 1, v38));
              goto LABEL_23;
            }
            if (!gOALBufferMap)
              goto LABEL_56;
            v24 = gBufferMapLock;
            v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gBufferMapLock + 16))(gBufferMapLock);
            v26 = *(_QWORD *)(gOALBufferMap + 8);
            if (!v26)
              goto LABEL_53;
            v27 = gOALBufferMap + 8;
            do
            {
              v28 = *(_DWORD *)(v26 + 32);
              v29 = v28 >= value;
              if (v28 >= value)
                v30 = (uint64_t *)v26;
              else
                v30 = (uint64_t *)(v26 + 8);
              if (v29)
                v27 = v26;
              v26 = *v30;
            }
            while (*v30);
            if (v27 != gOALBufferMap + 8 && *(_DWORD *)(v27 + 32) <= value)
              v31 = *(OALBuffer **)(v27 + 40);
            else
LABEL_53:
              v31 = 0;
            v20 = OALSource::SetBuffer(v16, value, v31);
            if (v25)
              (*(void (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);
            goto LABEL_68;
          case 4128:
            v19 = OALSource::SetReferenceDistance(v15, (float)value);
            goto LABEL_67;
          case 4129:
            v19 = OALSource::SetRollOffFactor(v15, (float)value);
            goto LABEL_67;
          case 4130:
            v19 = OALSource::SetConeOuterGain(v15, (float)value);
            goto LABEL_67;
          case 4131:
            v19 = OALSource::SetMaxDistance(v15, (float)value);
            goto LABEL_67;
          case 4132:
            v34 = (float)value;
            v35 = 1;
            goto LABEL_66;
          case 4133:
            v34 = (float)value;
            v35 = 2;
            goto LABEL_66;
          case 4134:
            v34 = (float)value;
            v35 = 3;
LABEL_66:
            v19 = OALSource::SetQueueOffset(v15, v35, v34);
            goto LABEL_67;
          default:
            if (param != 514)
            {
LABEL_34:
              pthread_once(&gErrorOnce, ErrorKeyInitializer);
              if (!pthread_getspecific(gALErrorKey))
                pthread_setspecific(gALErrorKey, (const void *)0xA002);
LABEL_56:
              v32 = (unsigned int *)((char *)v16 + 72);
              do
                v33 = __ldaxr(v32);
              while (__stlxr(v33 - 1, v32));
              return;
            }
            v19 = OALSource::SetSourceRelative(v15, value);
LABEL_67:
            v20 = v19;
LABEL_68:
            v36 = (unsigned int *)((char *)v16 + 72);
            do
              v37 = __ldaxr(v36);
            while (__stlxr(v37 - 1, v36));
            if (!v20)
              return;
            goto LABEL_23;
        }
      }
    }
  }
  v20 = 40963;
LABEL_23:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v40 = 136316418;
    v41 = "oalImp.cpp";
    v42 = 1024;
    v43 = 2114;
    v44 = 2048;
    v45 = sid;
    v46 = 2080;
    ALAttributeString = GetALAttributeString(param);
    v48 = 2048;
    v49 = value;
    v50 = 2080;
    String = alGetString(v20);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourcei FAILED - sid:pname:value:result %ld:%s:%ld:%s", (uint8_t *)&v40, 0x3Au);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v20);
}

void sub_215C3D50C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void alSourceiv(ALuint sid, ALenum param, const ALint *values)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  ALenum v19;
  ALenum v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  BOOL v29;
  uint64_t *v30;
  OALBuffer *v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int v37;
  int v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const char *ALAttributeString;
  __int16 v46;
  const ALchar *String;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (gOALContextMap)
  {
    v6 = gCurrentContext;
    v7 = gContextMapLock;
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v9 = *(_QWORD **)(gOALContextMap + 8);
    if (!v9)
      goto LABEL_13;
    v10 = gOALContextMap + 8;
    do
    {
      v11 = v9[4];
      v12 = v11 >= v6;
      if (v11 >= v6)
        v13 = v9;
      else
        v13 = v9 + 1;
      if (v12)
        v10 = (uint64_t)v9;
      v9 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
    {
      v14 = *(OALContext **)(v10 + 40);
      if (v14)
      {
        v21 = (unsigned int *)((char *)v14 + 440);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 + 1, v21));
      }
    }
    else
    {
LABEL_13:
      v14 = 0;
    }
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    if (v14)
    {
      v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
      v16 = v15;
      v17 = (unsigned int *)((char *)v14 + 440);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (v15)
      {
        switch(param)
        {
          case 4097:
            v19 = OALSource::SetConeInnerAngle(v15, (float)*values);
            goto LABEL_68;
          case 4098:
            v19 = OALSource::SetConeOuterAngle(v15, (float)*values);
            goto LABEL_68;
          case 4099:
          case 4104:
          case 4106:
          case 4107:
          case 4108:
          case 4109:
          case 4110:
          case 4111:
          case 4112:
          case 4113:
          case 4114:
          case 4115:
          case 4116:
          case 4117:
          case 4118:
          case 4119:
          case 4120:
          case 4121:
          case 4122:
          case 4123:
          case 4124:
          case 4125:
          case 4126:
          case 4127:
          case 4130:
            goto LABEL_35;
          case 4100:
            v19 = OALSource::SetPosition(v15, (float)*values, (float)values[1], (float)values[2]);
            goto LABEL_68;
          case 4101:
            v19 = OALSource::SetDirection(v15, (float)*values, (float)values[1], (float)values[2]);
            goto LABEL_68;
          case 4102:
            v19 = OALSource::SetVelocity(v15, (float)*values, (float)values[1], (float)values[2]);
            goto LABEL_68;
          case 4103:
            v19 = OALSource::SetLooping(v15, *values);
            goto LABEL_68;
          case 4105:
            if (OALSource::GetSourceType(v15) == 4137 || !alIsBuffer(*values))
            {
              v20 = 40964;
              goto LABEL_75;
            }
            if (!gOALBufferMap)
              goto LABEL_62;
            v23 = gBufferMapLock;
            v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gBufferMapLock + 16))(gBufferMapLock);
            v25 = *values;
            v26 = *(_QWORD *)(gOALBufferMap + 8);
            if (!v26)
              goto LABEL_59;
            v27 = gOALBufferMap + 8;
            do
            {
              v28 = *(_DWORD *)(v26 + 32);
              v29 = v28 >= v25;
              if (v28 >= v25)
                v30 = (uint64_t *)v26;
              else
                v30 = (uint64_t *)(v26 + 8);
              if (v29)
                v27 = v26;
              v26 = *v30;
            }
            while (*v30);
            if (v27 != gOALBufferMap + 8 && *(_DWORD *)(v27 + 32) <= v25)
              v31 = *(OALBuffer **)(v27 + 40);
            else
LABEL_59:
              v31 = 0;
            v20 = OALSource::SetBuffer(v16, v25, v31);
            if (v24)
              (*(void (**)(uint64_t))(*(_QWORD *)v23 + 24))(v23);
            goto LABEL_69;
          case 4128:
            v19 = OALSource::SetReferenceDistance(v15, (float)*values);
            goto LABEL_68;
          case 4129:
            v19 = OALSource::SetRollOffFactor(v15, (float)*values);
            goto LABEL_68;
          case 4131:
            v19 = OALSource::SetMaxDistance(v15, (float)*values);
            goto LABEL_68;
          case 4132:
            v19 = OALSource::SetQueueOffset(v15, 1, (float)*values);
            goto LABEL_68;
          case 4133:
            v19 = OALSource::SetQueueOffset(v15, 2, (float)*values);
            goto LABEL_68;
          case 4134:
            v19 = OALSource::SetQueueOffset(v15, 3, (float)*values);
            goto LABEL_68;
          default:
            if (param != 514)
            {
LABEL_35:
              pthread_once(&gErrorOnce, ErrorKeyInitializer);
              if (!pthread_getspecific(gALErrorKey))
                pthread_setspecific(gALErrorKey, (const void *)0xA002);
LABEL_62:
              v32 = (unsigned int *)((char *)v16 + 72);
              do
                v33 = __ldaxr(v32);
              while (__stlxr(v33 - 1, v32));
              return;
            }
            if (*values > 1u)
            {
              v20 = 40963;
LABEL_75:
              v36 = (unsigned int *)((char *)v16 + 72);
              do
                v37 = __ldaxr(v36);
              while (__stlxr(v37 - 1, v36));
              goto LABEL_23;
            }
            v19 = OALSource::SetSourceRelative(v15, *values);
LABEL_68:
            v20 = v19;
LABEL_69:
            v34 = (unsigned int *)((char *)v16 + 72);
            do
              v35 = __ldaxr(v34);
            while (__stlxr(v35 - 1, v34));
            if (!v20)
              return;
            goto LABEL_23;
        }
      }
    }
  }
  v20 = 40963;
LABEL_23:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v38 = 136316162;
    v39 = "oalImp.cpp";
    v40 = 1024;
    v41 = 2204;
    v42 = 2048;
    v43 = sid;
    v44 = 2080;
    ALAttributeString = GetALAttributeString(param);
    v46 = 2080;
    String = alGetString(v20);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourcei FAILED: source %ld : %s error = %s", (uint8_t *)&v38, 0x30u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v20);
}

void sub_215C3DA08(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void alSource3i(ALuint sid, ALenum param, ALint value1, ALint value2, ALint value3)
{
  unint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  OALContext *v18;
  OALSource *v19;
  OALSource *v20;
  unsigned int *v21;
  unsigned int v22;
  ALenum v23;
  ALenum v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  int v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const char *ALAttributeString;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const ALchar *String;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_24;
  v10 = gCurrentContext;
  v11 = gContextMapLock;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v13 = *(_QWORD **)(gOALContextMap + 8);
  if (!v13)
    goto LABEL_13;
  v14 = gOALContextMap + 8;
  do
  {
    v15 = v13[4];
    v16 = v15 >= v10;
    if (v15 >= v10)
      v17 = v13;
    else
      v17 = v13 + 1;
    if (v16)
      v14 = (uint64_t)v13;
    v13 = (_QWORD *)*v17;
  }
  while (*v17);
  if (v14 != gOALContextMap + 8 && *(_QWORD *)(v14 + 32) <= v10)
  {
    v18 = *(OALContext **)(v14 + 40);
    if (v18)
    {
      v25 = (unsigned int *)((char *)v18 + 440);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 + 1, v25));
    }
  }
  else
  {
LABEL_13:
    v18 = 0;
  }
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
  if (!v18)
    goto LABEL_24;
  v19 = (OALSource *)OALContext::ProtectSource(v18, sid);
  v20 = v19;
  v21 = (unsigned int *)((char *)v18 + 440);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v19)
  {
LABEL_24:
    v24 = 40963;
LABEL_25:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v31 = 136316930;
      v32 = "oalImp.cpp";
      v33 = 1024;
      v34 = 2243;
      v35 = 2048;
      v36 = sid;
      v37 = 2080;
      ALAttributeString = GetALAttributeString(param);
      v39 = 2048;
      v40 = value1;
      v41 = 2048;
      v42 = value2;
      v43 = 2048;
      v44 = value3;
      v45 = 2080;
      String = alGetString(v24);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSource3f FAILED: source %ld : %s : values = %ld:%ld:%ld error = %s", (uint8_t *)&v31, 0x4Eu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v24);
    return;
  }
  switch(param)
  {
    case 4100:
      v23 = OALSource::SetPosition(v19, (float)value1, (float)value2, (float)value3);
      goto LABEL_36;
    case 4102:
      v23 = OALSource::SetVelocity(v19, (float)value1, (float)value2, (float)value3);
      goto LABEL_36;
    case 4101:
      v23 = OALSource::SetDirection(v19, (float)value1, (float)value2, (float)value3);
LABEL_36:
      v24 = v23;
      v27 = (unsigned int *)((char *)v20 + 72);
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v23)
        return;
      goto LABEL_25;
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  v29 = (unsigned int *)((char *)v20 + 72);
  do
    v30 = __ldaxr(v29);
  while (__stlxr(v30 - 1, v29));
}

void sub_215C3DD54(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetSourcef(ALuint sid, ALenum param, ALfloat *value)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  float ConeInnerAngle;
  unsigned int *v20;
  unsigned int v21;
  int v22;
  unsigned int *v23;
  unsigned int v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const ALchar *String;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_50;
  v6 = gCurrentContext;
  v7 = gContextMapLock;
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v9 = *(_QWORD **)(gOALContextMap + 8);
  if (!v9)
    goto LABEL_13;
  v10 = gOALContextMap + 8;
  do
  {
    v11 = v9[4];
    v12 = v11 >= v6;
    if (v11 >= v6)
      v13 = v9;
    else
      v13 = v9 + 1;
    if (v12)
      v10 = (uint64_t)v9;
    v9 = (_QWORD *)*v13;
  }
  while (*v13);
  if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
  {
    v14 = *(OALContext **)(v10 + 40);
    if (v14)
    {
      v20 = (unsigned int *)((char *)v14 + 440);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
    }
  }
  else
  {
LABEL_13:
    v14 = 0;
  }
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  if (!v14)
    goto LABEL_50;
  v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
  v16 = v15;
  v17 = (unsigned int *)((char *)v14 + 440);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (v15)
  {
    switch(param)
    {
      case 4097:
        ConeInnerAngle = OALSource::GetConeInnerAngle(v15);
        goto LABEL_45;
      case 4098:
        ConeInnerAngle = OALSource::GetConeOuterAngle(v15);
        goto LABEL_45;
      case 4099:
        ConeInnerAngle = OALSource::GetPitch(v15);
        goto LABEL_45;
      case 4106:
        ConeInnerAngle = OALSource::GetGain(v15);
        goto LABEL_45;
      case 4109:
        ConeInnerAngle = OALSource::GetMinGain(v15);
        goto LABEL_45;
      case 4110:
        ConeInnerAngle = OALSource::GetMaxGain(v15);
        goto LABEL_45;
      case 4128:
        ConeInnerAngle = OALSource::GetReferenceDistance(v15);
        goto LABEL_45;
      case 4129:
        ConeInnerAngle = OALSource::GetRollOffFactor(v15);
        goto LABEL_45;
      case 4130:
        ConeInnerAngle = OALSource::GetConeOuterGain(v15);
        goto LABEL_45;
      case 4131:
        ConeInnerAngle = OALSource::GetMaxDistance(v15);
        goto LABEL_45;
      case 4132:
        ConeInnerAngle = OALSource::GetQueueOffsetSecondsFloat(v15);
        goto LABEL_45;
      case 4133:
        v22 = 2;
        goto LABEL_44;
      case 4134:
        v22 = 3;
LABEL_44:
        ConeInnerAngle = (float)OALSource::GetQueueOffset(v15, v22);
LABEL_45:
        *value = ConeInnerAngle;
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v23 = (unsigned int *)((char *)v16 + 72);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
  }
  else
  {
LABEL_50:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v25 = 136315650;
      v26 = "oalImp.cpp";
      v27 = 1024;
      v28 = 2313;
      v29 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSourcef FAILED = %s\n", (uint8_t *)&v25, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void sub_215C3E058(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetSourcefv(ALuint sid, ALenum param, ALfloat *values)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  float ConeInnerAngle;
  unsigned int *v20;
  unsigned int v21;
  int v22;
  unsigned int *v23;
  unsigned int v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const ALchar *String;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_53;
  v6 = gCurrentContext;
  v7 = gContextMapLock;
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v9 = *(_QWORD **)(gOALContextMap + 8);
  if (!v9)
    goto LABEL_13;
  v10 = gOALContextMap + 8;
  do
  {
    v11 = v9[4];
    v12 = v11 >= v6;
    if (v11 >= v6)
      v13 = v9;
    else
      v13 = v9 + 1;
    if (v12)
      v10 = (uint64_t)v9;
    v9 = (_QWORD *)*v13;
  }
  while (*v13);
  if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
  {
    v14 = *(OALContext **)(v10 + 40);
    if (v14)
    {
      v20 = (unsigned int *)((char *)v14 + 440);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
    }
  }
  else
  {
LABEL_13:
    v14 = 0;
  }
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  if (!v14)
    goto LABEL_53;
  v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
  v16 = v15;
  v17 = (unsigned int *)((char *)v14 + 440);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (v15)
  {
    switch(param)
    {
      case 4097:
        ConeInnerAngle = OALSource::GetConeInnerAngle(v15);
        goto LABEL_48;
      case 4098:
        ConeInnerAngle = OALSource::GetConeOuterAngle(v15);
        goto LABEL_48;
      case 4099:
        ConeInnerAngle = OALSource::GetPitch(v15);
        goto LABEL_48;
      case 4100:
        OALSource::GetPosition(v15, values, values + 1, values + 2);
        break;
      case 4101:
        OALSource::GetDirection(v15, values, values + 1, values + 2);
        break;
      case 4102:
        OALSource::GetVelocity(v15, values, values + 1, values + 2);
        break;
      case 4106:
        ConeInnerAngle = OALSource::GetGain(v15);
        goto LABEL_48;
      case 4109:
        ConeInnerAngle = OALSource::GetMinGain(v15);
        goto LABEL_48;
      case 4110:
        ConeInnerAngle = OALSource::GetMaxGain(v15);
        goto LABEL_48;
      case 4128:
        ConeInnerAngle = OALSource::GetReferenceDistance(v15);
        goto LABEL_48;
      case 4129:
        ConeInnerAngle = OALSource::GetRollOffFactor(v15);
        goto LABEL_48;
      case 4130:
        ConeInnerAngle = OALSource::GetConeOuterGain(v15);
        goto LABEL_48;
      case 4131:
        ConeInnerAngle = OALSource::GetMaxDistance(v15);
        goto LABEL_48;
      case 4132:
        ConeInnerAngle = OALSource::GetQueueOffsetSecondsFloat(v15);
        goto LABEL_48;
      case 4133:
        v22 = 2;
        goto LABEL_47;
      case 4134:
        v22 = 3;
LABEL_47:
        ConeInnerAngle = (float)OALSource::GetQueueOffset(v15, v22);
LABEL_48:
        *values = ConeInnerAngle;
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v23 = (unsigned int *)((char *)v16 + 72);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
  }
  else
  {
LABEL_53:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v25 = 136315650;
      v26 = "oalImp.cpp";
      v27 = 1024;
      v28 = 2392;
      v29 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSourcefv FAILED = %s\n", (uint8_t *)&v25, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void sub_215C3E3A4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetSource3f(ALuint sid, ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3)
{
  unint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  OALContext *v18;
  OALSource *v19;
  OALSource *v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int *v25;
  unsigned int v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const ALchar *String;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_40;
  v10 = gCurrentContext;
  v11 = gContextMapLock;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v13 = *(_QWORD **)(gOALContextMap + 8);
  if (!v13)
    goto LABEL_13;
  v14 = gOALContextMap + 8;
  do
  {
    v15 = v13[4];
    v16 = v15 >= v10;
    if (v15 >= v10)
      v17 = v13;
    else
      v17 = v13 + 1;
    if (v16)
      v14 = (uint64_t)v13;
    v13 = (_QWORD *)*v17;
  }
  while (*v17);
  if (v14 != gOALContextMap + 8 && *(_QWORD *)(v14 + 32) <= v10)
  {
    v18 = *(OALContext **)(v14 + 40);
    if (v18)
    {
      v23 = (unsigned int *)((char *)v18 + 440);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 + 1, v23));
    }
  }
  else
  {
LABEL_13:
    v18 = 0;
  }
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
  if (!v18)
    goto LABEL_40;
  v19 = (OALSource *)OALContext::ProtectSource(v18, sid);
  v20 = v19;
  v21 = (unsigned int *)((char *)v18 + 440);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (v19)
  {
    switch(param)
    {
      case 4100:
        OALSource::GetPosition(v19, value1, value2, value3);
        break;
      case 4102:
        OALSource::GetVelocity(v19, value1, value2, value3);
        break;
      case 4101:
        OALSource::GetDirection(v19, value1, value2, value3);
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v25 = (unsigned int *)((char *)v20 + 72);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
  }
  else
  {
LABEL_40:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v27 = 136315650;
      v28 = "oalImp.cpp";
      v29 = 1024;
      v30 = 2431;
      v31 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSource3f FAILED = %s\n", (uint8_t *)&v27, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void sub_215C3E654(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetSourcei(ALuint sid, ALenum param, ALint *value)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  float ConeInnerAngle;
  unsigned int *v20;
  unsigned int v21;
  ALint Looping;
  float ReferenceDistance;
  int v24;
  unsigned int *v25;
  unsigned int v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const ALchar *String;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_56;
  v6 = gCurrentContext;
  v7 = gContextMapLock;
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v9 = *(_QWORD **)(gOALContextMap + 8);
  if (!v9)
    goto LABEL_13;
  v10 = gOALContextMap + 8;
  do
  {
    v11 = v9[4];
    v12 = v11 >= v6;
    if (v11 >= v6)
      v13 = v9;
    else
      v13 = v9 + 1;
    if (v12)
      v10 = (uint64_t)v9;
    v9 = (_QWORD *)*v13;
  }
  while (*v13);
  if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
  {
    v14 = *(OALContext **)(v10 + 40);
    if (v14)
    {
      v20 = (unsigned int *)((char *)v14 + 440);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
    }
  }
  else
  {
LABEL_13:
    v14 = 0;
  }
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  if (!v14)
    goto LABEL_56;
  v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
  v16 = v15;
  v17 = (unsigned int *)((char *)v14 + 440);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (v15)
  {
    switch(param)
    {
      case 4097:
        ConeInnerAngle = OALSource::GetConeInnerAngle(v15);
        goto LABEL_43;
      case 4098:
        ConeInnerAngle = OALSource::GetConeOuterAngle(v15);
        goto LABEL_43;
      case 4099:
      case 4100:
      case 4101:
      case 4102:
      case 4104:
      case 4106:
      case 4107:
      case 4108:
      case 4109:
      case 4110:
      case 4111:
      case 4113:
      case 4114:
      case 4115:
      case 4116:
      case 4119:
      case 4120:
      case 4121:
      case 4122:
      case 4123:
      case 4124:
      case 4125:
      case 4126:
      case 4127:
        goto LABEL_32;
      case 4103:
        Looping = OALSource::GetLooping(v15);
        goto LABEL_51;
      case 4105:
        Looping = OALSource::GetBuffer(v15);
        goto LABEL_51;
      case 4112:
        Looping = OALSource::GetState(v15);
        goto LABEL_51;
      case 4117:
        Looping = OALSource::GetQLength(v15);
        goto LABEL_51;
      case 4118:
        Looping = OALSource::GetBuffersProcessed(v15);
        goto LABEL_51;
      case 4128:
        ReferenceDistance = OALSource::GetReferenceDistance(v15);
        goto LABEL_45;
      case 4129:
        ReferenceDistance = OALSource::GetRollOffFactor(v15);
        goto LABEL_45;
      case 4130:
        ConeInnerAngle = OALSource::GetConeOuterGain(v15);
LABEL_43:
        *value = ConeInnerAngle;
        goto LABEL_52;
      case 4131:
        ReferenceDistance = OALSource::GetMaxDistance(v15);
LABEL_45:
        *value = (int)ReferenceDistance;
        goto LABEL_52;
      case 4132:
        v24 = 1;
        goto LABEL_49;
      case 4133:
        v24 = 2;
        goto LABEL_49;
      case 4134:
        v24 = 3;
LABEL_49:
        Looping = OALSource::GetQueueOffset(v15, v24);
        goto LABEL_51;
      case 4135:
        Looping = OALSource::GetSourceType(v15);
        goto LABEL_51;
      default:
        if (param == 514)
        {
          Looping = OALSource::GetSourceRelative(v15);
LABEL_51:
          *value = Looping;
        }
        else
        {
LABEL_32:
          pthread_once(&gErrorOnce, ErrorKeyInitializer);
          if (!pthread_getspecific(gALErrorKey))
            pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
LABEL_52:
        v25 = (unsigned int *)((char *)v16 + 72);
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        break;
    }
  }
  else
  {
LABEL_56:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v27 = 136315650;
      v28 = "oalImp.cpp";
      v29 = 1024;
      v30 = 2508;
      v31 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSourcei FAILED = %s\n", (uint8_t *)&v27, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void sub_215C3E990(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetSourceiv(ALuint sid, ALenum param, ALint *values)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  float ConeInnerAngle;
  unsigned int *v20;
  unsigned int v21;
  ALint Looping;
  float ReferenceDistance;
  int v24;
  unsigned int *v25;
  unsigned int v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const ALchar *String;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_58;
  v6 = gCurrentContext;
  v7 = gContextMapLock;
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v9 = *(_QWORD **)(gOALContextMap + 8);
  if (!v9)
    goto LABEL_13;
  v10 = gOALContextMap + 8;
  do
  {
    v11 = v9[4];
    v12 = v11 >= v6;
    if (v11 >= v6)
      v13 = v9;
    else
      v13 = v9 + 1;
    if (v12)
      v10 = (uint64_t)v9;
    v9 = (_QWORD *)*v13;
  }
  while (*v13);
  if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
  {
    v14 = *(OALContext **)(v10 + 40);
    if (v14)
    {
      v20 = (unsigned int *)((char *)v14 + 440);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
    }
  }
  else
  {
LABEL_13:
    v14 = 0;
  }
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  if (!v14)
    goto LABEL_58;
  v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
  v16 = v15;
  v17 = (unsigned int *)((char *)v14 + 440);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (v15)
  {
    switch(param)
    {
      case 4097:
        ConeInnerAngle = OALSource::GetConeInnerAngle(v15);
        goto LABEL_35;
      case 4098:
        ConeInnerAngle = OALSource::GetConeOuterAngle(v15);
LABEL_35:
        *values = ConeInnerAngle;
        goto LABEL_54;
      case 4099:
      case 4104:
      case 4106:
      case 4107:
      case 4108:
      case 4109:
      case 4110:
      case 4111:
      case 4113:
      case 4114:
      case 4115:
      case 4116:
      case 4119:
      case 4120:
      case 4121:
      case 4122:
      case 4123:
      case 4124:
      case 4125:
      case 4126:
      case 4127:
      case 4130:
        goto LABEL_32;
      case 4100:
        OALSource::GetPosition(v15, (float *)values, (float *)values + 1, (float *)values + 2);
        goto LABEL_54;
      case 4101:
        OALSource::GetDirection(v15, (float *)values, (float *)values + 1, (float *)values + 2);
        goto LABEL_54;
      case 4102:
        OALSource::GetVelocity(v15, (float *)values, (float *)values + 1, (float *)values + 2);
        goto LABEL_54;
      case 4103:
        Looping = OALSource::GetLooping(v15);
        goto LABEL_53;
      case 4105:
        Looping = OALSource::GetBuffer(v15);
        goto LABEL_53;
      case 4112:
        Looping = OALSource::GetState(v15);
        goto LABEL_53;
      case 4117:
        Looping = OALSource::GetQLength(v15);
        goto LABEL_53;
      case 4118:
        Looping = OALSource::GetBuffersProcessed(v15);
        goto LABEL_53;
      case 4128:
        ReferenceDistance = OALSource::GetReferenceDistance(v15);
        goto LABEL_47;
      case 4129:
        ReferenceDistance = OALSource::GetRollOffFactor(v15);
        goto LABEL_47;
      case 4131:
        ReferenceDistance = OALSource::GetMaxDistance(v15);
LABEL_47:
        *values = (int)ReferenceDistance;
        goto LABEL_54;
      case 4132:
        v24 = 1;
        goto LABEL_51;
      case 4133:
        v24 = 2;
        goto LABEL_51;
      case 4134:
        v24 = 3;
LABEL_51:
        Looping = OALSource::GetQueueOffset(v15, v24);
        goto LABEL_53;
      case 4135:
        Looping = OALSource::GetSourceType(v15);
        goto LABEL_53;
      default:
        if (param == 514)
        {
          Looping = OALSource::GetSourceRelative(v15);
LABEL_53:
          *values = Looping;
        }
        else
        {
LABEL_32:
          pthread_once(&gErrorOnce, ErrorKeyInitializer);
          if (!pthread_getspecific(gALErrorKey))
            pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
LABEL_54:
        v25 = (unsigned int *)((char *)v16 + 72);
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        break;
    }
  }
  else
  {
LABEL_58:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v27 = 136315650;
      v28 = "oalImp.cpp";
      v29 = 1024;
      v30 = 2592;
      v31 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSourcefv FAILED = %s\n", (uint8_t *)&v27, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void sub_215C3ED08(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetSource3i(ALuint sid, ALenum param, ALint *value1, ALint *value2, ALint *value3)
{
  unint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  OALContext *v18;
  OALSource *v19;
  OALSource *v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int *v25;
  unsigned int v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const ALchar *String;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_40;
  v10 = gCurrentContext;
  v11 = gContextMapLock;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v13 = *(_QWORD **)(gOALContextMap + 8);
  if (!v13)
    goto LABEL_13;
  v14 = gOALContextMap + 8;
  do
  {
    v15 = v13[4];
    v16 = v15 >= v10;
    if (v15 >= v10)
      v17 = v13;
    else
      v17 = v13 + 1;
    if (v16)
      v14 = (uint64_t)v13;
    v13 = (_QWORD *)*v17;
  }
  while (*v17);
  if (v14 != gOALContextMap + 8 && *(_QWORD *)(v14 + 32) <= v10)
  {
    v18 = *(OALContext **)(v14 + 40);
    if (v18)
    {
      v23 = (unsigned int *)((char *)v18 + 440);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 + 1, v23));
    }
  }
  else
  {
LABEL_13:
    v18 = 0;
  }
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
  if (!v18)
    goto LABEL_40;
  v19 = (OALSource *)OALContext::ProtectSource(v18, sid);
  v20 = v19;
  v21 = (unsigned int *)((char *)v18 + 440);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (v19)
  {
    switch(param)
    {
      case 4100:
        OALSource::GetPosition(v19, (float *)value1, (float *)value2, (float *)value3);
        break;
      case 4102:
        OALSource::GetVelocity(v19, (float *)value1, (float *)value2, (float *)value3);
        break;
      case 4101:
        OALSource::GetDirection(v19, (float *)value1, (float *)value2, (float *)value3);
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v25 = (unsigned int *)((char *)v20 + 72);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
  }
  else
  {
LABEL_40:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v27 = 136315650;
      v28 = "oalImp.cpp";
      v29 = 1024;
      v30 = 2631;
      v31 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSource3f FAILED = %s\n", (uint8_t *)&v27, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void sub_215C3EFB8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSourcePlay(ALuint sid)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  OALContext *v10;
  OALSource *v11;
  OALSource *v12;
  unsigned int *v13;
  unsigned int v14;
  ALenum v15;
  unsigned int *v16;
  unsigned int v17;
  const ALchar *String;
  unsigned int *v19;
  unsigned int v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const ALchar *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v21 = 136315650;
    v22 = "oalImp.cpp";
    v23 = 1024;
    v24 = 2639;
    v25 = 2048;
    v26 = (const ALchar *)sid;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourcePlay--> source %ld", (uint8_t *)&v21, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_25;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_15;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(OALContext **)(v6 + 40);
    if (v10)
    {
      v19 = (unsigned int *)((char *)v10 + 440);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 + 1, v19));
    }
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (!v10)
    goto LABEL_25;
  v11 = (OALSource *)OALContext::ProtectSource(v10, sid);
  v12 = v11;
  v13 = (unsigned int *)((char *)v10 + 440);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v11)
  {
    v15 = OALSource::Play(v11);
    v16 = (unsigned int *)((char *)v12 + 72);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
  }
  else
  {
LABEL_25:
    v15 = 40963;
  }
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v15);
      v21 = 136315650;
      v22 = "oalImp.cpp";
      v23 = 1024;
      v24 = 2653;
      v25 = 2080;
      v26 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourcePlay FAILED = %s\n", (uint8_t *)&v21, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v15);
  }
}

void sub_215C3F240(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSourcePause(ALuint sid)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  OALContext *v10;
  OALSource *v11;
  OALSource *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  const ALchar *String;
  unsigned int *v20;
  unsigned int v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const ALchar *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315650;
    v23 = "oalImp.cpp";
    v24 = 1024;
    v25 = 2661;
    v26 = 2048;
    v27 = (const ALchar *)sid;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourcePause--> source %ld", (uint8_t *)&v22, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_25;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_15;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(OALContext **)(v6 + 40);
    if (v10)
    {
      v20 = (unsigned int *)((char *)v10 + 440);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
    }
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (!v10)
    goto LABEL_25;
  v11 = (OALSource *)OALContext::ProtectSource(v10, sid);
  v12 = v11;
  v13 = (unsigned int *)((char *)v10 + 440);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v11)
  {
    OALSource::Pause(v11);
    v15 = (unsigned int *)((char *)v12 + 72);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    v17 = 0;
    v18 = 0;
  }
  else
  {
LABEL_25:
    v18 = 40963;
    v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v18);
      v22 = 136315650;
      v23 = "oalImp.cpp";
      v24 = 1024;
      v25 = 2676;
      v26 = 2080;
      v27 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourcePause FAILED = %s\n", (uint8_t *)&v22, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v18);
  }
}

void sub_215C3F4D0(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSourceRewind(ALuint sid)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  OALContext *v10;
  OALSource *v11;
  OALSource *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  const ALchar *String;
  unsigned int *v20;
  unsigned int v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const ALchar *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315650;
    v23 = "oalImp.cpp";
    v24 = 1024;
    v25 = 2706;
    v26 = 2048;
    v27 = (const ALchar *)sid;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceRewind--> source %ld", (uint8_t *)&v22, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_25;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_15;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(OALContext **)(v6 + 40);
    if (v10)
    {
      v20 = (unsigned int *)((char *)v10 + 440);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
    }
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (!v10)
    goto LABEL_25;
  v11 = (OALSource *)OALContext::ProtectSource(v10, sid);
  v12 = v11;
  v13 = (unsigned int *)((char *)v10 + 440);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v11)
  {
    OALSource::Rewind(v11);
    v15 = (unsigned int *)((char *)v12 + 72);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    v17 = 0;
    v18 = 0;
  }
  else
  {
LABEL_25:
    v18 = 40963;
    v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v18);
      v22 = 136315650;
      v23 = "oalImp.cpp";
      v24 = 1024;
      v25 = 2720;
      v26 = 2080;
      v27 = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceRewind FAILED = %s\n", (uint8_t *)&v22, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)v18);
  }
}

void sub_215C3F760(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSourcePlayv(ALsizei ns, const ALuint *sids)
{
  uint64_t v3;
  ALuint v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  LODWORD(v3) = ns;
  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "oalImp.cpp";
    v7 = 1024;
    v8 = 2728;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourcePlayv", (uint8_t *)&v5, 0x12u);
  }
  if ((_DWORD)v3)
  {
    v3 = v3;
    do
    {
      v4 = *sids++;
      alSourcePlay(v4);
      --v3;
    }
    while (v3);
  }
}

void alSourcePausev(ALsizei ns, const ALuint *sids)
{
  uint64_t v3;
  ALuint v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  LODWORD(v3) = ns;
  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "oalImp.cpp";
    v7 = 1024;
    v8 = 2744;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourcePausev", (uint8_t *)&v5, 0x12u);
  }
  if ((_DWORD)v3)
  {
    v3 = v3;
    do
    {
      v4 = *sids++;
      alSourcePause(v4);
      --v3;
    }
    while (v3);
  }
}

void alSourceStopv(ALsizei ns, const ALuint *sids)
{
  uint64_t v3;
  ALuint v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  LODWORD(v3) = ns;
  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "oalImp.cpp";
    v7 = 1024;
    v8 = 2760;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceStopv", (uint8_t *)&v5, 0x12u);
  }
  if ((_DWORD)v3)
  {
    v3 = v3;
    do
    {
      v4 = *sids++;
      alSourceStop(v4);
      --v3;
    }
    while (v3);
  }
}

void alSourceRewindv(ALsizei ns, const ALuint *sids)
{
  uint64_t v3;
  ALuint v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  LODWORD(v3) = ns;
  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "oalImp.cpp";
    v7 = 1024;
    v8 = 2776;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceRewindv", (uint8_t *)&v5, 0x12u);
  }
  if ((_DWORD)v3)
  {
    v3 = v3;
    do
    {
      v4 = *sids++;
      alSourceRewind(v4);
      --v3;
    }
    while (v3);
  }
}

void alSourceQueueBuffers(ALuint sid, ALsizei numEntries, const ALuint *bids)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  ALuint v25;
  uint64_t v26;
  uint64_t v27;
  ALuint v28;
  BOOL v29;
  uint64_t *v30;
  ALenum v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  BOOL v40;
  ALuint v41;
  uint64_t v42;
  uint64_t v43;
  ALuint v44;
  BOOL v45;
  uint64_t *v46;
  uint64_t i;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  BOOL v52;
  uint64_t *v53;
  OALBuffer *v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  BOOL v60;
  uint64_t *v61;
  OALBuffer *v62;
  unsigned int *v63;
  unsigned int v64;
  int v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  const ALchar *String;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  if (!numEntries)
    return;
  if (!gOALBufferMap)
  {
LABEL_51:
    v31 = 40964;
    goto LABEL_52;
  }
  if (gOALContextMap)
  {
    v6 = gCurrentContext;
    v7 = gContextMapLock;
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v9 = *(_QWORD **)(gOALContextMap + 8);
    if (!v9)
      goto LABEL_15;
    v10 = gOALContextMap + 8;
    do
    {
      v11 = v9[4];
      v12 = v11 >= v6;
      if (v11 >= v6)
        v13 = v9;
      else
        v13 = v9 + 1;
      if (v12)
        v10 = (uint64_t)v9;
      v9 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
    {
      v14 = *(OALContext **)(v10 + 40);
      if (v14)
      {
        v32 = (unsigned int *)((char *)v14 + 440);
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 + 1, v32));
      }
    }
    else
    {
LABEL_15:
      v14 = 0;
    }
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    if (v14)
    {
      v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
      v16 = v15;
      v17 = (unsigned int *)((char *)v14 + 440);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (v15)
      {
        if (OALSource::IsSourceTransitioningToFlushQ(v15))
        {
          v19 = gBufferMapLock;
          v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gBufferMapLock + 16))(gBufferMapLock);
          v21 = 0;
          v22 = (uint64_t *)(gOALBufferMap + 8);
          if (numEntries <= 1)
            v23 = 1;
          else
            v23 = numEntries;
          v24 = 1;
          do
          {
            v25 = bids[v21];
            if (v25)
            {
              v26 = *v22;
              if (!*v22)
              {
                v31 = 40963;
                goto LABEL_94;
              }
              v27 = gOALBufferMap + 8;
              do
              {
                v28 = *(_DWORD *)(v26 + 32);
                v29 = v28 >= v25;
                if (v28 >= v25)
                  v30 = (uint64_t *)v26;
                else
                  v30 = (uint64_t *)(v26 + 8);
                if (v29)
                  v27 = v26;
                v26 = *v30;
              }
              while (*v30);
              if ((uint64_t *)v27 == v22 || *(_DWORD *)(v27 + 32) > v25 || !*(_QWORD *)(v27 + 40))
              {
                v31 = 40963;
                if (v24)
                  goto LABEL_94;
                goto LABEL_77;
              }
            }
            v24 = ++v21 < (unint64_t)numEntries;
          }
          while (v21 != v23);
          v31 = 0;
          if (v24)
            goto LABEL_94;
LABEL_77:
          for (i = 0; i != v23; ++i)
          {
            v48 = bids[i];
            v49 = *(_QWORD *)(gOALBufferMap + 8);
            if (!v49)
              goto LABEL_89;
            v50 = gOALBufferMap + 8;
            do
            {
              v51 = *(_DWORD *)(v49 + 32);
              v52 = v51 >= v48;
              if (v51 >= v48)
                v53 = (uint64_t *)v49;
              else
                v53 = (uint64_t *)(v49 + 8);
              if (v52)
                v50 = v49;
              v49 = *v53;
            }
            while (*v53);
            if (v50 != gOALBufferMap + 8 && *(_DWORD *)(v50 + 32) <= v48)
              v54 = *(OALBuffer **)(v50 + 40);
            else
LABEL_89:
              v54 = 0;
            OALSource::AddToTempQueue(v16, v48, v54);
          }
LABEL_94:
          if (v20)
LABEL_117:
            (*(void (**)(uint64_t))(*(_QWORD *)v19 + 24))(v19);
LABEL_118:
          v63 = (unsigned int *)((char *)v16 + 72);
          do
            v64 = __ldaxr(v63);
          while (__stlxr(v64 - 1, v63));
          if (!v31)
            return;
          goto LABEL_52;
        }
        if (OALSource::GetSourceType(v16) != 4136)
        {
          v19 = gBufferMapLock;
          v36 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gBufferMapLock + 16))(gBufferMapLock);
          v37 = 0;
          v38 = (uint64_t *)(gOALBufferMap + 8);
          if (numEntries <= 1)
            v39 = 1;
          else
            v39 = numEntries;
          v40 = 1;
          do
          {
            v41 = bids[v37];
            if (v41)
            {
              v42 = *v38;
              if (!*v38)
              {
                v31 = 40963;
                goto LABEL_116;
              }
              v43 = gOALBufferMap + 8;
              do
              {
                v44 = *(_DWORD *)(v42 + 32);
                v45 = v44 >= v41;
                if (v44 >= v41)
                  v46 = (uint64_t *)v42;
                else
                  v46 = (uint64_t *)(v42 + 8);
                if (v45)
                  v43 = v42;
                v42 = *v46;
              }
              while (*v46);
              if ((uint64_t *)v43 == v38 || *(_DWORD *)(v43 + 32) > v41 || !*(_QWORD *)(v43 + 40))
              {
                v31 = 40963;
                goto LABEL_97;
              }
            }
            v40 = ++v37 < (unint64_t)numEntries;
          }
          while (v37 != v39);
          v31 = 0;
LABEL_97:
          if (!v40)
          {
            v55 = 0;
            while (1)
            {
              v56 = bids[v55];
              v57 = *(_QWORD *)(gOALBufferMap + 8);
              if (!v57)
                goto LABEL_110;
              v58 = gOALBufferMap + 8;
              do
              {
                v59 = *(_DWORD *)(v57 + 32);
                v60 = v59 >= v56;
                if (v59 >= v56)
                  v61 = (uint64_t *)v57;
                else
                  v61 = (uint64_t *)(v57 + 8);
                if (v60)
                  v58 = v57;
                v57 = *v61;
              }
              while (*v61);
              if (v58 != gOALBufferMap + 8 && *(_DWORD *)(v58 + 32) <= v56)
                v62 = *(OALBuffer **)(v58 + 40);
              else
LABEL_110:
                v62 = 0;
              v31 = OALSource::AddToQueue(v16, v56, v62);
              if (v31)
                break;
              if (++v55 == v39)
              {
                v31 = 0;
                break;
              }
            }
          }
LABEL_116:
          if (v36)
            goto LABEL_117;
          goto LABEL_118;
        }
        v34 = (unsigned int *)((char *)v16 + 72);
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        goto LABEL_51;
      }
    }
  }
  v31 = 40963;
LABEL_52:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v65 = 136315650;
    v66 = "oalImp.cpp";
    v67 = 1024;
    v68 = 2867;
    v69 = 2080;
    String = alGetString(v31);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceQueueBuffers FAILED = %s\n", (uint8_t *)&v65, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v31);
}

void sub_215C3FF78(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void alSourceUnqueueBuffers(ALuint sid, ALsizei numEntries, ALuint *bids)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  OALSource *v15;
  OALSource *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  ALenum v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  ALenum v25;
  unsigned int *v26;
  unsigned int v27;
  int v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const ALchar *String;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!numEntries)
    return;
  if (bids)
  {
    if (!gOALBufferMap)
    {
      v21 = 40964;
      goto LABEL_28;
    }
    if (gOALContextMap)
    {
      v6 = gCurrentContext;
      v7 = gContextMapLock;
      v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
      v9 = *(_QWORD **)(gOALContextMap + 8);
      if (!v9)
        goto LABEL_16;
      v10 = gOALContextMap + 8;
      do
      {
        v11 = v9[4];
        v12 = v11 >= v6;
        if (v11 >= v6)
          v13 = v9;
        else
          v13 = v9 + 1;
        if (v12)
          v10 = (uint64_t)v9;
        v9 = (_QWORD *)*v13;
      }
      while (*v13);
      if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
      {
        v14 = *(OALContext **)(v10 + 40);
        if (v14)
        {
          v23 = (unsigned int *)((char *)v14 + 440);
          do
            v24 = __ldaxr(v23);
          while (__stlxr(v24 + 1, v23));
        }
      }
      else
      {
LABEL_16:
        v14 = 0;
      }
      if (v8)
        (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
      if (v14)
      {
        v15 = (OALSource *)OALContext::ProtectSource(v14, sid);
        v16 = v15;
        v17 = (unsigned int *)((char *)v14 + 440);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (v15)
        {
          if (OALSource::GetQLength(v15) >= numEntries)
          {
            v25 = OALSource::RemoveBuffersFromQueue(v16, numEntries, bids);
            v21 = v25;
            v26 = (unsigned int *)((char *)v16 + 72);
            do
              v27 = __ldaxr(v26);
            while (__stlxr(v27 - 1, v26));
            if (!v25)
              return;
            goto LABEL_28;
          }
          v19 = (unsigned int *)((char *)v16 + 72);
          do
            v20 = __ldaxr(v19);
          while (__stlxr(v20 - 1, v19));
        }
      }
    }
  }
  v21 = 40963;
LABEL_28:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v28 = 136315650;
    v29 = "oalImp.cpp";
    v30 = 1024;
    v31 = 2898;
    v32 = 2080;
    String = alGetString(v21);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceUnqueueBuffers FAILED = %s\n", (uint8_t *)&v28, 0x1Cu);
  }
  if (bids)
  {
    if (numEntries <= 1)
      v22 = 1;
    else
      v22 = numEntries;
    bzero(bids, 4 * v22);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v21);
}

void sub_215C40248(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alListenerf(ALenum param, ALfloat value)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  OALContext *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const ALchar *String;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_34;
  v4 = gCurrentContext;
  v5 = gContextMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v7 = *(_QWORD **)(gOALContextMap + 8);
  if (!v7)
    goto LABEL_13;
  v8 = gOALContextMap + 8;
  do
  {
    v9 = v7[4];
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = v7;
    else
      v11 = v7 + 1;
    if (v10)
      v8 = (uint64_t)v7;
    v7 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
  {
    v12 = *(OALContext **)(v8 + 40);
    if (v12)
    {
      v15 = (unsigned int *)((char *)v12 + 440);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 + 1, v15));
    }
  }
  else
  {
LABEL_13:
    v12 = 0;
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  if (v12)
  {
    if (param == 4106)
    {
      OALContext::SetListenerGain(v12, value);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
    }
    v13 = (unsigned int *)((char *)v12 + 440);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
  }
  else
  {
LABEL_34:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315650;
      v18 = "oalImp.cpp";
      v19 = 1024;
      v20 = 2948;
      v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListenerf FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C4046C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alListenerfv(ALenum param, const ALfloat *values)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  OALContext *v12;
  ALenum v13;
  ALenum v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const ALchar *String;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (gOALContextMap)
  {
    v4 = gCurrentContext;
    v5 = gContextMapLock;
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v7 = *(_QWORD **)(gOALContextMap + 8);
    if (!v7)
      goto LABEL_13;
    v8 = gOALContextMap + 8;
    do
    {
      v9 = v7[4];
      v10 = v9 >= v4;
      if (v9 >= v4)
        v11 = v7;
      else
        v11 = v7 + 1;
      if (v10)
        v8 = (uint64_t)v7;
      v7 = (_QWORD *)*v11;
    }
    while (*v11);
    if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
    {
      v12 = *(OALContext **)(v8 + 40);
      if (v12)
      {
        v15 = (unsigned int *)((char *)v12 + 440);
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 + 1, v15));
      }
    }
    else
    {
LABEL_13:
      v12 = 0;
    }
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
    if (v12)
    {
      switch(param)
      {
        case 4100:
          v13 = OALContext::SetListenerPosition(v12, *values, values[1], values[2]);
          goto LABEL_32;
        case 4102:
          v13 = OALContext::SetListenerVelocity(v12, *values, values[1], values[2]);
          goto LABEL_32;
        case 4106:
          v13 = OALContext::SetListenerGain(v12, *values);
          goto LABEL_32;
        case 4111:
          v13 = OALContext::SetListenerOrientation(v12, *values, values[1], values[2], values[3], values[4], values[5]);
LABEL_32:
          v14 = v13;
          v19 = (unsigned int *)((char *)v12 + 440);
          do
            v20 = __ldaxr(v19);
          while (__stlxr(v20 - 1, v19));
          if (v13)
            goto LABEL_35;
          return;
        default:
          pthread_once(&gErrorOnce, ErrorKeyInitializer);
          if (!pthread_getspecific(gALErrorKey))
            pthread_setspecific(gALErrorKey, (const void *)0xA002);
          v17 = (unsigned int *)((char *)v12 + 440);
          do
            v18 = __ldaxr(v17);
          while (__stlxr(v18 - 1, v17));
          return;
      }
    }
  }
  v14 = 40964;
LABEL_35:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v21 = 136315650;
    v22 = "oalImp.cpp";
    v23 = 1024;
    v24 = 2987;
    v25 = 2080;
    String = alGetString(v14);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListenerfv FAILED = %s\n", (uint8_t *)&v21, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v14);
}

void sub_215C4070C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alListener3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  OALContext *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const ALchar *String;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_36;
  v8 = gCurrentContext;
  v9 = gContextMapLock;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v11 = *(_QWORD **)(gOALContextMap + 8);
  if (!v11)
    goto LABEL_13;
  v12 = gOALContextMap + 8;
  do
  {
    v13 = v11[4];
    v14 = v13 >= v8;
    if (v13 >= v8)
      v15 = v11;
    else
      v15 = v11 + 1;
    if (v14)
      v12 = (uint64_t)v11;
    v11 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(_QWORD *)(v12 + 32) <= v8)
  {
    v16 = *(OALContext **)(v12 + 40);
    if (v16)
    {
      v19 = (unsigned int *)((char *)v16 + 440);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 + 1, v19));
    }
  }
  else
  {
LABEL_13:
    v16 = 0;
  }
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  if (v16)
  {
    if (param == 4102)
    {
      OALContext::SetListenerVelocity(v16, value1, value2, value3);
    }
    else if (param == 4100)
    {
      OALContext::SetListenerPosition(v16, value1, value2, value3);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
    }
    v17 = (unsigned int *)((char *)v16 + 440);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
  }
  else
  {
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v21 = 136315650;
      v22 = "oalImp.cpp";
      v23 = 1024;
      v24 = 3019;
      v25 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListener3f FAILED = %s\n", (uint8_t *)&v21, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C4096C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alListeneri(ALenum param, ALint value)
{
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
}

void alListeneriv(ALenum param, const ALint *values)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  OALContext *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const ALchar *String;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_37;
  v4 = gCurrentContext;
  v5 = gContextMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v7 = *(_QWORD **)(gOALContextMap + 8);
  if (!v7)
    goto LABEL_13;
  v8 = gOALContextMap + 8;
  do
  {
    v9 = v7[4];
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = v7;
    else
      v11 = v7 + 1;
    if (v10)
      v8 = (uint64_t)v7;
    v7 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
  {
    v12 = *(OALContext **)(v8 + 40);
    if (v12)
    {
      v13 = (unsigned int *)((char *)v12 + 440);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
  }
  else
  {
LABEL_13:
    v12 = 0;
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  if (v12)
  {
    switch(param)
    {
      case 4111:
        OALContext::SetListenerOrientation(v12, (float)*values, (float)values[1], (float)values[2], (float)values[3], (float)values[4], (float)values[5]);
        break;
      case 4102:
        OALContext::SetListenerVelocity(v12, (float)*values, (float)values[1], (float)values[2]);
        break;
      case 4100:
        OALContext::SetListenerPosition(v12, (float)*values, (float)values[1], (float)values[2]);
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v15 = (unsigned int *)((char *)v12 + 440);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
  }
  else
  {
LABEL_37:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315650;
      v18 = "oalImp.cpp";
      v19 = 1024;
      v20 = 3063;
      v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListeneriv FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C40C58(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alListener3i(ALenum param, ALint value1, ALint value2, ALint value3)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  OALContext *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const ALchar *String;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_36;
  v8 = gCurrentContext;
  v9 = gContextMapLock;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v11 = *(_QWORD **)(gOALContextMap + 8);
  if (!v11)
    goto LABEL_13;
  v12 = gOALContextMap + 8;
  do
  {
    v13 = v11[4];
    v14 = v13 >= v8;
    if (v13 >= v8)
      v15 = v11;
    else
      v15 = v11 + 1;
    if (v14)
      v12 = (uint64_t)v11;
    v11 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(_QWORD *)(v12 + 32) <= v8)
  {
    v16 = *(OALContext **)(v12 + 40);
    if (v16)
    {
      v19 = (unsigned int *)((char *)v16 + 440);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 + 1, v19));
    }
  }
  else
  {
LABEL_13:
    v16 = 0;
  }
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  if (v16)
  {
    if (param == 4102)
    {
      OALContext::SetListenerVelocity(v16, (float)value1, (float)value2, (float)value3);
    }
    else if (param == 4100)
    {
      OALContext::SetListenerPosition(v16, (float)value1, (float)value2, (float)value3);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
    }
    v17 = (unsigned int *)((char *)v16 + 440);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
  }
  else
  {
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v21 = 136315650;
      v22 = "oalImp.cpp";
      v23 = 1024;
      v24 = 3095;
      v25 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListener3f FAILED = %s\n", (uint8_t *)&v21, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C40EB8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetListenerf(ALenum param, ALfloat *value)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const ALchar *String;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_34;
  v4 = gCurrentContext;
  v5 = gContextMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v7 = *(_QWORD **)(gOALContextMap + 8);
  if (!v7)
    goto LABEL_13;
  v8 = gOALContextMap + 8;
  do
  {
    v9 = v7[4];
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = v7;
    else
      v11 = v7 + 1;
    if (v10)
      v8 = (uint64_t)v7;
    v7 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
  {
    v12 = *(_QWORD *)(v8 + 40);
    if (v12)
    {
      v15 = (unsigned int *)(v12 + 440);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 + 1, v15));
    }
  }
  else
  {
LABEL_13:
    v12 = 0;
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  if (v12)
  {
    if (param == 4106)
    {
      *value = *(ALfloat *)(v12 + 368);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
    }
    v13 = (unsigned int *)(v12 + 440);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
  }
  else
  {
LABEL_34:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315650;
      v18 = "oalImp.cpp";
      v19 = 1024;
      v20 = 3124;
      v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListenerf FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C410D8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetListenerfv(ALenum param, ALfloat *values)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  ALfloat *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const ALchar *String;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_36;
  v4 = gCurrentContext;
  v5 = gContextMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v7 = *(_QWORD **)(gOALContextMap + 8);
  if (!v7)
    goto LABEL_13;
  v8 = gOALContextMap + 8;
  do
  {
    v9 = v7[4];
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = v7;
    else
      v11 = v7 + 1;
    if (v10)
      v8 = (uint64_t)v7;
    v7 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
  {
    v12 = *(ALfloat **)(v8 + 40);
    if (v12)
    {
      v13 = (unsigned int *)(v12 + 110);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
  }
  else
  {
LABEL_13:
    v12 = 0;
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  if (v12)
  {
    switch(param)
    {
      case 4100:
        *values = v12[86];
        values[1] = v12[87];
        values[2] = v12[88];
        break;
      case 4102:
        *values = v12[89];
        values[1] = v12[90];
        values[2] = v12[91];
        break;
      case 4106:
        *values = v12[92];
        break;
      case 4111:
        *values = v12[93];
        values[1] = v12[94];
        values[2] = v12[95];
        values[3] = v12[96];
        values[4] = v12[97];
        values[5] = v12[98];
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v15 = (unsigned int *)(v12 + 110);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
  }
  else
  {
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315650;
      v18 = "oalImp.cpp";
      v19 = 1024;
      v20 = 3163;
      v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListenerfv FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C41380(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetListener3f(ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  ALfloat *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const ALchar *String;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_36;
  v8 = gCurrentContext;
  v9 = gContextMapLock;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v11 = *(_QWORD **)(gOALContextMap + 8);
  if (!v11)
    goto LABEL_13;
  v12 = gOALContextMap + 8;
  do
  {
    v13 = v11[4];
    v14 = v13 >= v8;
    if (v13 >= v8)
      v15 = v11;
    else
      v15 = v11 + 1;
    if (v14)
      v12 = (uint64_t)v11;
    v11 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(_QWORD *)(v12 + 32) <= v8)
  {
    v16 = *(ALfloat **)(v12 + 40);
    if (v16)
    {
      v19 = (unsigned int *)(v16 + 110);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 + 1, v19));
    }
  }
  else
  {
LABEL_13:
    v16 = 0;
  }
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  if (v16)
  {
    if (param == 4102)
    {
      *value1 = v16[89];
      *value2 = v16[90];
      *value3 = v16[91];
    }
    else if (param == 4100)
    {
      *value1 = v16[86];
      *value2 = v16[87];
      *value3 = v16[88];
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
    }
    v17 = (unsigned int *)(v16 + 110);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
  }
  else
  {
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v21 = 136315650;
      v22 = "oalImp.cpp";
      v23 = 1024;
      v24 = 3195;
      v25 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListener3f FAILED = %s\n", (uint8_t *)&v21, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C415E8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetListeneri(ALenum param, ALint *value)
{
  *value = 0;
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA003);
}

void alGetListeneriv(ALenum param, ALint *values)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  ALint *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const ALchar *String;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_37;
  v4 = gCurrentContext;
  v5 = gContextMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v7 = *(_QWORD **)(gOALContextMap + 8);
  if (!v7)
    goto LABEL_13;
  v8 = gOALContextMap + 8;
  do
  {
    v9 = v7[4];
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = v7;
    else
      v11 = v7 + 1;
    if (v10)
      v8 = (uint64_t)v7;
    v7 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
  {
    v12 = *(ALint **)(v8 + 40);
    if (v12)
    {
      v13 = (unsigned int *)(v12 + 110);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
  }
  else
  {
LABEL_13:
    v12 = 0;
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  if (v12)
  {
    switch(param)
    {
      case 4111:
        *values = v12[93];
        values[1] = v12[94];
        values[2] = v12[95];
        values[3] = v12[96];
        values[4] = v12[97];
        values[5] = v12[98];
        break;
      case 4102:
        *values = v12[89];
        values[1] = v12[90];
        values[2] = v12[91];
        break;
      case 4100:
        *values = v12[86];
        values[1] = v12[87];
        values[2] = v12[88];
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v15 = (unsigned int *)(v12 + 110);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
  }
  else
  {
LABEL_37:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315650;
      v18 = "oalImp.cpp";
      v19 = 1024;
      v20 = 3246;
      v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListenerfv FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C418D4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetListener3i(ALenum param, ALint *value1, ALint *value2, ALint *value3)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  ALint *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const ALchar *String;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!gOALContextMap)
    goto LABEL_36;
  v8 = gCurrentContext;
  v9 = gContextMapLock;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v11 = *(_QWORD **)(gOALContextMap + 8);
  if (!v11)
    goto LABEL_13;
  v12 = gOALContextMap + 8;
  do
  {
    v13 = v11[4];
    v14 = v13 >= v8;
    if (v13 >= v8)
      v15 = v11;
    else
      v15 = v11 + 1;
    if (v14)
      v12 = (uint64_t)v11;
    v11 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(_QWORD *)(v12 + 32) <= v8)
  {
    v16 = *(ALint **)(v12 + 40);
    if (v16)
    {
      v19 = (unsigned int *)(v16 + 110);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 + 1, v19));
    }
  }
  else
  {
LABEL_13:
    v16 = 0;
  }
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  if (v16)
  {
    if (param == 4102)
    {
      *value1 = v16[89];
      *value2 = v16[90];
      *value3 = v16[91];
    }
    else if (param == 4100)
    {
      *value1 = v16[86];
      *value2 = v16[87];
      *value3 = v16[88];
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
    }
    v17 = (unsigned int *)(v16 + 110);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
  }
  else
  {
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v21 = 136315650;
      v22 = "oalImp.cpp";
      v23 = 1024;
      v24 = 3278;
      v25 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListener3f FAILED = %s\n", (uint8_t *)&v21, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C41B3C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alDistanceModel(ALenum distanceModel)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  const ALchar *String;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *ALAttributeString;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315650;
    v18 = "oalImp.cpp";
    v19 = 1024;
    v20 = 3288;
    v21 = 2080;
    ALAttributeString = GetALAttributeString(distanceModel);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alDistanceModel--> model = %s", (uint8_t *)&v17, 0x1Cu);
  }
  if ((distanceModel - 53249) >= 6 && distanceModel)
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (pthread_getspecific(gALErrorKey))
      return;
    v14 = 40963;
LABEL_27:
    pthread_setspecific(gALErrorKey, (const void *)v14);
    return;
  }
  if (!gOALContextMap)
    goto LABEL_38;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_16;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(_QWORD *)(v6 + 40);
    if (v10)
    {
      v15 = (unsigned int *)(v10 + 440);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 + 1, v15));
    }
  }
  else
  {
LABEL_16:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (v10)
  {
    OALContext::SetDistanceModel(v10, distanceModel);
    v11 = (unsigned int *)(v10 + 440);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
  }
  else
  {
LABEL_38:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40964);
      v17 = 136315650;
      v18 = "oalImp.cpp";
      v19 = 1024;
      v20 = 3316;
      v21 = 2080;
      ALAttributeString = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDistanceModel FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
    {
      v14 = 40964;
      goto LABEL_27;
    }
  }
}

void sub_215C41DD4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alDopplerFactor(ALfloat value)
{
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  const ALchar *String;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315650;
    v18 = "oalImp.cpp";
    v19 = 1024;
    v20 = 3324;
    v21 = 2048;
    v22 = value;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alDopplerFactor---> setting = %.f2", (uint8_t *)&v17, 0x1Cu);
  }
  if (value < 0.0)
  {
    v2 = 40963;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
LABEL_27:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)v2);
      return;
    }
LABEL_26:
    String = alGetString(v2);
    v17 = 136315650;
    v18 = "oalImp.cpp";
    v19 = 1024;
    v20 = 3340;
    v21 = 2080;
    v22 = *(double *)&String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDopplerFactor FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    goto LABEL_27;
  }
  if (!gOALContextMap)
    goto LABEL_25;
  v3 = gCurrentContext;
  v4 = gContextMapLock;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v6 = *(_QWORD **)(gOALContextMap + 8);
  if (!v6)
    goto LABEL_18;
  v7 = gOALContextMap + 8;
  do
  {
    v8 = v6[4];
    v9 = v8 >= v3;
    if (v8 >= v3)
      v10 = v6;
    else
      v10 = v6 + 1;
    if (v9)
      v7 = (uint64_t)v6;
    v6 = (_QWORD *)*v10;
  }
  while (*v10);
  if (v7 != gOALContextMap + 8 && *(_QWORD *)(v7 + 32) <= v3)
  {
    v11 = *(_QWORD *)(v7 + 40);
    if (v11)
    {
      v15 = (unsigned int *)(v11 + 440);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 + 1, v15));
    }
  }
  else
  {
LABEL_18:
    v11 = 0;
  }
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  if (!v11)
  {
LABEL_25:
    v2 = 40964;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_27;
    goto LABEL_26;
  }
  OALContext::SetDopplerFactor(v11, value);
  v12 = (unsigned int *)(v11 + 440);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
}

void sub_215C42050(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alDopplerVelocity(ALfloat value)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  const ALchar *String;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315650;
    v18 = "oalImp.cpp";
    v19 = 1024;
    v20 = 3348;
    v21 = 2048;
    v22 = value;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alDopplerVelocity---> setting = %.f2", (uint8_t *)&v17, 0x1Cu);
  }
  if (value <= 0.0)
  {
    v13 = 40963;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
LABEL_26:
      String = alGetString(v13);
      v17 = 136315650;
      v18 = "oalImp.cpp";
      v19 = 1024;
      v20 = 3365;
      v21 = 2080;
      v22 = *(double *)&String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDopplerVelocity FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
  }
  else
  {
    if (gOALContextMap)
    {
      v2 = gCurrentContext;
      v3 = gContextMapLock;
      v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
      v5 = *(_QWORD **)(gOALContextMap + 8);
      if (!v5)
        goto LABEL_16;
      v6 = gOALContextMap + 8;
      do
      {
        v7 = v5[4];
        v8 = v7 >= v2;
        if (v7 >= v2)
          v9 = v5;
        else
          v9 = v5 + 1;
        if (v8)
          v6 = (uint64_t)v5;
        v5 = (_QWORD *)*v9;
      }
      while (*v9);
      if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
      {
        v10 = *(_QWORD *)(v6 + 40);
        if (v10)
        {
          v15 = (unsigned int *)(v10 + 440);
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 + 1, v15));
        }
      }
      else
      {
LABEL_16:
        v10 = 0;
      }
      if (v4)
        (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
      if (v10)
      {
        OALContext::SetDopplerVelocity(v10, value);
        v11 = (unsigned int *)(v10 + 440);
        do
          v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
        return;
      }
    }
    v13 = 40964;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)v13);
}

void sub_215C422CC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSpeedOfSound(ALfloat value)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  const ALchar *String;
  unsigned int *v14;
  unsigned int v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315650;
    v17 = "oalImp.cpp";
    v18 = 1024;
    v19 = 3373;
    v20 = 2048;
    v21 = value;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSpeedOfSound---> setting = %.f2", (uint8_t *)&v16, 0x1Cu);
  }
  if (value <= 0.0 || !gOALContextMap)
    goto LABEL_34;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_16;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(_QWORD *)(v6 + 40);
    if (v10)
    {
      v14 = (unsigned int *)(v10 + 440);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 + 1, v14));
    }
  }
  else
  {
LABEL_16:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (v10)
  {
    OALContext::SetSpeedOfSound(v10, value);
    v11 = (unsigned int *)(v10 + 440);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
  }
  else
  {
LABEL_34:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40964);
      v16 = 136315650;
      v17 = "oalImp.cpp";
      v18 = 1024;
      v19 = 3389;
      v20 = 2080;
      v21 = *(double *)&String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSpeedOfSound FAILED = %s\n", (uint8_t *)&v16, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C42528(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

ALBOOLean alGetBoolean(ALenum param)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315394;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 3551;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alGetBoolean", (uint8_t *)&v2, 0x12u);
  }
  return 0;
}

void alGetBooleanv(ALenum param, ALBOOLean *data)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315394;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 3559;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alGetBooleanv", (uint8_t *)&v2, 0x12u);
  }
}

ALfloat alGetFloat(ALenum param)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  _DWORD *v10;
  float v11;
  const ALchar *String;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *ALAttributeString;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315650;
    v19 = "oalImp.cpp";
    v20 = 1024;
    v21 = 3567;
    v22 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetFloat ---> attribute = %s", (uint8_t *)&v18, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_38;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_15;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(_DWORD **)(v6 + 40);
    if (v10)
    {
      v13 = v10 + 110;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (v10)
  {
    if (param == 49152)
    {
      v11 = *((float *)v10 + 84);
    }
    else if (param == 49153)
    {
      v11 = *((float *)v10 + 85);
    }
    else
    {
      v11 = 0.0;
      if (param == 49155)
        v11 = *((float *)v10 + 83);
    }
    v15 = v10 + 110;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
  }
  else
  {
LABEL_38:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40964);
      v18 = 136315650;
      v19 = "oalImp.cpp";
      v20 = 1024;
      v21 = 3592;
      v22 = 2080;
      ALAttributeString = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetFloat FAILED = %s\n", (uint8_t *)&v18, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    v11 = 0.0;
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
  return v11;
}

void sub_215C42908(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetFloatv(ALenum param, ALfloat *data)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  ALfloat *v12;
  const ALchar *String;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *ALAttributeString;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315650;
    v19 = "oalImp.cpp";
    v20 = 1024;
    v21 = 3602;
    v22 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetFloatv ---> attribute = %s", (uint8_t *)&v18, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_39;
  v4 = gCurrentContext;
  v5 = gContextMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v7 = *(_QWORD **)(gOALContextMap + 8);
  if (!v7)
    goto LABEL_15;
  v8 = gOALContextMap + 8;
  do
  {
    v9 = v7[4];
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = v7;
    else
      v11 = v7 + 1;
    if (v10)
      v8 = (uint64_t)v7;
    v7 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
  {
    v12 = *(ALfloat **)(v8 + 40);
    if (v12)
    {
      v14 = (unsigned int *)(v12 + 110);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 + 1, v14));
    }
  }
  else
  {
LABEL_15:
    v12 = 0;
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  if (v12)
  {
    switch(param)
    {
      case 49152:
        *data = v12[84];
        break;
      case 49153:
        *data = v12[85];
        break;
      case 49155:
        *data = v12[83];
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey))
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        break;
    }
    v16 = (unsigned int *)(v12 + 110);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
  }
  else
  {
LABEL_39:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40964);
      v18 = 136315650;
      v19 = "oalImp.cpp";
      v20 = 1024;
      v21 = 3628;
      v22 = 2080;
      ALAttributeString = String;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetFloatv FAILED = %s\n", (uint8_t *)&v18, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_215C42BCC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

ALdouble alGetDouble(ALenum param)
{
  const char *v2;
  double v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  uint64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          v2 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          v2 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          v2 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          v2 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            v2 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101)
              goto LABEL_17;
            v2 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        v2 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (param == 4100)
      {
        v2 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!param)
      {
        v2 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (param == 784)
      {
        v2 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        v11 = 136315650;
        v12 = "oalImp.cpp";
        v13 = 1024;
        v14 = 3636;
        v15 = 2080;
        v16 = v2;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetDouble ---> attribute = %s", (uint8_t *)&v11, 0x1Cu);
        goto LABEL_23;
      }
    }
LABEL_17:
    v2 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  if (param == 61443)
  {
    v3 = *(double *)&gUsersMixerOutputRate;
    if (*(double *)&gUsersMixerOutputRate <= 0.0)
    {
      v3 = 0.0;
      if (gOALDeviceMap)
      {
        v4 = *(_QWORD **)(gOALDeviceMap + 8);
        if (v4)
        {
          v5 = gOALDeviceMap + 8;
          do
          {
            v6 = v4[4];
            v7 = v6 >= gCurrentDevice;
            if (v6 >= gCurrentDevice)
              v8 = v4;
            else
              v8 = v4 + 1;
            if (v7)
              v5 = (uint64_t)v4;
            v4 = (_QWORD *)*v8;
          }
          while (*v8);
          if (v5 != gOALDeviceMap + 8 && *(_QWORD *)(v5 + 32) <= (unint64_t)gCurrentDevice)
          {
            v9 = *(_QWORD *)(v5 + 40);
            if (v9)
              return *(double *)(v9 + 56);
          }
        }
      }
    }
  }
  else
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    v3 = 0.0;
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
  return v3;
}

void alGetDoublev(ALenum param, ALdouble *data)
{
  const char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          v4 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          v4 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          v4 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          v4 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            v4 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101)
              goto LABEL_17;
            v4 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        v4 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (param == 4100)
      {
        v4 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!param)
      {
        v4 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (param == 784)
      {
        v4 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        v12 = 136315650;
        v13 = "oalImp.cpp";
        v14 = 1024;
        v15 = 3657;
        v16 = 2080;
        v17 = v4;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetDoublev ---> attribute = %s", (uint8_t *)&v12, 0x1Cu);
        goto LABEL_23;
      }
    }
LABEL_17:
    v4 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  if (param == 61443)
  {
    v5 = gUsersMixerOutputRate;
    if (*(double *)&gUsersMixerOutputRate <= 0.0)
    {
      v5 = 0;
      if (gOALDeviceMap)
      {
        v6 = *(_QWORD **)(gOALDeviceMap + 8);
        if (v6)
        {
          v7 = gOALDeviceMap + 8;
          do
          {
            v8 = v6[4];
            v9 = v8 >= gCurrentDevice;
            if (v8 >= gCurrentDevice)
              v10 = v6;
            else
              v10 = v6 + 1;
            if (v9)
              v7 = (uint64_t)v6;
            v6 = (_QWORD *)*v10;
          }
          while (*v10);
          if (v7 != gOALDeviceMap + 8 && *(_QWORD *)(v7 + 32) <= (unint64_t)gCurrentDevice)
          {
            v11 = *(_QWORD *)(v7 + 40);
            if (v11)
              v5 = *(_QWORD *)(v11 + 56);
          }
        }
      }
    }
    *(_QWORD *)data = v5;
  }
  else
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

ALint alGetInteger(ALenum param)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  ALint *v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  _QWORD *v19;
  uint64_t v20;
  ALint result;
  unsigned int *v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  BOOL v30;
  _QWORD *v31;
  const ALchar *String;
  unint64_t v33;
  uint64_t v34;
  int v35;
  _QWORD *v36;
  uint64_t v37;
  unint64_t v38;
  BOOL v39;
  _QWORD *v40;
  unsigned int *v41;
  unsigned int v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int *v45;
  unsigned int v46;
  unsigned int *v47;
  unsigned int v48;
  unsigned int *v49;
  unsigned int v50;
  int v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const ALchar *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v51 = 136315650;
    v52 = "oalImp.cpp";
    v53 = 1024;
    v54 = 3674;
    v55 = 1024;
    LODWORD(v56) = param;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetInteger ---> attribute = 0x%X", (uint8_t *)&v51, 0x18u);
  }
  if (param <= 61443)
  {
    if (param == 53248)
    {
      if (gOALContextMap)
      {
        v24 = gCurrentContext;
        v25 = gContextMapLock;
        v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
        v27 = *(_QWORD **)(gOALContextMap + 8);
        if (!v27)
          goto LABEL_56;
        v28 = gOALContextMap + 8;
        do
        {
          v29 = v27[4];
          v30 = v29 >= v24;
          if (v29 >= v24)
            v31 = v27;
          else
            v31 = v27 + 1;
          if (v30)
            v28 = (uint64_t)v27;
          v27 = (_QWORD *)*v31;
        }
        while (*v31);
        if (v28 != gOALContextMap + 8 && *(_QWORD *)(v28 + 32) <= v24)
        {
          v10 = *(_QWORD *)(v28 + 40);
          if (v10)
          {
            v47 = (unsigned int *)(v10 + 440);
            do
              v48 = __ldaxr(v47);
            while (__stlxr(v48 + 1, v47));
          }
        }
        else
        {
LABEL_56:
          v10 = 0;
        }
        if (v26)
          (*(void (**)(uint64_t))(*(_QWORD *)v25 + 24))(v25);
        if (v10)
        {
          v11 = (ALint *)(v10 + 328);
LABEL_80:
          result = *v11;
          v41 = (unsigned int *)(v10 + 440);
          do
            v42 = __ldaxr(v41);
          while (__stlxr(v42 - 1, v41));
          return result;
        }
      }
      goto LABEL_61;
    }
    if (param == 61442)
    {
      if (gOALContextMap)
      {
        v2 = gCurrentContext;
        v3 = gContextMapLock;
        v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
        v5 = *(_QWORD **)(gOALContextMap + 8);
        if (!v5)
          goto LABEL_18;
        v6 = gOALContextMap + 8;
        do
        {
          v7 = v5[4];
          v8 = v7 >= v2;
          if (v7 >= v2)
            v9 = v5;
          else
            v9 = v5 + 1;
          if (v8)
            v6 = (uint64_t)v5;
          v5 = (_QWORD *)*v9;
        }
        while (*v9);
        if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
        {
          v10 = *(_QWORD *)(v6 + 40);
          if (v10)
          {
            v43 = (unsigned int *)(v10 + 440);
            do
              v44 = __ldaxr(v43);
            while (__stlxr(v44 + 1, v43));
          }
        }
        else
        {
LABEL_18:
          v10 = 0;
        }
        if (v4)
          (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
        if (v10)
        {
          v11 = (ALint *)(v10 + 424);
          goto LABEL_80;
        }
      }
      goto LABEL_61;
    }
LABEL_83:
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey))
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    return 0;
  }
  if (param == 61444)
  {
    if (!gOALContextMap)
      return gMaximumMixerBusCount;
    v33 = gCurrentContext;
    v34 = gContextMapLock;
    v35 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v36 = *(_QWORD **)(gOALContextMap + 8);
    if (!v36)
      goto LABEL_75;
    v37 = gOALContextMap + 8;
    do
    {
      v38 = v36[4];
      v39 = v38 >= v33;
      if (v38 >= v33)
        v40 = v36;
      else
        v40 = v36 + 1;
      if (v39)
        v37 = (uint64_t)v36;
      v36 = (_QWORD *)*v40;
    }
    while (*v40);
    if (v37 != gOALContextMap + 8 && *(_QWORD *)(v37 + 32) <= v33)
    {
      v10 = *(_QWORD *)(v37 + 40);
      if (v10)
      {
        v49 = (unsigned int *)(v10 + 440);
        do
          v50 = __ldaxr(v49);
        while (__stlxr(v50 + 1, v49));
      }
    }
    else
    {
LABEL_75:
      v10 = 0;
    }
    if (v35)
      (*(void (**)(uint64_t))(*(_QWORD *)v34 + 24))(v34);
    if (!v10)
      return gMaximumMixerBusCount;
    v11 = (ALint *)(v10 + 432);
    goto LABEL_80;
  }
  if (param != 61445)
    goto LABEL_83;
  if (!gOALDeviceMap)
    goto LABEL_61;
  v12 = gCurrentDevice;
  v13 = gDeviceMapLock;
  v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
  v15 = *(_QWORD **)(gOALDeviceMap + 8);
  if (!v15)
    goto LABEL_37;
  v16 = gOALDeviceMap + 8;
  do
  {
    v17 = v15[4];
    v18 = v17 >= v12;
    if (v17 >= v12)
      v19 = v15;
    else
      v19 = v15 + 1;
    if (v18)
      v16 = (uint64_t)v15;
    v15 = (_QWORD *)*v19;
  }
  while (*v19);
  if (v16 != gOALDeviceMap + 8 && *(_QWORD *)(v16 + 32) <= v12)
  {
    v20 = *(_QWORD *)(v16 + 40);
    if (v20)
    {
      v45 = (unsigned int *)(v20 + 76);
      do
        v46 = __ldaxr(v45);
      while (__stlxr(v46 + 1, v45));
    }
  }
  else
  {
LABEL_37:
    v20 = 0;
  }
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
  if (!v20)
  {
LABEL_61:
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    String = alGetString(40964);
    v51 = 136315650;
    v52 = "oalImp.cpp";
    v53 = 1024;
    v54 = 3719;
    v55 = 2080;
    v56 = String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetInteger FAILED = %s\n", (uint8_t *)&v51, 0x1Cu);
    return 0;
  }
  result = *(_DWORD *)(v20 + 68);
  v22 = (unsigned int *)(v20 + 76);
  do
    v23 = __ldaxr(v22);
  while (__stlxr(v23 - 1, v22));
  return result;
}

void sub_215C43580(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alGetIntegerv(ALenum param, ALint *data)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  _QWORD *v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  _QWORD *v32;
  const ALchar *String;
  unint64_t v34;
  uint64_t v35;
  int v36;
  _QWORD *v37;
  uint64_t v38;
  unint64_t v39;
  BOOL v40;
  _QWORD *v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int *v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int *v50;
  unsigned int v51;
  int v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  const ALchar *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v52 = 136315650;
    v53 = "oalImp.cpp";
    v54 = 1024;
    v55 = 3728;
    v56 = 1024;
    LODWORD(v57) = param;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetIntegerv ---> attribute = 0x%X", (uint8_t *)&v52, 0x18u);
  }
  if (param > 61443)
  {
    if (param == 61444)
    {
      if (!gOALContextMap)
        goto LABEL_83;
      v34 = gCurrentContext;
      v35 = gContextMapLock;
      v36 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
      v37 = *(_QWORD **)(gOALContextMap + 8);
      if (!v37)
        goto LABEL_76;
      v38 = gOALContextMap + 8;
      do
      {
        v39 = v37[4];
        v40 = v39 >= v34;
        if (v39 >= v34)
          v41 = v37;
        else
          v41 = v37 + 1;
        if (v40)
          v38 = (uint64_t)v37;
        v37 = (_QWORD *)*v41;
      }
      while (*v41);
      if (v38 != gOALContextMap + 8 && *(_QWORD *)(v38 + 32) <= v34)
      {
        v12 = *(_QWORD *)(v38 + 40);
        if (v12)
        {
          v50 = (unsigned int *)(v12 + 440);
          do
            v51 = __ldaxr(v50);
          while (__stlxr(v51 + 1, v50));
        }
      }
      else
      {
LABEL_76:
        v12 = 0;
      }
      if (v36)
        (*(void (**)(uint64_t))(*(_QWORD *)v35 + 24))(v35);
      if (!v12)
      {
LABEL_83:
        *data = gMaximumMixerBusCount;
        return;
      }
      v13 = v12 + 432;
      goto LABEL_85;
    }
    if (param != 61445)
    {
LABEL_81:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
      return;
    }
    if (gOALDeviceMap)
    {
      v14 = gCurrentDevice;
      v15 = gDeviceMapLock;
      v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
      v17 = *(_QWORD **)(gOALDeviceMap + 8);
      if (!v17)
        goto LABEL_36;
      v18 = gOALDeviceMap + 8;
      do
      {
        v19 = v17[4];
        v20 = v19 >= v14;
        if (v19 >= v14)
          v21 = v17;
        else
          v21 = v17 + 1;
        if (v20)
          v18 = (uint64_t)v17;
        v17 = (_QWORD *)*v21;
      }
      while (*v21);
      if (v18 != gOALDeviceMap + 8 && *(_QWORD *)(v18 + 32) <= v14)
      {
        v22 = *(_QWORD *)(v18 + 40);
        if (v22)
        {
          v46 = (unsigned int *)(v22 + 76);
          do
            v47 = __ldaxr(v46);
          while (__stlxr(v47 + 1, v46));
        }
      }
      else
      {
LABEL_36:
        v22 = 0;
      }
      if (v16)
        (*(void (**)(uint64_t))(*(_QWORD *)v15 + 24))(v15);
      if (v22)
      {
        *data = *(_DWORD *)(v22 + 68);
        v23 = (unsigned int *)(v22 + 76);
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        return;
      }
    }
  }
  else
  {
    if (param != 53248)
    {
      if (param == 61442)
      {
        if (gOALContextMap)
        {
          v4 = gCurrentContext;
          v5 = gContextMapLock;
          v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
          v7 = *(_QWORD **)(gOALContextMap + 8);
          if (!v7)
            goto LABEL_18;
          v8 = gOALContextMap + 8;
          do
          {
            v9 = v7[4];
            v10 = v9 >= v4;
            if (v9 >= v4)
              v11 = v7;
            else
              v11 = v7 + 1;
            if (v10)
              v8 = (uint64_t)v7;
            v7 = (_QWORD *)*v11;
          }
          while (*v11);
          if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
          {
            v12 = *(_QWORD *)(v8 + 40);
            if (v12)
            {
              v44 = (unsigned int *)(v12 + 440);
              do
                v45 = __ldaxr(v44);
              while (__stlxr(v45 + 1, v44));
            }
          }
          else
          {
LABEL_18:
            v12 = 0;
          }
          if (v6)
            (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
          v13 = v12 + 424;
        }
        else
        {
          v12 = 0;
          v13 = 424;
        }
        goto LABEL_85;
      }
      goto LABEL_81;
    }
    if (gOALContextMap)
    {
      v25 = gCurrentContext;
      v26 = gContextMapLock;
      v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
      v28 = *(_QWORD **)(gOALContextMap + 8);
      if (!v28)
        goto LABEL_55;
      v29 = gOALContextMap + 8;
      do
      {
        v30 = v28[4];
        v31 = v30 >= v25;
        if (v30 >= v25)
          v32 = v28;
        else
          v32 = v28 + 1;
        if (v31)
          v29 = (uint64_t)v28;
        v28 = (_QWORD *)*v32;
      }
      while (*v32);
      if (v29 != gOALContextMap + 8 && *(_QWORD *)(v29 + 32) <= v25)
      {
        v12 = *(_QWORD *)(v29 + 40);
        if (v12)
        {
          v48 = (unsigned int *)(v12 + 440);
          do
            v49 = __ldaxr(v48);
          while (__stlxr(v49 + 1, v48));
        }
      }
      else
      {
LABEL_55:
        v12 = 0;
      }
      if (v27)
        (*(void (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
      if (v12)
      {
        v13 = v12 + 328;
LABEL_85:
        *data = *(_DWORD *)v13;
        v42 = (unsigned int *)(v12 + 440);
        do
          v43 = __ldaxr(v42);
        while (__stlxr(v43 - 1, v42));
        return;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    String = alGetString(40964);
    v52 = 136315650;
    v53 = "oalImp.cpp";
    v54 = 1024;
    v55 = 3770;
    v56 = 2080;
    v57 = String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetIntegerv FAILED = %s\n", (uint8_t *)&v52, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA004);
}

void sub_215C43AA0(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

ALBOOLean alIsExtensionPresent(const ALchar *extname)
{
  size_t v2;
  char *v3;
  size_t v4;
  unsigned int v5;
  char *v6;
  ALBOOLean v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const ALchar *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "oalImp.cpp";
    v11 = 1024;
    v12 = 3933;
    v13 = 2080;
    v14 = extname;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alIsExtensionPresent function name = %s", (uint8_t *)&v9, 0x1Cu);
  }
  if (extname)
  {
    v2 = strlen(extname);
    v3 = (char *)malloc_type_calloc(1uLL, v2 + 1, 0x100004077774924uLL);
    if (*extname)
    {
      v4 = 0;
      v5 = 1;
      do
      {
        v3[v4] = __toupper(extname[v4]);
        v4 = v5++;
      }
      while (strlen(extname) > v4);
    }
    v6 = (char *)alExtensions;
    if (!alExtensions)
    {
      v6 = (char *)malloc_type_malloc(0x8CuLL, 0x1C4BE439uLL);
      alExtensions = (uint64_t)v6;
      strcpy(v6, "AL_EXT_OFFSET AL_EXT_LINEAR_DISTANCE AL_EXT_EXPONENT_DISTANCE AL_EXT_STATIC_BUFFER AL_EXT_SOURCE_NOTIFICATIONS AL_EXT_SOURCE_SPATIALIZATION");
    }
    v7 = strstr(v6, v3) != 0;
    free(v3);
  }
  else
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    return 0;
  }
  return v7;
}

void alDisable(ALenum capability)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  ALenum v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315650;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 3957;
    v6 = 1024;
    v7 = capability;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alDisable--> capability = 0x%X", (uint8_t *)&v2, 0x18u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA003);
}

void alEnable(ALenum capability)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  ALenum v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315650;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 3970;
    v6 = 1024;
    v7 = capability;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alEnable--> capability = 0x%X", (uint8_t *)&v2, 0x18u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)0xA003);
}

ALBOOLean alIsEnabled(ALenum capability)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  ALenum v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315650;
    v4 = "oalImp.cpp";
    v5 = 1024;
    v6 = 3983;
    v7 = 1024;
    v8 = capability;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alIsEnabled--> capability = 0x%X", (uint8_t *)&v3, 0x18u);
  }
  return 0;
}

void alcMacOSXRenderingQuality(signed int a1)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315650;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 3999;
    v6 = 2048;
    v7 = a1;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXRenderingQuality--> value = %ld", (uint8_t *)&v2, 0x1Cu);
  }
  alSetInteger(61442, a1);
}

void alMacOSXRenderChannelCount(signed int a1)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315650;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 4007;
    v6 = 2048;
    v7 = a1;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alOSXRenderChannelCount--> value = %ld", (uint8_t *)&v2, 0x1Cu);
  }
  alSetInteger(61445, a1);
}

void alcMacOSXMixerMaxiumumBusses(int a1)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315650;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 4015;
    v6 = 2048;
    v7 = a1;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXMixerMaxiumumBusses--> value = %ld", (uint8_t *)&v2, 0x1Cu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315394;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 4232;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alSetIntegeri", (uint8_t *)&v2, 0x12u);
  }
  gMaximumMixerBusCount = a1;
}

void alcMacOSXMixerOutputRate(double a1)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315650;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 4023;
    v6 = 2048;
    v7 = a1;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXMixerOutputRate--> value = %.f2", (uint8_t *)&v2, 0x1Cu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = 136315394;
    v3 = "oalImp.cpp";
    v4 = 1024;
    v5 = 4302;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alSetDouble", (uint8_t *)&v2, 0x12u);
  }
  gUsersMixerOutputRate = *(_QWORD *)&a1;
}

uint64_t alcMacOSXGetRenderingQuality()
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v1 = 136315394;
    v2 = "oalImp.cpp";
    v3 = 1024;
    v4 = 4031;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXGetRenderingQuality-->", (uint8_t *)&v1, 0x12u);
  }
  return alGetInteger(61442);
}

uint64_t alMacOSXGetRenderChannelCount()
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v1 = 136315394;
    v2 = "oalImp.cpp";
    v3 = 1024;
    v4 = 4039;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alOSXGetRenderChannelCount-->", (uint8_t *)&v1, 0x12u);
  }
  return alGetInteger(61445);
}

uint64_t alcMacOSXGetMixerMaxiumumBusses()
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v1 = 136315394;
    v2 = "oalImp.cpp";
    v3 = 1024;
    v4 = 4047;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXGetMixerMaxiumumBusses-->", (uint8_t *)&v1, 0x12u);
  }
  return alGetInteger(61444);
}

ALdouble alcMacOSXGetMixerOutputRate()
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v1 = 136315394;
    v2 = "oalImp.cpp";
    v3 = 1024;
    v4 = 4055;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcMacOSXGetMixerOutputRate-->", (uint8_t *)&v1, 0x12u);
  }
  return alGetDouble(61443);
}

uint64_t alBufferDataStatic(unsigned int a1, unsigned int a2, char *a3, int a4, signed int a5)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  uint64_t *v14;
  ALenum v15;
  uint64_t v16;
  uint64_t result;
  unsigned int *v18;
  unsigned int v19;
  const char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const ALchar *String;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!gOALBufferMap)
    goto LABEL_20;
  CleanUpDeadBufferList();
  v10 = *(_QWORD *)(gOALBufferMap + 8);
  if (!v10)
  {
    v15 = 40963;
    goto LABEL_23;
  }
  v11 = gOALBufferMap + 8;
  do
  {
    v12 = *(_DWORD *)(v10 + 32);
    v13 = v12 >= a1;
    if (v12 >= a1)
      v14 = (uint64_t *)v10;
    else
      v14 = (uint64_t *)(v10 + 8);
    if (v13)
      v11 = v10;
    v10 = *v14;
  }
  while (*v14);
  if (v11 == gOALBufferMap + 8)
  {
LABEL_20:
    v15 = 40963;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
LABEL_24:
      if (a2 - 4352 > 3)
        v20 = "UNKNOWN FORMAT";
      else
        v20 = off_24D4652B0[a2 - 4352];
      v21 = 136316674;
      v22 = "oalImp.cpp";
      v23 = 1024;
      v24 = 4081;
      v25 = 2048;
      v26 = (int)a1;
      v27 = 2080;
      v28 = v20;
      v29 = 2048;
      v30 = a4;
      v31 = 2048;
      v32 = a5;
      v33 = 2080;
      String = alGetString(v15);
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alBufferDataStatic FAILED: buffer %ld : %s : %ld bytes : %ldHz error = %s", (uint8_t *)&v21, 0x44u);
    }
LABEL_28:
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    result = (uint64_t)pthread_getspecific(gALErrorKey);
    if (!result)
      return pthread_setspecific(gALErrorKey, (const void *)v15);
    return result;
  }
  v15 = 40963;
  if (*(_DWORD *)(v11 + 32) > a1)
    goto LABEL_23;
  if (a4 < 1)
    goto LABEL_23;
  if (!a3)
    goto LABEL_23;
  v16 = *(_QWORD *)(v11 + 40);
  if (!v16)
    goto LABEL_23;
  result = OALBuffer::AddAudioDataStatic(*(OALBuffer **)(v11 + 40), a3, a4, a2, a5);
  v15 = result;
  v18 = (unsigned int *)(v16 + 280);
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  if ((_DWORD)result)
  {
LABEL_23:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_24;
    goto LABEL_28;
  }
  return result;
}

uint64_t alSourceSetRenderCallback(unsigned int a1, int (*a2)(unsigned int, int, char **, int *, void *), int a3, signed int a4, void *a5)
{
  unint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  OALContext *v18;
  OALSource *v19;
  OALSource *v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  unsigned int v26;
  const char *v27;
  const ALchar *String;
  unsigned int *v30;
  unsigned int v31;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const ALchar *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315394;
    v33 = "oalImp.cpp";
    v34 = 1024;
    v35 = 4203;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceSetRenderCallback-->", (uint8_t *)&v32, 0x12u);
  }
  if (!a2 || !gOALContextMap)
    goto LABEL_28;
  v10 = gCurrentContext;
  v11 = gContextMapLock;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v13 = *(_QWORD **)(gOALContextMap + 8);
  if (!v13)
    goto LABEL_16;
  v14 = gOALContextMap + 8;
  do
  {
    v15 = v13[4];
    v16 = v15 >= v10;
    if (v15 >= v10)
      v17 = v13;
    else
      v17 = v13 + 1;
    if (v16)
      v14 = (uint64_t)v13;
    v13 = (_QWORD *)*v17;
  }
  while (*v17);
  if (v14 != gOALContextMap + 8 && *(_QWORD *)(v14 + 32) <= v10)
  {
    v18 = *(OALContext **)(v14 + 40);
    if (v18)
    {
      v30 = (unsigned int *)((char *)v18 + 440);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 + 1, v30));
    }
  }
  else
  {
LABEL_16:
    v18 = 0;
  }
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
  if (!v18)
  {
    v24 = 40963;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    goto LABEL_29;
  }
  v19 = (OALSource *)OALContext::ProtectSource(v18, a1);
  v20 = v19;
  v21 = (unsigned int *)((char *)v18 + 440);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v19)
  {
LABEL_28:
    v24 = 40963;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    goto LABEL_29;
  }
  v23 = OALSource::SetRenderCallback(v19, a2, a3, a4, a5);
  v24 = v23;
  v25 = (unsigned int *)((char *)v20 + 72);
  do
    v26 = __ldaxr(v25);
  while (__stlxr(v26 - 1, v25));
  if (!(_DWORD)v23)
    goto LABEL_35;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
LABEL_29:
    if ((a3 - 4352) > 3)
      v27 = "UNKNOWN FORMAT";
    else
      v27 = off_24D4652B0[a3 - 4352];
    String = alGetString(v24);
    v32 = 136316418;
    v33 = "oalImp.cpp";
    v34 = 1024;
    v35 = 4218;
    v36 = 2048;
    v37 = a1;
    v38 = 2080;
    v39 = v27;
    v40 = 2048;
    v41 = a4;
    v42 = 2080;
    v43 = String;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceSetRenderCallback FAILED: source: %ld : %s : %ldHz error = %s", (uint8_t *)&v32, 0x3Au);
  }
LABEL_33:
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
    pthread_setspecific(gALErrorKey, (const void *)(int)v24);
LABEL_35:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315394;
    v33 = "oalImp.cpp";
    v34 = 1024;
    v35 = 4222;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d <--alSourceSetRenderCallback", (uint8_t *)&v32, 0x12u);
  }
  return v24;
}

void sub_215C44BA0(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t alSourceAddNotification(unsigned int a1, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  OALContext *v16;
  OALSource *v17;
  OALSource *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v25;
  unsigned int v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void (*v34)(unsigned int, unsigned int, void *);
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "oalImp.cpp";
    v29 = 1024;
    v30 = 4136;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceAddNotification-->", buf, 0x12u);
  }
  if (!a3)
    return 40963;
  if (!gOALContextMap)
    goto LABEL_25;
  v8 = gCurrentContext;
  v9 = gContextMapLock;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v11 = *(_QWORD **)(gOALContextMap + 8);
  if (!v11)
    goto LABEL_16;
  v12 = gOALContextMap + 8;
  do
  {
    v13 = v11[4];
    v14 = v13 >= v8;
    if (v13 >= v8)
      v15 = v11;
    else
      v15 = v11 + 1;
    if (v14)
      v12 = (uint64_t)v11;
    v11 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(_QWORD *)(v12 + 32) <= v8)
  {
    v16 = *(OALContext **)(v12 + 40);
    if (v16)
    {
      v25 = (unsigned int *)((char *)v16 + 440);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 + 1, v25));
    }
  }
  else
  {
LABEL_16:
    v16 = 0;
  }
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  if (!v16)
  {
LABEL_25:
    v18 = 0;
    v21 = 40963;
    goto LABEL_26;
  }
  v17 = (OALSource *)OALContext::ProtectSource(v16, a1);
  v18 = v17;
  v19 = (unsigned int *)((char *)v16 + 440);
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (!v17)
  {
    v21 = 40963;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
LABEL_28:
      if (!v18)
        return v21;
      goto LABEL_29;
    }
LABEL_27:
    *(_DWORD *)buf = 136316162;
    v28 = "oalImp.cpp";
    v29 = 1024;
    v30 = 4154;
    v31 = 2048;
    v32 = a1;
    v33 = 2048;
    v34 = a3;
    v35 = 2048;
    v36 = a4;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceAddNotification FAILED: source: %ld : proc: %p : userData: %p", buf, 0x30u);
    goto LABEL_28;
  }
  v21 = OALSource::AddNotification(v17, a2, a3, a4);
  if ((_DWORD)v21)
  {
LABEL_26:
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_29:
  v22 = (unsigned int *)((char *)v18 + 72);
  do
    v23 = __ldaxr(v22);
  while (__stlxr(v23 - 1, v22));
  return v21;
}

void sub_215C44E60(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_215C44E78(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 buf, __int128 a12)
{
  int *v13;
  int v14;
  const char *v15;
  char *v16;

  if (a2)
  {
    v13 = (int *)__cxa_begin_catch(a1);
    if (a2 == 2)
    {
      v14 = *v13;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          if (v14 > 40960)
          {
            switch(v14)
            {
              case 53249:
                v15 = "AL_INVERSE_DISTANCE";
                break;
              case 53250:
                v15 = "AL_INVERSE_DISTANCE_CLAMPED";
                break;
              case 53251:
                v15 = "AL_LINEAR_DISTANCE";
                break;
              case 53252:
                v15 = "AL_LINEAR_DISTANCE_CLAMPED";
                break;
              case 53253:
                v15 = "AL_EXPONENT_DISTANCE";
                break;
              case 53254:
                v15 = "AL_EXPONENT_DISTANCE_CLAMPED";
                break;
              default:
                if (v14 != 40961)
                  goto LABEL_16;
                v15 = "AL_INVALID_NAME";
                break;
            }
          }
          else
          {
            switch(v14)
            {
              case 4097:
                v15 = "AL_CONE_INNER_ANGLE";
                break;
              case 4098:
                v15 = "AL_CONE_OUTER_ANGLE";
                break;
              case 4099:
                v15 = "AL_PITCH";
                break;
              case 4100:
                v15 = "AL_POSITION";
                break;
              case 4101:
                v15 = "AL_DIRECTION";
                break;
              case 4102:
                v15 = "AL_VELOCITY";
                break;
              case 4103:
                v15 = "AL_LOOPING";
                break;
              case 4104:
              case 4107:
              case 4108:
              case 4113:
              case 4114:
              case 4115:
              case 4116:
              case 4119:
              case 4120:
              case 4121:
              case 4122:
              case 4123:
              case 4124:
              case 4125:
              case 4126:
              case 4127:
                goto LABEL_16;
              case 4105:
                v15 = "AL_BUFFER";
                break;
              case 4106:
                v15 = "AL_GAIN";
                break;
              case 4109:
                v15 = "AL_MIN_GAIN";
                break;
              case 4110:
                v15 = "AL_MAX_GAIN";
                break;
              case 4111:
                v15 = "AL_ORIENTATION";
                break;
              case 4112:
                v15 = "AL_SOURCE_STATE";
                break;
              case 4117:
                v15 = "AL_BUFFERS_QUEUED";
                break;
              case 4118:
                v15 = "AL_BUFFERS_PROCESSED";
                break;
              case 4128:
                v15 = "AL_REFERENCE_DISTANCE";
                break;
              case 4129:
                v15 = "AL_ROLLOFF_FACTOR";
                break;
              case 4130:
                v15 = "AL_CONE_OUTER_GAIN";
                break;
              case 4131:
                v15 = "AL_MAX_DISTANCE";
                break;
              case 4132:
                v15 = "AL_SEC_OFFSET";
                break;
              case 4133:
                v15 = "AL_SAMPLE_OFFSET";
                break;
              case 4134:
                v15 = "AL_BYTE_OFFSET";
                break;
              case 4135:
                v15 = "AL_SOURCE_TYPE";
                break;
              default:
                if (v14)
                {
                  if (v14 == 514)
                    v15 = "AL_SOURCE_RELATIVE";
                  else
LABEL_16:
                    v15 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
                }
                else
                {
                  v15 = "AL_NONE";
                }
                break;
            }
          }
          LODWORD(buf) = 136315650;
          *(_QWORD *)((char *)&buf + 4) = "oalImp.cpp";
          WORD6(buf) = 1024;
          *(_DWORD *)((char *)&buf + 14) = 3397;
          WORD1(a12) = 2080;
          *(_QWORD *)((char *)&a12 + 4) = v15;
          _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetString = %s", (uint8_t *)&buf, 0x1Cu);
        }
        if (v14 > 45056)
        {
          v16 = "Apple Inc.";
          switch(v14)
          {
            case 45057:
              goto LABEL_65;
            case 45058:
              v16 = "1.1";
              goto LABEL_65;
            case 45059:
              v16 = "Software";
              goto LABEL_65;
            case 45060:
              v16 = (char *)alExtensions;
              if (!alExtensions)
              {
                v16 = (char *)malloc_type_malloc(0x8CuLL, 0x1C4BE439uLL);
                alExtensions = (uint64_t)v16;
                strcpy(v16, "AL_EXT_OFFSET AL_EXT_LINEAR_DISTANCE AL_EXT_EXPONENT_DISTANCE AL_EXT_STATIC_BUFFER AL_EXT_SOURCE_NOTIFICATIONS AL_EXT_SOURCE_SPATIALIZATION");
              }
              goto LABEL_65;
            default:
              goto LABEL_62;
          }
        }
        switch(v14)
        {
          case 40961:
            v16 = "Invalid Name";
            goto LABEL_65;
          case 40962:
            v16 = "Invalid Enum";
            goto LABEL_65;
          case 40963:
            v16 = "Invalid Value";
            goto LABEL_65;
          case 40964:
            v16 = "Invalid Operation";
            goto LABEL_65;
          case 40965:
            v16 = "Out of Memory";
            goto LABEL_65;
          default:
            if (v14 == -1)
            {
              v16 = "Unknown Internal Error";
            }
            else if (v14)
            {
LABEL_62:
              pthread_once(&gErrorOnce, ErrorKeyInitializer);
              if (!pthread_getspecific(gALErrorKey))
                pthread_setspecific(gALErrorKey, (const void *)0xA002);
              v16 = 0;
            }
            else
            {
              v16 = "No Error";
            }
LABEL_65:
            LODWORD(a9) = 136315650;
            *(_QWORD *)((char *)&a9 + 4) = "oalImp.cpp";
            WORD6(a9) = 1024;
            *(_DWORD *)((char *)&a9 + 14) = 4158;
            WORD1(a10) = 2080;
            *(_QWORD *)((char *)&a10 + 4) = v16;
            _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceAddNotification FAILED = %s\n", (uint8_t *)&a9, 0x1Cu);
            break;
        }
      }
      __cxa_end_catch();
    }
    else
    {
      alSourceAddNotification_cold_1();
    }
    JUMPOUT(0x215C44DB4);
  }
  JUMPOUT(0x215C44E68);
}

void sub_215C452DC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void alSourceRemoveNotification(unsigned int a1, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  OALContext *v16;
  _QWORD *v17;
  _QWORD *v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v25 = 136315394;
    v26 = "oalImp.cpp";
    v27 = 1024;
    v28 = 4173;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceRemoveNotification-->", (uint8_t *)&v25, 0x12u);
  }
  if (a3 && gOALContextMap)
  {
    v8 = gCurrentContext;
    v9 = gContextMapLock;
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v11 = *(_QWORD **)(gOALContextMap + 8);
    if (!v11)
      goto LABEL_16;
    v12 = gOALContextMap + 8;
    do
    {
      v13 = v11[4];
      v14 = v13 >= v8;
      if (v13 >= v8)
        v15 = v11;
      else
        v15 = v11 + 1;
      if (v14)
        v12 = (uint64_t)v11;
      v11 = (_QWORD *)*v15;
    }
    while (*v15);
    if (v12 != gOALContextMap + 8 && *(_QWORD *)(v12 + 32) <= v8)
    {
      v16 = *(OALContext **)(v12 + 40);
      if (v16)
      {
        v23 = (unsigned int *)((char *)v16 + 440);
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 + 1, v23));
      }
    }
    else
    {
LABEL_16:
      v16 = 0;
    }
    if (v10)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
    if (v16)
    {
      v17 = (_QWORD *)OALContext::ProtectSource(v16, a1);
      v18 = v17;
      v19 = (unsigned int *)((char *)v16 + 440);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (v17)
      {
        OALSource::RemoveNotification(v17, a2, a3, a4);
        v21 = (unsigned int *)(v18 + 9);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
      }
    }
  }
}

void sub_215C454CC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_215C454E4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, __int128 a10)
{
  uint64_t v10;
  ALenum *v12;
  _BOOL4 v13;
  const ALchar *String;

  if (a2)
  {
    v12 = (ALenum *)__cxa_begin_catch(a1);
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (a2 == 2)
    {
      if (v13)
      {
        String = alGetString(*v12);
        LODWORD(a9) = 136315650;
        *(_QWORD *)((char *)&a9 + 4) = "oalImp.cpp";
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 4186;
        WORD1(a10) = 2080;
        *(_QWORD *)((char *)&a10 + 4) = String;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceRemoveNotification FAILED = %s\n", (uint8_t *)&a9, 0x1Cu);
      }
      __cxa_end_catch();
    }
    else
    {
      alSourceRemoveNotification_cold_1(v13);
    }
    if (!v10)
      JUMPOUT(0x215C45474);
    JUMPOUT(0x215C45460);
  }
  JUMPOUT(0x215C454D4);
}

void sub_215C45590(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t alcASASetListener(int a1, AudioUnitParameterValue *a2, unsigned int a3)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  uint64_t result;
  float v16;
  float v18;
  float v20;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  _DWORD *v26;
  _DWORD *exception;
  _DWORD *v28;
  _DWORD *v29;

  if (!a2)
    return 40963;
  if (gOALContextMap)
  {
    v6 = gCurrentContext;
    v7 = gContextMapLock;
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v9 = *(_QWORD **)(gOALContextMap + 8);
    if (!v9)
      goto LABEL_14;
    v10 = gOALContextMap + 8;
    do
    {
      v11 = v9[4];
      v12 = v11 >= v6;
      if (v11 >= v6)
        v13 = v9;
      else
        v13 = v9 + 1;
      if (v12)
        v10 = (uint64_t)v9;
      v9 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
    {
      v14 = *(OALContext **)(v10 + 40);
      if (v14)
      {
        v24 = (unsigned int *)((char *)v14 + 440);
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 + 1, v24));
      }
    }
    else
    {
LABEL_14:
      v14 = 0;
    }
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    result = 40961;
    if (a1 <= 1920362347)
    {
LABEL_18:
      switch(a1)
      {
        case 1920361826:
          v18 = *a2;
          if (*a2 < 0.5 || v18 > 4.0)
          {
            exception = __cxa_allocate_exception(4uLL);
            *exception = 40963;
            __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
          }
          OALContext::SetReverbEQBandwidth((uint64_t)v14, v18);
          break;
        case 1920361830:
          v20 = *a2;
          if (*a2 < 10.0 || v20 > 20000.0)
          {
            v29 = __cxa_allocate_exception(4uLL);
            *v29 = 40963;
            __cxa_throw(v29, MEMORY[0x24BEDB798], 0);
          }
          OALContext::SetReverbEQFrequency((uint64_t)v14, v20);
          break;
        case 1920361831:
          v16 = *a2;
          if (*a2 < -18.0 || v16 > 18.0)
          {
            v28 = __cxa_allocate_exception(4uLL);
            *v28 = 40963;
            __cxa_throw(v28, MEMORY[0x24BEDB798], 0);
          }
          OALContext::SetReverbEQGain((uint64_t)v14, v16);
          break;
        default:
          goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else
  {
    v14 = 0;
    result = 40961;
    if (a1 <= 1920362347)
      goto LABEL_18;
  }
  if (a1 == 1920362348)
  {
    if (a3 > 3)
    {
      OALContext::SetReverbLevel((uint64_t)v14, *a2);
      goto LABEL_50;
    }
LABEL_59:
    v26 = __cxa_allocate_exception(4uLL);
    *v26 = 40964;
    __cxa_throw(v26, MEMORY[0x24BEDB798], 0);
  }
  if (a1 == 1920364398)
  {
    if (a3 >= 4)
    {
      OALContext::SetReverbState(v14, *(_DWORD *)a2);
      goto LABEL_50;
    }
    goto LABEL_59;
  }
  if (a1 != 1920365172)
    goto LABEL_51;
  if (a3 < 4)
    goto LABEL_59;
  OALContext::SetReverbRoomType((uint64_t)v14, *(_DWORD *)a2);
LABEL_50:
  result = 0;
LABEL_51:
  if (v14)
  {
    v22 = (unsigned int *)((char *)v14 + 440);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
  }
  return result;
}

void sub_215C458B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, __int128 a10)
{
  int v10;
  ALenum *v12;
  ALenum v13;
  const ALchar *String;
  const char *ALCAttributeString;
  const ALchar *v16;
  const char *v17;

  if (a2)
  {
    v12 = (ALenum *)__cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      v13 = *v12;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        String = alGetString(v13);
        ALCAttributeString = GetALCAttributeString(v10);
        LODWORD(a9) = 136315906;
        *(_QWORD *)((char *)&a9 + 4) = "oalImp.cpp";
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 4884;
        WORD1(a10) = 2080;
        *(_QWORD *)((char *)&a10 + 4) = ALCAttributeString;
        WORD6(a10) = 2080;
        *(_QWORD *)((char *)&a10 + 14) = String;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR ASAGetListener FAILED--> property %s : error = %s", (uint8_t *)&a9, 0x26u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v16 = alGetString(-1);
      v17 = GetALCAttributeString(v10);
      LODWORD(a9) = 136315906;
      *(_QWORD *)((char *)&a9 + 4) = "oalImp.cpp";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 4888;
      WORD1(a10) = 2080;
      *(_QWORD *)((char *)&a10 + 4) = v17;
      WORD6(a10) = 2080;
      *(_QWORD *)((char *)&a10 + 14) = v16;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR ASAGetListener FAILED--> property %s : error = %s", (uint8_t *)&a9, 0x26u);
    }
    __cxa_end_catch();
    JUMPOUT(0x215C457B8);
  }
  _Unwind_Resume(exception_object);
}

void sub_215C45A34()
{
  __cxa_end_catch();
  JUMPOUT(0x215C458DCLL);
}

void sub_215C45A40(uint64_t a1, int a2)
{
  if (a2)
    JUMPOUT(0x215C45A48);
  JUMPOUT(0x215C458DCLL);
}

void sub_215C45A50(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t alcASAGetListener(int a1, float *a2, _DWORD *a3)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  _DWORD *v14;
  uint64_t result;
  float ReverbEQBandwidth;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  _DWORD *exception;

  if (gOALContextMap)
  {
    v6 = gCurrentContext;
    v7 = gContextMapLock;
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
    v9 = *(_QWORD **)(gOALContextMap + 8);
    if (!v9)
      goto LABEL_13;
    v10 = gOALContextMap + 8;
    do
    {
      v11 = v9[4];
      v12 = v11 >= v6;
      if (v11 >= v6)
        v13 = v9;
      else
        v13 = v9 + 1;
      if (v12)
        v10 = (uint64_t)v9;
      v9 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
    {
      v14 = *(_DWORD **)(v10 + 40);
      if (v14)
      {
        v19 = v14 + 110;
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 + 1, v19));
      }
    }
    else
    {
LABEL_13:
      v14 = 0;
    }
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    result = 40961;
    if (a1 <= 1920362347)
    {
LABEL_17:
      switch(a1)
      {
        case 1920361826:
          if (*a3 >= 4u)
          {
            *a3 = 4;
            ReverbEQBandwidth = OALContext::GetReverbEQBandwidth((OALContext *)v14);
            goto LABEL_33;
          }
          break;
        case 1920361830:
          if (*a3 > 3u)
          {
            *a3 = 4;
            ReverbEQBandwidth = OALContext::GetReverbEQFrequency((OALContext *)v14);
            goto LABEL_33;
          }
          break;
        case 1920361831:
          if (*a3 >= 4u)
          {
            *a3 = 4;
            ReverbEQBandwidth = OALContext::GetReverbEQGain((OALContext *)v14);
LABEL_33:
            result = 0;
            *a2 = ReverbEQBandwidth;
            goto LABEL_34;
          }
          break;
        default:
          goto LABEL_34;
      }
      goto LABEL_47;
    }
  }
  else
  {
    v14 = 0;
    result = 40961;
    if (a1 <= 1920362347)
      goto LABEL_17;
  }
  if (a1 == 1920362348)
  {
    if (*a3 < 4u)
      goto LABEL_47;
    result = 0;
    *a3 = 4;
    *a2 = *((float *)v14 + 125);
  }
  else
  {
    if (a1 == 1920364398)
    {
      if (*a3 < 4u)
        goto LABEL_47;
      *a3 = 4;
      *a2 = *((float *)v14 + 123);
    }
    else if (a1 != 1920365172)
    {
LABEL_34:
      if (!v14)
        return result;
      goto LABEL_40;
    }
    if (*a3 < 4u)
    {
LABEL_47:
      exception = __cxa_allocate_exception(4uLL);
      *exception = 40964;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
    result = 0;
    *a3 = 4;
    *a2 = *((float *)v14 + 124);
  }
LABEL_40:
  v17 = v14 + 110;
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  return result;
}

void sub_215C45D10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10, __int16 a11, int a12, __int16 a13, uint64_t a14, __int16 a15, uint64_t a16)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_215C45E8C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t alcASASetSource(int a1, unsigned int a2, AudioUnitParameterValue *a3, unsigned int a4)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  OALContext *v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  OALSource *v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v25;
  unsigned int v26;
  _DWORD *exception;

  if (!gOALContextMap)
    goto LABEL_22;
  v8 = gCurrentContext;
  v9 = gContextMapLock;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v11 = *(_QWORD **)(gOALContextMap + 8);
  if (!v11)
    goto LABEL_13;
  v12 = gOALContextMap + 8;
  do
  {
    v13 = v11[4];
    v14 = v13 >= v8;
    if (v13 >= v8)
      v15 = v11;
    else
      v15 = v11 + 1;
    if (v14)
      v12 = (uint64_t)v11;
    v11 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(_QWORD *)(v12 + 32) <= v8)
  {
    v16 = *(OALContext **)(v12 + 40);
    if (v16)
    {
      v25 = (unsigned int *)((char *)v16 + 440);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 + 1, v25));
    }
  }
  else
  {
LABEL_13:
    v16 = 0;
  }
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  if (v16)
  {
    v17 = OALContext::ProtectSource(v16, a2);
    v18 = (unsigned int *)((char *)v16 + 440);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    v20 = (OALSource *)v17;
    if (a1 == 1868723060)
    {
LABEL_20:
      if (a4 > 3)
      {
        OALSource::SetObstruction(v20, *a3);
LABEL_29:
        v21 = 0;
        goto LABEL_31;
      }
      goto LABEL_39;
    }
  }
  else
  {
LABEL_22:
    v20 = 0;
    if (a1 == 1868723060)
      goto LABEL_20;
  }
  if (a1 == 1868784492)
  {
    if (a4 >= 4)
    {
      OALSource::SetOcclusion((uint64_t)v20, *a3);
      goto LABEL_29;
    }
    goto LABEL_39;
  }
  if (a1 == 1920365420)
  {
    if (a4 >= 4)
    {
      OALSource::SetReverbSendLevel(v20, *a3);
      goto LABEL_29;
    }
LABEL_39:
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40964;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  v21 = 40961;
LABEL_31:
  if (v20)
  {
    v22 = (unsigned int *)((char *)v20 + 72);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
  }
  return v21;
}

void sub_215C460BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10, __int16 a11, int a12, __int16 a13, uint64_t a14, __int16 a15, uint64_t a16, __int16 a17, uint64_t a18)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_215C46254(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t alcASAGetSource(int a1, unsigned int a2, _DWORD *a3, _DWORD *a4)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  OALContext *v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  _DWORD *v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int *v26;
  unsigned int v27;
  _DWORD *exception;

  if (!gOALContextMap)
    goto LABEL_22;
  v8 = gCurrentContext;
  v9 = gContextMapLock;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v11 = *(_QWORD **)(gOALContextMap + 8);
  if (!v11)
    goto LABEL_13;
  v12 = gOALContextMap + 8;
  do
  {
    v13 = v11[4];
    v14 = v13 >= v8;
    if (v13 >= v8)
      v15 = v11;
    else
      v15 = v11 + 1;
    if (v14)
      v12 = (uint64_t)v11;
    v11 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(_QWORD *)(v12 + 32) <= v8)
  {
    v16 = *(OALContext **)(v12 + 40);
    if (v16)
    {
      v26 = (unsigned int *)((char *)v16 + 440);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 + 1, v26));
    }
  }
  else
  {
LABEL_13:
    v16 = 0;
  }
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  if (!v16)
  {
LABEL_22:
    v20 = 0;
    if (a1 == 1868723060)
      goto LABEL_20;
LABEL_23:
    if (a1 == 1868784492)
    {
      if (*a4 >= 4u)
      {
        *a4 = 4;
        v21 = v20 + 109;
        goto LABEL_29;
      }
    }
    else
    {
      if (a1 != 1920365420)
      {
        v22 = 40961;
        if (!v20)
          return v22;
        goto LABEL_30;
      }
      if (*a4 >= 4u)
      {
        *a4 = 4;
        v21 = v20 + 108;
        goto LABEL_29;
      }
    }
LABEL_39:
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40964;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  v17 = OALContext::ProtectSource(v16, a2);
  v18 = (unsigned int *)((char *)v16 + 440);
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  v20 = (unsigned int *)v17;
  if (a1 != 1868723060)
    goto LABEL_23;
LABEL_20:
  if (*a4 <= 3u)
    goto LABEL_39;
  *a4 = 4;
  v21 = v20 + 110;
LABEL_29:
  v22 = 0;
  *a3 = *v21;
LABEL_30:
  v23 = v20 + 18;
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  return v22;
}

void sub_215C46498(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10, __int16 a11, int a12, __int16 a13, uint64_t a14, __int16 a15, uint64_t a16, __int16 a17, uint64_t a18)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_215C46638(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void alSourceRenderingQuality(unsigned int a1, int a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  OALContext *v12;
  OALSource *v13;
  OALSource *v14;
  unsigned int *v15;
  unsigned int v16;
  char v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _DWORD v27[7];

  *(_QWORD *)&v27[5] = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315650;
    v23 = "oalImp.cpp";
    v24 = 1024;
    v25 = 4092;
    v26 = 2048;
    *(_QWORD *)v27 = a2;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceRenderingQuality--> value = %ld", (uint8_t *)&v22, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_25;
  v4 = gCurrentContext;
  v5 = gContextMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v7 = *(_QWORD **)(gOALContextMap + 8);
  if (!v7)
    goto LABEL_15;
  v8 = gOALContextMap + 8;
  do
  {
    v9 = v7[4];
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = v7;
    else
      v11 = v7 + 1;
    if (v10)
      v8 = (uint64_t)v7;
    v7 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
  {
    v12 = *(OALContext **)(v8 + 40);
    if (v12)
    {
      v20 = (unsigned int *)((char *)v12 + 440);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
    }
  }
  else
  {
LABEL_15:
    v12 = 0;
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  if (!v12)
    goto LABEL_25;
  v13 = (OALSource *)OALContext::ProtectSource(v12, a1);
  v14 = v13;
  v15 = (unsigned int *)((char *)v12 + 440);
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (!v13)
  {
LABEL_25:
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      return;
    v14 = 0;
    v17 = 1;
LABEL_27:
    v22 = 136315906;
    v23 = "oalImp.cpp";
    v24 = 1024;
    v25 = 4105;
    v26 = 1024;
    v27[0] = a1;
    LOWORD(v27[1]) = 2048;
    *(_QWORD *)((char *)&v27[1] + 2) = a2;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceRenderingQuality FAILED: source: %d : value: %ld", (uint8_t *)&v22, 0x22u);
    if ((v17 & 1) != 0)
      return;
    goto LABEL_28;
  }
  if (OALSource::SetRenderQuality(v13, a2) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v17 = 0;
    goto LABEL_27;
  }
LABEL_28:
  v18 = (unsigned int *)((char *)v14 + 72);
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
}

void sub_215C468BC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t alSourceGetRenderingQuality(unsigned int a1)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  OALContext *v10;
  OALSource *v11;
  OALSource *v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t result;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v20 = 136315394;
    v21 = "oalImp.cpp";
    v22 = 1024;
    v23 = 4114;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceGetRenderingQuality-->", (uint8_t *)&v20, 0x12u);
  }
  if (!gOALContextMap)
    goto LABEL_25;
  v2 = gCurrentContext;
  v3 = gContextMapLock;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v5 = *(_QWORD **)(gOALContextMap + 8);
  if (!v5)
    goto LABEL_15;
  v6 = gOALContextMap + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(_QWORD *)(v6 + 32) <= v2)
  {
    v10 = *(OALContext **)(v6 + 40);
    if (v10)
    {
      v18 = (unsigned int *)((char *)v10 + 440);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 + 1, v18));
    }
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  if (!v10)
    goto LABEL_25;
  v11 = (OALSource *)OALContext::ProtectSource(v10, a1);
  v12 = v11;
  v13 = (unsigned int *)((char *)v10 + 440);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v11)
  {
    result = OALSource::GetRenderQuality(v11);
    v16 = (unsigned int *)((char *)v12 + 72);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
  }
  else
  {
LABEL_25:
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if ((_DWORD)result)
    {
      v20 = 136315650;
      v21 = "oalImp.cpp";
      v22 = 1024;
      v23 = 4123;
      v24 = 1024;
      v25 = a1;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceGetRenderingQuality FAILED: source: %d", (uint8_t *)&v20, 0x18u);
      return 0;
    }
  }
  return result;
}

void sub_215C46AE4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void *alcOutputCapturerPrepare(unsigned int a1, unsigned int a2, unsigned int a3)
{
  unint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  OALContext *v14;
  void *result;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v20 = 136316418;
    v21 = "oalImp.cpp";
    v22 = 1024;
    v23 = 4904;
    v24 = 1024;
    v25 = gCurrentContext;
    v26 = 1024;
    v27 = a1;
    v28 = 1024;
    v29 = a2;
    v30 = 1024;
    v31 = a3;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerPrepare--> context = %u, frequency = %u, format = %d, buffersize = %d", (uint8_t *)&v20, 0x2Au);
  }
  if (!gOALContextMap)
    goto LABEL_33;
  v6 = gCurrentContext;
  v7 = gContextMapLock;
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v9 = *(_QWORD **)(gOALContextMap + 8);
  if (!v9)
    goto LABEL_15;
  v10 = gOALContextMap + 8;
  do
  {
    v11 = v9[4];
    v12 = v11 >= v6;
    if (v11 >= v6)
      v13 = v9;
    else
      v13 = v9 + 1;
    if (v12)
      v10 = (uint64_t)v9;
    v9 = (_QWORD *)*v13;
  }
  while (*v13);
  if (v10 != gOALContextMap + 8 && *(_QWORD *)(v10 + 32) <= v6)
  {
    v14 = *(OALContext **)(v10 + 40);
    if (v14)
    {
      v18 = (unsigned int *)((char *)v14 + 440);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 + 1, v18));
    }
  }
  else
  {
LABEL_15:
    v14 = 0;
  }
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  if (!v14)
    goto LABEL_33;
  result = (void *)OALContext::OutputCapturerCreate(v14, (double)a1, a2, a3);
  v16 = (unsigned int *)((char *)v14 + 440);
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if ((_DWORD)result)
  {
LABEL_33:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v20 = 136315394;
      v21 = "oalImp.cpp";
      v22 = 1024;
      v23 = 4926;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerPrepare FAILED", (uint8_t *)&v20, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    result = pthread_getspecific(gALCErrorKey);
    if (!result)
      return (void *)pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
  return result;
}

void sub_215C46D48(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void *alcOutputCapturerStart()
{
  unint64_t v0;
  uint64_t v1;
  int v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;
  OALContext *v8;
  void *result;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315650;
    v15 = "oalImp.cpp";
    v16 = 1024;
    v17 = 4933;
    v18 = 2048;
    v19 = gCurrentContext;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerStart--> context = %ld", (uint8_t *)&v14, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_33;
  v0 = gCurrentContext;
  v1 = gContextMapLock;
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v3 = *(_QWORD **)(gOALContextMap + 8);
  if (!v3)
    goto LABEL_15;
  v4 = gOALContextMap + 8;
  do
  {
    v5 = v3[4];
    v6 = v5 >= v0;
    if (v5 >= v0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6)
      v4 = (uint64_t)v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 != gOALContextMap + 8 && *(_QWORD *)(v4 + 32) <= v0)
  {
    v8 = *(OALContext **)(v4 + 40);
    if (v8)
    {
      v12 = (unsigned int *)((char *)v8 + 440);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 + 1, v12));
    }
  }
  else
  {
LABEL_15:
    v8 = 0;
  }
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  if (!v8)
    goto LABEL_33;
  result = (void *)OALContext::OutputCapturerStart(v8);
  v10 = (unsigned int *)((char *)v8 + 440);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 - 1, v10));
  if ((_DWORD)result)
  {
LABEL_33:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "oalImp.cpp";
      v16 = 1024;
      v17 = 4955;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerStart FAILED", (uint8_t *)&v14, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    result = pthread_getspecific(gALCErrorKey);
    if (!result)
      return (void *)pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
  return result;
}

void sub_215C46F78(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void *alcOutputCapturerStop()
{
  unint64_t v0;
  uint64_t v1;
  int v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;
  OALContext *v8;
  void *result;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315650;
    v15 = "oalImp.cpp";
    v16 = 1024;
    v17 = 4962;
    v18 = 2048;
    v19 = gCurrentContext;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerStop--> context = %ld", (uint8_t *)&v14, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_33;
  v0 = gCurrentContext;
  v1 = gContextMapLock;
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v3 = *(_QWORD **)(gOALContextMap + 8);
  if (!v3)
    goto LABEL_15;
  v4 = gOALContextMap + 8;
  do
  {
    v5 = v3[4];
    v6 = v5 >= v0;
    if (v5 >= v0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6)
      v4 = (uint64_t)v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 != gOALContextMap + 8 && *(_QWORD *)(v4 + 32) <= v0)
  {
    v8 = *(OALContext **)(v4 + 40);
    if (v8)
    {
      v12 = (unsigned int *)((char *)v8 + 440);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 + 1, v12));
    }
  }
  else
  {
LABEL_15:
    v8 = 0;
  }
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  if (!v8)
    goto LABEL_33;
  result = (void *)OALContext::OutputCapturerStop(v8);
  v10 = (unsigned int *)((char *)v8 + 440);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 - 1, v10));
  if ((_DWORD)result)
  {
LABEL_33:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "oalImp.cpp";
      v16 = 1024;
      v17 = 4984;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerStop FAILED", (uint8_t *)&v14, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    result = pthread_getspecific(gALCErrorKey);
    if (!result)
      return (void *)pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
  return result;
}

void sub_215C471A8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

OALCaptureMixer *alcOutputCapturerAvailableSamples()
{
  unint64_t v0;
  uint64_t v1;
  int v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;
  OALContext *v8;
  OALCaptureMixer *result;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315650;
    v15 = "oalImp.cpp";
    v16 = 1024;
    v17 = 4991;
    v18 = 2048;
    v19 = gCurrentContext;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerAvailableSamples--> context = %ld", (uint8_t *)&v14, 0x1Cu);
  }
  if (!gOALContextMap)
    goto LABEL_34;
  v0 = gCurrentContext;
  v1 = gContextMapLock;
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v3 = *(_QWORD **)(gOALContextMap + 8);
  if (!v3)
    goto LABEL_15;
  v4 = gOALContextMap + 8;
  do
  {
    v5 = v3[4];
    v6 = v5 >= v0;
    if (v5 >= v0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6)
      v4 = (uint64_t)v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 != gOALContextMap + 8 && *(_QWORD *)(v4 + 32) <= v0)
  {
    v8 = *(OALContext **)(v4 + 40);
    if (v8)
    {
      v12 = (unsigned int *)((char *)v8 + 440);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 + 1, v12));
    }
  }
  else
  {
LABEL_15:
    v8 = 0;
  }
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  if (v8)
  {
    result = OALContext::OutputCapturerAvailableFrames(v8);
    v10 = (unsigned int *)((char *)v8 + 440);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
  }
  else
  {
LABEL_34:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "oalImp.cpp";
      v16 = 1024;
      v17 = 5015;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerAvailableSamples FAILED", (uint8_t *)&v14, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey))
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    return 0;
  }
  return result;
}

void sub_215C473DC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void *alcOutputCapturerSamples(unsigned __int8 *a1, unsigned int a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  OALContext *v12;
  void *result;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unsigned __int8 *v25;
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v18 = 136316162;
    v19 = "oalImp.cpp";
    v20 = 1024;
    v21 = 5023;
    v22 = 2048;
    v23 = gCurrentContext;
    v24 = 2048;
    v25 = a1;
    v26 = 1024;
    v27 = a2;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerSamples--> context = %ld, buffer = %p, samples = %d", (uint8_t *)&v18, 0x2Cu);
  }
  if (!gOALContextMap)
    goto LABEL_33;
  v4 = gCurrentContext;
  v5 = gContextMapLock;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
  v7 = *(_QWORD **)(gOALContextMap + 8);
  if (!v7)
    goto LABEL_15;
  v8 = gOALContextMap + 8;
  do
  {
    v9 = v7[4];
    v10 = v9 >= v4;
    if (v9 >= v4)
      v11 = v7;
    else
      v11 = v7 + 1;
    if (v10)
      v8 = (uint64_t)v7;
    v7 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
  {
    v12 = *(OALContext **)(v8 + 40);
    if (v12)
    {
      v16 = (unsigned int *)((char *)v12 + 440);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 + 1, v16));
    }
  }
  else
  {
LABEL_15:
    v12 = 0;
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  if (!v12)
    goto LABEL_33;
  result = (void *)OALContext::OutputCapturerGetFrames(v12, a2, a1);
  v14 = (unsigned int *)((char *)v12 + 440);
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if ((_DWORD)result)
  {
LABEL_33:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315394;
      v19 = "oalImp.cpp";
      v20 = 1024;
      v21 = 5045;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerSamples FAILED", (uint8_t *)&v18, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    result = pthread_getspecific(gALCErrorKey);
    if (!result)
      return (void *)pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
  return result;
}

void sub_215C47634(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void alSetInteger(int a1, unsigned int a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  OALContext *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v20;
  _QWORD *v21;
  BOOL v22;
  unsigned int *v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  _DWORD *exception;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315394;
    v33 = "oalImp.cpp";
    v34 = 1024;
    v35 = 4232;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alSetIntegeri", (uint8_t *)&v32, 0x12u);
  }
  switch(a1)
  {
    case 61445:
      if (gRenderChannelSetting == a2)
        goto LABEL_52;
      if (!gOALDeviceMap)
      {
        exception = __cxa_allocate_exception(4uLL);
        *exception = 40964;
        __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
      }
      gRenderChannelSetting = a2;
      v13 = gDeviceMapLock;
      v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gDeviceMapLock + 16))(gDeviceMapLock);
      v15 = gOALDeviceMap;
      if (!*(_DWORD *)(gOALDeviceMap + 16))
      {
LABEL_50:
        if (v14)
          (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
        goto LABEL_52;
      }
      v16 = 0;
      while (1)
      {
        v17 = *(_QWORD **)v15;
        if (v16)
        {
          v18 = v16;
          do
          {
            v20 = (_QWORD *)v17[1];
            if (v20)
            {
              do
              {
                v21 = v20;
                v20 = (_QWORD *)*v20;
              }
              while (v20);
            }
            else
            {
              do
              {
                v21 = (_QWORD *)v17[2];
                v22 = *v21 == (_QWORD)v17;
                v17 = v21;
              }
              while (!v22);
            }
            v17 = v21;
          }
          while (v18-- > 1);
        }
        else
        {
          v21 = *(_QWORD **)v15;
        }
        if (v21 == (_QWORD *)(v15 + 8))
        {
          v23 = 0;
          if (MEMORY[0x44] != gRenderChannelSetting)
          {
LABEL_43:
            v24 = v23 + 19;
            do
              v25 = __ldaxr(v24);
            while (__stlxr(v25 + 1, v24));
            OALDevice::SetRenderChannelSetting((OALDevice *)v23, gRenderChannelSetting);
            do
              v26 = __ldaxr(v24);
            while (__stlxr(v26 - 1, v24));
            v15 = gOALDeviceMap;
          }
        }
        else
        {
          v23 = (unsigned int *)v21[5];
          if (v23[17] != gRenderChannelSetting)
            goto LABEL_43;
        }
        if (++v16 >= (unint64_t)*(unsigned int *)(v15 + 16))
          goto LABEL_50;
      }
    case 61444:
LABEL_52:
      gMaximumMixerBusCount = a2;
      return;
    case 61442:
      if (a2 == 1751412840 || a2 == 1920034921 || a2 == 1919183983)
      {
        if (gOALContextMap)
        {
          v4 = gCurrentContext;
          v5 = gContextMapLock;
          v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)gContextMapLock + 16))(gContextMapLock);
          v7 = *(_QWORD **)(gOALContextMap + 8);
          if (!v7)
            goto LABEL_21;
          v8 = gOALContextMap + 8;
          do
          {
            v9 = v7[4];
            v10 = v9 >= v4;
            if (v9 >= v4)
              v11 = v7;
            else
              v11 = v7 + 1;
            if (v10)
              v8 = (uint64_t)v7;
            v7 = (_QWORD *)*v11;
          }
          while (*v11);
          if (v8 != gOALContextMap + 8 && *(_QWORD *)(v8 + 32) <= v4)
          {
            v12 = *(OALContext **)(v8 + 40);
            if (v12)
            {
              v29 = (unsigned int *)((char *)v12 + 440);
              do
                v30 = __ldaxr(v29);
              while (__stlxr(v30 + 1, v29));
            }
          }
          else
          {
LABEL_21:
            v12 = 0;
          }
          if (v6)
            (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
        }
        else
        {
          v12 = 0;
        }
        OALContext::SetRenderQuality(v12, a2);
        if (v12)
        {
          v27 = (unsigned int *)((char *)v12 + 440);
          do
            v28 = __ldaxr(v27);
          while (__stlxr(v28 - 1, v27));
        }
      }
      break;
    default:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey))
        pthread_setspecific(gALErrorKey, (const void *)0xA003);
      break;
  }
}

void sub_215C479DC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_215C479F8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, __int128 a10)
{
  ALenum *v11;
  ALenum v12;
  const ALchar *String;

  if (a2)
  {
    v11 = (ALenum *)__cxa_begin_catch(a1);
    if (a2 == 2)
    {
      v12 = *v11;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        String = alGetString(v12);
        LODWORD(a9) = 136315650;
        *(_QWORD *)((char *)&a9 + 4) = "oalImp.cpp";
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 4286;
        WORD1(a10) = 2080;
        *(_QWORD *)((char *)&a10 + 4) = String;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSetInteger FAILED = %s\n", (uint8_t *)&a9, 0x1Cu);
      }
      alSetError(v12);
      __cxa_end_catch();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(a9) = 136315394;
        *(_QWORD *)((char *)&a9 + 4) = "oalImp.cpp";
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 4290;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSetInteger FAILED", (uint8_t *)&a9, 0x12u);
      }
      alSetError(40964);
      __cxa_end_catch();
    }
    JUMPOUT(0x215C47974);
  }
  JUMPOUT(0x215C479E8);
}

void sub_215C47B4C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_215C47B64()
{
  __cxa_end_catch();
  JUMPOUT(0x215C479E8);
}

void sub_215C47B74(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

BOOL IsValidRenderQuality(int a1)
{
  _BOOL4 v1;

  v1 = a1 == 1919183983 || a1 == 1920034921;
  return a1 == 1751412840 || v1;
}

uint64_t FillInASBD(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;

  if ((a2 - 4352) > 3)
    return 40963;
  result = 0;
  v5 = 4 * (a2 - 4352);
  v6 = *(_DWORD *)((char *)&unk_215C56000 + v5);
  v7 = *(_DWORD *)((char *)&unk_215C56010 + v5);
  v8 = *(_DWORD *)((char *)&unk_215C56020 + v5);
  LODWORD(v5) = *(_DWORD *)((char *)&unk_215C56030 + v5);
  *(double *)a1 = (double)a3;
  *(_DWORD *)(a1 + 8) = 1819304813;
  *(_DWORD *)(a1 + 12) = v6;
  *(_DWORD *)(a1 + 16) = v7;
  *(_DWORD *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 28) = v5;
  *(_QWORD *)(a1 + 32) = v8;
  return result;
}

char *std::__tree<std::__value_type<unsigned long,OALCaptureDevice *>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,OALCaptureDevice *>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,OALCaptureDevice *>>>::__emplace_hint_multi<std::pair<unsigned long const,OALCaptureDevice *>>(uint64_t ***a1, uint64_t **a2, _OWORD *a3)
{
  char *v6;
  char *v7;
  unint64_t *v8;
  uint64_t **v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t **v15;
  uint64_t **v16;
  BOOL v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;

  v6 = (char *)operator new(0x30uLL);
  v7 = v6;
  v8 = (unint64_t *)(v6 + 32);
  *((_OWORD *)v6 + 2) = *a3;
  v9 = (uint64_t **)(a1 + 1);
  if (a1 + 1 != (uint64_t ***)a2)
  {
    v10 = *v8;
    if ((unint64_t)a2[4] < *v8)
    {
      while (1)
      {
        v11 = *v9;
        v12 = v9;
        if (!*v9)
          goto LABEL_25;
        while (1)
        {
          v9 = (uint64_t **)v11;
          if (v11[4] >= v10)
            break;
          v11 = (uint64_t *)v11[1];
          if (!v11)
            goto LABEL_19;
        }
      }
    }
  }
  v13 = *a2;
  if (*a1 == a2)
  {
    v15 = a2;
    goto LABEL_20;
  }
  if (v13)
  {
    v14 = *a2;
    do
    {
      v15 = (uint64_t **)v14;
      v14 = (uint64_t *)v14[1];
    }
    while (v14);
  }
  else
  {
    v16 = a2;
    do
    {
      v15 = (uint64_t **)v16[2];
      v17 = *v15 == (uint64_t *)v16;
      v16 = v15;
    }
    while (v17);
  }
  v18 = *v8;
  if (*v8 >= (unint64_t)v15[4])
  {
LABEL_20:
    v12 = v15 + 1;
    if (v13)
      v9 = v15;
    else
      v9 = a2;
    if (!v13)
      v12 = a2;
    goto LABEL_25;
  }
  while (1)
  {
    v19 = *v9;
    v12 = v9;
    if (!*v9)
      break;
    while (1)
    {
      v9 = (uint64_t **)v19;
      if (v18 < v19[4])
        break;
      v19 = (uint64_t *)v19[1];
      if (!v19)
      {
LABEL_19:
        v12 = v9 + 1;
        goto LABEL_25;
      }
    }
  }
LABEL_25:
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = v9;
  *v12 = (uint64_t *)v6;
  v20 = **a1;
  v21 = (uint64_t *)v6;
  if (v20)
  {
    *a1 = (uint64_t **)v20;
    v21 = *v12;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)a1[1], v21);
  a1[2] = (uint64_t **)((char *)a1[2] + 1);
  return v7;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OALSource::OALSource(OALSource *this, int a2, OALContext *a3)
{
  _OWORD *v4;
  uint64_t *v5;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  *(_DWORD *)this = a2;
  *((_BYTE *)this + 4) = 0;
  v4 = (_OWORD *)((char *)this + 308);
  *((_QWORD *)this + 1) = a3;
  *((_DWORD *)this + 4) = 65792;
  *((_BYTE *)this + 20) = 1;
  *((_QWORD *)this + 3) = 0;
  v5 = (uint64_t *)((char *)this + 24);
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_DWORD *)this + 13) = 0;
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 1;
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 18) = 0;
  CAGuard::CAGuard((OALSource *)((char *)this + 80), "OAL:SourceLock");
  *((_DWORD *)this + 58) = -1;
  *((_WORD *)this + 118) = 0;
  *((_QWORD *)this + 35) = 0x103000000000;
  *((_OWORD *)this + 18) = xmmword_215C56080;
  *((_DWORD *)this + 76) = 4113;
  __asm { FMOV            V0.4S, #1.0 }
  *v4 = _Q0;
  v4[1] = xmmword_215C56090;
  *(_QWORD *)((char *)this + 340) = 0;
  *(_QWORD *)((char *)this + 345) = 0;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *((_QWORD *)this + 55) = 0x72646C6F00000000;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_QWORD *)this + 34) = 0;
  v11 = operator new();
  *(_QWORD *)v11 = 0;
  *(_QWORD *)(v11 + 8) = 0;
  *(_QWORD *)(v11 + 16) = 0;
  *(_DWORD *)(v11 + 24) = 0;
  *v5 = v11;
  v12 = (char *)operator new(0x4000uLL);
  *(_QWORD *)v11 = v12;
  *(_QWORD *)(v11 + 8) = v12;
  *(_QWORD *)(v11 + 16) = v12 + 0x4000;
  v13 = operator new();
  *(_QWORD *)v13 = 0;
  *(_QWORD *)(v13 + 8) = 0;
  *(_QWORD *)(v13 + 16) = 0;
  *(_DWORD *)(v13 + 24) = 0;
  *((_QWORD *)this + 4) = v13;
  v14 = (char *)operator new(0x4000uLL);
  *(_QWORD *)v13 = v14;
  *(_QWORD *)(v13 + 8) = v14;
  *(_QWORD *)(v13 + 16) = v14 + 0x4000;
  v15 = operator new();
  *(_QWORD *)v15 = 0;
  *(_QWORD *)(v15 + 8) = 0;
  *(_QWORD *)(v15 + 16) = 0;
  *(_DWORD *)(v15 + 24) = 0;
  *((_QWORD *)this + 5) = v15;
  v16 = (char *)operator new(0x1000uLL);
  *(_QWORD *)v15 = v16;
  *(_QWORD *)(v15 + 8) = v16;
  *(_QWORD *)(v15 + 16) = v16 + 4096;
  v17 = *((_QWORD *)this + 1);
  *((_QWORD *)v4 + 2) = *(_QWORD *)(v17 + 456);
  *((_DWORD *)this + 111) = *(_DWORD *)(v17 + 424);
}

void sub_215C47F8C(_Unwind_Exception *a1)
{
  CAGuard *v1;

  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

void OALSource::~OALSource(OALSource *this)
{
  AudioUnitElement v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = *((_DWORD *)this + 58);
  if (v2 != -1)
  {
    *((_QWORD *)this + 27) = 0;
    *((_QWORD *)this + 28) = 0;
    if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v2, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(_QWORD *)(*((_QWORD *)this + 1) + 16) + 16), 0);
    OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1);
    *((_BYTE *)this + 236) = 0;
    v3 = *((_DWORD *)this + 58);
    if (v3 != -1)
    {
      OALContext::SetBusAsAvailable(*((_QWORD *)this + 1), v3);
      *((_DWORD *)this + 58) = -1;
    }
  }
  OALSource::FlushBufferQueue(this);
  v4 = *((_QWORD *)this + 4);
  if (v4)
  {
    v5 = *(void **)v4;
    if (*(_QWORD *)v4)
    {
      *(_QWORD *)(v4 + 8) = v5;
      operator delete(v5);
    }
    MEMORY[0x2199EEC7C](v4, 0x1020C4055CCDE27);
  }
  v6 = *((_QWORD *)this + 3);
  if (v6)
  {
    v7 = *(void **)v6;
    if (*(_QWORD *)v6)
    {
      *(_QWORD *)(v6 + 8) = v7;
      operator delete(v7);
    }
    MEMORY[0x2199EEC7C](v6, 0x1020C4055CCDE27);
  }
  v8 = *((_QWORD *)this + 5);
  if (v8)
  {
    v9 = *(void **)v8;
    if (*(_QWORD *)v8)
    {
      *(_QWORD *)(v8 + 8) = v9;
      operator delete(v9);
    }
    MEMORY[0x2199EEC7C](v8, 0x1020C4055CCDE27);
  }
  v10 = *((_QWORD *)this + 52);
  if (v10)
  {
    v11 = *(_QWORD *)(v10 + 24);
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    v12 = *(void **)v10;
    if (*(_QWORD *)v10)
    {
      *(_QWORD *)(v10 + 8) = v12;
      operator delete(v12);
    }
    MEMORY[0x2199EEC7C](v10, 0x1020C401C8C6399);
  }
  CAGuard::~CAGuard((OALSource *)((char *)this + 80));
}

uint64_t OALSource::StopRenderingToBus(uint64_t this)
{
  AudioUnitElement v1;
  uint64_t v2;
  unsigned int v3;

  v1 = *(_DWORD *)(this + 232);
  if (v1 != -1)
  {
    v2 = this;
    *(_QWORD *)(this + 216) = 0;
    *(_QWORD *)(this + 224) = 0;
    if (!OALContext::SetBusRenderProc(*(AudioUnit **)(this + 8), v1, (const AURenderCallbackStruct *)(this + 216)))AUGraphUpdate(*(AUGraph *)(*(_QWORD *)(*(_QWORD *)(v2 + 8) + 16) + 16), 0);
    this = OALContext::SetBusEnable(*(AudioUnit **)(v2 + 8), *(_DWORD *)(v2 + 232), 1);
    *(_BYTE *)(v2 + 236) = 0;
    v3 = *(_DWORD *)(v2 + 232);
    if (v3 != -1)
    {
      this = OALContext::SetBusAsAvailable(*(_QWORD *)(v2 + 8), v3);
      *(_DWORD *)(v2 + 232) = -1;
    }
  }
  return this;
}

_QWORD *OALSource::FlushBufferQueue(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  OALBuffer **v5;
  OALBuffer **v6;
  int64_t v7;
  OALBuffer **v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  OALBuffer **v12;
  OALBuffer **v13;
  int64_t v14;
  OALBuffer **v15;

  v1 = (uint64_t)this;
  v2 = this[4];
  v3 = *(_DWORD *)(v2 + 24);
  if (v3)
  {
    if (*(_QWORD *)v2 == *(_QWORD *)(v2 + 8))
    {
      do
      {
        *(_DWORD *)(v2 + 24) = 0;
        --v3;
      }
      while (v3);
    }
    else
    {
      do
      {
        while (1)
        {
          v4 = *(_QWORD *)(v1 + 32);
          v5 = *(OALBuffer ***)v4;
          if (*(_QWORD *)v4 != *(_QWORD *)(v4 + 8))
            break;
          *(_DWORD *)(v4 + 24) = 0;
          if (!--v3)
            goto LABEL_10;
        }
        this = (_QWORD *)OALBuffer::ReleaseBuffer(v5[1], (OALSource *)v1);
        v6 = *(OALBuffer ***)(v4 + 8);
        v7 = (char *)v6 - (char *)(v5 + 4);
        if (v6 != v5 + 4)
          this = memmove(v5, v5 + 4, (char *)v6 - (char *)(v5 + 4));
        v8 = *(OALBuffer ***)v4;
        *(_QWORD *)(v4 + 8) = (char *)v5 + v7;
        *(_DWORD *)(v4 + 24) = (unint64_t)((char *)v5 + v7 - (char *)v8) >> 5;
        --v3;
      }
      while (v3);
    }
  }
LABEL_10:
  v9 = *(_QWORD *)(v1 + 24);
  v10 = *(_DWORD *)(v9 + 24);
  if (v10)
  {
    if (*(_QWORD *)v9 == *(_QWORD *)(v9 + 8))
    {
      do
      {
        *(_DWORD *)(v9 + 24) = 0;
        --v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        while (1)
        {
          v11 = *(_QWORD *)(v1 + 24);
          v12 = *(OALBuffer ***)v11;
          if (*(_QWORD *)v11 != *(_QWORD *)(v11 + 8))
            break;
          *(_DWORD *)(v11 + 24) = 0;
          if (!--v10)
            goto LABEL_19;
        }
        this = (_QWORD *)OALBuffer::ReleaseBuffer(v12[1], (OALSource *)v1);
        v13 = *(OALBuffer ***)(v11 + 8);
        v14 = (char *)v13 - (char *)(v12 + 4);
        if (v13 != v12 + 4)
          this = memmove(v12, v12 + 4, (char *)v13 - (char *)(v12 + 4));
        v15 = *(OALBuffer ***)v11;
        *(_QWORD *)(v11 + 8) = (char *)v12 + v14;
        *(_DWORD *)(v11 + 24) = (unint64_t)((char *)v12 + v14 - (char *)v15) >> 5;
        --v10;
      }
      while (v10);
LABEL_19:
      v9 = *(_QWORD *)(v1 + 24);
    }
  }
  *(_DWORD *)(v1 + 48) = *(_DWORD *)(*(_QWORD *)(v1 + 32) + 24) + *(_DWORD *)(v9 + 24);
  return this;
}

uint64_t OALSource::SetUpDeconstruction(OALSource *this)
{
  unsigned int *v2;
  uint64_t v3;
  pthread_t v4;
  _opaque_pthread_t *v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;

  v2 = (unsigned int *)((char *)this + 64);
  v3 = *((_QWORD *)this + 1);
  v4 = pthread_self();
  v5 = *(_opaque_pthread_t **)(v3 + 480);
  if (v4 != v5)
  {
    do
      v6 = __ldaxr(v2);
    while (__stlxr(v6 + 1, v2));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v8 = v7;
  v9 = *((_DWORD *)this + 76);
  if ((v9 - 56577) >= 6 && v9 != 4114)
  {
    *((_BYTE *)this + 4) = 1;
    *((_DWORD *)this + 76) = 56577;
    *((_BYTE *)this + 352) = 1;
    if (!v7)
      goto LABEL_18;
LABEL_17:
    (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
    goto LABEL_18;
  }
  v11 = operator new();
  *(_DWORD *)(v11 + 8) = 9;
  *(_QWORD *)(v11 + 16) = 0;
  *(_DWORD *)(v11 + 24) = 0;
  v12 = (unint64_t *)((char *)this + 424);
LABEL_13:
  v13 = *v12;
  *(_QWORD *)v11 = *v12;
  do
  {
    v14 = __ldaxr(v12);
    if (v14 != v13)
    {
      __clrex();
      goto LABEL_13;
    }
  }
  while (__stlxr(v11, v12));
  OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
  *((_DWORD *)this + 76) = 56577;
  *((_BYTE *)this + 352) = 1;
  if (v8)
    goto LABEL_17;
LABEL_18:
  if (v4 != v5)
  {
    do
      v15 = __ldaxr(v2);
    while (__stlxr(v15 - 1, v2));
  }
  return 0;
}

void sub_215C48474(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;

  if (v1 != v3)
  {
    do
      v4 = __ldaxr(v2);
    while (__stlxr(v4 - 1, v2));
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::AddPlaybackMessage(OALSource *this, int a2, OALBuffer *a3, int a4)
{
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;

  v8 = operator new();
  *(_DWORD *)(v8 + 8) = a2;
  *(_QWORD *)(v8 + 16) = a3;
  *(_DWORD *)(v8 + 24) = a4;
  v9 = (unint64_t *)((char *)this + 424);
LABEL_2:
  v10 = *v9;
  *(_QWORD *)v8 = *v9;
  do
  {
    v11 = __ldaxr(v9);
    if (v11 != v10)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stlxr(v8, v9));
  return OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
}

void OALSource::SetPlaybackState(OALSource *this, int a2, int a3)
{
  _QWORD *v3;
  BOOL v4;
  uint64_t v5;
  int v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  _DWORD *v10;
  NSObject *global_queue;
  _QWORD block[6];
  int v13;

  *((_DWORD *)this + 76) = a2;
  v3 = (_QWORD *)*((_QWORD *)this + 52);
  if (v3)
    v4 = a3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = v3[3];
    if (v5)
    {
      v6 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v5 + 16))(v3[3]);
      v8 = (_DWORD *)*v3;
      v7 = (_DWORD *)v3[1];
      if ((_DWORD *)*v3 != v7)
      {
        v9 = MEMORY[0x24BDAC760];
        v10 = (_DWORD *)*v3;
        do
        {
          if (*v10 == 4112)
          {
            global_queue = dispatch_get_global_queue(0, 0);
            block[0] = v9;
            block[1] = 0x40000000;
            block[2] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
            block[3] = &__block_descriptor_tmp;
            block[4] = v3;
            block[5] = v8;
            v13 = 4112;
            dispatch_async(global_queue, block);
            v7 = (_DWORD *)v3[1];
          }
          v10 += 6;
          v8 += 6;
        }
        while (v10 != v7);
      }
      if (v6)
        (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
    }
  }
}

uint64_t OALSource::SetPitch(OALSource *this, float a2)
{
  char *v5;
  int v6;
  int v7;
  AudioUnitElement v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  if (a2 < 0.0)
    return 40963;
  if (*((float *)this + 78) != a2 || *((_BYTE *)this + 20))
  {
    v5 = (char *)this + 80;
    v6 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
    v7 = v6;
    *((float *)this + 78) = a2;
    v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      v9 = (uint64_t *)*((_QWORD *)this + 3);
      v11 = *v9;
      v10 = v9[1];
      if (v11)
        v12 = v11 + ((uint64_t)((unint64_t)*((unsigned int *)this + 14) << 48) >> 43) == v10;
      else
        v12 = 1;
      if (!v12)
        OALContext::SetBusPlaybackRate(*((AudioUnit **)this + 1), v8, *((float *)this + 79) * a2);
      *((_BYTE *)this + 20) = 0;
      if (!v7)
        return 0;
      goto LABEL_14;
    }
    *((_BYTE *)this + 20) = 1;
    if (v6)
LABEL_14:
      (*(void (**)(char *))(*(_QWORD *)v5 + 24))((char *)this + 80);
  }
  return 0;
}

void sub_215C48744(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetGain(OALSource *this, float a2)
{
  uint64_t updated;
  float *v5;
  int v6;
  int v7;
  uint64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0.0)
    return 40963;
  v5 = (float *)((char *)this + 80);
  v6 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v7 = v6;
  if (v5[57] == a2)
  {
    updated = 0;
    if (!v6)
      return updated;
LABEL_10:
    (*(void (**)(float *))(*(_QWORD *)v5 + 24))(v5);
    return updated;
  }
  *((float *)this + 77) = a2;
  updated = OALSource::UpdateBusGain(this);
  if ((_DWORD)updated && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v8 = *(unsigned int *)this;
    v10 = 136315906;
    v11 = "oalSource.cpp";
    v12 = 1024;
    v13 = 279;
    v14 = 2048;
    v15 = v8;
    v16 = 2048;
    v17 = (int)updated;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetGain FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v10, 0x26u);
  }
  if (v7)
    goto LABEL_10;
  return updated;
}

void sub_215C488BC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t OALSource::UpdateBusGain(OALSource *this)
{
  AudioUnitElement v1;
  float v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = *((_DWORD *)this + 58);
  if (v1 == -1)
    return 0;
  v3 = *((float *)this + 77) * *((float *)this + 75);
  if (v3 > 1.0)
  {
    *((_BYTE *)this + 237) = 0;
    v3 = 1.0;
    goto LABEL_4;
  }
  if (v3 < 0.0)
  {
    v5 = 0;
    *((_BYTE *)this + 237) = 1;
    return v5;
  }
  *((_BYTE *)this + 237) = v3 <= 0.0;
  if (v3 <= 0.0)
    return 0;
LABEL_4:
  v4 = log10f(v3) * 20.0;
  if (v4 < -120.0)
    v4 = -120.0;
  v5 = OALContext::SetBusInputGain(*((AudioUnit **)this + 1), v1, v4);
  if ((_DWORD)v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v6 = *(unsigned int *)this;
    v8 = 136315906;
    v9 = "oalSource.cpp";
    v10 = 1024;
    v11 = 2466;
    v12 = 2048;
    v13 = v6;
    v14 = 2048;
    v15 = (int)v5;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateBusGain FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v8, 0x26u);
  }
  return v5;
}

uint64_t OALSource::SetMinGain(OALSource *this, AudioUnitParameterValue a2)
{
  float *v6;
  int v7;
  AudioUnitElement v8;
  int v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0.0 || a2 > 1.0)
    return 40963;
  v6 = (float *)((char *)this + 80);
  v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  if (v6[63] != a2)
  {
    *((AudioUnitParameterValue *)this + 83) = a2;
    v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      v9 = OALContext::SetBusMinGain(*((AudioUnit **)this + 1), v8, a2);
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v10 = *(unsigned int *)this;
          v11 = 136315906;
          v12 = "oalSource.cpp";
          v13 = 1024;
          v14 = 2483;
          v15 = 2048;
          v16 = v10;
          v17 = 2048;
          v18 = v9;
          _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateMinBusGain FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v11, 0x26u);
        }
      }
    }
  }
  if (v7)
    (*(void (**)(float *))(*(_QWORD *)v6 + 24))(v6);
  return 0;
}

void sub_215C48BAC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetMaxGain(OALSource *this, AudioUnitParameterValue a2)
{
  float *v6;
  int v7;
  AudioUnitElement v8;
  int v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0.0 || a2 > 1.0)
    return 40963;
  v6 = (float *)((char *)this + 80);
  v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  if (v6[64] != a2)
  {
    *((AudioUnitParameterValue *)this + 84) = a2;
    v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      v9 = OALContext::SetBusMaxGain(*((AudioUnit **)this + 1), v8, a2);
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v10 = *(unsigned int *)this;
          v11 = 136315906;
          v12 = "oalSource.cpp";
          v13 = 1024;
          v14 = 2500;
          v15 = 2048;
          v16 = v10;
          v17 = 2048;
          v18 = v9;
          _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateMaxBusGain FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v11, 0x26u);
        }
      }
    }
  }
  if (v7)
    (*(void (**)(float *))(*(_QWORD *)v6 + 24))(v6);
  return 0;
}

void sub_215C48D40(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::UpdateMaxBusGain(OALSource *this)
{
  AudioUnitElement v1;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *((_DWORD *)this + 58);
  if (v1 == -1)
    return 0;
  v3 = OALContext::SetBusMaxGain(*((AudioUnit **)this + 1), v1, *((AudioUnitParameterValue *)this + 84));
  if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v4 = *(unsigned int *)this;
    v6 = 136315906;
    v7 = "oalSource.cpp";
    v8 = 1024;
    v9 = 2500;
    v10 = 2048;
    v11 = v4;
    v12 = 2048;
    v13 = (int)v3;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateMaxBusGain FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v6, 0x26u);
  }
  return v3;
}

uint64_t OALSource::SetDistanceParams(OALSource *this, int a2, int a3)
{
  AudioUnitElement *v6;
  int v7;
  uint64_t BusDistanceParams;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  MixerDistanceParams inData;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (AudioUnitElement *)((char *)this + 80);
  v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  BusDistanceParams = OALContext::GetBusDistanceParams(*((AudioUnit **)v6 - 9), v6[38], &inData);
  if ((_DWORD)BusDistanceParams)
    goto LABEL_16;
  v9 = *((float *)this + 80);
  if (a2)
  {
    inData.mReferenceDistance = *((Float32 *)this + 81);
  }
  else if (a3)
  {
    inData.mMaxDistance = *((Float32 *)this + 82);
  }
  v10 = log10f(inData.mReferenceDistance/ (float)(inData.mReferenceDistance + (float)(v9 * (float)(inData.mMaxDistance - inData.mReferenceDistance))))* 20.0;
  v11 = -v10;
  if (v10 >= 0.0)
    v11 = 0.0;
  inData.mMaxAttenuation = v11;
  BusDistanceParams = OALContext::SetBusDistanceParams(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), &inData);
  if ((_DWORD)BusDistanceParams)
  {
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v12 = *(unsigned int *)this;
      *(_DWORD *)buf = 136315906;
      v16 = "oalSource.cpp";
      v17 = 1024;
      v18 = 361;
      v19 = 2048;
      v20 = v12;
      v21 = 2048;
      v22 = (int)BusDistanceParams;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetDistanceParams FAILED - OALSource = %ld : result = %ld", buf, 0x26u);
    }
  }
  if (v7)
    (*(void (**)(AudioUnitElement *))(*(_QWORD *)v6 + 24))(v6);
  return BusDistanceParams;
}

void sub_215C4900C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetReferenceDistance(OALSource *this, float a2)
{
  float *v5;
  int v6;

  if (a2 < 0.0)
    return 40963;
  v5 = (float *)((char *)this + 80);
  v6 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  if (v5[61] != a2)
  {
    *((float *)this + 81) = a2;
    if (*(_BYTE *)(*((_QWORD *)this + 1) + 408))
    {
      if (*((_DWORD *)this + 58) != -1)
        OALSource::SetDistanceParams(this, 1, 0);
    }
  }
  if (v6)
    (*(void (**)(float *))(*(_QWORD *)v5 + 24))(v5);
  return 0;
}

void sub_215C49104(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetMaxDistance(OALSource *this, float a2)
{
  char *v4;
  int v5;

  if (a2 <= 0.0)
    return 40963;
  if (*((float *)this + 82) != a2)
  {
    v4 = (char *)this + 80;
    v5 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
    *((float *)this + 82) = a2;
    if (*(_BYTE *)(*((_QWORD *)this + 1) + 408) && *((_DWORD *)this + 58) != -1)
      OALSource::SetDistanceParams(this, 0, 1);
    if (v5)
      (*(void (**)(char *))(*(_QWORD *)v4 + 24))((char *)this + 80);
  }
  return 0;
}

void sub_215C491E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetRollOffFactor(OALSource *this, float a2)
{
  float *v5;
  int v6;

  if (a2 < 0.0)
    return 40963;
  v5 = (float *)((char *)this + 80);
  v6 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  if (v5[60] != a2)
  {
    *((float *)this + 80) = a2;
    if (*(_BYTE *)(*((_QWORD *)this + 1) + 408))
    {
      if (*((_DWORD *)this + 58) != -1)
        OALSource::SetDistanceParams(this, 0, 0);
    }
  }
  if (v6)
    (*(void (**)(float *))(*(_QWORD *)v5 + 24))(v5);
  return 0;
}

void sub_215C492C8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetLooping(OALSource *this, int a2)
{
  _DWORD *v3;
  int v4;

  v3 = (_DWORD *)((char *)this + 80);
  v4 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v3[49] = a2;
  if (v4)
    (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 24))(v3);
  return 0;
}

uint64_t OALSource::SetPosition(OALSource *this, float a2, float a3, float a4)
{
  float *v7;
  uint64_t result;

  v7 = (float *)((char *)this + 80);
  result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v7[40] = a2;
  v7[41] = a3;
  v7[42] = a4;
  *((_BYTE *)v7 - 63) = 1;
  if ((_DWORD)result)
  {
    (*(void (**)(float *))(*(_QWORD *)v7 + 24))(v7);
    return 0;
  }
  return result;
}

uint64_t OALSource::SetVelocity(OALSource *this, float a2, float a3, float a4)
{
  float *v7;
  uint64_t result;

  v7 = (float *)((char *)this + 80);
  result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v7[43] = a2;
  v7[44] = a3;
  v7[45] = a4;
  *((_BYTE *)v7 - 63) = 1;
  if ((_DWORD)result)
  {
    (*(void (**)(float *))(*(_QWORD *)v7 + 24))(v7);
    return 0;
  }
  return result;
}

uint64_t OALSource::SetDirection(OALSource *this, float a2, float a3, float a4)
{
  float *v7;
  uint64_t result;

  v7 = (float *)((char *)this + 80);
  result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v7[46] = a2;
  v7[47] = a3;
  v7[48] = a4;
  *((_BYTE *)v7 - 63) = 1;
  if ((_DWORD)result)
  {
    (*(void (**)(float *))(*(_QWORD *)v7 + 24))(v7);
    return 0;
  }
  return result;
}

uint64_t OALSource::SetSourceRelative(OALSource *this, unsigned int a2)
{
  uint64_t result;
  _DWORD *v4;

  if (a2 > 1)
    return 40963;
  v4 = (_DWORD *)((char *)this + 80);
  result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v4[50] = a2;
  *((_BYTE *)v4 - 63) = 1;
  if ((_DWORD)result)
  {
    (*(void (**)(_DWORD *))(*(_QWORD *)v4 + 24))(v4);
    return 0;
  }
  return result;
}

uint64_t OALSource::SetChannelParameters(OALSource *this)
{
  float v2;
  char *v3;
  int v4;
  float v5;
  int v6;

  v2 = *((float *)this + 81);
  if (v2 >= 0.0)
  {
    v3 = (char *)this + 80;
    v4 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
    if (*((float *)this + 81) != v2)
    {
      *((float *)this + 81) = v2;
      if (*(_BYTE *)(*((_QWORD *)this + 1) + 408))
      {
        if (*((_DWORD *)this + 58) != -1)
          OALSource::SetDistanceParams(this, 1, 0);
      }
    }
    if (v4)
      (*(void (**)(char *))(*(_QWORD *)v3 + 24))((char *)this + 80);
  }
  v5 = *((float *)this + 80);
  if (v5 >= 0.0)
  {
    v6 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
    if (*((float *)this + 80) != v5)
    {
      *((float *)this + 80) = v5;
      if (*(_BYTE *)(*((_QWORD *)this + 1) + 408))
      {
        if (*((_DWORD *)this + 58) != -1)
          OALSource::SetDistanceParams(this, 0, 0);
      }
    }
    if (v6)
      (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
  }
  *((_BYTE *)this + 17) = 1;
  return 0;
}

void sub_215C49700(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetConeInnerAngle(OALSource *this, float a2)
{
  float *v4;
  int v5;

  v4 = (float *)((char *)this + 80);
  v5 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  if (v4[52] != a2)
  {
    *((float *)this + 72) = a2;
    *((_BYTE *)this + 17) = 1;
  }
  if (v5)
    (*(void (**)(float *))(*(_QWORD *)v4 + 24))(v4);
  return 0;
}

uint64_t OALSource::SetConeOuterAngle(OALSource *this, float a2)
{
  float *v4;
  int v5;

  v4 = (float *)((char *)this + 80);
  v5 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  if (v4[53] != a2)
  {
    *((float *)this + 73) = a2;
    *((_BYTE *)this + 17) = 1;
  }
  if (v5)
    (*(void (**)(float *))(*(_QWORD *)v4 + 24))(v4);
  return 0;
}

uint64_t OALSource::SetConeOuterGain(OALSource *this, float a2)
{
  float *v5;
  uint64_t result;

  if (a2 <= 0.0)
    return 40963;
  if (a2 < 0.0 || a2 > 1.0)
    return 0;
  v5 = (float *)((char *)this + 80);
  result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  if (v5[54] != a2)
  {
    *((float *)this + 74) = a2;
    *((_BYTE *)this + 17) = 1;
  }
  if ((_DWORD)result)
  {
    (*(void (**)(float *))(*(_QWORD *)v5 + 24))(v5);
    return 0;
  }
  return result;
}

float OALSource::GetPitch(OALSource *this)
{
  return *((float *)this + 78);
}

float OALSource::GetGain(OALSource *this)
{
  return *((float *)this + 77);
}

float OALSource::GetMinGain(OALSource *this)
{
  return *((float *)this + 83);
}

float OALSource::GetMaxGain(OALSource *this)
{
  return *((float *)this + 84);
}

float OALSource::GetReferenceDistance(OALSource *this)
{
  return *((float *)this + 81);
}

float OALSource::GetMaxDistance(OALSource *this)
{
  return *((float *)this + 82);
}

float OALSource::GetRollOffFactor(OALSource *this)
{
  return *((float *)this + 80);
}

uint64_t OALSource::GetLooping(OALSource *this)
{
  return *((unsigned int *)this + 69);
}

float OALSource::GetPosition(OALSource *this, float *a2, float *a3, float *a4)
{
  float result;

  *a2 = *((float *)this + 60);
  *a3 = *((float *)this + 61);
  result = *((float *)this + 62);
  *a4 = result;
  return result;
}

float OALSource::GetVelocity(OALSource *this, float *a2, float *a3, float *a4)
{
  float result;

  *a2 = *((float *)this + 63);
  *a3 = *((float *)this + 64);
  result = *((float *)this + 65);
  *a4 = result;
  return result;
}

float OALSource::GetDirection(OALSource *this, float *a2, float *a3, float *a4)
{
  float result;

  *a2 = *((float *)this + 66);
  *a3 = *((float *)this + 67);
  result = *((float *)this + 68);
  *a4 = result;
  return result;
}

uint64_t OALSource::GetSourceRelative(OALSource *this)
{
  return *((unsigned int *)this + 70);
}

uint64_t OALSource::GetSourceType(OALSource *this)
{
  return *((unsigned int *)this + 71);
}

float OALSource::GetConeInnerAngle(OALSource *this)
{
  return *((float *)this + 72);
}

float OALSource::GetConeOuterAngle(OALSource *this)
{
  return *((float *)this + 73);
}

float OALSource::GetConeOuterGain(OALSource *this)
{
  return *((float *)this + 74);
}

uint64_t OALSource::GetState(OALSource *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 76);
  if ((result - 56577) <= 5)
    return dword_215C560B8[(int)result - 56577];
  return result;
}

uint64_t OALSource::GetToken(OALSource *this)
{
  return *(unsigned int *)this;
}

uint64_t OALSource::GetQLength(OALSource *this)
{
  uint64_t v1;

  v1 = 52;
  if (!*((_BYTE *)this + 352))
    v1 = 48;
  return *(unsigned int *)((char *)this + v1);
}

uint64_t OALSource::IsSourceTransitioningToFlushQ(OALSource *this)
{
  return *((unsigned __int8 *)this + 352);
}

uint64_t OALSource::GetBuffersProcessed(OALSource *this)
{
  int v1;
  BOOL v2;
  unsigned int *v6;
  uint64_t v7;
  pthread_t v8;
  _opaque_pthread_t *v9;
  unsigned int v10;
  int v11;
  OALSource *v12;
  unsigned int v13;

  v1 = *((_DWORD *)this + 76);
  v2 = v1 == 4113 || v1 == 56580;
  if (v2 || *((_DWORD *)this + 71) == 1735095154 || *((_BYTE *)this + 352))
    return 0;
  if (v1 == 56577 || v1 == 4116)
    return *((unsigned int *)this + 12);
  if (*((_BYTE *)this + 60))
  {
    v6 = (unsigned int *)((char *)this + 64);
    v7 = *((_QWORD *)this + 1);
    v8 = pthread_self();
    v9 = *(_opaque_pthread_t **)(v7 + 480);
    if (v8 != v9)
    {
      do
        v10 = __ldaxr(v6);
      while (__stlxr(v10 + 1, v6));
      while (*((_DWORD *)this + 17))
        usleep(0x1F4u);
    }
    v11 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
    OALSource::ClearActiveQueue(this, v12);
    if (v11)
      (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
    if (v8 != v9)
    {
      do
        v13 = __ldaxr(v6);
      while (__stlxr(v13 - 1, v6));
    }
  }
  return *(unsigned int *)(*((_QWORD *)this + 4) + 24);
}

void sub_215C49B68(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v7;

  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (v1 != v5)
  {
    do
      v7 = __ldaxr(v4);
    while (__stlxr(v7 - 1, v4));
  }
  _Unwind_Resume(exception_object);
}

void OALSource::ClearActiveQueue(OALSource *this, OALSource *a2)
{
  uint64_t *i;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char **v9;
  char *v10;
  char *v11;
  int64_t v12;
  char *v13;

  for (i = (uint64_t *)*((_QWORD *)this + 3);
        *((_DWORD *)i + 6);
        *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *((_DWORD *)i + 6))
  {
    v6 = *i;
    v5 = i[1];
    v7 = v6 == v5;
    if (v6 == v5)
      v8 = 0;
    else
      v8 = v6;
    if (!v7)
      *(_DWORD *)(v6 + 20) = 2;
    BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v8, *(OALBuffer **)(v8 + 8), *(_DWORD *)(v8 + 24));
    v9 = (char **)*((_QWORD *)this + 3);
    v11 = *v9;
    v10 = v9[1];
    if (*v9 == v10)
    {
      v4 = *v9;
    }
    else
    {
      a2 = (OALSource *)(v11 + 32);
      v12 = v10 - (v11 + 32);
      if (v10 != v11 + 32)
        memmove(*v9, a2, v10 - (v11 + 32));
      v13 = *v9;
      v4 = &v11[v12];
      v9[1] = &v11[v12];
      v11 = v13;
    }
    *((_DWORD *)v9 + 6) = (unint64_t)(v4 - v11) >> 5;
    i = (uint64_t *)*((_QWORD *)this + 3);
  }
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 0;
}

uint64_t OALSource::SetBuffer(OALSource *this, int a2, OALBuffer *a3)
{
  uint64_t v3;
  unsigned int *v6;
  uint64_t v7;
  pthread_t v8;
  _opaque_pthread_t *v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  OALSource *v19;
  BufferQueue *v20;
  int v21;
  uint64_t v22;
  char **v23;
  char *v24;
  char *v25;
  int64_t v26;
  char *v27;
  unsigned int v28;
  int v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v3 = (uint64_t)a3;
  v39 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return v3;
  v6 = (unsigned int *)((char *)this + 64);
  v7 = *((_QWORD *)this + 1);
  v8 = pthread_self();
  v9 = *(_opaque_pthread_t **)(v7 + 480);
  if (v8 != v9)
  {
    do
      v10 = __ldaxr(v6);
    while (__stlxr(v10 + 1, v6));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v11 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v12 = v11;
  v13 = *((_DWORD *)this + 76);
  if ((v13 - 56577) > 5)
  {
    if ((v13 - 4114) >= 2)
    {
      OALSource::FlushBufferQueue(this);
      if (a2)
      {
        v20 = (BufferQueue *)*((_QWORD *)this + 3);
        if (*(_QWORD *)v20 == *((_QWORD *)v20 + 1))
        {
          *((_DWORD *)this + 14) = 0;
          *((_BYTE *)this + 60) = 0;
        }
        BufferQueue::AppendBuffer(v20, v19, a2, (OALBuffer *)v3, 0);
        *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *(_DWORD *)(*((_QWORD *)this + 3) + 24);
        OALBuffer::UseThisBuffer((OALBuffer *)v3, this);
        v3 = 0;
        *((_DWORD *)this + 71) = 4136;
        if (!v12)
          goto LABEL_40;
      }
      else
      {
        v3 = 0;
        *((_DWORD *)this + 71) = 4144;
        if (!v12)
          goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if (((1 << (v13 - 1)) & 0x36) == 0)
  {
    v30 = v11;
    if (!a2)
    {
      *((_DWORD *)this + 71) = 4144;
      *((_BYTE *)this + 352) = 1;
      *((_DWORD *)this + 13) = 0;
      v21 = *(_DWORD *)(*((_QWORD *)this + 5) + 24);
      if (v21)
      {
        v22 = *((_QWORD *)this + 4);
        if (*(_QWORD *)v22 == *(_QWORD *)(v22 + 8))
        {
          do
          {
            *(_DWORD *)(v22 + 24) = 0;
            --v21;
          }
          while (v21);
        }
        else
        {
          do
          {
            while (1)
            {
              v23 = (char **)*((_QWORD *)this + 4);
              v25 = *v23;
              v24 = v23[1];
              if (*v23 != v24)
                break;
              *((_DWORD *)v23 + 6) = 0;
              if (!--v21)
                goto LABEL_10;
            }
            v26 = v24 - (v25 + 32);
            if (v24 != v25 + 32)
              memmove(*v23, v25 + 32, v24 - (v25 + 32));
            v27 = *v23;
            v23[1] = &v25[v26];
            *((_DWORD *)v23 + 6) = (unint64_t)(&v25[v26] - v27) >> 5;
            --v21;
          }
          while (v21);
        }
      }
    }
LABEL_10:
    *(_BYTE *)(v3 + 352) = 1;
    v14 = operator new();
    *(_DWORD *)(v14 + 8) = 3;
    *(_QWORD *)(v14 + 16) = v3;
    *(_DWORD *)(v14 + 24) = 0;
    v15 = (unint64_t *)((char *)this + 424);
LABEL_18:
    v17 = *v15;
    *(_QWORD *)v14 = *v15;
    do
    {
      v18 = __ldaxr(v15);
      if (v18 != v17)
      {
        __clrex();
        goto LABEL_18;
      }
    }
    while (__stlxr(v14, v15));
    OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
    v3 = 0;
    if (!v30)
      goto LABEL_40;
    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v16 = *(unsigned int *)this;
    *(_DWORD *)buf = 136315906;
    v32 = "oalSource.cpp";
    v33 = 1024;
    v34 = 885;
    v35 = 2048;
    v36 = v16;
    v37 = 2048;
    v3 = 40964;
    v38 = 40964;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetBuffer FAILED - OALSource = %ld : result = %ld", buf, 0x26u);
    if (!v12)
      goto LABEL_40;
LABEL_39:
    (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
    goto LABEL_40;
  }
  v3 = 40964;
  if (v12)
    goto LABEL_39;
LABEL_40:
  if (v8 != v9)
  {
    do
      v28 = __ldaxr(v6);
    while (__stlxr(v28 - 1, v6));
  }
  return v3;
}

void sub_215C4A000(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::GetBuffer(OALSource *this)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;

  if (*((_DWORD *)this + 71) != 4136)
    return 0;
  v1 = (uint64_t *)*((_QWORD *)this + 3);
  if (!*((_DWORD *)v1 + 6))
  {
    v3 = (uint64_t *)*((_QWORD *)this + 4);
    if (!*((_DWORD *)v3 + 6))
      return 0;
    v2 = *v3;
    if (*v3 == v3[1])
      return 0;
    return **(unsigned int **)(v2 + 8);
  }
  v2 = *v1;
  if (*v1 != v1[1])
    return **(unsigned int **)(v2 + 8);
  return 0;
}

uint64_t OALSource::AddToQueue(OALSource *this, int a2, OALBuffer *a3)
{
  unsigned int *v6;
  uint64_t v7;
  pthread_t v8;
  _opaque_pthread_t *v9;
  unsigned int v10;
  char *v11;
  OALSource *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  BufferQueue *v17;
  unsigned int v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int *)((char *)this + 64);
  v7 = *((_QWORD *)this + 1);
  v8 = pthread_self();
  v9 = *(_opaque_pthread_t **)(v7 + 480);
  if (v8 != v9)
  {
    do
      v10 = __ldaxr(v6);
    while (__stlxr(v10 + 1, v6));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v11 = (char *)this + 80;
  v13 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v14 = *((_DWORD *)this + 71);
  switch(v14)
  {
    case 4136:
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v15 = *(unsigned int *)this;
        v20 = 136315906;
        v21 = "oalSource.cpp";
        v22 = 1024;
        v23 = 960;
        v24 = 2048;
        v25 = v15;
        v26 = 2048;
        v16 = 40964;
        v27 = 40964;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::AddToQueue FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v20, 0x26u);
        if (!v13)
          goto LABEL_19;
      }
      else
      {
        v16 = 40964;
        if (!v13)
          goto LABEL_19;
      }
LABEL_18:
      (*(void (**)(char *))(*(_QWORD *)v11 + 24))(v11);
      goto LABEL_19;
    case 4144:
      *((_DWORD *)this + 71) = 4137;
      break;
    case 1735095154:
      goto LABEL_9;
  }
  v17 = (BufferQueue *)*((_QWORD *)this + 3);
  if (*(_QWORD *)v17 == *((_QWORD *)v17 + 1))
  {
    *((_DWORD *)this + 14) = 0;
    *((_BYTE *)this + 60) = 0;
  }
  BufferQueue::AppendBuffer(v17, v12, a2, a3, 0);
  *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *(_DWORD *)(*((_QWORD *)this + 3) + 24);
  OALBuffer::UseThisBuffer(a3, this);
  v16 = 0;
  if (v13)
    goto LABEL_18;
LABEL_19:
  if (v8 != v9)
  {
    do
      v18 = __ldaxr(v6);
    while (__stlxr(v18 - 1, v6));
  }
  return v16;
}

void sub_215C4A2B8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::AddToTempQueue(OALSource *this, int a2, OALBuffer *a3)
{
  unsigned int *v6;
  uint64_t v7;
  pthread_t v8;
  _opaque_pthread_t *v9;
  unsigned int v10;
  int v11;
  OALSource *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;
  unsigned int v18;

  v6 = (unsigned int *)((char *)this + 64);
  v7 = *((_QWORD *)this + 1);
  v8 = pthread_self();
  v9 = *(_opaque_pthread_t **)(v7 + 480);
  if (v8 != v9)
  {
    do
      v10 = __ldaxr(v6);
    while (__stlxr(v10 + 1, v6));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v11 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  BufferQueue::AppendBuffer(*((BufferQueue **)this + 5), v12, a2, a3, 0);
  OALBuffer::UseThisBuffer(a3, this);
  ++*((_DWORD *)this + 13);
  v13 = operator new();
  *(_DWORD *)(v13 + 8) = 12;
  *(_QWORD *)(v13 + 16) = 0;
  *(_DWORD *)(v13 + 24) = 1;
  v14 = (unint64_t *)((char *)this + 424);
LABEL_8:
  v15 = *v14;
  *(_QWORD *)v13 = *v14;
  do
  {
    v16 = __ldaxr(v14);
    if (v16 != v15)
    {
      __clrex();
      goto LABEL_8;
    }
  }
  while (__stlxr(v13, v14));
  result = OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
  if (v11)
    result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
  if (v8 != v9)
  {
    do
      v18 = __ldaxr(v6);
    while (__stlxr(v18 - 1, v6));
  }
  return result;
}

void sub_215C4A460(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;

  if (v1 != v3)
  {
    do
      v4 = __ldaxr(v2);
    while (__stlxr(v4 - 1, v2));
  }
  _Unwind_Resume(exception_object);
}

void BufferQueue::AppendBuffer(BufferQueue *this, OALSource *a2, int a3, OALBuffer *a4, int a5)
{
  unint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;

  v10 = (_DWORD *)*((_QWORD *)this + 1);
  v9 = *((_QWORD *)this + 2);
  if ((unint64_t)v10 >= v9)
  {
    v12 = *(_DWORD **)this;
    v13 = ((uint64_t)v10 - *(_QWORD *)this) >> 5;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 59)
      std::vector<SourceAttachedInfo>::__throw_length_error[abi:ne180100]();
    v15 = v9 - (_QWORD)v12;
    if (v15 >> 4 > v14)
      v14 = v15 >> 4;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0)
      v16 = 0x7FFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
    {
      if (v16 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v17 = (char *)operator new(32 * v16);
    }
    else
    {
      v17 = 0;
    }
    v18 = &v17[32 * v13];
    *(_DWORD *)v18 = a3;
    *((_QWORD *)v18 + 1) = a4;
    *((_QWORD *)v18 + 2) = 0;
    *((_DWORD *)v18 + 6) = a5;
    v11 = v18 + 32;
    if (v10 != v12)
    {
      do
      {
        v19 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v18 - 1) = v19;
        v18 -= 32;
        v10 -= 8;
      }
      while (v10 != v12);
      v10 = *(_DWORD **)this;
    }
    *(_QWORD *)this = v18;
    *((_QWORD *)this + 1) = v11;
    *((_QWORD *)this + 2) = &v17[32 * v16];
    if (v10)
      operator delete(v10);
  }
  else
  {
    *v10 = a3;
    *((_QWORD *)v10 + 1) = a4;
    *((_QWORD *)v10 + 2) = 0;
    v11 = v10 + 8;
    v10[6] = a5;
  }
  *((_QWORD *)this + 1) = v11;
  *((_DWORD *)this + 6) = ((unint64_t)v11 - *(_QWORD *)this) >> 5;
}

uint64_t OALSource::RemoveBuffersFromQueue(OALSource *this, unsigned int a2, unsigned int *a3)
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int *v7;
  uint64_t v8;
  pthread_t v9;
  _opaque_pthread_t *v10;
  unsigned int v11;
  char *v12;
  OALSource *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  unsigned int v47;
  unint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  char **v60;
  char *v61;
  char *v62;
  int64_t v63;
  char *v64;
  _opaque_pthread_t *v65;
  _opaque_pthread_t *v66;
  int v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  int v73;
  __int16 v74;
  unsigned int v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  v3 = 0;
  v78 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return v3;
  v4 = a3;
  if (!a3)
    return v3;
  v7 = (unsigned int *)((char *)this + 64);
  v8 = *((_QWORD *)this + 1);
  v9 = pthread_self();
  v10 = *(_opaque_pthread_t **)(v8 + 480);
  if (v9 != v10)
  {
    do
      v11 = __ldaxr(v7);
    while (__stlxr(v11 + 1, v7));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v12 = (char *)this + 80;
  v67 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v14 = 52;
  if (!*((_BYTE *)this + 352))
    v14 = 48;
  if (*(_DWORD *)((char *)this + v14) < a2)
  {
LABEL_11:
    v3 = 40964;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_DWORD *)this;
      *(_DWORD *)buf = 136316162;
      v69 = "oalSource.cpp";
      v70 = 1024;
      v71 = 1102;
      v72 = 1024;
      v73 = v15;
      v74 = 1024;
      v75 = a2;
      v76 = 1024;
      v77 = 40964;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::RemoveBuffersFromQueue FAILED - OALSource = %d : count = %d : result = %d", buf, 0x24u);
    }
    if (!v67)
      goto LABEL_60;
    goto LABEL_59;
  }
  if (*((_BYTE *)this + 352))
  {
    v16 = operator new();
    *(_DWORD *)(v16 + 8) = 8;
    *(_QWORD *)(v16 + 16) = 0;
    *(_DWORD *)(v16 + 24) = a2;
    v17 = (unint64_t *)((char *)this + 424);
    while (1)
    {
      v18 = *v17;
      *(_QWORD *)v16 = *v17;
      while (1)
      {
        v19 = __ldaxr(v17);
        if (v19 != v18)
          break;
        if (!__stlxr(v16, v17))
          goto LABEL_21;
      }
      __clrex();
    }
  }
  v25 = *((_DWORD *)this + 76);
  if (v25 > 4115)
  {
    if (v25 != 4116)
    {
      if (v25 == 56577 || v25 == 56580)
      {
        v49 = operator new();
        *(_DWORD *)(v49 + 8) = 8;
        *(_QWORD *)(v49 + 16) = 0;
        *(_DWORD *)(v49 + 24) = a2;
        v50 = (unint64_t *)((char *)this + 424);
LABEL_68:
        v51 = *v50;
        *(_QWORD *)v49 = *v50;
        do
        {
          v52 = __ldaxr(v50);
          if (v52 != v51)
          {
            __clrex();
            goto LABEL_68;
          }
        }
        while (__stlxr(v49, v50));
LABEL_21:
        OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
      }
      goto LABEL_22;
    }
    goto LABEL_73;
  }
  if ((v25 - 4114) >= 2)
  {
    if (v25 != 4113)
      goto LABEL_22;
LABEL_73:
    v53 = (uint64_t *)*((_QWORD *)this + 3);
    if (*((_DWORD *)v53 + 6))
    {
      do
      {
        v57 = *v53;
        v56 = v53[1];
        v58 = v57 == v56;
        if (v57 == v56)
          v59 = 0;
        else
          v59 = v57;
        if (!v58)
          *(_DWORD *)(v57 + 20) = 2;
        BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), v13, *(_DWORD *)v59, *(OALBuffer **)(v59 + 8), *(_DWORD *)(v59 + 24));
        v60 = (char **)*((_QWORD *)this + 3);
        v62 = *v60;
        v61 = v60[1];
        if (*v60 == v61)
        {
          v54 = *v60;
        }
        else
        {
          v13 = (OALSource *)(v62 + 32);
          v63 = v61 - (v62 + 32);
          if (v61 != v62 + 32)
            memmove(*v60, v13, v61 - (v62 + 32));
          v64 = *v60;
          v54 = &v62[v63];
          v60[1] = &v62[v63];
          v62 = v64;
        }
        *((_DWORD *)v60 + 6) = (unint64_t)(v54 - v62) >> 5;
        v53 = (uint64_t *)*((_QWORD *)this + 3);
        v55 = *((_QWORD *)this + 4);
        *((_DWORD *)this + 12) = *(_DWORD *)(v55 + 24) + *((_DWORD *)v53 + 6);
      }
      while (*((_DWORD *)v53 + 6));
      v12 = (char *)this + 80;
    }
    else
    {
      v55 = *((_QWORD *)this + 4);
    }
    *((_DWORD *)this + 14) = 0;
    *((_BYTE *)this + 60) = 0;
    v26 = *(_DWORD *)(v55 + 24);
    goto LABEL_89;
  }
  if (*((_DWORD *)this + 69) == 1)
    goto LABEL_11;
  v26 = *(_DWORD *)(*((_QWORD *)this + 4) + 24);
LABEL_89:
  if (v26 < a2)
    goto LABEL_11;
LABEL_22:
  v65 = v10;
  v66 = v9;
  if (*((_BYTE *)this + 352))
  {
    v20 = (uint64_t *)*((_QWORD *)this + 5);
    v21 = *v20;
    v22 = v20[1];
    v23 = a2;
    do
    {
      if (v21 == v22)
        v24 = 0;
      else
        v24 = **(_DWORD **)(v21 + 8);
      *v4++ = v24;
      --*((_DWORD *)this + 13);
      v21 += 32;
      --v23;
    }
    while (v23);
    goto LABEL_55;
  }
  v27 = 0;
  v28 = 0;
  v29 = a2 - 1;
LABEL_39:
  v34 = *((_DWORD *)this + 76);
  if (v34 == 56580 || v34 == 56577)
  {
    v36 = *((_QWORD *)this + 4);
    if (v28 >= *(unsigned int *)(v36 + 24))
    {
      v46 = (_QWORD *)*((_QWORD *)this + 3);
      v38 = *v46 + 32 * (v28 - *(_DWORD *)(v36 + 24));
      if (v38 == v46[1])
        goto LABEL_46;
    }
    else
    {
      v37 = *(_QWORD *)(v36 + 8);
      v38 = *(_QWORD *)v36 + v27;
      if (v38 == v37)
      {
LABEL_46:
        v4[v28] = 0;
        goto LABEL_37;
      }
    }
    v4[v28] = **(_DWORD **)(v38 + 8);
    goto LABEL_37;
  }
  v39 = (uint64_t *)*((_QWORD *)this + 4);
  v40 = *v39;
  if (*v39 == v39[1])
  {
    v41 = 0;
    v45 = *v39;
  }
  else
  {
    v41 = *(_DWORD *)v40;
    OALBuffer::ReleaseBuffer(*(OALBuffer **)(v40 + 8), this);
    v42 = v39[1];
    v43 = v42 - (v40 + 32);
    if (v42 != v40 + 32)
      memmove((void *)v40, (const void *)(v40 + 32), v42 - (v40 + 32));
    v44 = *v39;
    v45 = v40 + v43;
    v39[1] = v40 + v43;
    v40 = v44;
  }
  *((_DWORD *)v39 + 6) = (unint64_t)(v45 - v40) >> 5;
  *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *(_DWORD *)(*((_QWORD *)this + 3) + 24);
  v4[v28] = v41;
  v12 = (char *)this + 80;
LABEL_37:
  while (v29 != v28)
  {
    v27 += 32;
    ++v28;
    if (!*((_BYTE *)this + 352))
      goto LABEL_39;
    v30 = (_QWORD *)*((_QWORD *)this + 5);
    v31 = v30[1];
    v32 = *v30 + v27;
    if (v32 == v31)
      v33 = 0;
    else
      v33 = **(_DWORD **)(v32 + 8);
    v4[v28] = v33;
    --*((_DWORD *)this + 13);
  }
LABEL_55:
  if (!*((_DWORD *)this + 12))
  {
    v3 = 0;
    *((_DWORD *)this + 71) = 4144;
    v10 = v65;
    v9 = v66;
    if (!v67)
      goto LABEL_60;
    goto LABEL_59;
  }
  v3 = 0;
  v10 = v65;
  v9 = v66;
  if (v67)
LABEL_59:
    (*(void (**)(char *))(*(_QWORD *)v12 + 24))(v12);
LABEL_60:
  if (v9 != v10)
  {
    do
      v47 = __ldaxr(v7);
    while (__stlxr(v47 - 1, v7));
  }
  return v3;
}

void sub_215C4AB54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  unsigned int *v13;
  unsigned int v15;

  if (a13)
    (*(void (**)(uint64_t))(*(_QWORD *)a11 + 24))(a11);
  if (a10 != a9)
  {
    do
      v15 = __ldaxr(v13);
    while (__stlxr(v15 - 1, v13));
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::PostRenderRemoveBuffersFromQueue(OALSource *this, OALSource *a2)
{
  unsigned int v2;
  uint64_t *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  char **v11;
  char *v12;
  char *v13;
  int64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  OALBuffer **v18;
  OALBuffer **v19;
  OALBuffer **v20;
  int64_t v21;
  OALBuffer **v22;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v2 = a2;
  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t *)*((_QWORD *)this + 3);
  if (*((_DWORD *)v4 + 6))
  {
    do
    {
      v8 = *v4;
      v7 = v4[1];
      v9 = v8 == v7;
      if (v8 == v7)
        v10 = 0;
      else
        v10 = v8;
      if (!v9)
        *(_DWORD *)(v8 + 20) = 2;
      BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v10, *(OALBuffer **)(v10 + 8), *(_DWORD *)(v10 + 24));
      v11 = (char **)*((_QWORD *)this + 3);
      v13 = *v11;
      v12 = v11[1];
      if (*v11 == v12)
      {
        v5 = *v11;
      }
      else
      {
        a2 = (OALSource *)(v13 + 32);
        v14 = v12 - (v13 + 32);
        if (v12 != v13 + 32)
          memmove(*v11, a2, v12 - (v13 + 32));
        v15 = *v11;
        v5 = &v13[v14];
        v11[1] = &v13[v14];
        v13 = v15;
      }
      *((_DWORD *)v11 + 6) = (unint64_t)(v5 - v13) >> 5;
      v4 = (uint64_t *)*((_QWORD *)this + 3);
      v6 = *((_QWORD *)this + 4);
      *((_DWORD *)this + 12) = *(_DWORD *)(v6 + 24) + *((_DWORD *)v4 + 6);
    }
    while (*((_DWORD *)v4 + 6));
  }
  else
  {
    v6 = *((_QWORD *)this + 4);
  }
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 0;
  if (*(_DWORD *)(v6 + 24) >= v2)
  {
    if (v2)
    {
      if (*(_QWORD *)v6 == *(_QWORD *)(v6 + 8))
      {
        do
        {
          *(_DWORD *)(v6 + 24) = 0;
          *((_DWORD *)this + 12) = *(_DWORD *)(v6 + 24) + *((_DWORD *)v4 + 6);
          --v2;
        }
        while (v2);
      }
      else
      {
        do
        {
          v19 = *(OALBuffer ***)v6;
          if (*(_QWORD *)v6 == *(_QWORD *)(v6 + 8))
          {
            v18 = *(OALBuffer ***)v6;
          }
          else
          {
            OALBuffer::ReleaseBuffer(v19[1], this);
            v20 = *(OALBuffer ***)(v6 + 8);
            v21 = (char *)v20 - (char *)(v19 + 4);
            if (v20 != v19 + 4)
              memmove(v19, v19 + 4, (char *)v20 - (char *)(v19 + 4));
            v22 = *(OALBuffer ***)v6;
            v18 = (OALBuffer **)((char *)v19 + v21);
            *(_QWORD *)(v6 + 8) = (char *)v19 + v21;
            v19 = v22;
          }
          *(_DWORD *)(v6 + 24) = (unint64_t)((char *)v18 - (char *)v19) >> 5;
          v6 = *((_QWORD *)this + 4);
          *((_DWORD *)this + 12) = *(_DWORD *)(v6 + 24) + *(_DWORD *)(*((_QWORD *)this + 3) + 24);
          --v2;
        }
        while (v2);
      }
    }
    v17 = 0;
    if (!*((_DWORD *)this + 12))
      *((_DWORD *)this + 71) = 4144;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v16 = *(unsigned int *)this;
    v24 = 136316162;
    v25 = "oalSource.cpp";
    v26 = 1024;
    v27 = 1139;
    v28 = 2048;
    v29 = v16;
    v30 = 2048;
    v31 = v2;
    v32 = 2048;
    v17 = 40964;
    v33 = 40964;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::RemoveBuffersFromQueue FAILED - OALSource = %ld : count = %ld : result = %ld", (uint8_t *)&v24, 0x30u);
  }
  else
  {
    return 40964;
  }
  return v17;
}

uint64_t OALSource::PostRenderAddBuffersToQueue(OALSource *this, OALSource *a2)
{
  uint64_t v2;
  int v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  OALBuffer *v10;
  BufferQueue *v11;
  uint64_t v12;
  OALBuffer **v13;
  OALBuffer **v14;
  int64_t v15;
  OALBuffer **v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v2 = (uint64_t)a2;
  v28 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)this + 71);
  if (v4 == 4136 || v4 == 1735095154)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v6 = *(unsigned int *)this;
      v18 = 136316162;
      v19 = "oalSource.cpp";
      v20 = 1024;
      v21 = 1169;
      v22 = 2048;
      v23 = v6;
      v24 = 2048;
      v25 = v2;
      v26 = 2048;
      v2 = 40964;
      v27 = 40964;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::RemoveBuffersFromQueue FAILED - OALSource = %ld : count = %ld : result = %ld", (uint8_t *)&v18, 0x30u);
    }
    else
    {
      return 40964;
    }
  }
  else
  {
    if (v4 == 4144)
      *((_DWORD *)this + 71) = 4137;
    if ((_DWORD)a2)
    {
      do
      {
        while (1)
        {
          v7 = (uint64_t *)*((_QWORD *)this + 5);
          if (*v7 == v7[1])
            v8 = 0;
          else
            v8 = *v7;
          v9 = *(_DWORD *)v8;
          v10 = *(OALBuffer **)(v8 + 8);
          v11 = (BufferQueue *)*((_QWORD *)this + 3);
          if (*(_QWORD *)v11 == *((_QWORD *)v11 + 1))
          {
            *((_DWORD *)this + 14) = 0;
            *((_BYTE *)this + 60) = 0;
          }
          BufferQueue::AppendBuffer(v11, a2, v9, v10, 0);
          *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *(_DWORD *)(*((_QWORD *)this + 3) + 24);
          OALBuffer::UseThisBuffer(v10, this);
          v12 = *((_QWORD *)this + 5);
          v13 = *(OALBuffer ***)v12;
          if (*(_QWORD *)v12 != *(_QWORD *)(v12 + 8))
            break;
          *(_DWORD *)(v12 + 24) = 0;
          v2 = (v2 - 1);
          if (!(_DWORD)v2)
            return v2;
        }
        OALBuffer::ReleaseBuffer(v13[1], this);
        v14 = *(OALBuffer ***)(v12 + 8);
        a2 = (OALSource *)(v13 + 4);
        v15 = (char *)v14 - (char *)(v13 + 4);
        if (v14 != v13 + 4)
          memmove(v13, a2, (char *)v14 - (char *)(v13 + 4));
        v16 = *(OALBuffer ***)v12;
        *(_QWORD *)(v12 + 8) = (char *)v13 + v15;
        *(_DWORD *)(v12 + 24) = (unint64_t)((char *)v13 + v15 - (char *)v16) >> 5;
        v2 = (v2 - 1);
      }
      while ((_DWORD)v2);
    }
  }
  return v2;
}

uint64_t OALSource::SetupMixerBus(OALSource *this, CAStreamBasicDescription *a2)
{
  uint64_t updated;
  AudioUnitElement v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  OALContext *v9;
  int v10;
  AudioUnitElement AvailableMonoBus;
  float v12;
  float v13;
  float v14;
  float v15;
  AudioUnitElement v16;
  uint64_t v17;
  AudioUnitElement v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  MixerDistanceParams buf;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  if (*((_DWORD *)this + 58) != -1)
    goto LABEL_2;
  v8 = *((_DWORD *)a2 + 7);
  v9 = (OALContext *)*((_QWORD *)this + 1);
  v10 = *(_DWORD *)this;
  if (v8 == 1)
  {
    AvailableMonoBus = OALContext::GetAvailableMonoBus(v9, v10);
    *((_DWORD *)this + 58) = AvailableMonoBus;
    if (AvailableMonoBus != -1)
      goto LABEL_11;
LABEL_27:
    updated = 0xFFFFFFFFLL;
    goto LABEL_28;
  }
  AvailableMonoBus = OALContext::GetAvailableStereoBus(v9, v10);
  *((_DWORD *)this + 58) = AvailableMonoBus;
  if (AvailableMonoBus == -1)
    goto LABEL_27;
LABEL_11:
  OALContext::GetBusFormat(*((_QWORD *)this + 1), AvailableMonoBus, &v21);
  if (*(double *)&v21 != *(double *)a2 || (_DWORD)v23 != *((_DWORD *)a2 + 8) || HIDWORD(v22) >= 2)
    *((_BYTE *)this + 18) = 1;
  v12 = *((float *)this + 81);
  v13 = *((float *)this + 82);
  v14 = log10f(v12 / (float)(v12 + (float)(*((float *)this + 80) * (float)(v13 - v12)))) * 20.0;
  if (v14 >= 0.0)
    v15 = 0.0;
  else
    v15 = -v14;
  if (!OALContext::GetBusDistanceParams(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), &buf)
    && (buf.mReferenceDistance != v12 || buf.mMaxDistance != v13 || buf.mMaxAttenuation != v15))
  {
    buf.mMaxAttenuation = v15;
    *(_QWORD *)&buf.mReferenceDistance = *(_QWORD *)((char *)this + 324);
    OALContext::SetBusDistanceParams(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), &buf);
  }
  v16 = *((_DWORD *)this + 58);
  if (v16 != -1)
  {
    v17 = *((_QWORD *)this + 1);
    if (!*(_DWORD *)(v17 + 492)
      || (AudioUnitSetParameter(*(AudioUnit *)(v17 + 32), 8u, 1u, v16, *((float *)this + 108) * 100.0, 0),
          v16 = *((_DWORD *)this + 58),
          v16 != -1))
    {
      AudioUnitSetParameter(*(AudioUnit *)(*((_QWORD *)this + 1) + 32), 0xAu, 1u, v16, *((AudioUnitParameterValue *)this + 109), 0);
      v18 = *((_DWORD *)this + 58);
      if (v18 != -1)
        AudioUnitSetParameter(*(AudioUnit *)(*((_QWORD *)this + 1) + 32), 0xBu, 1u, v18, *((AudioUnitParameterValue *)this + 110), 0);
    }
  }
LABEL_2:
  *((_BYTE *)this + 20) = 1;
  updated = OALSource::SetPitch(this, *((float *)this + 78));
  if (!(_DWORD)updated)
  {
    *((_BYTE *)this + 17) = 1;
    updated = OALSource::ChangeChannelSettings(this);
    if (!(_DWORD)updated)
    {
      updated = OALSource::UpdateBusGain(this);
      if (!(_DWORD)updated)
      {
        v4 = *((_DWORD *)this + 58);
        if (v4 == -1
          || (v5 = OALContext::SetBusMinGain(*((AudioUnit **)this + 1), v4, *((AudioUnitParameterValue *)this + 83)),
              !(_DWORD)v5))
        {
          updated = OALSource::UpdateMaxBusGain(this);
          if (!(_DWORD)updated)
          {
            updated = OALSource::UpdateBusRenderQuality(this);
            if (!(_DWORD)updated)
              return updated;
          }
        }
        else
        {
          updated = v5;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            v6 = *(unsigned int *)this;
            buf.mReferenceDistance = 4.8153e-34;
            *(_QWORD *)&buf.mMaxDistance = "oalSource.cpp";
            v25 = 1024;
            v26 = 2483;
            v27 = 2048;
            v28 = v6;
            v29 = 2048;
            v30 = (int)updated;
            _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateMinBusGain FAILED - OALSource = %ld : result = %ld", (uint8_t *)&buf, 0x26u);
          }
        }
      }
    }
  }
LABEL_28:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v19 = *(unsigned int *)this;
    buf.mReferenceDistance = 4.8153e-34;
    *(_QWORD *)&buf.mMaxDistance = "oalSource.cpp";
    v25 = 1024;
    v26 = 1266;
    v27 = 2048;
    v28 = v19;
    v29 = 2048;
    v30 = (int)updated;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetupMixerBus FAILED - OALSource = %ld : result = %ld", (uint8_t *)&buf, 0x26u);
  }
  return updated;
}

uint64_t OALSource::ChangeChannelSettings(OALSource *this)
{
  uint64_t *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  float v7;
  uint64_t v8;
  AudioUnitParameterValue *v9;
  uint64_t updated;
  uint64_t v11;
  uint64_t v12;
  float v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 17))
  {
    if (*((_DWORD *)this + 71) == 1735095154)
    {
      if (*((_DWORD *)this + 101) != 1)
      {
LABEL_18:
        *((_BYTE *)this + 17) = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v2 = (uint64_t *)*((_QWORD *)this + 3);
      v3 = *((_DWORD *)this + 14);
      v4 = *v2;
      v5 = v2[1];
      if (v4)
        v6 = v4 + 32 * (__int16)v3 == v5;
      else
        v6 = 1;
      if (v6 || *(_DWORD *)(*(_QWORD *)(v4 + 32 * (__int16)v3 + 8) + 332) != 1)
        goto LABEL_18;
    }
    *(_DWORD *)buf = 0;
    v15 = 0;
    v14 = 0.0;
    OALSource::CalculateDistanceAndAzimuth(this, (float *)&v15 + 1, (float *)buf, (float *)&v15, &v14);
    v7 = v14;
    if (v14 != *((float *)this + 79))
    {
      *((float *)this + 79) = v14;
      OALContext::SetBusPlaybackRate(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), v7 * *((float *)this + 78));
    }
    OALContext::SetBusAzimuth(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), *(AudioUnitParameterValue *)buf);
    OALContext::SetBusElevation(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), *(AudioUnitParameterValue *)&v15);
    v8 = *((_QWORD *)this + 1);
    if (*(_BYTE *)(v8 + 408))
      v9 = (AudioUnitParameterValue *)&v15 + 1;
    else
      v9 = (AudioUnitParameterValue *)((char *)this + 324);
    OALContext::SetBusDistance((AudioUnit *)v8, *((_DWORD *)this + 58), *v9);
    if (OALSource::ConeAttenuation(this))
    {
      updated = OALSource::UpdateBusGain(this);
      if ((_DWORD)updated)
      {
        v11 = updated;
LABEL_21:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v12 = *(unsigned int *)this;
          *(_DWORD *)buf = 136315906;
          v17 = "oalSource.cpp";
          v18 = 1024;
          v19 = 2430;
          v20 = 2048;
          v21 = v12;
          v22 = 2048;
          v23 = (int)v11;
          _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::ChangeChannelSettings FAILED - OALSource = %ld : result = %ld", buf, 0x26u);
        }
        return v11;
      }
    }
    goto LABEL_18;
  }
LABEL_19:
  if (!*((_BYTE *)this + 18))
    return 0;
  v11 = OALSource::UpdateBusFormat(this);
  if ((_DWORD)v11)
    goto LABEL_21;
  return v11;
}

uint64_t OALSource::UpdateBusRenderQuality(OALSource *this)
{
  AudioUnitElement v1;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *((_DWORD *)this + 58);
  if (v1 == -1)
    return 0;
  v3 = OALContext::SetSourceDesiredRenderQualityOnBus(*((AudioUnit **)this + 1), *((_DWORD *)this + 111), v1);
  if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v4 = *(unsigned int *)this;
    v6 = 136315906;
    v7 = "oalSource.cpp";
    v8 = 1024;
    v9 = 2551;
    v10 = 2048;
    v11 = v4;
    v12 = 2048;
    v13 = (int)v3;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateBusRenderQuality FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v6, 0x26u);
  }
  return v3;
}

uint64_t OALSource::PrepBufferQueueForPlayback(OALSource *this, OALSource *a2)
{
  unsigned int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  OALSource::JoinBufferLists(this, a2);
  v3 = *((_DWORD *)this + 85);
  if (v3)
    OALSource::AdvanceQueueToFrameIndex(this, v3);
  v4 = (uint64_t *)*((_QWORD *)this + 3);
  v5 = *v4;
  v6 = v4[1];
  if (v5 == v6)
    return 0;
  v7 = *((_DWORD *)this + 14);
  v8 = v5 + 32 * (__int16)v7;
  if (!v5 || v8 == v6)
    return 0;
  v11 = (__int16)v7;
  v12 = v7 + 1;
  while (!*(_DWORD *)v8 || !*(_QWORD *)(*(_QWORD *)(v5 + 32 * v11 + 8) + 288))
  {
    *(_DWORD *)(v5 + 32 * v11 + 20) = 2;
    *((_DWORD *)this + 14) = v12;
    v11 = (__int16)v12;
    v8 = v5 + 32 * (__int16)v12++;
    if (v8 == v6)
      return 0;
  }
  v13 = *(_QWORD *)(v8 + 8);
  v14 = *(_DWORD *)(v13 + 300) & 0xFFFFFFFC;
  if ((_DWORD)v14)
  {
    v15 = *(_QWORD *)(v13 + 288);
    v16 = v15 + v14;
    do
      v15 += 4096;
    while (v15 < v16);
  }
  return 1;
}

void OALSource::JoinBufferLists(OALSource *this, OALSource *a2)
{
  uint64_t *v3;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char **v9;
  char *v10;
  char *v11;
  int64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v3 = (uint64_t *)*((_QWORD *)this + 3);
  if (*((_DWORD *)v3 + 6))
  {
    do
    {
      v6 = v3[1];
      v7 = *v3 == v6;
      if (*v3 == v6)
        v8 = 0;
      else
        v8 = *v3;
      if (!v7)
        *(_DWORD *)(*v3 + 20) = 2;
      BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v8, *(OALBuffer **)(v8 + 8), *(_DWORD *)(v8 + 24));
      v9 = (char **)*((_QWORD *)this + 3);
      v11 = *v9;
      v10 = v9[1];
      if (*v9 == v10)
      {
        v4 = *v9;
      }
      else
      {
        a2 = (OALSource *)(v11 + 32);
        v12 = v10 - (v11 + 32);
        if (v10 != v11 + 32)
          memmove(*v9, a2, v10 - (v11 + 32));
        v13 = *v9;
        v4 = &v11[v12];
        v9[1] = &v11[v12];
        v11 = v13;
      }
      *((_DWORD *)v9 + 6) = (unint64_t)(v4 - v11) >> 5;
      v3 = (uint64_t *)*((_QWORD *)this + 3);
      v5 = (uint64_t *)*((_QWORD *)this + 4);
      *((_DWORD *)this + 12) = *((_DWORD *)v5 + 6) + *((_DWORD *)v3 + 6);
    }
    while (*((_DWORD *)v3 + 6));
  }
  else
  {
    v5 = (uint64_t *)*((_QWORD *)this + 4);
  }
  *((_QWORD *)this + 3) = v5;
  *((_QWORD *)this + 4) = v3;
  v15 = *v5;
  v14 = v5[1];
  v16 = v3[1] - *v3;
  v17 = v14 - *v5;
  v7 = v14 == *v5;
  *((_DWORD *)v5 + 6) = v17 >> 5;
  *((_DWORD *)v3 + 6) = v16 >> 5;
  *((_DWORD *)this + 12) = *((_DWORD *)v3 + 6) + *((_DWORD *)v5 + 6);
  if (!v7)
  {
    v18 = v15;
    if (v17 - 32 < 0x20)
      goto LABEL_24;
    v19 = ((v17 - 32) >> 5) + 1;
    v18 = v15 + 32 * (v19 & 0xFFFFFFFFFFFFFFELL);
    v20 = (_QWORD *)(v15 + 48);
    v21 = v19 & 0xFFFFFFFFFFFFFFELL;
    do
    {
      *(v20 - 4) = 0;
      *v20 = 0;
      v20 += 8;
      v21 -= 2;
    }
    while (v21);
    if (v19 != (v19 & 0xFFFFFFFFFFFFFFELL))
    {
LABEL_24:
      do
      {
        *(_QWORD *)(v18 + 16) = 0;
        v18 += 32;
      }
      while (v18 != v14);
    }
  }
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 0;
}

uint64_t OALSource::AdvanceQueueToFrameIndex(OALSource *this, unsigned int a2)
{
  _DWORD *v3;
  int v4;
  uint64_t *v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  int v24;
  _DWORD *v25;
  _DWORD *v26;
  _DWORD *v27;
  NSObject *global_queue;
  _DWORD *v30;
  int v31;
  int v33;
  _QWORD block[6];
  int v35;

  v3 = (_DWORD *)((char *)this + 80);
  v4 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v3[65] = 0;
  v5 = (uint64_t *)*((_QWORD *)v3 - 7);
  v6 = *v5;
  if (*v5 == v5[1])
  {
    v8 = a2;
    if (a2)
      goto LABEL_5;
  }
  else
  {
    v7 = 0;
    do
    {
      v7 += OALBuffer::GetFrameCount(*(OALBuffer **)(v6 + 8));
      v6 += 32;
    }
    while (v6 != v5[1]);
    v8 = a2;
    if (v7 < a2)
    {
LABEL_5:
      v9 = 40963;
      if (!v4)
        return v9;
      goto LABEL_36;
    }
  }
  v33 = *(_DWORD *)(*((_QWORD *)this + 3) + 24);
  if (v33)
  {
    v31 = v4;
    v30 = v3;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = (_QWORD *)*((_QWORD *)this + 3);
      v13 = *v12 == v12[1] ? 0 : *v12;
      v15 = OALBuffer::GetFrameCount(*(OALBuffer **)(v13 + 8)) + v11;
      v16 = (uint64_t *)*((_QWORD *)this + 3);
      v18 = *v16;
      v17 = v16[1];
      if (v15 > v8)
        break;
      if (v18 == v17)
      {
        v21 = *v16;
      }
      else
      {
        *(_DWORD *)(v18 + 20) = 2;
        v14 = (void *)(v18 + 32);
        v19 = v17 - (v18 + 32);
        if (v17 == v18 + 32)
        {
          v20 = v18;
        }
        else
        {
          memmove((void *)v18, v14, v17 - (v18 + 32));
          v20 = *v16;
        }
        v21 = v18 + v19;
        v16[1] = v18 + v19;
        v18 = v20;
      }
      *((_DWORD *)v16 + 6) = (unint64_t)(v21 - v18) >> 5;
      BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), (OALSource *)v14, *(_DWORD *)v13, *(OALBuffer **)(v13 + 8), *(_DWORD *)(v13 + 24));
      *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *(_DWORD *)(*((_QWORD *)this + 3) + 24);
      v22 = (_QWORD *)*((_QWORD *)this + 52);
      if (v22)
      {
        v23 = v22[3];
        if (v23)
        {
          v24 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v23 + 16))(v22[3]);
          v26 = (_DWORD *)*v22;
          v25 = (_DWORD *)v22[1];
          if ((_DWORD *)*v22 != v25)
          {
            v27 = (_DWORD *)*v22;
            do
            {
              if (*v27 == 4118)
              {
                global_queue = dispatch_get_global_queue(0, 0);
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 0x40000000;
                block[2] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
                block[3] = &__block_descriptor_tmp;
                block[4] = v22;
                block[5] = v26;
                v35 = 4118;
                dispatch_async(global_queue, block);
                v25 = (_DWORD *)v22[1];
              }
              v27 += 6;
              v26 += 6;
            }
            while (v27 != v25);
          }
          v8 = a2;
          if (v24)
            (*(void (**)(uint64_t))(*(_QWORD *)v23 + 24))(v23);
        }
      }
      ++v10;
      v11 = v15;
      if (v10 == v33)
        goto LABEL_35;
    }
    if (v18 != v17)
    {
      v9 = 0;
      *(_DWORD *)(v18 + 16) = *(_DWORD *)(*(_QWORD *)(v18 + 8) + 320) * (v8 - v11);
      v3 = v30;
      if (v31)
        goto LABEL_36;
      return v9;
    }
LABEL_35:
    v9 = 0;
    v3 = v30;
    if (!v31)
      return v9;
  }
  else
  {
    v9 = 0;
    if (!v4)
      return v9;
  }
LABEL_36:
  (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 24))(v3);
  return v9;
}

void sub_215C4BC84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11)
{
  if (a11)
    (*(void (**)(uint64_t))(*(_QWORD *)a9 + 24))(a9);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::StartRenderer(OALSource *this)
{
  unsigned int *v2;
  uint64_t v3;
  pthread_t v4;
  _opaque_pthread_t *v5;
  unsigned int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  char v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned int *)((char *)this + 64);
  v3 = *((_QWORD *)this + 1);
  v4 = pthread_self();
  v5 = *(_opaque_pthread_t **)(v3 + 480);
  if (v4 != v5)
  {
    do
      v6 = __ldaxr(v2);
    while (__stlxr(v6 + 1, v2));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v8 = v7;
  if (!*((_QWORD *)this + 45))
  {
    v9 = 0;
    if (!v7)
      goto LABEL_36;
    goto LABEL_35;
  }
  v9 = 0;
  v10 = *((_DWORD *)this + 76);
  v11 = v10 - 1;
  if ((v10 - 56577) > 5)
  {
    if (v10 == 4114)
      goto LABEL_34;
    if (v10 == 4115)
    {
      v9 = OALSource::Resume(this);
      if (!(_DWORD)v9)
        goto LABEL_34;
    }
    else
    {
      v9 = OALSource::SetupMixerBus(this, (OALSource *)((char *)this + 376));
      if (!(_DWORD)v9)
      {
        v9 = OALSource::AddRenderProc(this);
        if (!(_DWORD)v9)
        {
          *((_DWORD *)this + 76) = 4114;
          *((_BYTE *)this + 60) = 0;
          if (!v8)
            goto LABEL_36;
          goto LABEL_35;
        }
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v20 = *(unsigned int *)this;
      v23 = 136315906;
      v24 = "oalSource.cpp";
      v25 = 1024;
      v26 = 1391;
      v27 = 2048;
      v28 = v20;
      v29 = 2048;
      v30 = (int)v9;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::StartRenderer FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v23, 0x26u);
    }
LABEL_34:
    if (!v8)
      goto LABEL_36;
    goto LABEL_35;
  }
  if (((1 << v11) & 0x32) != 0)
    goto LABEL_34;
  if (((1 << v11) & 9) != 0)
  {
    v12 = operator new();
    *(_DWORD *)(v12 + 8) = 4;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = 0;
    v13 = (unint64_t *)((char *)this + 424);
LABEL_18:
    v14 = *v13;
    *(_QWORD *)v12 = *v13;
    do
    {
      v15 = __ldaxr(v13);
      if (v15 != v14)
      {
        __clrex();
        goto LABEL_18;
      }
    }
    while (__stlxr(v12, v13));
    OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
    v9 = 0;
    *((_DWORD *)this + 76) = 56578;
    if (!v8)
      goto LABEL_36;
LABEL_35:
    (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
    goto LABEL_36;
  }
  v16 = operator new();
  *(_DWORD *)(v16 + 8) = 6;
  *(_QWORD *)(v16 + 16) = 0;
  *(_DWORD *)(v16 + 24) = 0;
  v17 = (unint64_t *)((char *)this + 424);
LABEL_25:
  v18 = *v17;
  *(_QWORD *)v16 = *v17;
  do
  {
    v19 = __ldaxr(v17);
    if (v19 != v18)
    {
      __clrex();
      goto LABEL_25;
    }
  }
  while (__stlxr(v16, v17));
  OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
  v9 = 0;
  *((_DWORD *)this + 76) = 56582;
  if (v8)
    goto LABEL_35;
LABEL_36:
  if (v4 != v5)
  {
    do
      v21 = __ldaxr(v2);
    while (__stlxr(v21 - 1, v2));
  }
  return v9;
}

void sub_215C4BFC0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::Resume(OALSource *this)
{
  unsigned int *v2;
  uint64_t v3;
  pthread_t v4;
  _opaque_pthread_t *v5;
  unsigned int v6;
  int v7;
  int v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned int *)((char *)this + 64);
  v3 = *((_QWORD *)this + 1);
  v4 = pthread_self();
  v5 = *(_opaque_pthread_t **)(v3 + 480);
  if (v4 != v5)
  {
    do
      v6 = __ldaxr(v2);
    while (__stlxr(v6 + 1, v2));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v8 = *((_DWORD *)this + 76);
  if (v8 == 4115)
  {
    *((_DWORD *)this + 86) = 1;
    v13 = OALSource::AddRenderProc(this);
    if ((_DWORD)v13)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      v14 = *(unsigned int *)this;
      v17 = 136315906;
      v18 = "oalSource.cpp";
      v19 = 1024;
      v20 = 1634;
      v21 = 2048;
      v22 = v14;
      v23 = 2048;
      v24 = (int)v13;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::Resume FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v17, 0x26u);
      if (!v7)
        goto LABEL_22;
    }
    else
    {
      OALSource::SetPlaybackState(this, 4114, 1);
      v13 = 0;
      if (!v7)
        goto LABEL_22;
    }
LABEL_21:
    (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
    goto LABEL_22;
  }
  if (v8 != 56579)
  {
    v13 = 0;
LABEL_20:
    if (!v7)
      goto LABEL_22;
    goto LABEL_21;
  }
  v9 = operator new();
  *(_DWORD *)(v9 + 8) = 6;
  *(_QWORD *)(v9 + 16) = 0;
  *(_DWORD *)(v9 + 24) = 0;
  v10 = (unint64_t *)((char *)this + 424);
LABEL_10:
  v11 = *v10;
  *(_QWORD *)v9 = *v10;
  do
  {
    v12 = __ldaxr(v10);
    if (v12 != v11)
    {
      __clrex();
      goto LABEL_10;
    }
  }
  while (__stlxr(v9, v10));
  OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
  v13 = 0;
  *((_DWORD *)this + 76) = 56582;
  if (v7)
    goto LABEL_21;
LABEL_22:
  if (v4 != v5)
  {
    do
      v15 = __ldaxr(v2);
    while (__stlxr(v15 - 1, v2));
  }
  return v13;
}

void sub_215C4C254(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t OALSource::AddRenderProc(OALSource *this)
{
  uint64_t v1;
  AudioUnitElement v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 236))
    return 0;
  v4 = *((_DWORD *)this + 58);
  if (v4 == -1)
    return 0xFFFFFFFFLL;
  *((_QWORD *)this + 27) = OALSource::SourceInputProc;
  *((_QWORD *)this + 28) = this;
  v1 = OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v4, (const AURenderCallbackStruct *)((char *)this + 216));
  if ((_DWORD)v1
    || (v1 = AUGraphUpdate(*(AUGraph *)(*(_QWORD *)(*((_QWORD *)this + 1) + 16) + 16), 0), (_DWORD)v1)
    || (v1 = OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1), (_DWORD)v1))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v5 = *(unsigned int *)this;
      v6 = 136315906;
      v7 = "oalSource.cpp";
      v8 = 1024;
      v9 = 2594;
      v10 = 2048;
      v11 = v5;
      v12 = 2048;
      v13 = (int)v1;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::AddRenderProc FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v6, 0x26u);
    }
  }
  else
  {
    *((_BYTE *)this + 236) = 1;
  }
  return v1;
}

uint64_t OALSource::Play(OALSource *this)
{
  unsigned int *v2;
  uint64_t v3;
  pthread_t v4;
  _opaque_pthread_t *v5;
  unsigned int v6;
  int v7;
  OALSource *v8;
  int v9;
  uint64_t started;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned int *)((char *)this + 64);
  v3 = *((_QWORD *)this + 1);
  v4 = pthread_self();
  v5 = *(_opaque_pthread_t **)(v3 + 480);
  if (v4 != v5)
  {
    do
      v6 = __ldaxr(v2);
    while (__stlxr(v6 + 1, v2));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v9 = v7;
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    started = OALSource::StartRenderer(this);
    goto LABEL_8;
  }
  if (!*((_DWORD *)this + 12))
  {
    v11 = 0;
    if (v7)
      goto LABEL_42;
    goto LABEL_43;
  }
  v13 = *((_DWORD *)this + 76);
  v14 = v13 - 1;
  if ((v13 - 56577) <= 5)
  {
    if (((1 << v14) & 0x32) == 0)
    {
      if (((1 << v14) & 9) == 0)
      {
        v23 = operator new();
        *(_DWORD *)(v23 + 8) = 6;
        *(_QWORD *)(v23 + 16) = 0;
        *(_DWORD *)(v23 + 24) = 0;
        v24 = (unint64_t *)((char *)this + 424);
LABEL_37:
        v25 = *v24;
        *(_QWORD *)v23 = *v24;
        do
        {
          v26 = __ldaxr(v24);
          if (v26 != v25)
          {
            __clrex();
            goto LABEL_37;
          }
        }
        while (__stlxr(v23, v24));
        OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
        v11 = 0;
        *((_DWORD *)this + 76) = 56582;
        goto LABEL_41;
      }
      v15 = operator new();
      *(_DWORD *)(v15 + 8) = 4;
      *(_QWORD *)(v15 + 16) = 0;
      *(_DWORD *)(v15 + 24) = 0;
      v16 = (unint64_t *)((char *)this + 424);
LABEL_30:
      v21 = *v16;
      *(_QWORD *)v15 = *v16;
      do
      {
        v22 = __ldaxr(v16);
        if (v22 != v21)
        {
          __clrex();
          goto LABEL_30;
        }
      }
      while (__stlxr(v15, v16));
      OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
      v11 = 0;
      *((_DWORD *)this + 76) = 56578;
      if (v9)
        goto LABEL_42;
      goto LABEL_43;
    }
LABEL_22:
    v17 = operator new();
    *(_DWORD *)(v17 + 8) = 11;
    *(_QWORD *)(v17 + 16) = 0;
    *(_DWORD *)(v17 + 24) = 0;
    v18 = (unint64_t *)((char *)this + 424);
LABEL_24:
    v19 = *v18;
    *(_QWORD *)v17 = *v18;
    do
    {
      v20 = __ldaxr(v18);
      if (v20 != v19)
      {
        __clrex();
        goto LABEL_24;
      }
    }
    while (__stlxr(v17, v18));
    OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
    v11 = 0;
    *((_DWORD *)this + 76) = 56581;
    if (v9)
      goto LABEL_42;
    goto LABEL_43;
  }
  if (v13 == 4115)
  {
    started = OALSource::Resume(this);
LABEL_8:
    v11 = started;
    if (!(_DWORD)started)
      goto LABEL_41;
    goto LABEL_9;
  }
  if (v13 == 4114)
  {
    *((_DWORD *)this + 86) = -1;
    goto LABEL_22;
  }
  OALSource::PrepBufferQueueForPlayback(this, v8);
  v29 = (uint64_t *)*((_QWORD *)this + 3);
  v30 = *v29;
  v11 = 0xFFFFFFFFLL;
  if (!*v29
    || (v31 = *((_DWORD *)this + 14), v30 + 32 * (__int16)v31 == v29[1])
    || (v11 = OALSource::SetupMixerBus(this, (CAStreamBasicDescription *)(*(_QWORD *)(v30 + 32 * (__int16)v31 + 8) + 304)), (_DWORD)v11)|| (v11 = OALSource::AddRenderProc(this), (_DWORD)v11))
  {
LABEL_9:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v12 = *(unsigned int *)this;
      v32 = 136315906;
      v33 = "oalSource.cpp";
      v34 = 1024;
      v35 = 1481;
      v36 = 2048;
      v37 = v12;
      v38 = 2048;
      v39 = (int)v11;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::Play FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v32, 0x26u);
      if (!v9)
        goto LABEL_43;
LABEL_42:
      (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
      goto LABEL_43;
    }
LABEL_41:
    if (!v9)
      goto LABEL_43;
    goto LABEL_42;
  }
  *((_BYTE *)this + 19) = 1;
  OALSource::SetPlaybackState(this, 4114, 1);
  v11 = 0;
  *((_DWORD *)this + 86) = 1;
  *((_BYTE *)this + 60) = 0;
  if (v9)
    goto LABEL_42;
LABEL_43:
  if (v4 != v5)
  {
    do
      v27 = __ldaxr(v2);
    while (__stlxr(v27 - 1, v2));
  }
  return v11;
}

void sub_215C4C800(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v7;

  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (v1 != v5)
  {
    do
      v7 = __ldaxr(v4);
    while (__stlxr(v7 - 1, v4));
  }
  _Unwind_Resume(exception_object);
}

void OALSource::Rewind(OALSource *this)
{
  unsigned int *v2;
  uint64_t v3;
  pthread_t v4;
  _opaque_pthread_t *v5;
  unsigned int v6;
  OALSource *v7;
  int v8;
  int v9;
  unsigned int v10;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;

  v2 = (unsigned int *)((char *)this + 64);
  v3 = *((_QWORD *)this + 1);
  v4 = pthread_self();
  v5 = *(_opaque_pthread_t **)(v3 + 480);
  if (v4 != v5)
  {
    do
      v6 = __ldaxr(v2);
    while (__stlxr(v6 + 1, v2));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v8 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  *((_DWORD *)this + 85) = 0;
  v9 = *((_DWORD *)this + 76);
  if (v9 <= 56576)
  {
    if (v9 != 4114)
    {
      if (v9 == 4115)
      {
        v7 = (OALSource *)*((unsigned int *)this + 58);
        if ((_DWORD)v7 != -1)
        {
          OALContext::SetBusAsAvailable(*((_QWORD *)this + 1), v7);
          *((_DWORD *)this + 58) = -1;
        }
      }
      else if (v9 != 4116)
      {
        goto LABEL_30;
      }
      OALSource::JoinBufferLists(this, v7);
      OALSource::SetPlaybackState(this, 4113, 1);
      goto LABEL_30;
    }
    *((_DWORD *)this + 76) = 56580;
    *((_DWORD *)this + 86) = -1;
    v16 = operator new();
    *(_DWORD *)(v16 + 8) = 2;
    *(_QWORD *)(v16 + 16) = 0;
    *(_DWORD *)(v16 + 24) = 0;
    v17 = (unint64_t *)((char *)this + 424);
LABEL_23:
    v18 = *v17;
    *(_QWORD *)v16 = *v17;
    do
    {
      v19 = __ldaxr(v17);
      if (v19 != v18)
      {
        __clrex();
        goto LABEL_23;
      }
    }
    while (__stlxr(v16, v17));
LABEL_16:
    OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
  }
  else
  {
    v10 = v9 - 56577;
    if (v10 <= 5 && v10 != 3)
    {
      *((_DWORD *)this + 76) = 56580;
      v12 = operator new();
      *(_DWORD *)(v12 + 8) = 2;
      *(_QWORD *)(v12 + 16) = 0;
      *(_DWORD *)(v12 + 24) = 0;
      v13 = (unint64_t *)((char *)this + 424);
      while (1)
      {
        v14 = *v13;
        *(_QWORD *)v12 = *v13;
        while (1)
        {
          v15 = __ldaxr(v13);
          if (v15 != v14)
            break;
          if (!__stlxr(v12, v13))
            goto LABEL_16;
        }
        __clrex();
      }
    }
  }
LABEL_30:
  if (v8)
    (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
  if (v4 != v5)
  {
    do
      v20 = __ldaxr(v2);
    while (__stlxr(v20 - 1, v2));
  }
}

void sub_215C4CA64(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;

  if (v1 != v3)
  {
    do
      v4 = __ldaxr(v2);
    while (__stlxr(v4 - 1, v2));
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::Pause(OALSource *this)
{
  unsigned int *v2;
  uint64_t v3;
  pthread_t v4;
  _opaque_pthread_t *v5;
  unsigned int v6;
  uint64_t result;
  int v8;
  int v9;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;

  v2 = (unsigned int *)((char *)this + 64);
  v3 = *((_QWORD *)this + 1);
  v4 = pthread_self();
  v5 = *(_opaque_pthread_t **)(v3 + 480);
  if (v4 != v5)
  {
    do
      v6 = __ldaxr(v2);
    while (__stlxr(v6 + 1, v2));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v8 = result;
  v9 = *((_DWORD *)this + 76);
  if ((v9 - 56578) <= 4 && ((1 << (v9 - 2)) & 0x19) != 0)
  {
    v11 = operator new();
    *(_DWORD *)(v11 + 8) = 5;
    *(_QWORD *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = 0;
    v12 = (unint64_t *)((char *)this + 424);
    while (1)
    {
      v13 = *v12;
      *(_QWORD *)v11 = *v12;
      while (1)
      {
        v14 = __ldaxr(v12);
        if (v14 != v13)
          break;
        if (!__stlxr(v11, v12))
          goto LABEL_22;
      }
      __clrex();
    }
  }
  if (v9 == 4114)
  {
    *((_DWORD *)this + 86) = -1;
    v15 = operator new();
    *(_DWORD *)(v15 + 8) = 5;
    *(_QWORD *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = 0;
    v16 = (unint64_t *)((char *)this + 424);
LABEL_19:
    v17 = *v16;
    *(_QWORD *)v15 = *v16;
    do
    {
      v18 = __ldaxr(v16);
      if (v18 != v17)
      {
        __clrex();
        goto LABEL_19;
      }
    }
    while (__stlxr(v15, v16));
LABEL_22:
    result = OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
    *((_DWORD *)this + 76) = 56579;
  }
  if (v8)
    result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
  if (v4 != v5)
  {
    do
      v19 = __ldaxr(v2);
    while (__stlxr(v19 - 1, v2));
  }
  return result;
}

void sub_215C4CC54(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;

  if (v1 != v3)
  {
    do
      v4 = __ldaxr(v2);
    while (__stlxr(v4 - 1, v2));
  }
  _Unwind_Resume(exception_object);
}

void OALSource::Stop(OALSource *this)
{
  unsigned int *v2;
  uint64_t v3;
  pthread_t v4;
  _opaque_pthread_t *v5;
  unsigned int v6;
  char *v7;
  int v8;
  int v9;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  _QWORD *v16;
  uint64_t v17;
  _DWORD *v18;
  _DWORD *v19;
  _DWORD *v20;
  NSObject *global_queue;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  int v27;
  uint64_t v28;
  _QWORD block[6];
  int v30;

  v2 = (unsigned int *)((char *)this + 64);
  v3 = *((_QWORD *)this + 1);
  v4 = pthread_self();
  v5 = *(_opaque_pthread_t **)(v3 + 480);
  if (v4 != v5)
  {
    do
      v6 = __ldaxr(v2);
    while (__stlxr(v6 + 1, v2));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v7 = (char *)this + 80;
  v8 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  *((_DWORD *)this + 85) = 0;
  v9 = *((_DWORD *)this + 76);
  if ((v9 - 56578) > 4 || v9 == 56580)
  {
    if (v9 == 4114)
    {
      *((_DWORD *)this + 76) = 56577;
      *((_DWORD *)this + 86) = -1;
      v22 = operator new();
      *(_DWORD *)(v22 + 8) = 1;
      *(_QWORD *)(v22 + 16) = 0;
      *(_DWORD *)(v22 + 24) = 0;
      v23 = (unint64_t *)((char *)this + 424);
LABEL_29:
      v24 = *v23;
      *(_QWORD *)v22 = *v23;
      do
      {
        v25 = __ldaxr(v23);
        if (v25 != v24)
        {
          __clrex();
          goto LABEL_29;
        }
      }
      while (__stlxr(v22, v23));
      OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
    }
    else if (v9 == 4115)
    {
      v15 = *((_DWORD *)this + 58);
      if (v15 != -1)
      {
        OALContext::SetBusAsAvailable(*((_QWORD *)this + 1), v15);
        *((_DWORD *)this + 58) = -1;
        OALSource::SetPlaybackState(this, 4116, 1);
        if (*(_DWORD *)(*((_QWORD *)this + 3) + 24))
        {
          v16 = (_QWORD *)*((_QWORD *)this + 52);
          if (v16)
          {
            v17 = v16[3];
            if (v17)
            {
              v27 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v17 + 16))(v16[3]);
              v28 = v17;
              v19 = (_DWORD *)*v16;
              v18 = (_DWORD *)v16[1];
              if ((_DWORD *)*v16 != v18)
              {
                v20 = (_DWORD *)*v16;
                do
                {
                  if (*v20 == 4118)
                  {
                    global_queue = dispatch_get_global_queue(0, 0);
                    block[0] = MEMORY[0x24BDAC760];
                    block[1] = 0x40000000;
                    block[2] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
                    block[3] = &__block_descriptor_tmp;
                    block[4] = v16;
                    block[5] = v19;
                    v30 = 4118;
                    dispatch_async(global_queue, block);
                    v18 = (_DWORD *)v16[1];
                  }
                  v20 += 6;
                  v19 += 6;
                }
                while (v20 != v18);
              }
              if (v27)
                (*(void (**)(uint64_t))(*(_QWORD *)v28 + 24))(v28);
            }
          }
        }
      }
    }
  }
  else
  {
    v11 = operator new();
    *(_DWORD *)(v11 + 8) = 1;
    *(_QWORD *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = 0;
    v12 = (unint64_t *)((char *)this + 424);
LABEL_12:
    v13 = *v12;
    *(_QWORD *)v11 = *v12;
    do
    {
      v14 = __ldaxr(v12);
      if (v14 != v13)
      {
        __clrex();
        goto LABEL_12;
      }
    }
    while (__stlxr(v11, v12));
    OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
    *((_DWORD *)this + 76) = 56577;
  }
  if (v8)
    (*(void (**)(char *))(*(_QWORD *)v7 + 24))(v7);
  if (v4 != v5)
  {
    do
      v26 = __ldaxr(v2);
    while (__stlxr(v26 - 1, v2));
  }
}

void sub_215C4CF80(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;

  if (v1 != v3)
  {
    do
      v4 = __ldaxr(v2);
    while (__stlxr(v4 - 1, v2));
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::GetQueueOffset(OALSource *this, int a2)
{
  unsigned int *v4;
  uint64_t v5;
  pthread_t v6;
  _opaque_pthread_t *v7;
  unsigned int v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  _QWORD *v31;
  int FrameCount;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  double *v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  uint64_t v45;
  _QWORD *v46;
  int v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t *v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t *v60;
  uint64_t v61;
  BOOL v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t v65;
  unsigned int v66;
  int v67;
  unsigned int v68;

  v4 = (unsigned int *)((char *)this + 64);
  v5 = *((_QWORD *)this + 1);
  v6 = pthread_self();
  v7 = *(_opaque_pthread_t **)(v5 + 480);
  if (v6 != v7)
  {
    do
      v8 = __ldaxr(v4);
    while (__stlxr(v8 + 1, v4));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v9 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  if (a2 == 1)
  {
    v24 = (uint64_t *)*((_QWORD *)this + 4);
    v25 = *v24;
    if (*v24 == v24[1])
    {
      v26 = 0;
      v27 = *((unsigned int *)this + 14);
      if ((_DWORD)v27)
      {
LABEL_24:
        v28 = 0;
        v29 = 0;
        v30 = 8;
        do
        {
          while (1)
          {
            v31 = (_QWORD *)*((_QWORD *)this + 3);
            if (*v31 + v30 - 8 != v31[1])
              break;
            ++v28;
            v30 += 32;
            if (v28 >= v27)
              goto LABEL_28;
          }
          FrameCount = OALBuffer::GetFrameCount(*(OALBuffer **)(*v31 + v30));
          v27 = *((unsigned int *)this + 14);
          v29 += FrameCount;
          ++v28;
          v30 += 32;
        }
        while (v28 < v27);
LABEL_28:
        v33 = (uint64_t *)*((_QWORD *)this + 3);
        v34 = *v33;
        v35 = v33[1];
        v36 = *v33 + 32 * v27;
        if (v36 != v35)
        {
LABEL_29:
          v37 = *(_DWORD *)(*(_QWORD *)(v36 + 8) + 320);
          if (v37)
            v37 = *(_DWORD *)(v34 + 32 * v27 + 16) / v37;
          if (*((_DWORD *)this + 71) == 1735095154)
            goto LABEL_32;
          goto LABEL_64;
        }
LABEL_63:
        v37 = 0;
        if (*((_DWORD *)this + 71) == 1735095154)
        {
LABEL_32:
          v38 = (double *)((char *)this + 376);
          goto LABEL_72;
        }
LABEL_64:
        v61 = v34 + 32 * (__int16)v27;
        if (v34)
          v62 = v61 == v35;
        else
          v62 = 1;
        if (v62)
        {
          v54 = 0;
          v63 = (uint64_t *)*((_QWORD *)this + 4);
          v61 = *v63;
          if (!*v63 || v61 == v63[1])
            goto LABEL_80;
        }
        v38 = (double *)(*(_QWORD *)(v61 + 8) + 304);
LABEL_72:
        v54 = ((double)(v29 + v26 + v37) / *v38);
        if (v9)
          goto LABEL_81;
        goto LABEL_82;
      }
    }
    else
    {
      v26 = 0;
      do
      {
        v26 += OALBuffer::GetFrameCount(*(OALBuffer **)(v25 + 8));
        v25 += 32;
      }
      while (v25 != v24[1]);
      v27 = *((unsigned int *)this + 14);
      if ((_DWORD)v27)
        goto LABEL_24;
    }
    v27 = 0;
    v29 = 0;
    v60 = (uint64_t *)*((_QWORD *)this + 3);
    v34 = *v60;
    v35 = v60[1];
    v36 = *v60;
    if (v36 != v35)
      goto LABEL_29;
    goto LABEL_63;
  }
  if (a2 == 2)
  {
    v39 = (uint64_t *)*((_QWORD *)this + 4);
    v40 = *v39;
    if (*v39 == v39[1])
    {
      v41 = 0;
      v42 = *((unsigned int *)this + 14);
      if ((_DWORD)v42)
      {
LABEL_37:
        v43 = 0;
        v44 = 0;
        v45 = 8;
        do
        {
          while (1)
          {
            v46 = (_QWORD *)*((_QWORD *)this + 3);
            if (*v46 + v45 - 8 != v46[1])
              break;
            ++v43;
            v45 += 32;
            if (v43 >= v42)
              goto LABEL_41;
          }
          v47 = OALBuffer::GetFrameCount(*(OALBuffer **)(*v46 + v45));
          v42 = *((unsigned int *)this + 14);
          v44 += v47;
          ++v43;
          v45 += 32;
        }
        while (v43 < v42);
LABEL_41:
        v48 = (uint64_t *)*((_QWORD *)this + 3);
        v49 = *v48;
        v50 = v48[1];
        v51 = *v48 + 32 * v42;
        if (v51 == v50)
          goto LABEL_78;
LABEL_76:
        v66 = *(_DWORD *)(*(_QWORD *)(v51 + 8) + 320);
        if (v66)
        {
          v67 = *(_DWORD *)(v49 + 32 * v42 + 16) / v66;
LABEL_79:
          v54 = (v44 + v41 + v67);
          goto LABEL_80;
        }
LABEL_78:
        v67 = 0;
        goto LABEL_79;
      }
    }
    else
    {
      v41 = 0;
      do
      {
        v41 += OALBuffer::GetFrameCount(*(OALBuffer **)(v40 + 8));
        v40 += 32;
      }
      while (v40 != v39[1]);
      v42 = *((unsigned int *)this + 14);
      if ((_DWORD)v42)
        goto LABEL_37;
    }
    v44 = 0;
    v42 = 0;
    v64 = (uint64_t *)*((_QWORD *)this + 3);
    v49 = *v64;
    v65 = v64[1];
    v51 = *v64;
    if (v51 == v65)
      goto LABEL_78;
    goto LABEL_76;
  }
  if (a2 != 3)
    goto LABEL_59;
  v10 = (uint64_t *)*((_QWORD *)this + 4);
  v11 = *v10;
  if (*v10 == v10[1])
  {
    v12 = 0;
    v13 = *((unsigned int *)this + 14);
    if ((_DWORD)v13)
    {
LABEL_13:
      v14 = 0;
      v15 = 0;
      v16 = 8;
      do
      {
        while (1)
        {
          v17 = (_QWORD *)*((_QWORD *)this + 3);
          if (*v17 + v16 - 8 != v17[1])
            break;
          ++v14;
          v16 += 32;
          if (v14 >= v13)
            goto LABEL_17;
        }
        v18 = OALBuffer::GetFrameCount(*(OALBuffer **)(*v17 + v16));
        v13 = *((unsigned int *)this + 14);
        v15 += v18;
        ++v14;
        v16 += 32;
      }
      while (v14 < v13);
LABEL_17:
      v19 = (uint64_t *)*((_QWORD *)this + 3);
      v20 = *v19;
      v21 = v19[1];
      v22 = *v19 + 32 * v13;
      if (v22 != v21)
        goto LABEL_18;
LABEL_45:
      v23 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    v12 = 0;
    do
    {
      v12 += OALBuffer::GetFrameCount(*(OALBuffer **)(v11 + 8));
      v11 += 32;
    }
    while (v11 != v10[1]);
    v13 = *((unsigned int *)this + 14);
    if ((_DWORD)v13)
      goto LABEL_13;
  }
  v13 = 0;
  v15 = 0;
  v52 = (uint64_t *)*((_QWORD *)this + 3);
  v20 = *v52;
  v21 = v52[1];
  v22 = *v52;
  if (v22 == v21)
    goto LABEL_45;
LABEL_18:
  v23 = *(_DWORD *)(*(_QWORD *)(v22 + 8) + 320);
  if (v23)
    v23 = *(_DWORD *)(v20 + 32 * v13 + 16) / v23;
LABEL_46:
  v53 = v15 + v12 + v23;
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    v54 = *((_DWORD *)this + 100) * v53;
    if (!v9)
      goto LABEL_82;
LABEL_81:
    (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
    goto LABEL_82;
  }
  v55 = v20 + 32 * (__int16)v13;
  if (v20)
    v56 = v55 == v21;
  else
    v56 = 1;
  if (v56)
  {
    v54 = 0;
    v57 = (uint64_t *)*((_QWORD *)this + 4);
    v55 = *v57;
    if (!*v57 || v55 == v57[1])
    {
LABEL_80:
      if (!v9)
        goto LABEL_82;
      goto LABEL_81;
    }
  }
  v58 = *(_QWORD *)(v55 + 8);
  v59 = *(_DWORD *)(v58 + 324);
  if (!v59)
  {
LABEL_59:
    v54 = 0;
    if (v9)
      goto LABEL_81;
    goto LABEL_82;
  }
  v54 = *(_DWORD *)(v58 + 320) * (v53 / v59);
  if (v9)
    goto LABEL_81;
LABEL_82:
  if (v6 != v7)
  {
    do
      v68 = __ldaxr(v4);
    while (__stlxr(v68 - 1, v4));
  }
  return v54;
}

void sub_215C4D4A4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;

  if (v1 != v3)
  {
    do
      v4 = __ldaxr(v2);
    while (__stlxr(v4 - 1, v2));
  }
  _Unwind_Resume(exception_object);
}

float OALSource::GetQueueOffsetSecondsFloat(OALSource *this)
{
  char *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  int FrameCount;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  double *v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t *v22;
  float v23;

  v2 = (char *)this + 80;
  v3 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v4 = (uint64_t *)*((_QWORD *)v2 - 6);
  v5 = *v4;
  if (*v4 != v4[1])
  {
    v6 = 0;
    do
    {
      v6 += OALBuffer::GetFrameCount(*(OALBuffer **)(v5 + 8));
      v5 += 32;
    }
    while (v5 != v4[1]);
    v7 = *((unsigned int *)this + 14);
    if ((_DWORD)v7)
      goto LABEL_5;
LABEL_15:
    v7 = 0;
    v9 = 0;
    v19 = (uint64_t *)*((_QWORD *)this + 3);
    v14 = *v19;
    v15 = v19[1];
    v16 = *v19;
    if (v16 != v15)
      goto LABEL_10;
    goto LABEL_16;
  }
  v6 = 0;
  v7 = *((unsigned int *)this + 14);
  if (!(_DWORD)v7)
    goto LABEL_15;
LABEL_5:
  v8 = 0;
  v9 = 0;
  v10 = 8;
  do
  {
    while (1)
    {
      v11 = (_QWORD *)*((_QWORD *)this + 3);
      if (*v11 + v10 - 8 != v11[1])
        break;
      ++v8;
      v10 += 32;
      if (v8 >= v7)
        goto LABEL_9;
    }
    FrameCount = OALBuffer::GetFrameCount(*(OALBuffer **)(*v11 + v10));
    v7 = *((unsigned int *)this + 14);
    v9 += FrameCount;
    ++v8;
    v10 += 32;
  }
  while (v8 < v7);
LABEL_9:
  v13 = (uint64_t *)*((_QWORD *)this + 3);
  v14 = *v13;
  v15 = v13[1];
  v16 = *v13 + 32 * v7;
  if (v16 != v15)
  {
LABEL_10:
    v17 = *(_DWORD *)(*(_QWORD *)(v16 + 8) + 320);
    if (v17)
      v17 = *(_DWORD *)(v14 + 32 * v7 + 16) / v17;
    if (*((_DWORD *)this + 71) == 1735095154)
      goto LABEL_13;
    goto LABEL_17;
  }
LABEL_16:
  v17 = 0;
  if (*((_DWORD *)this + 71) == 1735095154)
  {
LABEL_13:
    v18 = (double *)((char *)this + 376);
    goto LABEL_25;
  }
LABEL_17:
  v20 = v14 + 32 * (__int16)v7;
  if (v14)
    v21 = v20 == v15;
  else
    v21 = 1;
  if (v21)
  {
    v22 = (uint64_t *)*((_QWORD *)this + 4);
    v20 = *v22;
    v23 = 0.0;
    if (!*v22 || v20 == v22[1])
      goto LABEL_26;
  }
  v18 = (double *)(*(_QWORD *)(v20 + 8) + 304);
LABEL_25:
  v23 = (double)(v9 + v6 + v17) / *v18;
LABEL_26:
  if (v3)
    (*(void (**)(char *))(*(_QWORD *)v2 + 24))(v2);
  return v23;
}

void sub_215C4D6DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetQueueOffset(OALSource *this, int a2, float a3)
{
  double *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  _DWORD *exception;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;
  pthread_t v21;
  _opaque_pthread_t *v22;
  unsigned int v23;
  int v24;
  int v25;
  uint64_t *v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int v34;

  if (a3 < 0.0)
  {
LABEL_25:
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40963;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  if (a2 == 3)
  {
    if (*((_DWORD *)this + 71) == 1735095154)
    {
      v5 = a3 / *((_DWORD *)this + 100);
    }
    else
    {
      v12 = (uint64_t *)*((_QWORD *)this + 3);
      v13 = *((_DWORD *)this + 14);
      v14 = *v12;
      v15 = v12[1];
      if (v14)
        v16 = v14 + 32 * (__int16)v13 == v15;
      else
        v16 = 1;
      if (v16)
      {
        v5 = 0;
      }
      else
      {
        v18 = *(_QWORD *)(v14 + 32 * (__int16)v13 + 8);
        v5 = *(_DWORD *)(v18 + 324) * (float)(a3 / (float)*(unsigned int *)(v18 + 320));
      }
    }
    goto LABEL_26;
  }
  if (a2 == 2)
  {
    v5 = a3;
    goto LABEL_26;
  }
  if (a2 != 1)
    return 40963;
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    v4 = (double *)((char *)this + 376);
  }
  else
  {
    v7 = (uint64_t *)*((_QWORD *)this + 3);
    v8 = *((_DWORD *)this + 14);
    v9 = *v7;
    v10 = v7[1];
    if (v9)
      v11 = v9 + 32 * (__int16)v8 == v10;
    else
      v11 = 1;
    if (v11)
    {
      v5 = 0;
      goto LABEL_24;
    }
    v4 = (double *)(*(_QWORD *)(v9 + 32 * (__int16)v8 + 8) + 304);
  }
  v5 = (*v4 * a3);
LABEL_24:
  if ((int)v5 < (int)a3)
    goto LABEL_25;
LABEL_26:
  v19 = (unsigned int *)((char *)this + 64);
  v20 = *((_QWORD *)this + 1);
  v21 = pthread_self();
  v22 = *(_opaque_pthread_t **)(v20 + 480);
  if (v21 != v22)
  {
    do
      v23 = __ldaxr(v19);
    while (__stlxr(v23 + 1, v19));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v24 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v6 = 0;
  v25 = *((_DWORD *)this + 76);
  if (v25 <= 56576)
  {
    if ((v25 - 4115) < 2 || v25 == 4113)
    {
      v6 = 0;
      *((_DWORD *)this + 85) = v5;
      goto LABEL_51;
    }
    if (v25 != 4114)
      goto LABEL_51;
LABEL_33:
    v26 = (uint64_t *)*((_QWORD *)this + 3);
    v27 = *v26;
    if (*v26 == v26[1])
    {
      if (v5)
      {
LABEL_37:
        v6 = 40963;
        goto LABEL_51;
      }
    }
    else
    {
      v28 = 0;
      do
      {
        v28 += OALBuffer::GetFrameCount(*(OALBuffer **)(v27 + 8));
        v27 += 32;
      }
      while (v27 != v26[1]);
      if (v5 > v28)
        goto LABEL_37;
    }
    *((_DWORD *)this + 86) = -1;
    *((_DWORD *)this + 89) = v5;
    v30 = operator new();
    *(_DWORD *)(v30 + 8) = 7;
    *(_QWORD *)(v30 + 16) = 0;
    *(_DWORD *)(v30 + 24) = 0;
    v31 = (unint64_t *)((char *)this + 424);
LABEL_47:
    v32 = *v31;
    *(_QWORD *)v30 = *v31;
    do
    {
      v33 = __ldaxr(v31);
      if (v33 != v32)
      {
        __clrex();
        goto LABEL_47;
      }
    }
    while (__stlxr(v30, v31));
    OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
    v6 = 0;
    goto LABEL_51;
  }
  if ((v25 - 56577) < 6)
    goto LABEL_33;
LABEL_51:
  if (v24)
    (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
  if (v21 != v22)
  {
    do
      v34 = __ldaxr(v19);
    while (__stlxr(v34 - 1, v19));
  }
  return v6;
}

void sub_215C4DA10(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v7;

  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (v1 != v5)
  {
    do
      v7 = __ldaxr(v4);
    while (__stlxr(v7 - 1, v4));
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetRenderCallback(OALSource *this, int (*a2)(unsigned int, int, char **, int *, void *), int a3, unsigned int a4, void *a5)
{
  unsigned int *v10;
  uint64_t v11;
  pthread_t v12;
  _opaque_pthread_t *v13;
  unsigned int v14;
  int v15;
  int v16;
  unint64_t v17;
  unint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = (unsigned int *)((char *)this + 64);
  v11 = *((_QWORD *)this + 1);
  v12 = pthread_self();
  v13 = *(_opaque_pthread_t **)(v11 + 480);
  if (v12 != v13)
  {
    do
      v14 = __ldaxr(v10);
    while (__stlxr(v14 + 1, v10));
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  v15 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v16 = *((_DWORD *)this + 76);
  if ((v16 - 56577) > 5)
  {
    if ((v16 - 4114) >= 2)
    {
      OALSource::FlushBufferQueue(this);
      if (a2)
      {
        *((_QWORD *)this + 45) = a2;
        *((_QWORD *)this + 46) = a5;
        FillInASBD((uint64_t)this + 376, a3, a4);
        *((_DWORD *)this + 71) = 1735095154;
        CAStreamBasicDescription::Print((OALSource *)((char *)this + 376), (__sFILE *)*MEMORY[0x24BDAC8E8]);
        goto LABEL_24;
      }
      v20 = 0;
      *((_DWORD *)this + 71) = 4144;
      *((_QWORD *)this + 45) = 0;
      if (v15)
        goto LABEL_25;
      goto LABEL_26;
    }
  }
  else if (((1 << (v16 - 1)) & 0x36) == 0)
  {
    if (!a2)
    {
      *((_DWORD *)this + 71) = 4144;
      *((_QWORD *)this + 45) = 0;
    }
    v17 = operator new();
    *(_DWORD *)(v17 + 8) = 10;
    *(_QWORD *)(v17 + 16) = 0;
    *(_DWORD *)(v17 + 24) = 0;
    v18 = (unint64_t *)((char *)this + 424);
LABEL_18:
    v21 = *v18;
    *(_QWORD *)v17 = *v18;
    do
    {
      v22 = __ldaxr(v18);
      if (v22 != v21)
      {
        __clrex();
        goto LABEL_18;
      }
    }
    while (__stlxr(v17, v18));
    OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
LABEL_24:
    v20 = 0;
    if (!v15)
      goto LABEL_26;
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v19 = *(unsigned int *)this;
    v25 = 136315906;
    v26 = "oalSource.cpp";
    v27 = 1024;
    v28 = 2084;
    v29 = 2048;
    v30 = v19;
    v31 = 2048;
    v20 = 40964;
    v32 = 40964;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetRenderCallback FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v25, 0x26u);
    if (!v15)
      goto LABEL_26;
LABEL_25:
    (*(void (**)(char *))(*((_QWORD *)this + 10) + 24))((char *)this + 80);
    goto LABEL_26;
  }
  v20 = 40964;
  if (v15)
    goto LABEL_25;
LABEL_26:
  if (v12 != v13)
  {
    do
      v23 = __ldaxr(v10);
    while (__stlxr(v23 - 1, v10));
  }
  return v20;
}

void sub_215C4DD00(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::AddNotification(OALSource *this, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  uint64_t v7;
  CAMutex *v8;
  int v10;
  int v11;
  uint64_t v12;

  v7 = *((_QWORD *)this + 52);
  if (v7)
  {
    v8 = *(CAMutex **)(v7 + 24);
  }
  else
  {
    v7 = operator new();
    v10 = *(_DWORD *)this;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = 0;
    *(_DWORD *)(v7 + 32) = v10;
    v8 = (CAMutex *)operator new();
    CAMutex::CAMutex(v8, "Notifcation Mutex");
    *(_QWORD *)(v7 + 24) = v8;
    *((_QWORD *)this + 52) = v7;
  }
  v11 = (*(uint64_t (**)(CAMutex *))(*(_QWORD *)v8 + 16))(v8);
  v12 = SourceNotifications::AddSourceNotificationImp((SourceNotifications *)v7, a2, a3, a4);
  if (v11)
    (*(void (**)(CAMutex *))(*(_QWORD *)v8 + 24))(v8);
  return v12;
}

void sub_215C4DE3C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;

  MEMORY[0x2199EEC7C](v2, 0x10F1C40976EDA9DLL);
  v4 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v4;
    operator delete(v4);
  }
  MEMORY[0x2199EEC7C](v1, 0x1020C401C8C6399);
  _Unwind_Resume(a1);
}

void sub_215C4DE94(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

_QWORD *OALSource::RemoveNotification(_QWORD *this, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  uint64_t *v4;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (uint64_t *)this[52];
  if (v4)
  {
    v8 = v4[3];
    this = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
    v9 = (int)this;
    v11 = *v4;
    v10 = v4[1];
    if (*v4 != v10)
    {
      while (*(_DWORD *)v11 != a2
           || *(void (**)(unsigned int, unsigned int, void *))(v11 + 8) != a3
           || *(void **)(v11 + 16) != a4)
      {
        v11 += 24;
        if (v11 == v10)
          goto LABEL_12;
      }
    }
    if (v11 != v10)
    {
      v12 = v10 - (v11 + 24);
      if (v10 != v11 + 24)
        this = memmove((void *)v11, (const void *)(v11 + 24), v10 - (v11 + 24));
      v4[1] = v11 + v12;
    }
LABEL_12:
    if (v9)
      return (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
  }
  return this;
}

uint64_t OALSource::SetRenderQuality(OALSource *this, int a2)
{
  AudioUnitElement v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (IsValidRenderQuality(a2))
  {
    *((_DWORD *)this + 111) = a2;
    v4 = *((_DWORD *)this + 58);
    if (v4 == -1)
    {
      return 0;
    }
    else
    {
      v5 = OALContext::SetSourceDesiredRenderQualityOnBus(*((AudioUnit **)this + 1), a2, v4);
      if ((_DWORD)v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v6 = *(unsigned int *)this;
        v9 = 136315906;
        v10 = "oalSource.cpp";
        v11 = 1024;
        v12 = 2551;
        v13 = 2048;
        v14 = v6;
        v15 = 2048;
        v16 = (int)v5;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateBusRenderQuality FAILED - OALSource = %ld : result = %ld", (uint8_t *)&v9, 0x26u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(unsigned int *)this;
      v9 = 136315650;
      v10 = "oalSource.cpp";
      v11 = 1024;
      v12 = 2157;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d OALSource::SetRenderQuality called - OALSource = %ld: Invalid Render Quality", (uint8_t *)&v9, 0x1Cu);
    }
    return 4294967246;
  }
  return v5;
}

uint64_t OALSource::GetRenderQuality(OALSource *this)
{
  return *((unsigned int *)this + 111);
}

_QWORD *OALSource::ClearMessageQueue(_QWORD *this)
{
  unint64_t *v1;
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = this + 53;
  v2 = (_QWORD *)this[53];
  if (v2)
  {
    do
    {
      while (1)
      {
        v3 = __ldaxr(v1);
        if ((_QWORD *)v3 == v2)
          break;
        __clrex();
        v2 = (_QWORD *)*v1;
        if (!*v1)
          return this;
      }
    }
    while (__stlxr(0, v1));
    this = 0;
    do
    {
      v4 = this;
      this = v2;
      v2 = (_QWORD *)*v2;
      *this = v4;
    }
    while (v2);
    do
    {
      v5 = (_QWORD *)*this;
      MEMORY[0x2199EEC7C]();
      this = v5;
    }
    while (v5);
  }
  return this;
}

void OALSource::LoopToBeginning(OALSource *this, OALSource *a2)
{
  uint64_t *v3;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char **v9;
  char *v10;
  char *v11;
  int64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  int v24;
  _DWORD *v25;
  _DWORD *v26;
  uint64_t v27;
  _DWORD *v28;
  NSObject *global_queue;
  _QWORD block[6];
  int v31;

  v3 = (uint64_t *)*((_QWORD *)this + 3);
  if (*((_DWORD *)v3 + 6))
  {
    do
    {
      v6 = v3[1];
      v7 = *v3 == v6;
      if (*v3 == v6)
        v8 = 0;
      else
        v8 = *v3;
      if (!v7)
        *(_DWORD *)(*v3 + 20) = 2;
      BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v8, *(OALBuffer **)(v8 + 8), *(_DWORD *)(v8 + 24));
      v9 = (char **)*((_QWORD *)this + 3);
      v11 = *v9;
      v10 = v9[1];
      if (*v9 == v10)
      {
        v4 = *v9;
      }
      else
      {
        a2 = (OALSource *)(v11 + 32);
        v12 = v10 - (v11 + 32);
        if (v10 != v11 + 32)
          memmove(*v9, a2, v10 - (v11 + 32));
        v13 = *v9;
        v4 = &v11[v12];
        v9[1] = &v11[v12];
        v11 = v13;
      }
      *((_DWORD *)v9 + 6) = (unint64_t)(v4 - v11) >> 5;
      v3 = (uint64_t *)*((_QWORD *)this + 3);
      v5 = (uint64_t *)*((_QWORD *)this + 4);
      *((_DWORD *)this + 12) = *((_DWORD *)v5 + 6) + *((_DWORD *)v3 + 6);
    }
    while (*((_DWORD *)v3 + 6));
  }
  else
  {
    v5 = (uint64_t *)*((_QWORD *)this + 4);
  }
  *((_QWORD *)this + 3) = v5;
  *((_QWORD *)this + 4) = v3;
  v15 = *v5;
  v14 = v5[1];
  v16 = v3[1] - *v3;
  v17 = v14 - *v5;
  v7 = v14 == *v5;
  *((_DWORD *)v5 + 6) = v17 >> 5;
  *((_DWORD *)v3 + 6) = v16 >> 5;
  *((_DWORD *)this + 12) = *((_DWORD *)v3 + 6) + *((_DWORD *)v5 + 6);
  if (!v7)
  {
    v18 = v15;
    if (v17 - 32 < 0x20)
      goto LABEL_33;
    v19 = ((v17 - 32) >> 5) + 1;
    v18 = v15 + 32 * (v19 & 0xFFFFFFFFFFFFFFELL);
    v20 = (_QWORD *)(v15 + 48);
    v21 = v19 & 0xFFFFFFFFFFFFFFELL;
    do
    {
      *(v20 - 4) = 0;
      *v20 = 0;
      v20 += 8;
      v21 -= 2;
    }
    while (v21);
    if (v19 != (v19 & 0xFFFFFFFFFFFFFFELL))
    {
LABEL_33:
      do
      {
        *(_QWORD *)(v18 + 16) = 0;
        v18 += 32;
      }
      while (v18 != v14);
    }
  }
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 0;
  v22 = (_QWORD *)*((_QWORD *)this + 52);
  if (v22)
  {
    if (*((_DWORD *)this + 69))
    {
      v23 = v22[3];
      if (v23)
      {
        v24 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v23 + 16))(v22[3]);
        v26 = (_DWORD *)*v22;
        v25 = (_DWORD *)v22[1];
        if ((_DWORD *)*v22 != v25)
        {
          v27 = MEMORY[0x24BDAC760];
          v28 = (_DWORD *)*v22;
          do
          {
            if (*v28 == 36864)
            {
              global_queue = dispatch_get_global_queue(0, 0);
              block[0] = v27;
              block[1] = 0x40000000;
              block[2] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
              block[3] = &__block_descriptor_tmp;
              block[4] = v22;
              block[5] = v26;
              v31 = 36864;
              dispatch_async(global_queue, block);
              v25 = (_DWORD *)v22[1];
            }
            v28 += 6;
            v26 += 6;
          }
          while (v28 != v25);
        }
        if (v24)
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 24))(v23);
      }
    }
  }
}

void OALSource::UpdateQueue(OALSource *this, OALSource *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char **v9;
  char *v10;
  char *v11;
  int64_t v12;
  char *v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  _DWORD *v19;
  NSObject *global_queue;
  int v21;
  _QWORD block[6];
  int v23;

  if (*((_DWORD *)this + 14))
  {
    v3 = 0;
    v4 = MEMORY[0x24BDAC760];
    do
    {
      v5 = (uint64_t *)*((_QWORD *)this + 3);
      v6 = *v5;
      v7 = v5[1];
      if (v6)
        v8 = v6 == v7;
      else
        v8 = 1;
      if (!v8)
      {
        BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v6, *(OALBuffer **)(v6 + 8), *(_DWORD *)(v6 + 24));
        v9 = (char **)*((_QWORD *)this + 3);
        v11 = *v9;
        v10 = v9[1];
        if (*v9 == v10)
        {
          v14 = *v9;
        }
        else
        {
          a2 = (OALSource *)(v11 + 32);
          v12 = v10 - (v11 + 32);
          if (v10 != v11 + 32)
            memmove(*v9, a2, v10 - (v11 + 32));
          v13 = *v9;
          v14 = &v11[v12];
          v9[1] = &v11[v12];
          v11 = v13;
        }
        *((_DWORD *)v9 + 6) = (unint64_t)(v14 - v11) >> 5;
        *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *(_DWORD *)(*((_QWORD *)this + 3) + 24);
        v15 = (_QWORD *)*((_QWORD *)this + 52);
        if (v15)
        {
          v16 = v15[3];
          if (v16)
          {
            v21 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v16 + 16))(v15[3]);
            v18 = (_DWORD *)*v15;
            v17 = (_DWORD *)v15[1];
            if ((_DWORD *)*v15 != v17)
            {
              v19 = (_DWORD *)*v15;
              do
              {
                if (*v19 == 4118)
                {
                  global_queue = dispatch_get_global_queue(0, 0);
                  block[0] = v4;
                  block[1] = 0x40000000;
                  block[2] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
                  block[3] = &__block_descriptor_tmp;
                  block[4] = v15;
                  block[5] = v18;
                  v23 = 4118;
                  dispatch_async(global_queue, block);
                  v17 = (_DWORD *)v15[1];
                }
                v19 += 6;
                v18 += 6;
              }
              while (v19 != v17);
            }
            if (v21)
              (*(void (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
          }
        }
      }
      ++v3;
    }
    while (v3 < *((_DWORD *)this + 14));
    *((_DWORD *)this + 14) = 0;
  }
}

void OALSource::CalculateDistanceAndAzimuth(OALSource *this, float *a2, float *a3, float *a4, float *a5)
{
  float *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  int v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  double v57;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  double v65;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  double v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;

  *a5 = 1.0;
  v10 = (float *)*((_QWORD *)this + 1);
  v11 = v10[89];
  v12 = v10[90];
  v13 = v10[91];
  v14 = v10[93];
  v15 = v10[94];
  v16 = v10[95];
  v17 = v10[96];
  v18 = v10[97];
  v19 = v10[98];
  if (*((_DWORD *)this + 71) != 1735095154)
  {
    v23 = (uint64_t *)*((_QWORD *)this + 3);
    v24 = *v23;
    v20 = 0.0;
    if (*v23)
    {
      v25 = *((_DWORD *)this + 14);
      v21 = 0.0;
      v22 = 0.0;
      if (v24 + 32 * (__int16)v25 == v23[1])
        goto LABEL_70;
      v20 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
      if (*(_DWORD *)(*(_QWORD *)(v24 + 32 * (__int16)v25 + 8) + 332) != 1)
        goto LABEL_70;
      goto LABEL_8;
    }
LABEL_24:
    v21 = 0.0;
    v22 = 0.0;
    goto LABEL_70;
  }
  if (!*((_QWORD *)this + 45))
  {
    v20 = 0.0;
    goto LABEL_24;
  }
  v20 = 0.0;
  v21 = 0.0;
  v22 = 0.0;
  if (*((_DWORD *)this + 101) != 1)
    goto LABEL_70;
LABEL_8:
  v26 = *((_DWORD *)this + 70);
  v27 = 0.0;
  if (v26)
    v28 = 0.0;
  else
    v28 = v10[88];
  if (v26)
    v29 = 0.0;
  else
    v29 = v10[87];
  if (!v26)
    v27 = v10[86];
  v30 = (float)(v15 * v19) - (float)(v16 * v18);
  v31 = (float)(v16 * v17) - (float)(v14 * v19);
  v32 = (float)(v14 * v18) - (float)(v15 * v17);
  v33 = sqrtf((float)((float)(v31 * v31) + (float)(v30 * v30)) + (float)(v32 * v32));
  if (v33 != 0.0)
  {
    v34 = 1.0 / v33;
    v30 = v30 * v34;
    v31 = v31 * v34;
    v32 = v32 * v34;
  }
  v35 = *((float *)this + 62) - v28;
  v36 = *((float *)this + 61) - v29;
  v37 = *((float *)this + 60) - v27;
  v38 = sqrtf((float)((float)(v15 * v15) + (float)(v14 * v14)) + (float)(v16 * v16));
  if (v38 != 0.0)
  {
    v39 = 1.0 / v38;
    v14 = v14 * v39;
    v15 = v15 * v39;
    v16 = v16 * v39;
  }
  v20 = sqrtf((float)((float)(v36 * v36) + (float)(v37 * v37)) + (float)(v35 * v35));
  v40 = 0.0;
  v41 = 0.0;
  v42 = 0.0;
  v43 = 0.0;
  v44 = 0.0;
  v45 = 0.0;
  if (v20 > 0.0)
  {
    v81 = v10[89];
    v82 = v10[91];
    if (v20 == 0.0)
    {
      v46 = v37;
    }
    else
    {
      v46 = v37 * (float)(1.0 / v20);
      v36 = v36 * (float)(1.0 / v20);
      v35 = v35 * (float)(1.0 / v20);
    }
    v47 = (float)(v31 * v16) - (float)(v32 * v15);
    v48 = (float)(v32 * v14) - (float)(v30 * v16);
    v49 = (float)(v30 * v15) - (float)(v31 * v14);
    v50 = (float)((float)(v48 * v36) + (float)(v46 * v47)) + (float)(v35 * v49);
    v51 = v46 - (float)(v50 * v47);
    v52 = v36 - (float)(v50 * v48);
    v53 = v35 - (float)(v50 * v49);
    v54 = sqrtf((float)((float)(v52 * v52) + (float)(v51 * v51)) + (float)(v53 * v53));
    v79 = v36;
    v80 = v10[90];
    v83 = v46;
    v77 = v47;
    v78 = v35;
    v75 = v48;
    v76 = v49;
    if (v54 != 0.0)
    {
      v55 = 1.0 / v54;
      v51 = v51 * v55;
      v52 = v52 * v55;
      v53 = v53 * v55;
    }
    v56 = acosf((float)((float)(v31 * v52) + (float)(v51 * v30)) + (float)(v53 * v32)) * 180.0 / 3.14159265;
    v57 = fabsf(v56);
    if (v57 >= 1.0e15 || v57 <= 1.0e-15)
      v56 = 0.0;
    if ((float)((float)((float)(v15 * v52) + (float)(v51 * v14)) + (float)(v53 * v16)) < 0.0)
      v56 = 360.0 - v56;
    if (v56 < 0.0 || v56 > 270.0)
      v60 = 450.0;
    else
      v60 = 90.0;
    v21 = v60 - v56;
    v11 = v81;
    v13 = v82;
    v40 = v79;
    v12 = v80;
    v41 = v83;
    v44 = v77;
    v45 = v78;
    v43 = v75;
    v42 = v76;
  }
  if (v41 != 0.0 || v40 != 0.0 || v45 != 0.0)
  {
    v61 = v12;
    v62 = v40;
    v84 = v41;
    v63 = v45;
    v64 = acosf((float)((float)(v40 * v43) + (float)(v41 * v44)) + (float)(v45 * v42)) * -180.0 / 3.14159274 + 90.0;
    v65 = fabsf(v64);
    if (v65 >= 1.0e15 || v65 <= 1.0e-15)
      v64 = 0.0;
    if (v64 <= 90.0)
      v22 = v64;
    else
      v22 = 180.0 - v64;
    if (v22 < -90.0)
      v22 = -180.0 - v22;
    v12 = v61;
    v40 = v62;
    v41 = v84;
    v45 = v63;
  }
  v67 = v10[84];
  if (v67 > 0.0)
  {
    v68 = *((float *)this + 63);
    v69 = *((float *)this + 64);
    v70 = *((float *)this + 65);
    if (v11 != 0.0 || v12 != 0.0 || v13 != 0.0 || v68 != 0.0 || v69 != 0.0 || v70 != 0.0)
    {
      v71 = sqrtf((float)((float)(v40 * v40) + (float)(v41 * v41)) + (float)(v45 * v45));
      v72 = (float)(v10[83]
                  - (float)(v67
                          * fminf((float)-(float)((float)((float)(v12 * v40) + (float)(v41 * v11)) + (float)(v45 * v13))/ v71, v10[83] / v67)))/ (float)(v10[83]- (float)(v67* fminf((float)-(float)((float)((float)(v40 * v69) + (float)(v41 * v68)) + (float)(v45 * v70))/ v71, v10[83] / v67)));
      v73 = 1.0;
      if (v72 != 0.0)
      {
        v74 = fabsf(v72);
        v73 = 16.0;
        if (v74 <= 1.0e15)
        {
          v73 = 0.125;
          if (v74 >= 1.0e-15)
          {
            v73 = 16.0;
            if (v72 <= 16.0)
            {
              v73 = v72;
              if (v72 < 0.125)
                v73 = 0.125;
            }
          }
        }
      }
      *a5 = v73;
    }
  }
LABEL_70:
  *a2 = v20;
  *a3 = v21;
  *a4 = v22;
}

uint64_t OALSource::ConeAttenuation(OALSource *this)
{
  float v2;
  float v3;
  float *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;

  v2 = *((float *)this + 66);
  if (v2 == 0.0 && *((float *)this + 67) == 0.0 && *((float *)this + 68) == 0.0
    || (v3 = *((float *)this + 72), v3 == 360.0) && *((float *)this + 73) == 360.0)
  {
    if (*((float *)this + 75) != 1.0)
    {
      *((_DWORD *)this + 75) = 1065353216;
      return 1;
    }
    return 0;
  }
  v5 = (float *)*((_QWORD *)this + 1);
  v6 = v5[86] - *((float *)this + 60);
  v7 = v5[87] - *((float *)this + 61);
  v8 = v5[88] - *((float *)this + 62);
  v9 = sqrtf((float)((float)(v7 * v7) + (float)(v6 * v6)) + (float)(v8 * v8));
  if (v9 != 0.0)
  {
    v10 = 1.0 / v9;
    v6 = v6 * v10;
    v7 = v7 * v10;
    v8 = v8 * v10;
  }
  v11 = *((float *)this + 67);
  v12 = *((float *)this + 68);
  v13 = sqrtf((float)((float)(v11 * v11) + (float)(v2 * v2)) + (float)(v12 * v12));
  if (v13 != 0.0)
  {
    v14 = 1.0 / v13;
    v2 = v2 * v14;
    v11 = v11 * v14;
    v12 = v12 * v14;
  }
  v15 = acosf((float)((float)(v7 * v11) + (float)(v6 * v2)) + (float)(v8 * v12)) * 180.0 / 3.14159265;
  v16 = fabsf(v15);
  v17 = fabsf(v3) * 0.5;
  v18 = 1.0;
  if (v16 > v17)
  {
    v19 = fabsf(*((float *)this + 73)) * 0.5;
    if (v16 >= v19)
    {
      v18 = *((float *)this + 74);
      if (v18 != *((float *)this + 75))
        goto LABEL_16;
      return 0;
    }
    v18 = 1.0
        - (float)((float)(v16 - v17) / (float)(v19 - v17))
        + (float)((float)((float)(v16 - v17) / (float)(v19 - v17)) * *((float *)this + 74));
  }
  if (v18 != *((float *)this + 75))
  {
LABEL_16:
    *((float *)this + 75) = v18;
    return 1;
  }
  return 0;
}

uint64_t OALSource::UpdateBusFormat(OALSource *this)
{
  char *v2;
  AudioUnitElement v3;
  uint64_t result;
  uint64_t *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  if (*((_DWORD *)this + 71) == 1735095154)
  {
    v2 = (char *)this + 376;
    v3 = *((_DWORD *)this + 58);
    if (v3 == -1)
      goto LABEL_3;
  }
  else
  {
    v5 = (uint64_t *)*((_QWORD *)this + 3);
    v6 = *((_DWORD *)this + 14);
    v7 = *v5;
    v8 = v5[1];
    if (v7)
      v9 = v7 + 32 * (__int16)v6 == v8;
    else
      v9 = 1;
    if (v9)
      return 0;
    v2 = (char *)(*(_QWORD *)(v7 + 32 * (__int16)v6 + 8) + 304);
    v3 = *((_DWORD *)this + 58);
    if (v3 == -1)
    {
LABEL_3:
      result = OALContext::SetBusFormat(*((_QWORD *)this + 1), v3, v2);
      if ((_DWORD)result)
        return result;
      goto LABEL_15;
    }
  }
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 28) = 0;
  if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v3, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(_QWORD *)(*((_QWORD *)this + 1) + 16) + 16), 0);
  OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1);
  *((_BYTE *)this + 236) = 0;
  result = OALContext::SetBusFormat(*((_QWORD *)this + 1), *((_DWORD *)this + 58), v2);
  if (!(_DWORD)result)
  {
LABEL_15:
    result = OALSource::AddRenderProc(this);
    if (!(_DWORD)result)
      *((_BYTE *)this + 18) = 0;
  }
  return result;
}

uint64_t OALSource::SourceInputProc(OALSource *this, void *a2, unsigned int *a3, const AudioTimeStamp *a4, unsigned int a5, AudioBufferList *a6, AudioBufferList *a7)
{
  uint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = OALSource::DoRender(this, a6, a5);
  if ((_DWORD)v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "oalSource.cpp";
    v11 = 1024;
    v12 = 2649;
    v13 = 2048;
    v14 = (int)v7;
    _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: SourceInputProc FAILED - result = %ld", (uint8_t *)&v9, 0x1Cu);
  }
  return v7;
}

uint64_t OALSource::DoRender(OALSource *this, AudioBufferList *a2, unsigned int a3)
{
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  void *mData;
  unsigned int *v22;
  unsigned int v23;
  unint64_t v24;
  void **p_mData;
  uint64_t result;
  AudioUnitElement v27;
  OSStatus v28;
  uint64_t v29;
  uint64_t (*v30)(_QWORD, uint64_t, _BYTE *, int *, _QWORD);
  float v31;
  unsigned int v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  _QWORD *v51;
  uint64_t v52;
  _DWORD *v53;
  _DWORD *v54;
  _DWORD *v55;
  NSObject *global_queue;
  uint64_t v57;
  int v58;
  _DWORD *v59;
  _BOOL4 v60;
  int v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t *v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  int v71;
  uint64_t *v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  OALSource *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  int v86;
  _DWORD *v87;
  int v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  BOOL v92;
  uint64_t v93;
  unsigned int v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unsigned int v99;
  unsigned int *v100;
  float v101;
  int v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  uint64_t *v107;
  uint64_t v108;
  unsigned int v109;
  unsigned int v110;
  int v111;
  _BOOL4 v112;
  _DWORD *v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  int v118;
  int v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  _DWORD *v123;
  _DWORD *v124;
  int v125;
  int v126;
  float v127;
  uint64_t *v128;
  uint64_t v129;
  int v130;
  uint64_t v131;
  BOOL v132;
  int v133;
  int v134;
  int v135;
  unsigned int v136;
  unsigned int *v137;
  uint64_t v138;
  unsigned int v139;
  int v140;
  int *v141;
  int v142;
  int v143;
  int v144;
  _BYTE buf[40];
  _DWORD *v146;
  int v147;
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    v6 = *((_DWORD *)this + 100) * a3;
    v7 = (int *)((char *)this + 408);
LABEL_22:
    v18 = *v7;
    goto LABEL_23;
  }
  v8 = (uint64_t *)*((_QWORD *)this + 3);
  v9 = *((_DWORD *)this + 14);
  v10 = *v8;
  v11 = v8[1];
  v12 = v10 + 32 * (__int16)v9;
  if (v10)
    v13 = v12 == v11;
  else
    v13 = 1;
  v14 = v13;
  if (!v13
    || ((v15 = (uint64_t *)*((_QWORD *)this + 4), v12 = *v15, v16 = v15[1], v12) ? (v17 = v12 == v16) : (v17 = 1), !v17))
  {
    v19 = *(_QWORD *)(v12 + 8);
    v20 = *(_DWORD *)(v19 + 324);
    if (v20)
    {
      v6 = *(_DWORD *)(v19 + 320) * (a3 / v20);
      if ((v14 & 1) != 0)
      {
LABEL_19:
        v18 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      v6 = 0;
      if ((v14 & 1) != 0)
        goto LABEL_19;
    }
    v7 = (int *)(*(_QWORD *)(v10 + 32 * (__int16)v9 + 8) + 336);
    goto LABEL_22;
  }
  v6 = 0;
  v18 = 0;
LABEL_23:
  mData = a2->mBuffers[0].mData;
  v22 = (unsigned int *)((char *)this + 68);
  do
    v23 = __ldaxr(v22);
  while (__stlxr(v23 + 1, v22));
  if (*((_DWORD *)this + 16))
  {
    if (a2->mNumberBuffers)
    {
      v24 = 0;
      p_mData = &a2->mBuffers[0].mData;
      do
      {
        bzero(*p_mData, *((unsigned int *)p_mData - 1));
        ++v24;
        p_mData += 2;
      }
      while (v24 < a2->mNumberBuffers);
      result = 0;
    }
    else
    {
      result = 0;
    }
    goto LABEL_185;
  }
  if (*((_BYTE *)this + 19))
  {
    v27 = *((_DWORD *)this + 58);
    if (v27 != -1)
    {
      v28 = AudioUnitReset(*(AudioUnit *)(*((_QWORD *)this + 1) + 32), 1u, v27);
      if (v28)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v29 = *(unsigned int *)this;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "oalSource.cpp";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1290;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v29;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = v28;
          _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::ResetMixerBus FAILED - OALSource = %ld : result = %ld", buf, 0x26u);
        }
      }
    }
    *((_BYTE *)this + 19) = 0;
  }
  if (*((_DWORD *)this + 71) != 1735095154)
  {
    OALSource::UpdateQueue(this, (OALSource *)a2);
    v33 = (uint64_t *)*((_QWORD *)this + 3);
    v34 = *v33;
    v35 = v33[1];
    v36 = *((_DWORD *)this + 14);
    v37 = *v33 + 32 * (__int16)v36;
    if (*v33)
      v38 = v37 == v35;
    else
      v38 = 1;
    if (!v38)
    {
      v57 = (__int16)v36;
      v58 = v36 + 1;
      while (!*(_DWORD *)v37 || !*(_QWORD *)(*(_QWORD *)(v34 + 32 * v57 + 8) + 288))
      {
        *(_DWORD *)(v34 + 32 * v57 + 20) = 2;
        *((_DWORD *)this + 14) = v58;
        v57 = (__int16)v58;
        v37 = v34 + 32 * (__int16)v58++;
        if (v37 == v35)
          goto LABEL_48;
      }
LABEL_70:
      if (*((_DWORD *)this + 71) == 1735095154)
      {
        v59 = (_DWORD *)((char *)this + 400);
        v60 = 1;
      }
      else
      {
        v62 = (uint64_t *)*((_QWORD *)this + 3);
        v63 = *v62;
        v64 = v62[1];
        v65 = *v62 + ((uint64_t)((unint64_t)*((unsigned int *)this + 14) << 48) >> 43);
        if (v63)
          v66 = v65 == v64;
        else
          v66 = 1;
        if (v66
          && ((v67 = (uint64_t *)*((_QWORD *)this + 4), v65 = *v67, v68 = v67[1], v65) ? (v69 = v65 == v68) : (v69 = 1),
              v69)
          || (v70 = *(_QWORD *)(v65 + 8), (v71 = *(_DWORD *)(v70 + 324)) == 0))
        {
          v61 = 0;
LABEL_94:
          OALSource::ChangeChannelSettings(this);
          v77 = *(_QWORD *)(v37 + 8);
          v78 = *(unsigned int *)(v37 + 16);
          if (*(_DWORD *)(v77 + 300) - (int)v78 >= v6)
          {
            if (!*((_BYTE *)this + 237))
            {
              v126 = *((_DWORD *)this + 86);
              if (v126 == -1 || v126 == 1)
              {
                memcpy(mData, (const void *)(*(_QWORD *)(v77 + 288) + v78), v6);
                LODWORD(v78) = *(_DWORD *)(v37 + 16);
              }
              else
              {
                a2->mBuffers[0].mData = (void *)(*(_QWORD *)(v77 + 288) + v78);
              }
            }
            *(_DWORD *)(v37 + 16) = v78 + v6;
            v127 = (float)v6;
            if (*((_DWORD *)this + 71) == 1735095154)
            {
              v32 = v127 / *((_DWORD *)this + 100);
            }
            else
            {
              v32 = 0;
              v128 = (uint64_t *)*((_QWORD *)this + 3);
              v129 = *v128;
              if (*v128)
              {
                v130 = *((_DWORD *)this + 14);
                if (v129 + 32 * (__int16)v130 != v128[1])
                {
                  v131 = *(_QWORD *)(v129 + 32 * (__int16)v130 + 8);
                  v32 = *(_DWORD *)(v131 + 324) * (float)(v127 / (float)*(unsigned int *)(v131 + 320));
                }
              }
            }
          }
          else
          {
            v32 = 0;
            if (a3)
            {
              v141 = (int *)((char *)this + 400);
              v143 = v61;
              do
              {
                if (*((_BYTE *)this + 60))
                  break;
                v79 = (uint64_t *)*((_QWORD *)this + 3);
                v80 = *v79;
                v81 = v79[1];
                LODWORD(v82) = *((_DWORD *)this + 14);
                v83 = *v79 + 32 * (__int16)v82;
                if (*v79)
                  v84 = v83 == v81;
                else
                  v84 = 1;
                if (v84)
                {
LABEL_158:
                  *((_BYTE *)this + 60) = 1;
                  OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
                  v61 = v143;
                  break;
                }
                v85 = (__int16)v82;
                while (!*(_DWORD *)v83 || !*(_QWORD *)(*(_QWORD *)(v80 + 32 * v85 + 8) + 288))
                {
                  *(_DWORD *)(v80 + 32 * v85 + 20) = 2;
                  LODWORD(v82) = v82 + 1;
                  *((_DWORD *)this + 14) = v82;
                  v85 = (__int16)v82;
                  v83 = v80 + 32 * (__int16)v82;
                  if (v83 == v81)
                    goto LABEL_158;
                }
                *(_DWORD *)(v83 + 20) = 1;
                v86 = *((_DWORD *)this + 71);
                v87 = (_DWORD *)((char *)this + 400);
                v88 = v32;
                if (v86 != 1735095154)
                {
                  v89 = v80 + 32 * (__int16)v82;
                  if (v89 == v81
                    && ((v90 = (uint64_t *)*((_QWORD *)this + 4), v89 = *v90, v91 = v90[1], v89)
                      ? (v92 = v89 == v91)
                      : (v92 = 1),
                        v92)
                    || (v93 = *(_QWORD *)(v89 + 8), (v94 = *(_DWORD *)(v93 + 324)) == 0))
                  {
                    v82 = (__int16)v82;
                    v95 = (char *)a2->mBuffers[0].mData;
                    v104 = *(_QWORD *)(v83 + 8);
                    v97 = v83 + 8;
                    v96 = v104;
                    v100 = (unsigned int *)(v97 + 8);
                    v99 = *(_DWORD *)(v97 + 8);
                    v101 = (float)(*(_DWORD *)(v104 + 300) - v99);
                    goto LABEL_120;
                  }
                  v87 = (_DWORD *)(v93 + 320);
                  v88 = v32 / v94;
                }
                v95 = (char *)a2->mBuffers[0].mData + (*v87 * v88);
                v98 = *(_QWORD *)(v83 + 8);
                v97 = v83 + 8;
                v96 = v98;
                v100 = (unsigned int *)(v97 + 8);
                v99 = *(_DWORD *)(v97 + 8);
                v101 = (float)(*(_DWORD *)(v98 + 300) - v99);
                if (v86 == 1735095154)
                {
                  v102 = *v141;
                  v103 = v101 / *v141;
                  if (v103 >= a3 - v32)
                    v103 = a3 - v32;
                  v139 = v103;
                  goto LABEL_128;
                }
                v82 = (__int16)v82;
LABEL_120:
                v105 = v80 + 32 * v82;
                if (v105 == v81)
                {
                  v106 = 0;
                  v107 = (uint64_t *)*((_QWORD *)this + 4);
                  v105 = *v107;
                  if (!*v107 || v105 == v107[1])
                  {
                    v139 = 0;
                    goto LABEL_131;
                  }
                }
                else if (*(_DWORD *)(*(_QWORD *)(v105 + 8) + 324)
                        * (float)(v101 / (float)*(unsigned int *)(*(_QWORD *)(v105 + 8) + 320)) >= a3 - v32)
                {
                  v106 = a3 - v32;
                }
                else
                {
                  v106 = *(_DWORD *)(*(_QWORD *)(v105 + 8) + 324)
                       * (float)(v101 / (float)*(unsigned int *)(*(_QWORD *)(v105 + 8) + 320));
                }
                v108 = *(_QWORD *)(v105 + 8);
                v109 = *(_DWORD *)(v108 + 324);
                v139 = v106;
                if (v109)
                {
                  v102 = *(_DWORD *)(v108 + 320);
                  v103 = v106 / v109;
LABEL_128:
                  v106 = v102 * v103;
                  goto LABEL_131;
                }
                v106 = 0;
LABEL_131:
                if (!*((_BYTE *)this + 237))
                {
                  v137 = v100;
                  memcpy(v95, (const void *)(*(_QWORD *)(v96 + 288) + v99), v106);
                  v100 = v137;
                  v99 = *v137;
                  v96 = *(_QWORD *)v97;
                  v86 = *((_DWORD *)this + 71);
                }
                v61 = v143;
                v110 = v99 + v106;
                *v100 = v110;
                v111 = *(_DWORD *)(v96 + 300);
                if (v86 == 1735095154)
                {
                  v112 = 1;
                  v113 = (_DWORD *)((char *)this + 400);
                  goto LABEL_141;
                }
                v114 = (_QWORD *)*((_QWORD *)this + 3);
                if (*v114
                  && (v115 = *v114 + ((uint64_t)((unint64_t)*((unsigned int *)this + 14) << 48) >> 43),
                      v115 != v114[1])
                  || (v116 = (uint64_t *)*((_QWORD *)this + 4), (v115 = *v116) != 0) && v115 != v116[1])
                {
                  v117 = *(_QWORD *)(v115 + 8);
                  v118 = *(_DWORD *)(v117 + 324);
                  if (v118)
                  {
                    v112 = v118 == 1;
                    v113 = (_DWORD *)(v117 + 320);
LABEL_141:
                    if (v111 - v110 < *v113 * v112)
                    {
                      v119 = *((_DWORD *)this + 14);
                      LOWORD(v120) = v119 + 1;
                      *((_DWORD *)this + 14) = v119 + 1;
                      v121 = (uint64_t *)*((_QWORD *)this + 3);
                      v122 = *v121;
                      if (!*v121
                        || (v123 = (_DWORD *)v121[1], v124 = (_DWORD *)(v122 + 32 * (__int16)v120), v124 == v123))
                      {
LABEL_149:
                        if (*((_DWORD *)this + 69) == 1)
                        {
                          OALSource::LoopToBeginning(this, v76);
                        }
                        else
                        {
                          *((_BYTE *)this + 60) = 1;
                          OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
                        }
                      }
                      else
                      {
                        v120 = (__int16)v120;
                        v125 = v119 + 2;
                        while (!*v124 || !*(_QWORD *)(*(_QWORD *)(v122 + 32 * v120 + 8) + 288))
                        {
                          *(_DWORD *)(v122 + 32 * v120 + 20) = 2;
                          *((_DWORD *)this + 14) = v125;
                          v120 = (__int16)v125;
                          v124 = (_DWORD *)(v122 + 32 * (__int16)v125++);
                          if (v124 == v123)
                            goto LABEL_149;
                        }
                      }
                    }
                  }
                }
                v32 += v139;
              }
              while (v32 < a3);
            }
          }
LABEL_169:
          if (*((_BYTE *)this + 237))
            v132 = 1;
          else
            v132 = v32 >= a3;
          if (!v132)
          {
            if (v18 == 8)
              v133 = -128;
            else
              v133 = 0;
            memset((char *)a2->mBuffers[0].mData + v32 * v61, v133, v6 - v32 * v61);
          }
          v134 = *((_DWORD *)this + 86);
          if (v134 == -1)
          {
            v135 = 1;
          }
          else
          {
            if (v134 != 1)
              goto LABEL_182;
            v135 = 0;
          }
          OALSource::Ramp((uint64_t)this, a2, v135);
          *((_DWORD *)this + 86) = -2;
LABEL_182:
          if (*((_BYTE *)this + 237))
            result = 1397312581;
          else
            result = 0;
          goto LABEL_185;
        }
        v60 = v71 == 1;
        v59 = (_DWORD *)(v70 + 320);
      }
      v61 = *v59 * v60;
      goto LABEL_94;
    }
LABEL_48:
    if (*((_DWORD *)this + 69))
    {
      v39 = *((_QWORD *)this + 4);
      *((_QWORD *)this + 3) = v39;
      *((_QWORD *)this + 4) = v33;
      v41 = *(_QWORD *)v39;
      v40 = *(_QWORD *)(v39 + 8);
      v42 = v35 - v34;
      v43 = v40 - *(_QWORD *)v39;
      v13 = v40 == *(_QWORD *)v39;
      *(_DWORD *)(v39 + 24) = v43 >> 5;
      *((_DWORD *)v33 + 6) = v42 >> 5;
      *((_DWORD *)this + 12) = *((_DWORD *)v33 + 6) + *(_DWORD *)(v39 + 24);
      if (v13)
      {
        v61 = 0;
        v32 = 0;
        *((_DWORD *)this + 14) = 0;
        *((_BYTE *)this + 60) = 0;
        goto LABEL_169;
      }
      v44 = v43 - 32;
      v45 = v41;
      if (v44 < 0x20)
        goto LABEL_190;
      v46 = (v44 >> 5) + 1;
      v45 = v41 + 32 * (v46 & 0xFFFFFFFFFFFFFFELL);
      v47 = (_QWORD *)(v41 + 48);
      v48 = v46 & 0xFFFFFFFFFFFFFFELL;
      do
      {
        *(v47 - 4) = 0;
        *v47 = 0;
        v47 += 8;
        v48 -= 2;
      }
      while (v48);
      if (v46 != (v46 & 0xFFFFFFFFFFFFFFELL))
      {
LABEL_190:
        do
        {
          *(_QWORD *)(v45 + 16) = 0;
          v45 += 32;
        }
        while (v45 != v40);
      }
      *((_DWORD *)this + 14) = 0;
      *((_BYTE *)this + 60) = 0;
      if (v41)
      {
        v49 = 0;
        v50 = 1;
        v37 = v41;
        while (!*(_DWORD *)v37 || !*(_QWORD *)(*(_QWORD *)(v41 + 32 * v49 + 8) + 288))
        {
          *(_DWORD *)(v41 + 32 * v49 + 20) = 2;
          *((_DWORD *)this + 14) = v50;
          v49 = (__int16)v50;
          v37 = v41 + 32 * (__int16)v50++;
          if (v37 == v40)
            goto LABEL_74;
        }
        v51 = (_QWORD *)*((_QWORD *)this + 52);
        if (v51)
        {
          v52 = v51[3];
          if (v52)
          {
            v138 = v51[3];
            v142 = (*(uint64_t (**)(void))(*(_QWORD *)v52 + 16))();
            v140 = v18;
            v54 = (_DWORD *)*v51;
            v53 = (_DWORD *)v51[1];
            if ((_DWORD *)*v51 != v53)
            {
              v55 = (_DWORD *)*v51;
              do
              {
                if (*v55 == 36864)
                {
                  global_queue = dispatch_get_global_queue(0, 0);
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  *(_QWORD *)&buf[8] = 0x40000000;
                  *(_QWORD *)&buf[16] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
                  *(_QWORD *)&buf[24] = &__block_descriptor_tmp;
                  *(_QWORD *)&buf[32] = v51;
                  v146 = v54;
                  v147 = 36864;
                  dispatch_async(global_queue, buf);
                  v53 = (_DWORD *)v51[1];
                }
                v55 += 6;
                v54 += 6;
              }
              while (v55 != v53);
            }
            if (v142)
              (*(void (**)(uint64_t))(*(_QWORD *)v138 + 24))(v138);
            v18 = v140;
          }
        }
        goto LABEL_70;
      }
    }
    else
    {
      *((_BYTE *)this + 60) = 1;
      OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 1);
    }
LABEL_74:
    v61 = 0;
    v32 = 0;
    goto LABEL_169;
  }
  v30 = (uint64_t (*)(_QWORD, uint64_t, _BYTE *, int *, _QWORD))*((_QWORD *)this + 45);
  if (v30)
  {
    *(_QWORD *)buf = mData;
    v144 = v6;
    result = v30(*(unsigned int *)this, v6, buf, &v144, *((_QWORD *)this + 46));
    if (!(_DWORD)result)
    {
      v31 = (float)v144;
      if (*((_DWORD *)this + 71) == 1735095154)
      {
        v32 = v31 / *((_DWORD *)this + 100);
        if (v32 <= a3)
        {
LABEL_92:
          OALSource::ChangeChannelSettings(this);
          v61 = 0;
          goto LABEL_169;
        }
      }
      else
      {
        v32 = 0;
        v72 = (uint64_t *)*((_QWORD *)this + 3);
        v73 = *v72;
        if (!*v72)
          goto LABEL_92;
        v74 = *((_DWORD *)this + 14);
        if (v73 + 32 * (__int16)v74 == v72[1])
          goto LABEL_92;
        v75 = *(_QWORD *)(v73 + 32 * (__int16)v74 + 8);
        v32 = *(_DWORD *)(v75 + 324) * (float)(v31 / (float)*(unsigned int *)(v75 + 320));
        if (v32 <= a3)
          goto LABEL_92;
      }
      result = 4294967246;
    }
  }
  else
  {
    result = 1397312581;
  }
  do
LABEL_185:
    v136 = __ldaxr(v22);
  while (__stlxr(v136 - 1, v22));
  return result;
}

void sub_215C4FA4C(_Unwind_Exception *a1)
{
  unsigned int *v1;
  unsigned int v2;

  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 - 1, v1));
  _Unwind_Resume(a1);
}

uint64_t OALSource::Ramp(uint64_t this, AudioBufferList *a2, int a3)
{
  int v3;
  int v4;
  uint64_t mNumberChannels;
  UInt32 v6;
  double *v7;
  uint64_t *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  UInt32 mDataByteSize;
  uint64_t v14;
  unsigned int v15;
  double *v16;
  uint64_t *v17;
  uint64_t v18;
  double v19;
  int v20;
  unsigned int v21;
  float v22;
  BOOL v23;
  __int16 v24;
  uint64_t v25;
  int16x4_t *v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t *v30;
  uint64_t v31;
  double v32;
  int v33;
  unsigned int v34;
  float v35;
  BOOL v36;
  __int16 v37;
  uint64_t v38;
  int8x16_t *v39;
  int v40;
  __int16 v41;
  int v42;
  int v43;
  __int16 v44;
  int16x4_t *v45;
  int16x8_t v46;
  int16x8_t v47;
  int v48;
  uint64_t v49;
  int v50;
  __int16 v51;
  int8x16_t v52;
  unint64_t v53;
  int8x16_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int v58;
  __int16 v59;
  int v60;
  int8x16_t v61;
  int8x16_t *v62;
  uint64_t v63;
  int8x16_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int v68;
  int8x16x4_t v69;
  int8x16x4_t v70;

  v3 = *(_DWORD *)(this + 284);
  if (v3 == 1735095154)
  {
    v4 = *(_DWORD *)(this + 408);
    if (v4 != 8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(uint64_t **)(this + 24);
    v9 = *(_DWORD *)(this + 56);
    v10 = *v8;
    v11 = v8[1];
    if (v10)
      v12 = v10 + 32 * (__int16)v9 == v11;
    else
      v12 = 1;
    if (v12)
      return this;
    v4 = *(_DWORD *)(*(_QWORD *)(v10 + 32 * (__int16)v9 + 8) + 336);
    if (v4 != 8)
    {
LABEL_3:
      if (v4 != 16)
        return this;
      mNumberChannels = a2->mBuffers[0].mNumberChannels;
      v6 = a2->mBuffers[0].mDataByteSize >> 1;
      if (v3 == 1735095154)
      {
        v7 = (double *)(this + 376);
      }
      else
      {
        v17 = *(uint64_t **)(this + 24);
        v18 = *v17;
        v19 = 0.0;
        if (!*v17)
          goto LABEL_17;
        v20 = *(_DWORD *)(this + 56);
        if (v18 + 32 * (__int16)v20 == v17[1])
          goto LABEL_17;
        v7 = (double *)(*(_QWORD *)(v18 + 32 * (__int16)v20 + 8) + 304);
      }
      v19 = *v7 * 0.00579999993;
LABEL_17:
      v21 = vcvtmd_u64_f64(v19);
      if (v6 / mNumberChannels < v21)
        v21 = v6 / mNumberChannels;
      v22 = 1.0;
      if (a3)
        v22 = -1.0;
      if (v21)
        v23 = (_DWORD)mNumberChannels == 0;
      else
        v23 = 1;
      if (!v23)
      {
        v24 = vcvtd_n_s64_f64((float)(v22 / (float)v21), 0xFuLL);
        v25 = v6 - v21 * (_DWORD)mNumberChannels;
        if (!a3)
          v25 = 0;
        v26 = (int16x4_t *)((char *)a2->mBuffers[0].mData + 2 * v25);
        if (mNumberChannels >= 0x10)
        {
          v43 = 0;
          v44 = 0;
          do
          {
            v45 = v26 + 2;
            v26 = (int16x4_t *)((char *)v26 + 2 * (mNumberChannels & 0xFFFFFFF0));
            this = mNumberChannels & 0xFFFFFFF0;
            do
            {
              v46 = vdupq_n_s16(v44);
              v47 = vshrn_high_n_s32(vshrn_n_s32(vmull_s16(*(int16x4_t *)v46.i8, *v45), 0xFuLL), vmull_high_s16(v46, *(int16x8_t *)v45->i8), 0xFuLL);
              *(int16x8_t *)v45[-2].i8 = vshrn_high_n_s32(vshrn_n_s32(vmull_s16(*(int16x4_t *)v46.i8, v45[-2]), 0xFuLL), vmull_high_s16(v46, *(int16x8_t *)v45[-2].i8), 0xFuLL);
              *(int16x8_t *)v45->i8 = v47;
              v45 += 4;
              this -= 16;
            }
            while (this);
            if ((mNumberChannels & 0xFFFFFFF0) != mNumberChannels)
            {
              v48 = mNumberChannels - (mNumberChannels & 0xFFFFFFF0);
              do
              {
                this = (v26->i16[0] * v44) >> 15;
                v26->i16[0] = this;
                v26 = (int16x4_t *)((char *)v26 + 2);
                --v48;
              }
              while (v48);
            }
            v44 += v24;
            ++v43;
          }
          while (v43 != v21);
        }
        else
        {
          v27 = 0;
          v28 = 0;
          do
          {
            v29 = mNumberChannels;
            do
            {
              v26->i16[0] = (v26->i16[0] * v28) >> 15;
              v26 = (int16x4_t *)((char *)v26 + 2);
              --v29;
            }
            while (v29);
            v28 += v24;
            ++v27;
          }
          while (v27 != v21);
        }
      }
      return this;
    }
  }
  v14 = a2->mBuffers[0].mNumberChannels;
  mDataByteSize = a2->mBuffers[0].mDataByteSize;
  v15 = mDataByteSize / v14;
  if (v3 == 1735095154)
  {
    v16 = (double *)(this + 376);
  }
  else
  {
    v30 = *(uint64_t **)(this + 24);
    v31 = *v30;
    v32 = 0.0;
    if (!*v30)
      goto LABEL_37;
    v33 = *(_DWORD *)(this + 56);
    if (v31 + 32 * (__int16)v33 == v30[1])
      goto LABEL_37;
    v16 = (double *)(*(_QWORD *)(v31 + 32 * (__int16)v33 + 8) + 304);
  }
  v32 = *v16 * 0.00579999993;
LABEL_37:
  v34 = vcvtmd_u64_f64(v32);
  if (v15 >= v34)
    v15 = v34;
  v35 = 1.0;
  if (a3)
    v35 = -1.0;
  if (v15)
    v36 = (_DWORD)v14 == 0;
  else
    v36 = 1;
  if (!v36)
  {
    v37 = vcvtd_n_s64_f64((float)(v35 / (float)v15), 0xFuLL);
    v38 = mDataByteSize - v15 * (_DWORD)v14;
    if (!a3)
      v38 = 0;
    v39 = (int8x16_t *)((char *)a2->mBuffers[0].mData + v38);
    if (v14 > 0xF)
    {
      v49 = v14 & 0xFFFFFFF0;
      if (v49 == v14)
      {
        v50 = 0;
        v51 = 0;
        v52.i64[0] = 0x8080808080808080;
        v52.i64[1] = 0x8080808080808080;
        do
        {
          v53 = 0;
          do
          {
            v54 = veorq_s8(v39[v53 / 0x10], v52);
            v55 = vmovl_high_s8(v54);
            v56 = vmovl_s8(*(int8x8_t *)v54.i8);
            v57 = vdupq_n_s16(v51);
            v69.val[3] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_high_s16(v57, v55), 0xFuLL);
            v69.val[2] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_s16(*(int16x4_t *)v57.i8, *(int16x4_t *)v55.i8), 0xFuLL);
            v69.val[1] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_high_s16(v57, v56), 0xFuLL);
            v69.val[0] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_s16(*(int16x4_t *)v57.i8, *(int16x4_t *)v56.i8), 0xFuLL);
            v39[v53 / 0x10] = veorq_s8(vqtbl4q_s8(v69, (int8x16_t)xmmword_215C560A0), v52);
            v53 += 16;
          }
          while (v49 != v53);
          v51 += v37;
          ++v50;
          v39 = (int8x16_t *)((char *)v39 + v49);
        }
        while (v50 != v15);
      }
      else
      {
        v58 = 0;
        v59 = 0;
        v60 = v14 - v49;
        v61.i64[0] = 0x8080808080808080;
        v61.i64[1] = 0x8080808080808080;
        do
        {
          v62 = v39;
          v39 = (int8x16_t *)((char *)v39 + v49);
          v63 = v49;
          do
          {
            v64 = veorq_s8(*v62, v61);
            v65 = vmovl_high_s8(v64);
            v66 = vmovl_s8(*(int8x8_t *)v64.i8);
            v67 = vdupq_n_s16(v59);
            v70.val[3] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_high_s16(v67, v65), 0xFuLL);
            v70.val[2] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_s16(*(int16x4_t *)v67.i8, *(int16x4_t *)v65.i8), 0xFuLL);
            v70.val[1] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_high_s16(v67, v66), 0xFuLL);
            v70.val[0] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_s16(*(int16x4_t *)v67.i8, *(int16x4_t *)v66.i8), 0xFuLL);
            *v62++ = veorq_s8(vqtbl4q_s8(v70, (int8x16_t)xmmword_215C560A0), v61);
            v63 -= 16;
          }
          while (v63);
          v68 = v60;
          do
          {
            v39->i8[0] = (((v39->i8[0] ^ 0x7FFF80u) * v59) >> 15) ^ 0x80;
            v39 = (int8x16_t *)((char *)v39 + 1);
            --v68;
          }
          while (v68);
          v59 += v37;
          ++v58;
        }
        while (v58 != v15);
      }
    }
    else
    {
      v40 = 0;
      v41 = 0;
      do
      {
        v42 = v14;
        do
        {
          v39->i8[0] = (((v39->i8[0] ^ 0x7FFF80u) * v41) >> 15) ^ 0x80;
          v39 = (int8x16_t *)((char *)v39 + 1);
          --v42;
        }
        while (v42);
        v41 += v37;
        ++v40;
      }
      while (v40 != v15);
    }
  }
  return this;
}

uint64_t OALSource::DoPostRender(OALSource *this)
{
  OALSource *v2;
  unsigned int *v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t *v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  AudioUnitElement v13;
  unsigned int v14;
  OALSource *v15;
  uint64_t *v16;
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  char **v23;
  char *v24;
  char *v25;
  int64_t v26;
  char *v27;
  AudioUnitElement v28;
  unsigned int v29;
  OALBuffer *v30;
  int v31;
  OALSource *v32;
  BufferQueue *v33;
  AudioUnitElement v34;
  NSObject *v35;
  _QWORD *v36;
  uint64_t v37;
  int v38;
  _DWORD *v39;
  _DWORD *v40;
  _DWORD *v41;
  NSObject *v42;
  uint64_t v43;
  AudioUnitElement v44;
  unsigned int v45;
  OALSource *v46;
  uint64_t *v47;
  int v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  char **v54;
  char *v55;
  char *v56;
  int64_t v57;
  char *v58;
  _QWORD *v59;
  uint64_t v60;
  _DWORD *v61;
  _DWORD *v62;
  uint64_t v63;
  _DWORD *v64;
  NSObject *global_queue;
  unsigned int v66;
  char v68;
  int v69;
  _BYTE buf[40];
  _DWORD *v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v2 = (OALSource *)*((unsigned int *)this + 58);
  v3 = (unsigned int *)((char *)this + 68);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 + 1, v3));
  if (*((_DWORD *)this + 16))
  {
    v5 = 0;
    goto LABEL_114;
  }
  if (*((_DWORD *)this + 86) != -2
    || (v6 = (unint64_t *)((char *)this + 424), (v7 = (_QWORD *)*((_QWORD *)this + 53)) == 0))
  {
LABEL_82:
    if (*((_BYTE *)this + 60))
    {
      v44 = *((_DWORD *)this + 58);
      if (v44 != -1)
      {
        *((_QWORD *)this + 27) = 0;
        *((_QWORD *)this + 28) = 0;
        if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v44, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(_QWORD *)(*((_QWORD *)this + 1) + 16) + 16), 0);
        OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1);
        *((_BYTE *)this + 236) = 0;
        v45 = *((_DWORD *)this + 58);
        if (v45 != -1)
        {
          OALContext::SetBusAsAvailable(*((_QWORD *)this + 1), v45);
          *((_DWORD *)this + 58) = -1;
        }
      }
      OALSource::SetPlaybackState(this, 4116, 1);
      v47 = (uint64_t *)*((_QWORD *)this + 3);
      v48 = *((_DWORD *)v47 + 6);
      if (v48)
      {
        do
        {
          v51 = *v47;
          v50 = v47[1];
          v52 = v51 == v50;
          if (v51 == v50)
            v53 = 0;
          else
            v53 = v51;
          if (!v52)
            *(_DWORD *)(v51 + 20) = 2;
          BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), v46, *(_DWORD *)v53, *(OALBuffer **)(v53 + 8), *(_DWORD *)(v53 + 24));
          v54 = (char **)*((_QWORD *)this + 3);
          v56 = *v54;
          v55 = v54[1];
          if (*v54 == v55)
          {
            v49 = *v54;
          }
          else
          {
            v46 = (OALSource *)(v56 + 32);
            v57 = v55 - (v56 + 32);
            if (v55 != v56 + 32)
              memmove(*v54, v46, v55 - (v56 + 32));
            v58 = *v54;
            v49 = &v56[v57];
            v54[1] = &v56[v57];
            v56 = v58;
          }
          *((_DWORD *)v54 + 6) = (unint64_t)(v49 - v56) >> 5;
          v47 = (uint64_t *)*((_QWORD *)this + 3);
          *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *((_DWORD *)v47 + 6);
        }
        while (*((_DWORD *)v47 + 6));
      }
      *((_DWORD *)this + 14) = 0;
      *((_BYTE *)this + 60) = 0;
      if (v48)
      {
        v59 = (_QWORD *)*((_QWORD *)this + 52);
        if (v59)
        {
          v60 = v59[3];
          if (v60)
          {
            v69 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v60 + 16))(v59[3]);
            v62 = (_DWORD *)*v59;
            v61 = (_DWORD *)v59[1];
            if ((_DWORD *)*v59 != v61)
            {
              v63 = MEMORY[0x24BDAC760];
              v64 = (_DWORD *)*v59;
              do
              {
                if (*v64 == 4118)
                {
                  global_queue = dispatch_get_global_queue(0, 0);
                  *(_QWORD *)buf = v63;
                  *(_QWORD *)&buf[8] = 0x40000000;
                  *(_QWORD *)&buf[16] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
                  *(_QWORD *)&buf[24] = &__block_descriptor_tmp;
                  *(_QWORD *)&buf[32] = v59;
                  v71 = v62;
                  v72 = 4118;
                  dispatch_async(global_queue, buf);
                  v61 = (_DWORD *)v59[1];
                }
                v64 += 6;
                v62 += 6;
              }
              while (v64 != v61);
            }
            if (v69)
              (*(void (**)(uint64_t))(*(_QWORD *)v60 + 24))(v60);
          }
        }
      }
    }
    if (!*((_QWORD *)this + 53))
      OALContext::SetBusNeedsPostRender(*((_QWORD *)this + 1), *((_DWORD *)this + 58), 0);
    v5 = 0;
    goto LABEL_114;
  }
  do
  {
    while (1)
    {
      v8 = __ldaxr(v6);
      if ((_QWORD *)v8 == v7)
        break;
      __clrex();
      v7 = (_QWORD *)*v6;
      if (!*v6)
        goto LABEL_82;
    }
  }
  while (__stlxr(0, v6));
  v9 = 0;
  do
  {
    v10 = v9;
    v9 = v7;
    v7 = (_QWORD *)*v7;
    *v9 = v10;
  }
  while (v7);
  v68 = 0;
  v11 = (_QWORD *)((char *)this + 216);
  while (2)
  {
    switch(*((_DWORD *)v9 + 2))
    {
      case 1:
        if (*((_DWORD *)this + 76) != 4116)
        {
          v13 = *((_DWORD *)this + 58);
          if (v13 != -1)
          {
            *v11 = 0;
            *((_QWORD *)this + 28) = 0;
            if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v13, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(_QWORD *)(*((_QWORD *)this + 1) + 16) + 16), 0);
            OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1);
            *((_BYTE *)this + 236) = 0;
            v14 = *((_DWORD *)this + 58);
            if (v14 != -1)
            {
              OALContext::SetBusAsAvailable(*((_QWORD *)this + 1), v14);
              *((_DWORD *)this + 58) = -1;
            }
          }
          OALSource::SetPlaybackState(this, 4116, 1);
          v16 = (uint64_t *)*((_QWORD *)this + 3);
          v17 = *((_DWORD *)v16 + 6);
          while (*((_DWORD *)v16 + 6))
          {
            v20 = *v16;
            v19 = v16[1];
            v21 = v20 == v19;
            if (v20 == v19)
              v22 = 0;
            else
              v22 = v20;
            if (!v21)
              *(_DWORD *)(v20 + 20) = 2;
            BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), v15, *(_DWORD *)v22, *(OALBuffer **)(v22 + 8), *(_DWORD *)(v22 + 24));
            v23 = (char **)*((_QWORD *)this + 3);
            v25 = *v23;
            v24 = v23[1];
            if (*v23 == v24)
            {
              v18 = *v23;
            }
            else
            {
              v15 = (OALSource *)(v25 + 32);
              v26 = v24 - (v25 + 32);
              if (v24 != v25 + 32)
                memmove(*v23, v15, v24 - (v25 + 32));
              v27 = *v23;
              v18 = &v25[v26];
              v23[1] = &v25[v26];
              v25 = v27;
            }
            *((_DWORD *)v23 + 6) = (unint64_t)(v18 - v25) >> 5;
            v16 = (uint64_t *)*((_QWORD *)this + 3);
            *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *((_DWORD *)v16 + 6);
          }
          *((_DWORD *)this + 14) = 0;
          *((_BYTE *)this + 60) = 0;
          if (v17)
          {
            v36 = (_QWORD *)*((_QWORD *)this + 52);
            if (v36)
            {
              v37 = v36[3];
              if (v37)
              {
                v38 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v37 + 16))(v36[3]);
                v40 = (_DWORD *)*v36;
                v39 = (_DWORD *)v36[1];
                if ((_DWORD *)*v36 != v39)
                {
                  v41 = (_DWORD *)*v36;
                  do
                  {
                    if (*v41 == 4118)
                    {
                      v42 = dispatch_get_global_queue(0, 0);
                      *(_QWORD *)buf = MEMORY[0x24BDAC760];
                      *(_QWORD *)&buf[8] = 0x40000000;
                      *(_QWORD *)&buf[16] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
                      *(_QWORD *)&buf[24] = &__block_descriptor_tmp;
                      *(_QWORD *)&buf[32] = v36;
                      v71 = v40;
                      v72 = 4118;
                      dispatch_async(v42, buf);
                      v39 = (_DWORD *)v36[1];
                    }
                    v41 += 6;
                    v40 += 6;
                  }
                  while (v41 != v39);
                }
                if (v38)
                  (*(void (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37);
              }
            }
          }
        }
        goto LABEL_15;
      case 2:
        if (*((_DWORD *)this + 76) != 4113)
        {
          v28 = *((_DWORD *)this + 58);
          if (v28 != -1)
          {
            *v11 = 0;
            *((_QWORD *)this + 28) = 0;
            if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v28, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(_QWORD *)(*((_QWORD *)this + 1) + 16) + 16), 0);
            OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1);
            *((_BYTE *)this + 236) = 0;
            v29 = *((_DWORD *)this + 58);
            if (v29 != -1)
            {
              OALContext::SetBusAsAvailable(*((_QWORD *)this + 1), v29);
              *((_DWORD *)this + 58) = -1;
            }
          }
          OALSource::SetPlaybackState(this, 4113, 1);
          *((_BYTE *)this + 60) = 0;
        }
        goto LABEL_15;
      case 3:
        v30 = (OALBuffer *)v9[2];
        v31 = *(_DWORD *)v30;
        OALSource::FlushBufferQueue(this);
        if (v31)
        {
          v33 = (BufferQueue *)*((_QWORD *)this + 3);
          if (*(_QWORD *)v33 == *((_QWORD *)v33 + 1))
          {
            *((_DWORD *)this + 14) = 0;
            *((_BYTE *)this + 60) = 0;
          }
          BufferQueue::AppendBuffer(v33, v32, v31, v30, 0);
          *((_DWORD *)this + 12) = *(_DWORD *)(*((_QWORD *)this + 4) + 24) + *(_DWORD *)(*((_QWORD *)this + 3) + 24);
          OALBuffer::UseThisBuffer(v30, this);
          *((_DWORD *)this + 71) = 4136;
        }
        else
        {
          *((_DWORD *)this + 71) = 4144;
          *((_BYTE *)this + 352) = 0;
        }
        *(_BYTE *)(v9[2] + 352) = 0;
        OALSource::SetPlaybackState(this, 4116, 1);
        goto LABEL_15;
      case 4:
        *((_DWORD *)this + 86) = 0;
        v5 = OALSource::Play(this);
        if ((_DWORD)v5)
          goto LABEL_79;
        goto LABEL_16;
      case 5:
        OALSource::SetPlaybackState(this, 4115, 1);
        v34 = *((_DWORD *)this + 58);
        if (v34 != -1)
        {
          *v11 = 0;
          *((_QWORD *)this + 28) = 0;
          if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v34, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(_QWORD *)(*((_QWORD *)this + 1) + 16) + 16), 0);
          OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1);
          *((_BYTE *)this + 236) = 0;
        }
        *((_DWORD *)this + 86) = 0;
        goto LABEL_63;
      case 6:
        *((_DWORD *)this + 86) = 1;
        v5 = OALSource::AddRenderProc(this);
        if ((_DWORD)v5)
          goto LABEL_79;
        OALSource::SetPlaybackState(this, 4114, 1);
        goto LABEL_16;
      case 7:
        OALSource::LoopToBeginning(this, v2);
        v5 = OALSource::AdvanceQueueToFrameIndex(this, *((_DWORD *)this + 89));
        if (!(_DWORD)v5)
        {
          OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1);
          *((_DWORD *)this + 89) = 0;
LABEL_55:
          *((_DWORD *)this + 86) = 1;
LABEL_16:
          v12 = (_QWORD *)*v9;
          MEMORY[0x2199EEC7C](v9, 0x1020C40CC5CF236);
          v9 = v12;
          if (!v12)
            goto LABEL_82;
          continue;
        }
LABEL_79:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v43 = *(unsigned int *)this;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "oalSource.cpp";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3108;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v43;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = (int)v5;
          _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::DoPostRender FAILED - OALSource = %ld : result = %ld", buf, 0x26u);
        }
        do
LABEL_114:
          v66 = __ldaxr(v3);
        while (__stlxr(v66 - 1, v3));
        return v5;
      case 8:
        OALSource::PostRenderRemoveBuffersFromQueue(this, (OALSource *)*((unsigned int *)v9 + 6));
        goto LABEL_15;
      case 9:
        OALSource::StopRenderingToBus((uint64_t)this);
        OALSource::SetPlaybackState(this, 4116, 1);
        OALSource::FlushBufferQueue(this);
        *((_BYTE *)this + 4) = 1;
        OALSource::ClearMessageQueue(this);
        *((_DWORD *)this + 86) = 0;
        goto LABEL_82;
      case 0xB:
        OALSource::LoopToBeginning(this, v2);
        OALContext::SetBusEnable(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), 1);
        if ((v68 & 1) == 0 || !OALSource::AddRenderProc(this))
        {
          OALSource::SetPlaybackState(this, 4114, 1);
          v68 = 0;
          goto LABEL_55;
        }
LABEL_63:
        v68 = 1;
        goto LABEL_16;
      case 0xC:
        OALSource::PostRenderAddBuffersToQueue(this, (OALSource *)*((unsigned int *)v9 + 6));
LABEL_15:
        *((_DWORD *)this + 86) = 0;
        goto LABEL_16;
      default:
        v35 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "oalSource.cpp";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3070;
          _os_log_impl(&dword_215C2D000, v35, OS_LOG_TYPE_DEBUG, "%25s:%-5d      MQ:WARNING - UNIMPLEMENTED MESSAGE...", buf, 0x12u);
        }
        goto LABEL_16;
    }
  }
}

void sub_215C507D8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t OALSource::SetReverbSendLevel(OALSource *this, float a2)
{
  float *v5;
  uint64_t result;
  int v7;
  AudioUnitElement v8;
  uint64_t v9;
  _DWORD *exception;

  if (a2 < 0.0 || a2 > 1.0)
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40963;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  v5 = (float *)((char *)this + 80);
  result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v7 = result;
  if (v5[88] != a2)
  {
    *((float *)this + 108) = a2;
    v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      v9 = *((_QWORD *)this + 1);
      if (*(_DWORD *)(v9 + 492))
        result = AudioUnitSetParameter(*(AudioUnit *)(v9 + 32), 8u, 1u, v8, a2 * 100.0, 0);
    }
  }
  if (v7)
    return (*(uint64_t (**)(float *))(*(_QWORD *)v5 + 24))(v5);
  return result;
}

void sub_215C50920(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetOcclusion(uint64_t this, AudioUnitParameterValue a2)
{
  AudioUnitElement v2;
  _DWORD *exception;

  if (a2 < -100.0 || a2 > 0.0)
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40963;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  if (*(float *)(this + 436) != a2)
  {
    *(AudioUnitParameterValue *)(this + 436) = a2;
    v2 = *(_DWORD *)(this + 232);
    if (v2 != -1)
      return AudioUnitSetParameter(*(AudioUnit *)(*(_QWORD *)(this + 8) + 32), 0xAu, 1u, v2, a2, 0);
  }
  return this;
}

uint64_t OALSource::SetObstruction(OALSource *this, AudioUnitParameterValue a2)
{
  float *v4;
  uint64_t result;
  int v6;
  AudioUnitElement v7;
  _DWORD *exception;

  if (a2 < -100.0 || a2 > 0.0)
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40963;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  v4 = (float *)((char *)this + 80);
  result = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v6 = result;
  if (v4[90] != a2)
  {
    *((AudioUnitParameterValue *)this + 110) = a2;
    v7 = *((_DWORD *)this + 58);
    if (v7 != -1)
      result = AudioUnitSetParameter(*(AudioUnit *)(*((_QWORD *)this + 1) + 32), 0xBu, 1u, v7, a2, 0);
  }
  if (v6)
    return (*(uint64_t (**)(float *))(*(_QWORD *)v4 + 24))(v4);
  return result;
}

void sub_215C50A94(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 8))(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

uint64_t CAStreamBasicDescription::Print(CAStreamBasicDescription *this, __sFILE *a2)
{
  void **v3;
  void *__p[2];
  char v6;
  char __dst[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__dst = 0u;
  CA::StreamDescription::AsString(this, (uint64_t)__p);
  if (v6 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  strlcpy(__dst, (const char *)v3, 0x100uLL);
  if (v6 < 0)
    operator delete(__p[0]);
  return fprintf(a2, "%s%s %s\n", "", "AudioStreamBasicDescription:", __dst);
}

void sub_215C50BBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CA::StreamDescription::AsString(CA::StreamDescription *this@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  BOOL v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  const char *v29;
  unsigned int v30;
  const char *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  std::string *v35;
  std::string::size_type v36;
  std::string *v37;
  std::string::size_type size;
  std::string *v39;
  __int128 v40;
  void *v41;
  int v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  unsigned int v48;
  const char *v49;
  unsigned int v50;
  int v51;
  const char *v52;
  std::string *v54;
  std::string::size_type v55;
  std::string *v56;
  __int128 v57;
  std::string v58;
  std::string v59;
  char __str[20];
  std::string v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)this + 2);
  if (v4 == 1718773105)
  {
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz, 'freq'", a2, *((unsigned int *)this + 7), *(_QWORD *)this);
    return;
  }
  if (v4 == 1819304813 && *((_DWORD *)this + 5) == 1)
  {
    v5 = *((_DWORD *)this + 6);
    if (v5 == *((_DWORD *)this + 4))
    {
      v6 = *((_DWORD *)this + 8);
      if (v5 >= v6 >> 3)
      {
        v7 = *((_DWORD *)this + 7);
        if (v7)
        {
          v8 = *((_DWORD *)this + 3);
          if ((v8 & 0x20) == 0)
          {
            if (v5 % v7)
              goto LABEL_36;
            v5 /= v7;
          }
          if ((v8 & 2) != 0 || 8 * v5 != v6)
            goto LABEL_36;
          if ((v8 & 1) != 0)
          {
            if ((v8 & 0x1F84) != 0)
              goto LABEL_36;
            if (v5 == 4)
              v10 = 1;
            else
              v10 = 4 * (v5 == 8);
          }
          else
          {
            if ((v8 & 4) == 0)
              goto LABEL_36;
            v9 = (v8 >> 7) & 0x3F;
            if (v9 == 24 && v5 == 4)
            {
              v10 = 3;
            }
            else if (v9 || v5 != 4)
            {
              if (v5 == 2 && v9 == 0)
                v10 = 2;
              else
                v10 = 0;
            }
            else
            {
              v10 = 5;
            }
          }
          if (v10)
          {
            v12 = *((unsigned int *)this + 7);
            if (v12 < 2)
            {
              v13 = "";
            }
            else if ((*((_BYTE *)this + 12) & 0x20) != 0)
            {
              v13 = ", deinterleaved";
            }
            else
            {
              v13 = ", interleaved";
            }
            caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s%s", a2, v12, *(_QWORD *)this, *((_QWORD *)&off_24D4652F0 + v10), v13);
            return;
          }
        }
      }
    }
  }
LABEL_36:
  v14 = *((unsigned int *)this + 7);
  v15 = *(double *)this;
  if ((_DWORD)v14)
    v16 = 0;
  else
    v16 = v4 == 0;
  if (v16 && v15 == 0.0)
  {
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz", a2, 0, *(_QWORD *)this);
    return;
  }
  v17 = bswap32(v4);
  v18 = v17 & 0xFF000000;
  v19 = (char)v17 - 32;
  v20 = v17;
  v21 = ((__int16)v17 >> 8) - 32;
  *((_BYTE *)&v61.__r_.__value_.__s + 23) = 4;
  if (((v17 >> 24) - 32) >= 0x5F)
    v18 = 771751936;
  if (((v17 << 8 >> 24) - 32) >= 0x5F)
    v22 = 3014656;
  else
    v22 = v17 & 0xFF0000;
  v23 = v22 | v18;
  v24 = v17 & 0xFF00;
  if (v21 >= 0x5F)
    v24 = 11776;
  if (v19 >= 0x5F)
    v25 = 46;
  else
    v25 = v20;
  LODWORD(v61.__r_.__value_.__l.__data_) = v23 | v24 | v25;
  v61.__r_.__value_.__s.__data_[4] = 0;
  caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s (0x%08X) ", (uint64_t)&v59, v14, *(_QWORD *)&v15, &v61, *((unsigned int *)this + 3));
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v61.__r_.__value_.__l.__data_);
    v26 = *((_DWORD *)this + 2);
    if (v26 <= 1819304812)
      goto LABEL_52;
  }
  else
  {
    v26 = *((_DWORD *)this + 2);
    if (v26 <= 1819304812)
    {
LABEL_52:
      if (v26 != 1634492771 && v26 != 1634497332 && v26 != 1718378851)
      {
LABEL_96:
        caulk::make_string((caulk *)"%u bits/channel, %u bytes/packet, %u frames/packet, %u bytes/frame", (uint64_t)&v61, *((unsigned int *)this + 8), *((unsigned int *)this + 4), *((unsigned int *)this + 5), *((unsigned int *)this + 6));
        if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v37 = &v59;
        else
          v37 = (std::string *)v59.__r_.__value_.__r.__words[0];
        if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(v59.__r_.__value_.__r.__words[2]);
        else
          size = v59.__r_.__value_.__l.__size_;
LABEL_88:
        v39 = std::string::insert(&v61, 0, (const std::string::value_type *)v37, size);
        v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
        *(_QWORD *)(a2 + 16) = *((_QWORD *)&v39->__r_.__value_.__l + 2);
        *(_OWORD *)a2 = v40;
        v39->__r_.__value_.__l.__size_ = 0;
        v39->__r_.__value_.__r.__words[2] = 0;
        v39->__r_.__value_.__r.__words[0] = 0;
        if ((SHIBYTE(v61.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_91;
        v41 = (void *)v61.__r_.__value_.__r.__words[0];
        goto LABEL_90;
      }
LABEL_71:
      v34 = *((unsigned int *)this + 3);
      if ((v34 - 1) < 4 || !(_DWORD)v34 && (v26 == 1634497332 || v26 == 1936487278 || v26 == 1936487267))
      {
        caulk::make_string((caulk *)"from %u-bit source, ", (uint64_t)&v61, CA::StreamDescription::AsString(void)const::kSourceBits[v34]);
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v35 = &v61;
        else
          v35 = (std::string *)v61.__r_.__value_.__r.__words[0];
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v36 = HIBYTE(v61.__r_.__value_.__r.__words[2]);
        else
          v36 = v61.__r_.__value_.__l.__size_;
        std::string::append(&v59, (const std::string::value_type *)v35, v36);
        if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v61.__r_.__value_.__l.__data_);
      }
      else
      {
        std::string::append(&v59, "from UNKNOWN source bit depth, ", 0x1FuLL);
      }
      caulk::make_string((caulk *)"%u frames/packet", (uint64_t)&v61, *((unsigned int *)this + 5));
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v37 = &v59;
      else
        v37 = (std::string *)v59.__r_.__value_.__r.__words[0];
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v59.__r_.__value_.__r.__words[2]);
      else
        size = v59.__r_.__value_.__l.__size_;
      goto LABEL_88;
    }
  }
  if (v26 == 1936487278 || v26 == 1936487267)
    goto LABEL_71;
  if (v26 != 1819304813)
    goto LABEL_96;
  v27 = *((_DWORD *)this + 3);
  v28 = *((_DWORD *)this + 6);
  v29 = "";
  if (!v28)
    goto LABEL_63;
  if ((v27 & 0x20) != 0)
  {
    v30 = 1;
  }
  else
  {
    v30 = *((_DWORD *)this + 7);
    if (!v30)
    {
LABEL_63:
      v31 = " signed";
      if ((v27 & 4) == 0)
        v31 = " unsigned";
      if ((v27 & 1) != 0)
        v32 = "float";
      else
        v32 = "integer";
      if ((v27 & 1) != 0)
        v33 = "";
      else
        v33 = v31;
LABEL_128:
      v61.__r_.__value_.__s.__data_[0] = 0;
      if ((v27 & 0x20) != 0)
        v46 = ", deinterleaved";
      else
        v46 = "";
      v43 = "";
      v47 = "";
      goto LABEL_132;
    }
  }
  v42 = v28 / v30;
  if (v28 / v30 < 2)
  {
    v45 = " signed";
    if ((v27 & 4) == 0)
      v45 = " unsigned";
    if ((v27 & 1) != 0)
      v32 = "float";
    else
      v32 = "integer";
    if ((v27 & 1) != 0)
      v33 = "";
    else
      v33 = v45;
    if (v30 > v28)
      goto LABEL_128;
    v42 = 1;
    v43 = "";
  }
  else
  {
    if ((v27 & 2) != 0)
      v43 = " big-endian";
    else
      v43 = " little-endian";
    v44 = " unsigned";
    if ((v27 & 4) != 0)
      v44 = " signed";
    if ((v27 & 1) != 0)
      v32 = "float";
    else
      v32 = "integer";
    if ((v27 & 1) != 0)
      v33 = "";
    else
      v33 = v44;
  }
  v48 = *((_DWORD *)this + 7);
  if ((v27 & 0x20) != 0)
    v48 = 1;
  if (v48)
    v48 = 8 * (v28 / v48);
  if (v48 == *((_DWORD *)this + 8))
  {
    v61.__r_.__value_.__s.__data_[0] = 0;
  }
  else
  {
    if ((v27 & 8) != 0)
      v49 = "";
    else
      v49 = "un";
    snprintf((char *)&v61, 0x20uLL, "%spacked in %u bytes", v49, v42);
    v28 = *((_DWORD *)this + 6);
    v27 = *((_DWORD *)this + 3);
    if (!v28)
      goto LABEL_152;
  }
  v50 = *((_DWORD *)this + 7);
  if ((v27 & 0x20) != 0)
    v50 = 1;
  if (v50)
    v28 = 8 * (v28 / v50);
  else
    v28 = 0;
LABEL_152:
  v51 = *((_DWORD *)this + 8);
  v52 = " high-aligned";
  if ((v27 & 0x10) == 0)
    v52 = " low-aligned";
  if ((v51 & 7) == 0 && v28 == v51)
    v47 = "";
  else
    v47 = v52;
  if ((v27 & 0x20) != 0)
    v46 = ", deinterleaved";
  else
    v46 = "";
  if (!v61.__r_.__value_.__s.__data_[0])
  {
LABEL_132:
    if (*v47)
      v29 = ", ";
    if (((v27 >> 7) & 0x3F) != 0)
      goto LABEL_135;
    goto LABEL_165;
  }
  v29 = ", ";
  if (((v27 >> 7) & 0x3F) != 0)
  {
LABEL_135:
    snprintf(__str, 0x14uLL, "%u.%u");
    goto LABEL_166;
  }
LABEL_165:
  snprintf(__str, 0x14uLL, "%u");
LABEL_166:
  caulk::make_string((caulk *)"%s-bit%s%s %s%s%s%s%s", (uint64_t)&v58, __str, v43, v33, v32, v29, &v61, v47, v46);
  if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v54 = &v59;
  else
    v54 = (std::string *)v59.__r_.__value_.__r.__words[0];
  if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v55 = HIBYTE(v59.__r_.__value_.__r.__words[2]);
  else
    v55 = v59.__r_.__value_.__l.__size_;
  v56 = std::string::insert(&v58, 0, (const std::string::value_type *)v54, v55);
  v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
  *(_QWORD *)(a2 + 16) = *((_QWORD *)&v56->__r_.__value_.__l + 2);
  *(_OWORD *)a2 = v57;
  v56->__r_.__value_.__l.__size_ = 0;
  v56->__r_.__value_.__r.__words[2] = 0;
  v56->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
  {
    v41 = (void *)v58.__r_.__value_.__r.__words[0];
LABEL_90:
    operator delete(v41);
  }
LABEL_91:
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v59.__r_.__value_.__l.__data_);
}

void sub_215C51354(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

std::string *caulk::make_string@<X0>(caulk *this@<X0>, uint64_t a2@<X8>, ...)
{
  std::string *result;
  int v6;
  char *v7;
  size_t v8;
  unint64_t v9;
  va_list va;

  va_start(va, a2);
  result = (std::string *)vsnprintf(0, 0, (const char *)this, va);
  if ((int)result <= 0)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    return result;
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  std::string::append((std::string *)a2, ((_DWORD)result + 1), 0);
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (char *)a2;
  else
    v7 = *(char **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  result = (std::string *)vsnprintf(v7, v8, (const char *)this, va);
  if ((*(char *)(a2 + 23) & 0x80000000) == 0)
  {
    v9 = *(unsigned __int8 *)(a2 + 23);
    if (v9 >= (int)result)
    {
      *(_BYTE *)(a2 + 23) = result & 0x7F;
      *(_BYTE *)(a2 + (int)result) = 0;
      return result;
    }
    return std::string::append((std::string *)a2, (int)result - v9, 0);
  }
  v9 = *(_QWORD *)(a2 + 8);
  if (v9 < (int)result)
    return std::string::append((std::string *)a2, (int)result - v9, 0);
  *(_QWORD *)(a2 + 8) = (int)result;
  *(_BYTE *)(*(_QWORD *)a2 + (int)result) = 0;
  return result;
}

uint64_t SourceNotifications::AddSourceNotificationImp(SourceNotifications *this, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  char *v8;
  char *v9;
  char *v10;
  uint64_t result;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;

  v8 = *(char **)this;
  v9 = (char *)*((_QWORD *)this + 1);
  v10 = *(char **)this;
  if (*(char **)this != v9)
  {
    v10 = *(char **)this;
    while (*(_DWORD *)v10 != a2
         || *((void (**)(unsigned int, unsigned int, void *))v10 + 1) != a3
         || *((void **)v10 + 2) != a4)
    {
      v10 += 24;
      if (v10 == v9)
        goto LABEL_9;
    }
  }
  if (v10 != v9)
    return 4294967246;
LABEL_9:
  v12 = *((_QWORD *)this + 2);
  if ((unint64_t)v9 >= v12)
  {
    v14 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3) + 1;
    if (v14 > 0xAAAAAAAAAAAAAAALL)
      std::vector<SourceAttachedInfo>::__throw_length_error[abi:ne180100]();
    v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (_QWORD)v8) >> 3);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x555555555555555)
      v16 = 0xAAAAAAAAAAAAAAALL;
    else
      v16 = v14;
    if (v16)
    {
      if (v16 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v17 = (char *)operator new(24 * v16);
    }
    else
    {
      v17 = 0;
    }
    v18 = &v17[8 * ((v9 - v8) >> 3)];
    *(_DWORD *)v18 = a2;
    *((_QWORD *)v18 + 1) = a3;
    *((_QWORD *)v18 + 2) = a4;
    v13 = v18 + 24;
    if (v8 != v9)
    {
      do
      {
        v19 = *(_OWORD *)(v9 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v9 - 1);
        *(_OWORD *)(v18 - 24) = v19;
        v18 -= 24;
        v9 -= 24;
      }
      while (v9 != v8);
      v8 = *(char **)this;
    }
    *(_QWORD *)this = v18;
    *((_QWORD *)this + 1) = v13;
    *((_QWORD *)this + 2) = &v17[24 * v16];
    if (v8)
      operator delete(v8);
  }
  else
  {
    *(_DWORD *)v9 = a2;
    v13 = v9 + 24;
    *((_QWORD *)v9 + 1) = a3;
    *((_QWORD *)v9 + 2) = a4;
  }
  result = 0;
  *((_QWORD *)this + 1) = v13;
  return result;
}

void CAMutex::CAMutex(CAMutex *this, const char *a2)
{
  int v2;
  int v3;
  _DWORD *exception;

  *(_QWORD *)this = &off_24D465330;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = 0;
  v2 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 24), 0);
  if (v2)
  {
    v3 = v2;
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_24D4653C8;
    exception[2] = v3;
  }
}

void CAMutex::~CAMutex(CAMutex *this)
{
  *(_QWORD *)this = &off_24D465330;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  *(_QWORD *)this = &off_24D465330;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  *(_QWORD *)this = &off_24D465330;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
  JUMPOUT(0x2199EEC7CLL);
}

uint64_t CAMutex::Lock(CAMutex *this)
{
  _opaque_pthread_t *v2;
  int v4;
  int v5;
  _DWORD *exception;

  v2 = pthread_self();
  if (pthread_equal(v2, *((pthread_t *)this + 2)))
    return 0;
  v4 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  if (v4)
  {
    v5 = v4;
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_24D4653C8;
    exception[2] = v5;
  }
  *((_QWORD *)this + 2) = v2;
  return 1;
}

uint64_t CAMutex::Unlock(CAMutex *this)
{
  _opaque_pthread_t *v2;
  uint64_t result;
  int v4;
  _DWORD *exception;

  v2 = pthread_self();
  result = pthread_equal(v2, *((pthread_t *)this + 2));
  if ((_DWORD)result)
  {
    *((_QWORD *)this + 2) = 0;
    result = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
    if ((_DWORD)result)
    {
      v4 = result;
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_24D4653C8;
      exception[2] = v4;
    }
  }
  return result;
}

uint64_t CAMutex::Try(CAMutex *this, BOOL *a2)
{
  _opaque_pthread_t *v4;
  uint64_t result;
  int v6;
  int v7;
  _DWORD *exception;

  *a2 = 0;
  v4 = pthread_self();
  if (pthread_equal(v4, *((pthread_t *)this + 2)))
  {
    result = 1;
    *a2 = 0;
  }
  else
  {
    v6 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 24));
    if (v6 == 16)
    {
      result = 0;
      *a2 = 0;
    }
    else
    {
      if (v6)
      {
        v7 = v6;
        exception = __cxa_allocate_exception(0x10uLL);
        *(_QWORD *)exception = &unk_24D4653C8;
        exception[2] = v7;
      }
      *((_QWORD *)this + 2) = v4;
      result = 1;
      *a2 = 1;
    }
  }
  return result;
}

BOOL CAMutex::IsFree(CAMutex *this)
{
  return *((_QWORD *)this + 2) == 0;
}

BOOL CAMutex::IsOwnedByCurrentThread(pthread_t *this)
{
  _opaque_pthread_t *v2;

  v2 = pthread_self();
  return pthread_equal(v2, this[2]) != 0;
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x2199EEC7CLL);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

double CAHostTimeBase::Initialize(CAHostTimeBase *this)
{
  double result;
  mach_timebase_info info;

  mach_timebase_info(&info);
  CAHostTimeBase::sMinDelta = 1;
  CAHostTimeBase::sToNanosNumerator = info.numer;
  CAHostTimeBase::sToNanosDenominator = info.denom;
  *(double *)&CAHostTimeBase::sFrequency = (double)info.denom / (double)info.numer * 1000000000.0;
  result = 1.0 / *(double *)&CAHostTimeBase::sFrequency;
  *(double *)&CAHostTimeBase::sInverseFrequency = 1.0 / *(double *)&CAHostTimeBase::sFrequency;
  return result;
}

void CAGuard::CAGuard(CAGuard *this, const char *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  _DWORD *exception;

  CAMutex::CAMutex(this, a2);
  *(_QWORD *)v2 = &off_24D4653F0;
  v3 = pthread_cond_init((pthread_cond_t *)(v2 + 88), 0);
  if (v3)
  {
    v4 = v3;
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_24D4653C8;
    exception[2] = v4;
  }
}

void sub_215C51A68(_Unwind_Exception *a1)
{
  CAMutex *v1;

  CAMutex::~CAMutex(v1);
  _Unwind_Resume(a1);
}

void CAGuard::~CAGuard(CAGuard *this)
{
  *(_QWORD *)this = &off_24D4653F0;
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 88));
  CAMutex::~CAMutex(this);
}

{
  *(_QWORD *)this = &off_24D4653F0;
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 88));
  CAMutex::~CAMutex(this);
  JUMPOUT(0x2199EEC7CLL);
}

pthread_t CAGuard::Wait(CAGuard *this)
{
  _opaque_pthread_t *v2;
  int v3;
  pthread_t result;
  _DWORD *exception;
  int v6;
  _DWORD *v7;

  v2 = pthread_self();
  if (!pthread_equal(v2, *((pthread_t *)this + 2)))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_24D4653C8;
    exception[2] = 1;
  }
  *((_QWORD *)this + 2) = 0;
  v3 = pthread_cond_wait((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24));
  if (v3)
  {
    v6 = v3;
    v7 = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)v7 = &unk_24D4653C8;
    v7[2] = v6;
  }
  result = pthread_self();
  *((_QWORD *)this + 2) = result;
  return result;
}

BOOL CAGuard::WaitFor(CAGuard *this, unint64_t a2)
{
  _opaque_pthread_t *v4;
  __darwin_time_t v5;
  int v6;
  int v7;
  _DWORD *exception;
  _DWORD *v10;
  timespec v11;

  v4 = pthread_self();
  if (!pthread_equal(v4, *((pthread_t *)this + 2)))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_24D4653C8;
    exception[2] = 1;
  }
  if (a2 <= 0x3B9AC9FF)
  {
    v5 = 0;
  }
  else
  {
    v5 = a2 / 0x3B9ACA00;
    a2 %= 0x3B9ACA00uLL;
  }
  v11.tv_sec = v5;
  v11.tv_nsec = a2;
  *((_QWORD *)this + 2) = 0;
  v6 = pthread_cond_timedwait_relative_np((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24), &v11);
  v7 = v6;
  if (v6 && v6 != 60)
  {
    v10 = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)v10 = &unk_24D4653C8;
    v10[2] = v7;
  }
  *((_QWORD *)this + 2) = pthread_self();
  return v7 == 60;
}

uint64_t CAGuard::WaitUntil(CAGuard *this, unint64_t a2)
{
  uint64_t v4;

  v4 = mach_absolute_time();
  pthread_once(&CAHostTimeBase::sIsInited, (void (*)(void))CAHostTimeBase::Initialize);
  if (CAHostTimeBase::sToNanosNumerator != CAHostTimeBase::sToNanosDenominator)
    v4 = __udivti3();
  if (a2 <= v4)
    return 1;
  else
    return (*(uint64_t (**)(CAGuard *, unint64_t))(*(_QWORD *)this + 64))(this, a2 - v4);
}

uint64_t CAGuard::Notify(CAGuard *this)
{
  uint64_t result;
  int v2;
  _DWORD *exception;

  result = pthread_cond_signal((pthread_cond_t *)((char *)this + 88));
  if ((_DWORD)result)
  {
    v2 = result;
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_24D4653C8;
    exception[2] = v2;
  }
  return result;
}

uint64_t CAGuard::NotifyAll(CAGuard *this)
{
  uint64_t result;
  int v2;
  _DWORD *exception;

  result = pthread_cond_broadcast((pthread_cond_t *)((char *)this + 88));
  if ((_DWORD)result)
  {
    v2 = result;
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_24D4653C8;
    exception[2] = v2;
  }
  return result;
}

void OALCaptureDevice::OALCaptureDevice(OALCaptureDevice *this, const char *a2, uint64_t a3, unsigned int a4, int a5, unsigned int a6)
{
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  char *v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  OALRingBuffer *v18;
  unint64_t v19;
  _DWORD *exception;
  _DWORD *v21;

  *(_QWORD *)this = a3;
  *((_DWORD *)this + 2) = 0;
  *((_BYTE *)this + 12) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_QWORD *)this + 12) = 0x3FF0000000000000;
  *((_DWORD *)this + 26) = a6;
  *((_QWORD *)this + 14) = 0;
  *((_DWORD *)this + 30) = 0;
  FillInASBD((uint64_t)this + 40, a5, a4);
  if (*((_DWORD *)this + 14) > a6)
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40963;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  v9 = OALCaptureDevice::InitializeAU(this, v8);
  if (v9)
  {
    v21 = __cxa_allocate_exception(4uLL);
    *v21 = v9;
    __cxa_throw(v21, MEMORY[0x24BEDB798], 0);
  }
  v10 = *((_DWORD *)this + 13);
  if ((v10 & 0x20) != 0)
    v11 = *((unsigned int *)this + 17);
  else
    v11 = 1;
  if ((v10 & 0x20) != 0)
    v12 = 1;
  else
    v12 = *((_DWORD *)this + 17);
  v13 = operator new(16 * ((int)v11 - 1) + 48);
  *v13 = "WriteBufferList";
  v13[1] = 0;
  *((_DWORD *)v13 + 4) = 0;
  *((_DWORD *)v13 + 6) = v11;
  if ((_DWORD)v11)
  {
    v14 = (char *)(v13 + 4);
    if ((_DWORD)v11 == 1)
    {
      v15 = 1;
      do
      {
LABEL_15:
        *(_DWORD *)v14 = v12;
        *((_DWORD *)v14 + 1) = 0;
        *((_QWORD *)v14 + 1) = 0;
        v14 += 16;
        --v15;
      }
      while (v15);
      goto LABEL_16;
    }
    v15 = v11 - (v11 & 0xFFFFFFFE);
    v14 += 16 * (v11 & 0xFFFFFFFE);
    v16 = v13 + 7;
    v17 = v11 & 0xFFFFFFFE;
    do
    {
      *((_DWORD *)v16 - 6) = v12;
      *((_DWORD *)v16 - 5) = 0;
      *((_DWORD *)v16 - 2) = v12;
      *((_DWORD *)v16 - 1) = 0;
      *(v16 - 2) = 0;
      *v16 = 0;
      v16 += 4;
      v17 -= 2;
    }
    while (v17);
    if ((v11 & 0xFFFFFFFE) != v11)
      goto LABEL_15;
  }
LABEL_16:
  *((_QWORD *)this + 14) = v13;
  v18 = (OALRingBuffer *)operator new();
  OALRingBuffer::OALRingBuffer(v18);
  *((_QWORD *)this + 10) = v18;
  LODWORD(v19) = *((_DWORD *)this + 26);
  OALRingBuffer::Allocate(v18, *((_DWORD *)this + 16), (*((double *)this + 12) * (double)v19));
}

void sub_215C51F9C(void *a1, int a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  int *v7;
  int v8;
  OALRingBuffer *v9;
  uint64_t v10;
  uint64_t v11;
  OALRingBuffer *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *exception;
  uint64_t v17;
  _DWORD *v18;

  v4 = v3;
  MEMORY[0x2199EEC7C](v4, 0x1010C40829CE571);
  v7 = (int *)__cxa_begin_catch(a1);
  if (a2 == 2)
  {
    v8 = *v7;
    v9 = (OALRingBuffer *)v2[10];
    if (v9)
    {
      OALRingBuffer::~OALRingBuffer(v9);
      MEMORY[0x2199EEC7C]();
      v10 = v2[11];
      if (!v10)
      {
LABEL_4:
        v11 = v2[14];
        if (!v11)
          goto LABEL_15;
        goto LABEL_12;
      }
    }
    else
    {
      v10 = v2[11];
      if (!v10)
        goto LABEL_4;
    }
    MEMORY[0x2199EEC7C](v10, 0x1000C4077774924);
    v11 = v2[14];
    if (!v11)
      goto LABEL_15;
LABEL_12:
    v15 = *(_QWORD *)(v11 + 8);
    if (v15)
      MEMORY[0x2199EEC64](v15, 0x1000C8077774924);
    MEMORY[0x2199EEC7C](v11, 0x10D0C40C0CFF4BFLL);
LABEL_15:
    exception = __cxa_allocate_exception(4uLL);
    *exception = v8;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  v12 = (OALRingBuffer *)v2[10];
  if (v12)
  {
    OALRingBuffer::~OALRingBuffer(v12);
    MEMORY[0x2199EEC7C]();
    v13 = v2[11];
    if (!v13)
    {
LABEL_8:
      v14 = v2[14];
      if (!v14)
        goto LABEL_21;
      goto LABEL_18;
    }
  }
  else
  {
    v13 = v2[11];
    if (!v13)
      goto LABEL_8;
  }
  MEMORY[0x2199EEC7C](v13, 0x1000C4077774924);
  v14 = v2[14];
  if (!v14)
    goto LABEL_21;
LABEL_18:
  v17 = *(_QWORD *)(v14 + 8);
  if (v17)
    MEMORY[0x2199EEC64](v17, 0x1000C8077774924);
  MEMORY[0x2199EEC7C](v14, 0x10D0C40C0CFF4BFLL);
LABEL_21:
  v18 = __cxa_allocate_exception(4uLL);
  *v18 = -1;
  __cxa_throw(v18, MEMORY[0x24BEDB798], 0);
}

void sub_215C52140(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t OALCaptureDevice::InitializeAU(OALCaptureDevice *this, const char *a2)
{
  OpaqueAudioComponent *Next;
  AudioUnit *v4;
  uint64_t v5;
  __int128 v6;
  AudioComponentInstance v7;
  AudioComponentDescription v9;
  _QWORD v10[2];
  _OWORD v11[2];
  uint64_t v12;
  int inData;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  AudioComponentInstance v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  inData = 0;
  v9.componentFlagsMask = 0;
  *(_OWORD *)&v9.componentType = xmmword_215C55DE0;
  Next = AudioComponentFindNext(0, &v9);
  if (!Next)
    return 0xFFFFFFFFLL;
  v4 = (AudioUnit *)((char *)this + 32);
  v5 = AudioComponentInstanceNew(Next, (AudioComponentInstance *)this + 4);
  if ((_DWORD)v5)
    goto LABEL_16;
  inData = 0;
  v5 = AudioUnitSetProperty(*v4, 0x7D3u, 2u, 0, &inData, 4u);
  if ((_DWORD)v5)
    goto LABEL_16;
  inData = 1;
  v5 = AudioUnitSetProperty(*v4, 0x7D3u, 1u, 1u, &inData, 4u);
  if ((_DWORD)v5)
    goto LABEL_16;
  v6 = *(_OWORD *)((char *)this + 56);
  v11[0] = *(_OWORD *)((char *)this + 40);
  v11[1] = v6;
  v12 = *((_QWORD *)this + 9);
  v5 = AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 2u, 1u, v11, 0x28u);
  if ((_DWORD)v5
    || (v10[0] = OALCaptureDevice::InputProc,
        v10[1] = this,
        v5 = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x7D5u, 0, 0, v10, 0x10u),
        (_DWORD)v5)
    || (v5 = AudioUnitInitialize(*v4), (_DWORD)v5))
  {
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(AudioComponentInstance *)this;
      *(_DWORD *)buf = 136315906;
      v15 = "oalCaptureDevice.cpp";
      v16 = 1024;
      v17 = 172;
      v18 = 2048;
      v19 = v7;
      v20 = 2048;
      v21 = (int)v5;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::InitializeAU FAILED - OALContext = %ld : result = %ld", buf, 0x26u);
    }
    if (*v4)
    {
      AudioComponentInstanceDispose(*v4);
      *v4 = 0;
    }
  }
  return v5;
}

void OALCaptureDevice::~OALCaptureDevice(OALCaptureDevice *this)
{
  OpaqueAudioComponentInstance *v2;
  uint64_t v3;
  OALRingBuffer *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (OpaqueAudioComponentInstance *)*((_QWORD *)this + 4);
  if (v2)
    AudioComponentInstanceDispose(v2);
  v3 = *((_QWORD *)this + 11);
  if (v3)
    MEMORY[0x2199EEC7C](v3, 0x1000C4077774924);
  v4 = (OALRingBuffer *)*((_QWORD *)this + 10);
  if (v4)
  {
    OALRingBuffer::~OALRingBuffer(v4);
    MEMORY[0x2199EEC7C]();
  }
  v5 = *((_QWORD *)this + 14);
  if (v5)
  {
    v6 = *(_QWORD *)(v5 + 8);
    if (v6)
      MEMORY[0x2199EEC64](v6, 0x1000C8077774924);
    MEMORY[0x2199EEC7C](v5, 0x10D0C40C0CFF4BFLL);
  }
}

uint64_t OALCaptureDevice::InputProc(OALCaptureDevice *this, void *a2, const AudioTimeStamp *a3, const AudioTimeStamp *a4, UInt32 inNumberFrames, unsigned int a6, AudioBufferList *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AudioUnitRenderActionFlags ioActionFlags;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  ioActionFlags = 0;
  v9 = *((_QWORD *)this + 14);
  v10 = *(unsigned int *)(v9 + 24);
  if (*(_DWORD *)(v9 + 24))
  {
    if ((_DWORD)v10 == 1)
    {
      v11 = 0;
LABEL_7:
      v14 = (_QWORD *)(v9 + 16 * v11 + 40);
      v15 = v10 - v11;
      do
      {
        *v14 = 0;
        v14 += 2;
        --v15;
      }
      while (v15);
      goto LABEL_9;
    }
    v11 = v10 & 0xFFFFFFFE;
    v12 = (_QWORD *)(v9 + 56);
    v13 = v11;
    do
    {
      *(v12 - 2) = 0;
      *v12 = 0;
      v12 += 4;
      v13 -= 2;
    }
    while (v13);
    if (v11 != v10)
      goto LABEL_7;
  }
LABEL_9:
  v16 = AudioUnitRender(*((AudioUnit *)this + 4), &ioActionFlags, a3, 1u, inNumberFrames, (AudioBufferList *)(v9 + 24));
  if ((_DWORD)v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_QWORD *)this;
      *(_DWORD *)buf = 136315906;
      v21 = "oalCaptureDevice.cpp";
      v22 = 1024;
      v23 = 200;
      v24 = 2048;
      v25 = v17;
      v26 = 2048;
      v27 = (int)v16;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::InputProc FAILED - OALContext = %ld : result = %ld", buf, 0x26u);
    }
  }
  else if (OALRingBuffer::Store(*((OALRingBuffer **)this + 10), *(const unsigned __int8 **)(v9 + 40), inNumberFrames, *((_QWORD *)this + 2)))
  {
    *((_QWORD *)this + 2) += inNumberFrames;
  }
  return v16;
}

void OALCaptureDevice::StartCapture(AudioUnit *this)
{
  AudioOutputUnitStart(this[4]);
  *((_BYTE *)this + 12) = 1;
  OALRingBuffer::Clear(this[10]);
}

void OALCaptureDevice::StopCapture(AudioUnit *this)
{
  AudioOutputUnitStop(this[4]);
  *((_BYTE *)this + 12) = 0;
  OALRingBuffer::Clear(this[10]);
}

uint64_t OALCaptureDevice::GetFrames(OALCaptureDevice *this, unsigned int a2, unsigned __int8 *__dst, double a4, double a5)
{
  OALRingBuffer *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _DWORD *exception;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)this + 12))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v18 = *(_QWORD *)this;
      v20 = 136315906;
      v21 = "oalCaptureDevice.cpp";
      v22 = 1024;
      v23 = 241;
      v24 = 2048;
      v25 = v18;
      v26 = 2048;
      v27 = 40964;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::GetFrames FAILED, device not currently capturing - OALContext = %ld : result = %ld", (uint8_t *)&v20, 0x26u);
    }
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40964;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  v7 = (OALRingBuffer *)*((_QWORD *)this + 10);
  v9 = *((_QWORD *)v7 + 3);
  v8 = *((_QWORD *)v7 + 4);
  v10 = *((_QWORD *)this + 3);
  if (v10 < v9)
  {
    *((_QWORD *)this + 3) = v9;
    v10 = v9;
  }
  v11 = v8 - v10;
  LODWORD(a5) = *((_DWORD *)this + 26);
  v12 = *((double *)this + 12);
  v13 = v12 * (double)*(unint64_t *)&a5;
  if (v13 < (double)v11)
    v11 = v13;
  if (((double)v11 / v12) >= a2)
  {
    v15 = OALRingBuffer::Fetch(v7, __dst, a2, v10);
    if ((_DWORD)v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v16 = *(_QWORD *)this;
        v20 = 136315906;
        v21 = "oalCaptureDevice.cpp";
        v22 = 1024;
        v23 = 255;
        v24 = 2048;
        v25 = v16;
        v26 = 2048;
        v27 = -1;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::GetFrames FAILED, err returned from mRingBuffer->Fetch - OALContext = %ld : result = %ld", (uint8_t *)&v20, 0x26u);
      }
    }
    else
    {
      *((_QWORD *)this + 3) += a2;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)this;
      v20 = 136315906;
      v21 = "oalCaptureDevice.cpp";
      v22 = 1024;
      v23 = 247;
      v24 = 2048;
      v25 = v14;
      v26 = 2048;
      v27 = -1;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::GetFrames FAILED, not enough captured frames - OALContext = %ld : result = %ld", (uint8_t *)&v20, 0x26u);
    }
    return 0xFFFFFFFFLL;
  }
  return v15;
}

uint64_t OALCaptureDevice::AvailableFrames(OALCaptureDevice *this, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  double v8;
  double v9;

  v3 = *((_QWORD *)this + 10);
  v5 = *(_QWORD *)(v3 + 24);
  v4 = *(_QWORD *)(v3 + 32);
  v6 = *((_QWORD *)this + 3);
  if (v6 < v5)
  {
    *((_QWORD *)this + 3) = v5;
    LODWORD(v6) = v5;
  }
  v7 = v4 - v6;
  LODWORD(a3) = *((_DWORD *)this + 26);
  v8 = *((double *)this + 12);
  v9 = v8 * (double)*(unint64_t *)&a3;
  if (v9 < (double)v7)
    v7 = v9;
  return ((double)v7 / v8);
}

void OALRingBuffer::OALRingBuffer(OALRingBuffer *this)
{
  *(_QWORD *)this = 0;
  *((_DWORD *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
}

void OALRingBuffer::Allocate(OALRingBuffer *this, int a2, int a3)
{
  void *v6;
  size_t v7;
  void *v8;

  v6 = *(void **)this;
  if (v6)
  {
    free(v6);
    *(_QWORD *)this = 0;
  }
  *(_QWORD *)((char *)this + 20) = 0;
  *(_QWORD *)((char *)this + 28) = 0;
  *((_DWORD *)this + 9) = 0;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  v7 = (a3 * a2);
  *((_DWORD *)this + 4) = v7;
  v8 = malloc_type_malloc(v7, 0x961D322DuLL);
  *(_QWORD *)this = v8;
  if (v8)
    bzero(v8, *((unsigned int *)this + 4));
  *(_QWORD *)((char *)this + 20) = 0;
  *(_QWORD *)((char *)this + 28) = 0;
  *((_DWORD *)this + 9) = 0;
}

void OALRingBuffer::~OALRingBuffer(OALRingBuffer *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2)
  {
    free(v2);
    *(_QWORD *)this = 0;
  }
  *(_QWORD *)((char *)this + 20) = 0;
  *(_QWORD *)((char *)this + 12) = 0;
  *((_DWORD *)this + 9) = 0;
  *(_QWORD *)((char *)this + 28) = 0;
}

void OALRingBuffer::Clear(OALRingBuffer *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2)
    bzero(v2, *((unsigned int *)this + 4));
  *(_QWORD *)((char *)this + 28) = 0;
  *(_QWORD *)((char *)this + 20) = 0;
  *((_DWORD *)this + 9) = 0;
}

BOOL OALRingBuffer::Store(OALRingBuffer *this, const unsigned __int8 *__src, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  size_t v21;
  const unsigned __int8 *v22;
  uint64_t v24;
  int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  size_t v29;
  size_t v30;

  v5 = *((unsigned int *)this + 3);
  if (v5 >= a3)
  {
    v9 = a4 + a3;
    v10 = *((_QWORD *)this + 4);
    if (v10 + v5 <= a4)
    {
      v19 = *(void **)this;
      if (*(_QWORD *)this)
        bzero(v19, *((unsigned int *)this + 4));
      *((_QWORD *)this + 3) = 0;
    }
    else
    {
      v11 = *((_QWORD *)this + 3);
      if (v11)
      {
        if (v9 > v10)
        {
          if (v10 < a4)
          {
            v12 = *((_DWORD *)this + 2);
            v13 = *((_DWORD *)this + 4);
            v14 = *((_DWORD *)this + 5);
            v15 = (v14 + v12 * ((int)v10 - (int)v11)) % v13;
            v16 = (v14 + v12 * ((int)a4 - (int)v11)) % v13;
            v17 = v16 - v15;
            if (v16 <= v15)
            {
              bzero((void *)(*(_QWORD *)this + v15), v13 - v15);
              v18 = *(void **)this;
              v17 = v16;
            }
            else
            {
              v18 = (void *)(*(_QWORD *)this + v15);
            }
            bzero(v18, v17);
          }
          *((_QWORD *)this + 4) = v9;
          v24 = v9 - *((unsigned int *)this + 3);
          v11 = *((_QWORD *)this + 3);
          if (v24 > v11)
          {
            *((_DWORD *)this + 5) = (*((unsigned int *)this + 5) + (v24 - v11) * *((unsigned int *)this + 2))
                                  % *((unsigned int *)this + 4);
            *((_QWORD *)this + 3) = v24;
            LODWORD(v11) = v24;
          }
        }
        v25 = *((_DWORD *)this + 2);
        v26 = *((_DWORD *)this + 4);
        v27 = *((_DWORD *)this + 5);
        v28 = (v27 + v25 * ((int)a4 - (int)v11)) % v26;
        v29 = (v27 + v25 * ((int)v9 - (int)v11)) % v26;
        v21 = v29 - v28;
        if (v29 <= v28)
        {
          v30 = v26 - v28;
          memcpy((void *)(*(_QWORD *)this + v28), __src, v30);
          v20 = *(void **)this;
          v22 = &__src[v30];
          v21 = v29;
          goto LABEL_13;
        }
        v20 = (void *)(*(_QWORD *)this + v28);
LABEL_12:
        v22 = __src;
LABEL_13:
        memcpy(v20, v22, v21);
        return v5 >= a3;
      }
    }
    *((_DWORD *)this + 5) = 0;
    *((_QWORD *)this + 3) = a4;
    *((_QWORD *)this + 4) = v9;
    v20 = *(void **)this;
    v21 = *((_DWORD *)this + 2) * a3;
    goto LABEL_12;
  }
  return v5 >= a3;
}

uint64_t OALRingBuffer::Fetch(OALRingBuffer *this, unsigned __int8 *__dst, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  size_t v13;
  size_t v14;

  v4 = *((_QWORD *)this + 3);
  if (a4 < v4)
    return 0xFFFFFFFFLL;
  v7 = a4 + a3;
  if (v7 > *((_QWORD *)this + 4))
    return 0xFFFFFFFFLL;
  v9 = *((_DWORD *)this + 2);
  v10 = *((_DWORD *)this + 4);
  v11 = *((_DWORD *)this + 5);
  v12 = (v11 + v9 * ((int)a4 - (int)v4)) % v10;
  v13 = (v11 + v9 * ((int)v7 - (int)v4)) % v10;
  if (v13 <= v12)
  {
    v14 = v10 - v12;
    memcpy(__dst, (const void *)(*(_QWORD *)this + v12), v14);
    memcpy(&__dst[v14], *(const void **)this, v13);
  }
  else
  {
    memcpy(__dst, (const void *)(*(_QWORD *)this + v12), v13 - v12);
  }
  return 0;
}

void OALCaptureMixer::OALCaptureMixer(OALCaptureMixer *this, OpaqueAudioComponentInstance *a2, double a3, int a4, unsigned int a5)
{
  const AudioStreamBasicDescription *v7;
  AudioConverterRef *v8;
  OSStatus Property;
  OALRingBuffer *v10;
  OSStatus v11;
  int v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  char *v16;
  int v17;
  _QWORD *v18;
  uint64_t v19;
  _DWORD *exception;
  int v21;
  CAXException *v22;
  CAXException *v23;
  UInt32 ioDataSize;
  AudioStreamBasicDescription outData;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = a2;
  *(_OWORD *)((char *)this + 8) = 0u;
  v7 = (const AudioStreamBasicDescription *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 14) = a5;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_DWORD *)this + 20) = 0;
  *((_QWORD *)this + 11) = 0;
  v8 = (AudioConverterRef *)((char *)this + 88);
  *((_QWORD *)this + 12) = 0;
  FillInASBD((uint64_t)this + 8, a4, a3);
  if (*((_DWORD *)this + 6) > a5)
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40963;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  memset(&outData, 0, sizeof(outData));
  ioDataSize = 40;
  Property = AudioUnitGetProperty(*(AudioUnit *)this, 8u, 0, 0, &outData, &ioDataSize);
  if (Property)
  {
    v21 = Property;
    v22 = (CAXException *)__cxa_allocate_exception(0x104uLL);
    CAXException::CAXException(v22, "AudioUnitGetProperty(mMixerUnit, kAudioUnitProperty_StreamFormat, 0, 0, &mixerOutFormat, &propSize)", v21);
  }
  v10 = (OALRingBuffer *)operator new();
  OALRingBuffer::OALRingBuffer(v10);
  *((_QWORD *)this + 6) = v10;
  OALRingBuffer::Allocate(v10, *((_DWORD *)this + 8), 4096);
  v11 = AudioConverterNew(&outData, v7, v8);
  if (v11)
  {
    v23 = (CAXException *)__cxa_allocate_exception(0x104uLL);
    CAXException::CAXException(v23, "AudioConverterNew(&mixerOutFormat, &mRequestedFormat, &mAudioConverter)", v11);
  }
  v12 = *((_DWORD *)this + 5);
  if ((v12 & 0x20) != 0)
    v13 = *((unsigned int *)this + 9);
  else
    v13 = 1;
  if ((v12 & 0x20) != 0)
    v14 = 1;
  else
    v14 = *((_DWORD *)this + 9);
  v15 = operator new(16 * ((int)v13 - 1) + 48);
  *v15 = "converted data";
  v15[1] = 0;
  *((_DWORD *)v15 + 4) = 0;
  *((_DWORD *)v15 + 6) = v13;
  if ((_DWORD)v13)
  {
    v16 = (char *)(v15 + 4);
    if ((_DWORD)v13 == 1)
    {
      v17 = 1;
      do
      {
LABEL_16:
        *(_DWORD *)v16 = v14;
        *((_DWORD *)v16 + 1) = 0;
        *((_QWORD *)v16 + 1) = 0;
        v16 += 16;
        --v17;
      }
      while (v17);
      goto LABEL_17;
    }
    v17 = v13 - (v13 & 0xFFFFFFFE);
    v16 += 16 * (v13 & 0xFFFFFFFE);
    v18 = v15 + 7;
    v19 = v13 & 0xFFFFFFFE;
    do
    {
      *((_DWORD *)v18 - 6) = v14;
      *((_DWORD *)v18 - 5) = 0;
      *((_DWORD *)v18 - 2) = v14;
      *((_DWORD *)v18 - 1) = 0;
      *(v18 - 2) = 0;
      *v18 = 0;
      v18 += 4;
      v19 -= 2;
    }
    while (v19);
    if ((v13 & 0xFFFFFFFE) != v13)
      goto LABEL_16;
  }
LABEL_17:
  *((_QWORD *)this + 12) = v15;
  CABufferList::AllocateBuffers((uint64_t)v15, *((_DWORD *)this + 8) << 12);
}

void sub_215C52F08(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, __int16 a12, __int16 a13, int a14)
{
  uint64_t v14;
  void *v15;
  int *v18;
  int v19;
  OALRingBuffer *v20;
  _DWORD *exception;
  OALRingBuffer *v22;
  _DWORD *v23;

  if (a2)
  {
    __cxa_free_exception(v15);
    v18 = (int *)__cxa_begin_catch(a1);
    if (a2 == 2)
    {
      v19 = *v18;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 136315650;
        *(_QWORD *)((char *)&buf + 4) = "oalCaptureMixer.cpp";
        WORD6(buf) = 1024;
        *(_DWORD *)((char *)&buf + 14) = 62;
        a13 = 1024;
        a14 = v19;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::OALCaptureMixer FAILED - result = %d", (uint8_t *)&buf, 0x18u);
      }
      v20 = *(OALRingBuffer **)(v14 + 48);
      if (v20)
      {
        OALRingBuffer::~OALRingBuffer(v20);
        MEMORY[0x2199EEC7C]();
        *(_QWORD *)(v14 + 48) = 0;
      }
      exception = __cxa_allocate_exception(4uLL);
      *exception = v19;
      __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "oalCaptureMixer.cpp";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 70;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::OALCaptureMixer FAILED - Unknown error", (uint8_t *)&buf, 0x12u);
    }
    v22 = *(OALRingBuffer **)(v14 + 48);
    if (v22)
    {
      OALRingBuffer::~OALRingBuffer(v22);
      MEMORY[0x2199EEC7C]();
      *(_QWORD *)(v14 + 48) = 0;
    }
    v23 = __cxa_allocate_exception(4uLL);
    *v23 = -1;
    __cxa_throw(v23, MEMORY[0x24BEDB798], 0);
  }
  _Unwind_Resume(a1);
}

void sub_215C530E0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_215C530EC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_215C530FC()
{
  __cxa_end_catch();
  JUMPOUT(0x215C53104);
}

void CAXException::CAXException(CAXException *this, const char *__s, int a3)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  *((_DWORD *)this + 64) = a3;
  if (__s)
  {
    if (strlen(__s) < 0x100)
    {
      strlcpy((char *)this, __s, 0x100uLL);
    }
    else
    {
      v5 = *(_OWORD *)__s;
      v6 = *((_OWORD *)__s + 1);
      v7 = *((_OWORD *)__s + 3);
      *((_OWORD *)this + 2) = *((_OWORD *)__s + 2);
      *((_OWORD *)this + 3) = v7;
      *(_OWORD *)this = v5;
      *((_OWORD *)this + 1) = v6;
      v8 = *((_OWORD *)__s + 4);
      v9 = *((_OWORD *)__s + 5);
      v10 = *((_OWORD *)__s + 7);
      *((_OWORD *)this + 6) = *((_OWORD *)__s + 6);
      *((_OWORD *)this + 7) = v10;
      *((_OWORD *)this + 4) = v8;
      *((_OWORD *)this + 5) = v9;
      v11 = *((_OWORD *)__s + 8);
      v12 = *((_OWORD *)__s + 9);
      v13 = *((_OWORD *)__s + 11);
      *((_OWORD *)this + 10) = *((_OWORD *)__s + 10);
      *((_OWORD *)this + 11) = v13;
      *((_OWORD *)this + 8) = v11;
      *((_OWORD *)this + 9) = v12;
      v14 = *((_OWORD *)__s + 12);
      v15 = *((_OWORD *)__s + 13);
      v16 = *((_OWORD *)__s + 14);
      *(_OWORD *)((char *)this + 239) = *(_OWORD *)(__s + 239);
      *((_OWORD *)this + 13) = v15;
      *((_OWORD *)this + 14) = v16;
      *((_OWORD *)this + 12) = v14;
      *((_BYTE *)this + 255) = 0;
    }
  }
  else
  {
    *(_BYTE *)this = 0;
  }
}

void OALCaptureMixer::~OALCaptureMixer(AudioUnit *this)
{
  unsigned int *v2;
  unsigned int v3;
  OALRingBuffer *v4;
  AudioUnit v5;
  uint64_t v6;
  OpaqueAudioConverter *v7;

  v2 = (unsigned int *)(this + 10);
  if (*((_DWORD *)this + 20))
  {
    while (1)
    {
      v3 = __ldaxr(v2);
      if (v3 != 1)
        break;
      if (!__stlxr(0, v2))
        goto LABEL_6;
    }
    __clrex();
LABEL_6:
    AudioUnitRemoveRenderNotify(*this, (AURenderCallback)OALCaptureMixer::RenderCallback, this);
    OALRingBuffer::Clear(this[6]);
  }
  v4 = this[6];
  if (v4)
  {
    OALRingBuffer::~OALRingBuffer(v4);
    MEMORY[0x2199EEC7C]();
    this[6] = 0;
  }
  v5 = this[12];
  if (v5)
  {
    v6 = *((_QWORD *)v5 + 1);
    if (v6)
      MEMORY[0x2199EEC64](v6, 0x1000C8077774924);
    MEMORY[0x2199EEC7C](v5, 0x10D0C40C0CFF4BFLL);
    this[12] = 0;
  }
  v7 = this[11];
  if (v7)
  {
    AudioConverterDispose(v7);
    this[11] = 0;
  }
}

void OALCaptureMixer::StopCapture(AudioUnit *this)
{
  unsigned int *v1;
  unsigned int v3;

  v1 = (unsigned int *)(this + 10);
  if (*((_DWORD *)this + 20))
  {
    while (1)
    {
      v3 = __ldaxr(v1);
      if (v3 != 1)
        break;
      if (!__stlxr(0, v1))
        goto LABEL_7;
    }
    __clrex();
LABEL_7:
    AudioUnitRemoveRenderNotify(*this, (AURenderCallback)OALCaptureMixer::RenderCallback, this);
    OALRingBuffer::Clear(this[6]);
  }
}

void OALCaptureMixer::StartCapture(AudioUnit *this)
{
  unsigned int *v1;

  v1 = (unsigned int *)(this + 10);
  if (!*((_DWORD *)this + 20))
  {
    while (!__ldaxr(v1))
    {
      if (!__stlxr(1u, v1))
        goto LABEL_6;
    }
    __clrex();
LABEL_6:
    AudioUnitAddRenderNotify(*this, (AURenderCallback)OALCaptureMixer::RenderCallback, this);
    OALRingBuffer::Clear(this[6]);
  }
}

uint64_t OALCaptureMixer::RenderCallback(OALCaptureMixer *this, _DWORD *a2, unsigned int *a3, const AudioTimeStamp *a4, unsigned int a5, void *inInputDataProcUserData, AudioBufferList *a7)
{
  uint64_t result;
  uint64_t v10;
  OSStatus v11;
  OSStatus v12;
  char *exception;
  UInt32 v14[6];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!*((_DWORD *)this + 20))
    return 0;
  result = 0;
  if (!(_DWORD)a4 && (*a2 & 0x108) == 8)
  {
    v14[0] = a5;
    v10 = *((_QWORD *)this + 12);
    v11 = AudioConverterFillComplexBuffer(*((AudioConverterRef *)this + 11), (AudioConverterComplexInputDataProc)OALCaptureMixer::ConverterProc, inInputDataProcUserData, v14, (AudioBufferList *)(v10 + 24), 0);
    if (v11)
    {
      v12 = v11;
      exception = (char *)__cxa_allocate_exception(0x104uLL);
      *((_DWORD *)exception + 64) = v12;
      strlcpy(exception, "AudioConverterFillComplexBuffer(THIS->mAudioConverter, ConverterProc, ioData, &packetCount, abl, NULL)", 0x100uLL);
    }
    if (OALRingBuffer::Store(*((OALRingBuffer **)this + 6), *(const unsigned __int8 **)(v10 + 40), a5, *((_QWORD *)this + 8)))
    {
      *((_QWORD *)this + 8) += a5;
    }
    return 0;
  }
  return result;
}

void sub_215C53490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, __int16 a10, __int16 a11, int a12)
{
  void *v12;
  int *v15;
  int v16;

  if (a2)
  {
    __cxa_free_exception(v12);
    v15 = (int *)__cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      v16 = *v15;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(a9) = 136315650;
        *(_QWORD *)((char *)&a9 + 4) = "oalCaptureMixer.cpp";
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 157;
        a11 = 1024;
        a12 = v16;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::RenderCallback FAILED - result = %d", (uint8_t *)&a9, 0x18u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(a9) = 136315394;
      *(_QWORD *)((char *)&a9 + 4) = "oalCaptureMixer.cpp";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 161;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::RenderCallback FAILED - Unknown error", (uint8_t *)&a9, 0x12u);
    }
    __cxa_end_catch();
    JUMPOUT(0x215C53424);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALCaptureMixer::ConverterProc(OALCaptureMixer *this, OpaqueAudioConverter *a2, unsigned int *a3, AudioBufferList *a4, AudioStreamPacketDescription **a5, void *a6)
{
  uint64_t v6;
  AudioStreamPacketDescription **v7;
  unsigned int *v8;

  v6 = *(unsigned int *)a5;
  if ((_DWORD)v6)
  {
    v7 = a5 + 2;
    v8 = a3 + 4;
    do
    {
      *(_QWORD *)v8 = *v7;
      *(v8 - 1) = *((_DWORD *)v7 - 1);
      v7 += 2;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  return 0;
}

uint64_t OALCaptureMixer::GetFrames(OALCaptureMixer *this, unsigned int a2, unsigned __int8 *__dst)
{
  OALRingBuffer *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  _DWORD *exception;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!*((_DWORD *)this + 20))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315650;
      v14 = "oalCaptureMixer.cpp";
      v15 = 1024;
      v16 = 196;
      v17 = 2048;
      v18 = 40964;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::GetFrames FAILED, device not currently capturing - result = %ld", (uint8_t *)&v13, 0x1Cu);
    }
    exception = __cxa_allocate_exception(4uLL);
    *exception = 40964;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  v5 = (OALRingBuffer *)*((_QWORD *)this + 6);
  v7 = *((_QWORD *)v5 + 3);
  v6 = *((_QWORD *)v5 + 4);
  v8 = *((_QWORD *)this + 9);
  if (v8 < v7)
  {
    *((_QWORD *)this + 9) = v7;
    v8 = v7;
  }
  v9 = v6 - v8;
  if (*((_DWORD *)this + 14) < v9)
    v9 = *((_DWORD *)this + 14);
  if (v9 >= a2)
  {
    v10 = OALRingBuffer::Fetch(v5, __dst, a2, v8);
    if ((_DWORD)v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v13 = 136315650;
        v14 = "oalCaptureMixer.cpp";
        v15 = 1024;
        v16 = 210;
        v17 = 2048;
        v18 = -1;
        _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::GetFrames FAILED, err returned from mRingBuffer->Fetch - result = %ld", (uint8_t *)&v13, 0x1Cu);
      }
    }
    else
    {
      *((_QWORD *)this + 9) += a2;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315650;
      v14 = "oalCaptureMixer.cpp";
      v15 = 1024;
      v16 = 202;
      v17 = 2048;
      v18 = -1;
      _os_log_impl(&dword_215C2D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::GetFrames FAILED, not enough captured frames - result = %ld", (uint8_t *)&v13, 0x1Cu);
    }
    return 0xFFFFFFFFLL;
  }
  return v10;
}

uint64_t OALCaptureMixer::AvailableFrames(OALCaptureMixer *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;

  v1 = *((_QWORD *)this + 6);
  v3 = *(_QWORD *)(v1 + 24);
  v2 = *(_QWORD *)(v1 + 32);
  v4 = *((_QWORD *)this + 9);
  if (v4 < v3)
  {
    *((_QWORD *)this + 9) = v3;
    LODWORD(v4) = v3;
  }
  v5 = v2 - v4;
  v6 = *((_DWORD *)this + 14);
  if (v6 >= v5)
    return v5;
  else
    return v6;
}

uint64_t CABufferList::AllocateBuffers(uint64_t this, unsigned int a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  size_t v5;
  char *v6;
  int v7;
  const void **v8;
  char *v9;
  size_t v10;

  if (*(_DWORD *)(this + 36) < a2)
  {
    v2 = this;
    v3 = *(_DWORD *)(this + 24);
    if (v3 <= 1)
      v4 = a2;
    else
      v4 = (a2 + 15) & 0xFFFFFFE0 | 0x10;
    v5 = v4 * v3;
    v6 = (char *)operator new[]();
    bzero(v6, v5);
    v7 = *(_DWORD *)(v2 + 24);
    if (v7)
    {
      v8 = (const void **)(v2 + 40);
      v9 = v6;
      do
      {
        if (*v8)
        {
          v10 = *((unsigned int *)v8 - 1);
          if ((_DWORD)v10)
            memcpy(v9, *v8, v10);
        }
        *((_DWORD *)v8 - 1) = v4;
        *v8 = v9;
        v8 += 2;
        v9 += v4;
        --v7;
      }
      while (v7);
    }
    this = *(_QWORD *)(v2 + 8);
    *(_QWORD *)(v2 + 8) = v6;
    *(_DWORD *)(v2 + 16) = v4;
    if (this)
      JUMPOUT(0x2199EEC64);
  }
  return this;
}

void alSourceAddNotification_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_0(&dword_215C2D000, MEMORY[0x24BDACB70], v0, "%25s:%-5d ERROR: alSourceAddNotification FAILED", v1, v2, v3, v4, v5);
  }
  __cxa_end_catch();
  OUTLINED_FUNCTION_2();
}

void alSourceRemoveNotification_cold_1(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  if ((a1 & 1) != 0)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_0(&dword_215C2D000, MEMORY[0x24BDACB70], v1, "%25s:%-5d ERROR: alSourceRemoveNotification FAILED", v2, v3, v4, v5, v6);
  }
  __cxa_end_catch();
  OUTLINED_FUNCTION_2();
}

OSStatus AUGraphAddNode(AUGraph inGraph, const AudioComponentDescription *inDescription, AUNode *outNode)
{
  return MEMORY[0x24BDB66B0](inGraph, inDescription, outNode);
}

OSStatus AUGraphAddRenderNotify(AUGraph inGraph, AURenderCallback inCallback, void *inRefCon)
{
  return MEMORY[0x24BDB66B8](inGraph, inCallback, inRefCon);
}

OSStatus AUGraphConnectNodeInput(AUGraph inGraph, AUNode inSourceNode, UInt32 inSourceOutputNumber, AUNode inDestNode, UInt32 inDestInputNumber)
{
  return MEMORY[0x24BDB66C8](inGraph, *(_QWORD *)&inSourceNode, *(_QWORD *)&inSourceOutputNumber, *(_QWORD *)&inDestNode, *(_QWORD *)&inDestInputNumber);
}

OSStatus AUGraphDisconnectNodeInput(AUGraph inGraph, AUNode inDestNode, UInt32 inDestInputNumber)
{
  return MEMORY[0x24BDB66D0](inGraph, *(_QWORD *)&inDestNode, *(_QWORD *)&inDestInputNumber);
}

OSStatus AUGraphInitialize(AUGraph inGraph)
{
  return MEMORY[0x24BDB66E8](inGraph);
}

OSStatus AUGraphIsRunning(AUGraph inGraph, Boolean *outIsRunning)
{
  return MEMORY[0x24BDB6700](inGraph, outIsRunning);
}

OSStatus AUGraphNodeInfo(AUGraph inGraph, AUNode inNode, AudioComponentDescription *outDescription, AudioUnit *outAudioUnit)
{
  return MEMORY[0x24BDB6708](inGraph, *(_QWORD *)&inNode, outDescription, outAudioUnit);
}

OSStatus AUGraphOpen(AUGraph inGraph)
{
  return MEMORY[0x24BDB6710](inGraph);
}

OSStatus AUGraphRemoveNode(AUGraph inGraph, AUNode inNode)
{
  return MEMORY[0x24BDB6718](inGraph, *(_QWORD *)&inNode);
}

OSStatus AUGraphRemoveRenderNotify(AUGraph inGraph, AURenderCallback inCallback, void *inRefCon)
{
  return MEMORY[0x24BDB6720](inGraph, inCallback, inRefCon);
}

OSStatus AUGraphStart(AUGraph inGraph)
{
  return MEMORY[0x24BDB6730](inGraph);
}

OSStatus AUGraphStop(AUGraph inGraph)
{
  return MEMORY[0x24BDB6738](inGraph);
}

OSStatus AUGraphUninitialize(AUGraph inGraph)
{
  return MEMORY[0x24BDB6740](inGraph);
}

OSStatus AUGraphUpdate(AUGraph inGraph, Boolean *outIsUpdated)
{
  return MEMORY[0x24BDB6748](inGraph, outIsUpdated);
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x24BDB67A8](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x24BDB67B8](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x24BDB67C8](inComponent, outInstance);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x24BDB67F0](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x24BDB67F8](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x24BDB6810](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioOutputUnitStart(AudioUnit ci)
{
  return MEMORY[0x24BDB68B8](ci);
}

OSStatus AudioOutputUnitStop(AudioUnit ci)
{
  return MEMORY[0x24BDB68C0](ci);
}

OSStatus AudioUnitAddPropertyListener(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitPropertyListenerProc inProc, void *inProcUserData)
{
  return MEMORY[0x24BDB69F8](inUnit, *(_QWORD *)&inID, inProc, inProcUserData);
}

OSStatus AudioUnitAddRenderNotify(AudioUnit inUnit, AURenderCallback inProc, void *inProcUserData)
{
  return MEMORY[0x24BDB6A00](inUnit, inProc, inProcUserData);
}

OSStatus AudioUnitGetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue *outValue)
{
  return MEMORY[0x24BDB6A08](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outValue);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x24BDB6A10](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitGetPropertyInfo(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, UInt32 *outDataSize, Boolean *outWritable)
{
  return MEMORY[0x24BDB6A18](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outDataSize, outWritable);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x24BDB6A20](inUnit);
}

OSStatus AudioUnitRemoveRenderNotify(AudioUnit inUnit, AURenderCallback inProc, void *inProcUserData)
{
  return MEMORY[0x24BDB6A30](inUnit, inProc, inProcUserData);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x24BDB6A38](inUnit, ioActionFlags, inTimeStamp, *(_QWORD *)&inOutputBusNumber, *(_QWORD *)&inNumberFrames, ioData);
}

OSStatus AudioUnitReset(AudioUnit inUnit, AudioUnitScope inScope, AudioUnitElement inElement)
{
  return MEMORY[0x24BDB6A40](inUnit, *(_QWORD *)&inScope, *(_QWORD *)&inElement);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x24BDB6A48](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, *(_QWORD *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BDB6A50](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

OSStatus DisposeAUGraph(AUGraph inGraph)
{
  return MEMORY[0x24BDB6AB0](inGraph);
}

OSStatus NewAUGraph(AUGraph *outGraph)
{
  return MEMORY[0x24BDB6BC0](outGraph);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24D4650D8();
}

void operator delete(void *__p)
{
  off_24D4650E0(__p);
}

uint64_t operator delete()
{
  return off_24D4650E8();
}

uint64_t operator new[]()
{
  return off_24D4650F0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D4650F8(__sz);
}

uint64_t operator new()
{
  return off_24D465100();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F8](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x24BDAF828](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D8](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

