void ___ZN12GLDDeviceRec29getRenderPipelineStateFromKeyEPK20GLRRenderPipelineKey_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *Value;
  const void *v4;

  v2 = *(_QWORD *)(a1 + 56);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 456), *(const void **)(a1 + 64));
  if (Value)
  {
    v4 = Value;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v4;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[GLRRenderPipelineStateES initWithPipelineState:reflection:]([GLRRenderPipelineStateES alloc], "initWithPipelineState:reflection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v2 + 456), *(const void **)(a1 + 64), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
}

uint64_t gldWaitForContext(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 5264), 0xFFFFFFFFFFFFFFFFLL);
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 72) + 40))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88));
}

void GLDPipelineProgramRec::~GLDPipelineProgramRec(GLDPipelineProgramRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

intptr_t gldUnbindBuffer(id *a1, GLDBufferRec *this)
{
  intptr_t result;
  uint64_t v4;

  result = GLDBufferRec::getMemoryPlugin(this);
  if (result)
  {
    v4 = *(_QWORD *)(result + 24);
    if (v4)
    {
      if (*(_DWORD *)(v4 + 12))
        return GLDContextRec::flushContext(a1);
    }
  }
  return result;
}

void GLRPixelFormat::~GLRPixelFormat(GLRPixelFormat *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

_QWORD *_depthStencilKeyRetain(const __CFAllocator *a1, _QWORD *a2)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = *a2;
  return result;
}

uint64_t gldGetVersion(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result;

  if (!*(_DWORD *)g_Library)
    return 0;
  *a1 = 4;
  result = 1;
  *a2 = 1;
  *a3 = 16;
  *a4 = 32512;
  return result;
}

uint64_t gldCreateDevice(GLDObject **a1, uint64_t a2, uint64_t a3)
{
  GLDObject *v5;
  GLDObject *v6;
  uint64_t result;

  GLDObject::operator new((GLDObject *)0x3D8);
  v6 = v5;
  GLDObject::GLDObject(v5);
  *(_QWORD *)v6 = off_24FFEB0B0;
  *((_QWORD *)v6 + 68) = 0;
  *((_DWORD *)v6 + 241) = 0;
  *((_QWORD *)v6 + 61) = 0;
  *((_QWORD *)v6 + 62) = 0;
  if (GLDDeviceRec::init(v6))
  {
    result = 0;
    *a1 = v6;
  }
  else
  {
    GLDObject::release((unsigned int *)v6);
    result = 10017;
  }
  *(_DWORD *)a3 = 0;
  *(_BYTE *)(a3 + 4) = 1;
  return result;
}

void sub_231054454(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLRPixelFormat::GLRPixelFormat(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t result;

  GLDObject::GLDObject((GLDObject *)a1);
  *(_QWORD *)v4 = off_24FFED640;
  v6 = a2[1];
  v5 = a2[2];
  v7 = *a2;
  *(_QWORD *)(v4 + 112) = *((_QWORD *)a2 + 6);
  *(_OWORD *)(v4 + 80) = v6;
  *(_OWORD *)(v4 + 96) = v5;
  *(_OWORD *)(v4 + 64) = v7;
  *(_OWORD *)(v4 + 44) = 0u;
  *(_OWORD *)(v4 + 12) = 0u;
  *(_OWORD *)(v4 + 28) = 0u;
  *(_DWORD *)(v4 + 60) = 0;
  v8 = *(_DWORD *)(v4 + 84);
  *(_BYTE *)(v4 + 44) = (v8 & 0x3FFFFFFC) != 0;
  *(_BYTE *)(v4 + 45) = (*(_BYTE *)(v4 + 80) & 8) != 0;
  if ((v8 & 0x3FC0) != 0)
  {
    v9 = 0x8366000080E1;
    v10 = 16;
  }
  else if ((v8 & 0xFC000) != 0)
  {
    v9 = 0x8367000080E1;
    v10 = 32;
  }
  else if ((v8 & 0x3F00000) != 0)
  {
    v9 = 0x140300001908;
    v10 = 64;
  }
  else
  {
    if ((v8 & 0xC000000) == 0)
    {
      result = MTLReleaseAssertionFailure();
      __break(1u);
      return result;
    }
    v9 = 0x140600001908;
    v10 = 128;
  }
  *(_QWORD *)(a1 + 32) = v9;
  *(_DWORD *)(a1 + 40) = 6408;
  *(_DWORD *)(a1 + 12) = v10;
  if ((v8 & 0x400) != 0)
  {
    v11 = 1;
  }
  else if ((v8 & 0x40000) != 0)
  {
    v11 = 2;
  }
  else if ((v8 & 0x80) != 0)
  {
    v11 = 4;
  }
  else if ((v8 & 0x9A928) != 0)
  {
    v11 = 8;
  }
  else if ((v8 & 0x200000) != 0)
  {
    v11 = 12;
  }
  else if ((v8 & 0x2800000) != 0)
  {
    v11 = 16;
  }
  else if ((v8 & 0x8000000) != 0)
  {
    v11 = 32;
  }
  else
  {
    v11 = (v8 >> 23) & 0x40;
  }
  *(_DWORD *)(a1 + 16) = v11;
  v12 = *(_DWORD *)(a1 + 92);
  if ((v12 & 0x1000) != 0)
  {
    v13 = 32;
  }
  else if ((v12 & 0x800) != 0)
  {
    v13 = 24;
  }
  else if ((v12 & 0x400) != 0)
  {
    v13 = 16;
  }
  else
  {
    v13 = (v12 >> 4) & 8;
  }
  *(_DWORD *)(a1 + 20) = v13;
  v14 = *(_DWORD *)(a1 + 96);
  if ((v14 & 0x1000) != 0)
  {
    v15 = 32;
  }
  else if ((v14 & 0x800) != 0)
  {
    v15 = 24;
  }
  else if ((v14 & 0x400) != 0)
  {
    v15 = 16;
  }
  else
  {
    v15 = (v14 >> 4) & 8;
  }
  *(_DWORD *)(a1 + 24) = v15;
  v16 = *(unsigned __int16 *)(a1 + 104);
  v17 = 1;
  *(_DWORD *)(a1 + 52) = *(_WORD *)(a1 + 104) != 0;
  *(_DWORD *)(a1 + 56) = 1;
  if (v16)
  {
    if (*(__int16 *)(a1 + 106) < 1)
    {
      v17 = 1;
    }
    else
    {
      v18 = *(unsigned __int16 *)(a1 + 106);
      if (v18 >= 5)
      {
        if (v18 < 0xA)
          v17 = 3;
        else
          v17 = 4;
      }
      else
      {
        v17 = 2;
      }
    }
  }
  *(_DWORD *)(a1 + 60) = v17;
  *(_DWORD *)(a1 + 28) = *(__int16 *)(a1 + 102);
  *(_BYTE *)(a1 + 46) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  return a1;
}

void sub_2310546C0(_Unwind_Exception *a1)
{
  GLDObject *v1;

  GLDObject::~GLDObject(v1);
  _Unwind_Resume(a1);
}

uint64_t GLRFunctionCache::registerBuiltInFunction(uint64_t a1, void *a2)
{
  CFIndex Count;
  uint64_t v5;

  pthread_rwlock_wrlock((pthread_rwlock_t *)a1);
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 216));
  if (Count > 16777214)
  {
    v5 = 0;
  }
  else
  {
    v5 = (Count + 1);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 216), a2);
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)a1);

  return v5;
}

void gldInitializeLibrary(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  gldInitializeLibrary::space = a3;
  qword_25414D638 = a4;
  unk_25414D640 = a5;
  g_Library = (uint64_t)&gldInitializeLibrary::space;
}

uint64_t GLDLibrary::getAllDisplayMask(GLDLibrary *this)
{
  return 1;
}

BOOL GLDContextRec::drawableInvert(GLDContextRec *this)
{
  uint64_t v1;
  int v2;

  v1 = *((_QWORD *)this + 50);
  if (!v1)
    return 0;
  if (*(_DWORD *)(*(_QWORD *)(v1 + 32) + 192))
    v2 = 16;
  else
    v2 = 32;
  return (**((_DWORD **)this + 16) & v2) != 0;
}

_DWORD *GLDContextRec::bindTexture(_DWORD *this, GLDTextureRec *a2, int a3, char a4)
{
  _DWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  uint64_t TextureResource;
  unsigned int v12;
  int v13;
  char *v14;

  v4 = this;
  v5 = (uint64_t *)&this[2 * a3 + 894];
  v6 = *v5;
  v7 = 1 << a3;
  this[662] &= ~(1 << a3);
  if (!a2)
  {
    *v5 = 0;
    if (!v6)
      goto LABEL_9;
    goto LABEL_8;
  }
  TextureResource = GLDTextureRec::getTextureResource(a2, 0);
  *v5 = TextureResource;
  this = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)TextureResource + 16))(TextureResource);
  if (a4 < 0)
  {
    v12 = *(unsigned __int8 *)(*((_QWORD *)a2 + 6) + 214);
    v13 = (v12 >> 4) - (v12 & 0xF);
    v14 = (char *)v4 + a3;
    if (v14[1816] != v13)
    {
      v14[1816] = v13;
      v4[661] |= v7;
    }
  }
  if ((*((_BYTE *)&glrTextureFormats + 40 * *((unsigned int *)a2 + 16) + 37) & 1) != 0)
    v4[662] |= v7;
  if (v6)
LABEL_8:
    this = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
LABEL_9:
  v4[618] |= 4u;
  v4[660] |= v7;
  return this;
}

uint64_t gldCreatePipelineProgram(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject *v8;
  GLDLibrary *v9;

  GLDObject::operator new((GLDObject *)0x38);
  v9 = v8;
  GLDObject::GLDObject(v8);
  *(_QWORD *)v9 = off_24FFEB358;
  GLDLibrary::getAllDisplayMask(v9);
  *((_QWORD *)v9 + 2) = a1;
  *((_QWORD *)v9 + 3) = a3;
  *((_QWORD *)v9 + 4) = a4;
  *a2 = v9;
  return 0;
}

void sub_231054928(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldCreateProgram(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject *v8;
  GLDLibrary *v9;

  GLDObject::operator new((GLDObject *)0x28);
  v9 = v8;
  GLDObject::GLDObject(v8);
  *(_QWORD *)v9 = off_24FFEB390;
  GLDLibrary::getAllDisplayMask(v9);
  *((_QWORD *)v9 + 2) = a1;
  *((_QWORD *)v9 + 3) = a3;
  *((_QWORD *)v9 + 4) = a4;
  *a2 = v9;
  return 0;
}

void sub_2310549AC(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDTextureRec::ensureResource(uint64_t this)
{
  uint64_t v1;
  GLDTextureRec *v2;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(this + 48);
  if ((*(_BYTE *)(v1 + 24) & 8) == 0)
  {
    v2 = (GLDTextureRec *)this;
    if (*(_BYTE *)(*(_QWORD *)(this + 40) + 440))
    {
      v3 = mach_absolute_time();
      v4 = (*(uint64_t (**)(_QWORD))(g_Library + 16))(*(_QWORD *)(*((_QWORD *)v2 + 6) + 32));
      this = mach_absolute_time();
      *((_QWORD *)v2 + 18) += this - v3;
      if (v4)
        return this;
      return GLDTextureRec::getIOSurfaceResource(v2);
    }
    this = (*(uint64_t (**)(_QWORD))(g_Library + 16))(*(_QWORD *)(v1 + 32));
    if (!(_DWORD)this)
      return GLDTextureRec::getIOSurfaceResource(v2);
  }
  return this;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void GLDContextRec::~GLDContextRec(GLDContextRec *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 423);
  if (v2)
  {
    *((_QWORD *)this + 424) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 284);
  if (v3)
  {
    *((_QWORD *)this + 285) = v3;
    operator delete(v3);
  }
  GLDObject::~GLDObject(this);
}

uint64_t gldDestroyPipelineProgram(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  if (a2)
    (*(void (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  return 0;
}

uint64_t GLDObject::dealloc(uint64_t this)
{
  if (this)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)this + 8))(this);
  return this;
}

uint64_t GLRResourceListPool::dealloc(GLRResourceListPool *this)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)*((_QWORD *)this + 2);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)v2[24];
      (*(void (**)(_QWORD *))(*v2 + 24))(v2);
      v2 = v3;
    }
    while (v3);
  }
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRTextureResource::dealloc(id *this)
{
  id v2;

  v2 = this[5];
  if (v2)
    (*(void (**)(id))(*(_QWORD *)v2 + 24))(v2);
  return GLDObject::dealloc((uint64_t)this);
}

void GLRTextureResource::~GLRTextureResource(GLRTextureResource *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t gldModifyPipelineProgram()
{
  return 0;
}

uint64_t GLRResourceList::dealloc(void **this)
{
  GLRResourceList::releaseAllResources((uint64_t)this);
  free(this[20]);
  free(this[21]);
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRResource::incrementUsage(uint64_t this)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(this + 12);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return this;
}

unsigned int *GLDObject::release(unsigned int *this)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = this + 2;
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stxr(v3, v1));
  if (!v3)
    return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)this + 32))(this);
  return this;
}

uint64_t gldCreateSampler(uint64_t a1, GLDObject **a2, uint64_t a3, uint64_t a4)
{
  GLDObject *v8;
  GLDObject *v9;

  GLDObject::operator new((GLDObject *)0x38);
  v9 = v8;
  GLDObject::GLDObject(v8);
  *(_QWORD *)v9 = off_24FFEB678;
  GLDSamplerRec::initWithShareGroup((uint64_t)v9, a1, a3, a4);
  *a2 = v9;
  return 0;
}

void sub_231054CC4(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

__n128 _renderPipelineKeyRetain(const __CFAllocator *a1, __n128 *a2)
{
  _OWORD *v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 result;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  void *memptr;

  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x40uLL, 0x80uLL, 0x1000040AE2C30F4uLL);
  v3 = memptr;
  v4 = a2[3];
  v6 = *a2;
  v5 = a2[1];
  *((__n128 *)memptr + 2) = a2[2];
  v3[3] = v4;
  *v3 = v6;
  v3[1] = v5;
  result = a2[6];
  v8 = a2[7];
  v10 = a2[4];
  v9 = a2[5];
  v3[6] = result;
  v3[7] = v8;
  v3[4] = v10;
  v3[5] = v9;
  return result;
}

uint64_t GLRResource::incrementBusy(uint64_t this)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(this + 16);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return this;
}

uint64_t GLDContextRec::setRenderViewport(id *this, double a2, double a3, double a4, double a5, float a6)
{
  id v7;
  __int128 v8;
  _OWORD v10[3];

  GLDContextRec::updateRenderViewport((GLDContextRec *)this, a2, a3, a4, a5, a6);
  v7 = this[2];
  v8 = *((_OWORD *)this + 321);
  v10[0] = *((_OWORD *)this + 320);
  v10[1] = v8;
  v10[2] = *((_OWORD *)this + 322);
  objc_msgSend(v7, "setViewport:", v10);
  return objc_msgSend(this[2], "setViewportTransformEnabled:", *((_WORD *)this[13] + 2) == 0);
}

uint64_t GLDContextRec::setRenderUniformBuffers(GLDContextRec *this)
{
  GLDContextRec::setRenderUniformBuffersInternal((uint64_t)this, (uint64_t)this + 2872, (uint64_t)this + 3096, 12, (uint64_t)this + 3448);
  return GLDContextRec::setRenderUniformBuffersInternal((uint64_t)this, (uint64_t)this + 2968, (uint64_t)this + 3192, 12, (uint64_t)this + 3464);
}

uint64_t GLDContextRec::isTransformFeedbackActive(GLDContextRec *this)
{
  uint64_t v1;

  v1 = 0;
  while (!*(_QWORD *)(*((_QWORD *)this + 14) + 376 + v1))
  {
    v1 += 8;
    if (v1 == 32)
      return 0;
  }
  if (*(_BYTE *)(*((_QWORD *)this + 13) + 15713) || *(__int16 *)(*((_QWORD *)this + 13) + 15714) == -1)
    return 0;
  *((_QWORD *)this + 53) |= 0x2000uLL;
  return 1;
}

BOOL _cachedFunctionEqual(void *a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)objc_msgSend(a1, "bitCodeHash");
  v4 = (_QWORD *)objc_msgSend(a2, "bitCodeHash");
  return *v3 == *v4 && v3[1] == v4[1] && v3[2] == v4[2] && v3[3] == v4[3];
}

uint64_t gldDestroyDevice(unsigned int *a1)
{
  if (a1)
    GLDObject::release(a1);
  return 0;
}

uint64_t GLRTextureResource::setForceASTC_LP(uint64_t this, int a2)
{
  if (*(unsigned __int8 *)(this + 57) != a2)
  {
    *(_BYTE *)(this + 57) = a2;
    *(_BYTE *)(this + 56) = 1;
  }
  return this;
}

id GLRRenderPipelineKey::copyDescriptor(GLRRenderPipelineKey *this, const GLRFunctionCache *a2)
{
  void *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v27;

  v27 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  v4 = (void *)objc_msgSend(v27, "colorAttachments");
  v5 = 0;
  v6 = (char *)this + 104;
  do
  {
    v7 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
    v8 = *(unsigned __int16 *)&v6[2 * v5];
    objc_msgSend(v7, "setPixelFormat:", v8);
    if (v8)
    {
      v9 = &v6[4 * v5];
      objc_msgSend(v7, "setBlendingEnabled:", *((_DWORD *)v9 - 4) & 1);
      objc_msgSend(v7, "setRgbBlendOperation:", ((unint64_t)*((unsigned int *)v9 - 4) >> 1) & 7);
      objc_msgSend(v7, "setAlphaBlendOperation:", ((unint64_t)*((unsigned int *)v9 - 4) >> 4) & 7);
      objc_msgSend(v7, "setSourceRGBBlendFactor:", ((unint64_t)*((unsigned int *)v9 - 4) >> 7) & 0xF);
      objc_msgSend(v7, "setSourceAlphaBlendFactor:", ((unint64_t)*((unsigned int *)v9 - 4) >> 11) & 0xF);
      objc_msgSend(v7, "setDestinationRGBBlendFactor:", ((unint64_t)*((unsigned int *)v9 - 4) >> 15) & 0xF);
      objc_msgSend(v7, "setDestinationAlphaBlendFactor:", ((unint64_t)*((unsigned int *)v9 - 4) >> 19) & 0xF);
      objc_msgSend(v7, "setWriteMask:", ((unint64_t)*((unsigned int *)v9 - 4) >> 23) & 0xF);
    }
    ++v5;
  }
  while (v5 != 4);
  objc_msgSend(v27, "setDepthStencilWriteDisabled:", (*((_QWORD *)this + 14) >> 40) & 1);
  if ((*((_QWORD *)this + 14) & 0xE0000000000) != 0)
    v10 = 252;
  else
    v10 = 0;
  objc_msgSend(v27, "setDepthAttachmentPixelFormat:", v10);
  objc_msgSend(v27, "setStencilAttachmentPixelFormat:", ((uint64_t)(*((_QWORD *)this + 14) << 17) >> 63) & 0xFD);
  objc_msgSend(v27, "setSampleCoverageInvert:", (*((_QWORD *)this + 14) >> 45) & 1);
  objc_msgSend(v27, "setLogicOperationEnabled:", HIBYTE(*((_QWORD *)this + 14)) & 1);
  objc_msgSend(v27, "setLogicOperation:", (*((_QWORD *)this + 14) >> 52) & 0xFLL);
  objc_msgSend(v27, "setAlphaTestEnabled:", (*((_QWORD *)this + 14) >> 60) & 1);
  objc_msgSend(v27, "setAlphaTestFunction:", (*((_QWORD *)this + 14) >> 57) & 7);
  objc_msgSend(v27, "setPointSmoothEnabled:", (*((_QWORD *)this + 14) >> 61) & 1);
  objc_msgSend(v27, "setClipDistanceEnableMask:", *((unsigned __int8 *)this + 116));
  objc_msgSend(v27, "setSampleCount:", *((_WORD *)this + 59) & 0xFLL);
  objc_msgSend(v27, "setSampleMask:", *((unsigned int *)this + 20));
  LODWORD(v11) = *((_DWORD *)this + 28);
  objc_msgSend(v27, "setSampleCoverage:", v11);
  objc_msgSend(v27, "setAlphaToOneEnabled:", (*((_QWORD *)this + 14) >> 62) & 1);
  objc_msgSend(v27, "setAlphaToCoverageEnabled:", *((_QWORD *)this + 14) >> 63);
  objc_msgSend(v27, "setVertexDepthCompareClampMask:", *((unsigned int *)this + 30));
  objc_msgSend(v27, "setFragmentDepthCompareClampMask:", *((unsigned int *)this + 31));
  objc_msgSend(v27, "setVertexFunction:", GLRFunctionCache::getFunction(a2, *((_DWORD *)this + 18) & 0xFFFFFF));
  objc_msgSend(v27, "setFragmentFunction:", GLRFunctionCache::getFunction(a2, *(_DWORD *)((_BYTE *)this + 75) & 0xFFFFFF));
  objc_msgSend(v27, "setRasterizationEnabled:", (*((_QWORD *)this + 14) >> 47) & 1);
  objc_msgSend(v27, "setOpenGLModeEnabled:", 1);
  v12 = objc_alloc_init(MEMORY[0x24BDDD770]);
  v13 = (void *)objc_msgSend(v12, "layouts");
  v14 = (void *)objc_msgSend(v12, "attributes");
  v15 = 0;
  LODWORD(v16) = 0;
  v17 = 0;
  do
  {
    v18 = (void *)objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
    v19 = v18;
    v20 = *((_DWORD *)this + v15);
    if ((~v20 & 3) != 0)
    {
      if ((v20 & 0xFC) != 0)
      {
        v24 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", (v17 + 15));
        objc_msgSend(v19, "setFormat:", *((_DWORD *)this + v15) >> 2);
        objc_msgSend(v19, "setBufferIndex:", (v17 + 15));
        objc_msgSend(v19, "setOffset:", (unint64_t)*((unsigned int *)this + v15) >> 30);
        objc_msgSend(v24, "setStride:", ((unint64_t)*((unsigned int *)this + v15) >> 8) & 0xFFF);
        objc_msgSend(v24, "setStepFunction:", *((_DWORD *)this + v15) & 3);
        objc_msgSend(v24, "setStepRate:", ((unint64_t)*((unsigned int *)this + v15) >> 20) & 0x3FF);
        ++v17;
      }
    }
    else if (v20 >> 2)
    {
      objc_msgSend(v18, "setFormat:");
      objc_msgSend(v19, "setOffset:", ((unint64_t)*((unsigned int *)this + v15) >> 20) & 0x3FF);
      if ((*((_DWORD *)this + v15) & 0xFFF00) != 0)
      {
        v21 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 15);
        objc_msgSend(v19, "setBufferIndex:", 15);
        objc_msgSend(v21, "setStride:", ((unint64_t)*((unsigned int *)this + v15) >> 8) & 0xFFF);
        objc_msgSend(v21, "setStepFunction:", 1);
        v22 = v21;
        v23 = 1;
      }
      else
      {
        v25 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 14);
        objc_msgSend(v19, "setBufferIndex:", 14);
        v16 = (v16 + 16);
        objc_msgSend(v25, "setStride:", v16);
        objc_msgSend(v25, "setStepFunction:", 0);
        v22 = v25;
        v23 = 0;
      }
      objc_msgSend(v22, "setStepRate:", v23);
    }
    ++v15;
  }
  while (v15 != 18);
  objc_msgSend(v27, "attachVertexDescriptor:", v12);
  objc_msgSend(v27, "setLabel:", *MEMORY[0x24BDDD9C0]);

  return v27;
}

uint64_t GLRTextureResource::initWithMetalTexture(GLDLibrary *a1, void *a2, uint64_t a3)
{
  GLDLibrary::getAllDisplayMask(a1);
  *((_QWORD *)a1 + 3) = a3;
  *((_QWORD *)a1 + 4) = a2;
  return 1;
}

uint64_t gldDestroyBuffer(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  if (a2)
    (*(void (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  return 0;
}

uint64_t GLDBufferRec::getMemoryPlugin(GLDBufferRec *this)
{
  return *((_QWORD *)this + 5);
}

uint64_t GLRTextureViewResource::dealloc(id *this)
{

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDDeviceRec::getRenderPipelineStateFromKey(GLDDeviceRec *this, const GLRRenderPipelineKey *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v10[9];
  uint64_t v11;
  id v12;
  _QWORD context[3];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint8_t buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  context[0] = (char *)this + 456;
  context[1] = a2;
  context[2] = &v19;
  dispatch_sync_f(*((dispatch_queue_t *)this + 56), context, (dispatch_function_t)_getRenderPipelineState);
  v4 = v15[5];
  if (!v4)
  {
    v5 = (void *)MEMORY[0x2348CF1D8]();
    v12 = 0;
    v6 = GLRRenderPipelineKey::copyDescriptor(a2, (GLDDeviceRec *)((char *)this + 216));
    v11 = 0;
    v7 = objc_msgSend(*((id *)this + 3), "newRenderPipelineStateWithDescriptor:options:reflection:error:", v6, 1, &v11, &v12);
    if (v7)
    {
      *((_DWORD *)this + 3) |= 0x300000u;
      v8 = *((_QWORD *)this + 56);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = ___ZN12GLDDeviceRec29getRenderPipelineStateFromKeyEPK20GLRRenderPipelineKey_block_invoke;
      v10[3] = &unk_24FFEB1F0;
      v10[7] = this;
      v10[8] = a2;
      v10[6] = &v14;
      v10[4] = v7;
      v10[5] = v11;
      dispatch_barrier_sync(v8, v10);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      GLDDeviceRec::getRenderPipelineStateFromKey(objc_msgSend(v12, "localizedDescription"), buf);
    }

    objc_autoreleasePoolPop(v5);
    v4 = v15[5];
  }
  _Block_object_dispose(&v14, 8);
  return v4;
}

void sub_2310555D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *GLRDataBufferManager::allocDataBuffer(GLRDataBufferManager *this, unint64_t a2, unint64_t *a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  _os_nospin_lock_lock();
  v6 = *((_QWORD *)this + 33);
  if (v6 >= a2 && v6 == *((_QWORD *)this + 34))
  {
    v7 = *((_QWORD *)this + 32);
    if (v7)
    {
      v8 = v7 - 1;
      *((_QWORD *)this + 32) = v8;
      v9 = (void *)*((_QWORD *)this + v8);
      *a3 = v6;
      _os_nospin_lock_unlock();
      if (v9)
        goto LABEL_17;
      goto LABEL_14;
    }
  }
  else
  {
    if (*((_QWORD *)this + 32))
    {
      v10 = 0;
      do
      {

        *((_QWORD *)this + v10++) = 0;
      }
      while (v10 < *((_QWORD *)this + 32));
    }
    *((_QWORD *)this + 32) = 0;
    v6 = *((_QWORD *)this + 34);
  }
  for (; v6 < a2; v6 *= 2)
  {
    if (v6 >= *((_QWORD *)this + 36))
      break;
  }
  *((_QWORD *)this + 33) = v6;
  *((_QWORD *)this + 34) = v6;
  _os_nospin_lock_unlock();
LABEL_14:
  if (*((_QWORD *)this + 33) >= a2)
  {
    v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)this + 43) + 96) + 24), "newBufferWithLength:options:");
    objc_msgSend(v9, "setLabel:", *MEMORY[0x24BDDD9C0]);
  }
  else
  {
    v9 = 0;
  }
LABEL_17:
  *a3 = *((_QWORD *)this + 33);
  return v9;
}

uint64_t GLDContextRec::updateRenderPolygonMode(uint64_t this)
{
  uint64_t v1;
  _WORD *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v1 = *(_QWORD *)(this + 104);
  v2 = (_WORD *)(v1 + 13256);
  if (*(_BYTE *)(v1 + 13265))
  {
    *(_QWORD *)(this + 424) |= 0x20uLL;
    v3 = *(_DWORD *)(v1 + 13248);
    v4 = *(_DWORD *)(v1 + 13244);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  *(_DWORD *)(this + 5200) = v3;
  *(_DWORD *)(this + 5204) = v4;
  *(_QWORD *)(this + 5112) = 0;
  if (!*(_BYTE *)(v1 + 13262))
  {
    v6 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)(this + 424) |= 4uLL;
  v5 = *(unsigned __int16 *)(v1 + 13258);
  v6 = 1;
  switch(v5)
  {
    case 1028:
LABEL_10:
      *(_QWORD *)(this + 5104) = v6;
      LOBYTE(v6) = 0;
      goto LABEL_11;
    case 1032:
LABEL_11:
      *(_BYTE *)(this + 5081) = v6;
      break;
    case 1029:
      v6 = 2;
      goto LABEL_10;
  }
  *(_QWORD *)(this + 5096) = *(unsigned __int8 *)(this + 5080) != (*v2 == 2304);
  *(_DWORD *)(this + 2472) |= 0x100u;
  return this;
}

double GLRDataBufferManager::reset(GLRDataBufferManager *this)
{
  double result;

  *((_QWORD *)this + 37) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 328) = 0u;
  return result;
}

double GLDContextRec::beginRenderPass(GLDContextRec *this)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  double result;
  unsigned int v26;
  _QWORD v27[6];

  if (!*((_QWORD *)this + 5))
    GLDContextRec::getCommandBuffer(this);
  v2 = *((_QWORD *)this + 595);
  if ((*(_DWORD *)(v2 + 40) - *(_DWORD *)(v2 + 36)) <= 0x1FF)
  {
    v3 = (void *)*((_QWORD *)this + 5);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = ___ZN13GLDContextRec15beginRenderPassEv_block_invoke;
    v27[3] = &__block_descriptor_48_e28_v16__0___MTLCommandBuffer__8l;
    v27[4] = this;
    v27[5] = v2;
    objc_msgSend(v3, "addCompletedHandler:", v27);
    *((_QWORD *)this + 595) = GLDContextRec::allocQueryStagingBuffer(this);
  }
  v4 = **(_QWORD **)(*((_QWORD *)this + 50) + 40);
  v5 = (_QWORD *)MEMORY[0x24BDDD9C0];
  if (v4 && *(_QWORD *)(v4 + 184))
  {
    v6 = (void *)MEMORY[0x2348CF1D8]();
    v7 = (id)objc_msgSend(*((id *)this + 5), "blitCommandEncoder");
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v7, "setLabel:", *v5);
    GLDTextureRec::blitAccum(v4, v7, *((_QWORD *)this + 8));
    objc_msgSend(v7, "endEncoding");

  }
  v8 = GLDContextRec::buildRenderPassDescriptor(this);
  v9 = (void *)MEMORY[0x2348CF1D8](v8);
  v10 = (void *)*((_QWORD *)this + 5);
  v11 = *((_QWORD *)this + 231);
  if (*((_BYTE *)this + 2232))
  {
    v12 = (id)objc_msgSend(v10, "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", v11, *((_QWORD *)this + 287), *((_QWORD *)this + 288));
    *((_QWORD *)this + 285) = *((_QWORD *)this + 284);
  }
  else
  {
    v12 = (id)objc_msgSend(v10, "renderCommandEncoderWithDescriptor:", v11);
  }
  *((_QWORD *)this + 2) = v12;
  objc_autoreleasePoolPop(v9);
  objc_msgSend(*((id *)this + 2), "setLabel:", *v5);
  ++*((_DWORD *)this + 1257);
  v13 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 427) = sel_setVertexBytes_length_atIndex_;
  *((_QWORD *)this + 428) = objc_msgSend(v13, "methodForSelector:");
  v14 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 429) = sel_setFragmentBytes_length_atIndex_;
  *((_QWORD *)this + 430) = objc_msgSend(v14, "methodForSelector:");
  v15 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 431) = sel_setVertexBuffer_offset_atIndex_;
  *((_QWORD *)this + 432) = objc_msgSend(v15, "methodForSelector:");
  v16 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 433) = sel_setFragmentBuffer_offset_atIndex_;
  *((_QWORD *)this + 434) = objc_msgSend(v16, "methodForSelector:");
  v17 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 435) = sel_setVertexTexture_atIndex_;
  *((_QWORD *)this + 436) = objc_msgSend(v17, "methodForSelector:");
  v18 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 437) = sel_setFragmentTexture_atIndex_;
  *((_QWORD *)this + 438) = objc_msgSend(v18, "methodForSelector:");
  v19 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 439) = sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_;
  *((_QWORD *)this + 440) = objc_msgSend(v19, "methodForSelector:");
  v20 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 441) = sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_;
  *((_QWORD *)this + 442) = objc_msgSend(v20, "methodForSelector:");
  v21 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 443) = sel_setVertexBufferOffset_atIndex_;
  *((_QWORD *)this + 444) = objc_msgSend(v21, "methodForSelector:");
  v22 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 445) = sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_;
  *((_QWORD *)this + 446) = objc_msgSend(v22, "methodForSelector:");
  *((_BYTE *)this + 5086) = objc_opt_respondsToSelector() & 1;
  *((_DWORD *)this + 1263) |= *((_DWORD *)this + 1312) | 0x10;
  GLDContextRec::addRenderPassResources(this);
  v23 = *((_QWORD *)this + 599);
  if (v23)
  {
    v24 = *(_DWORD *)(v23 + 40);
    v26 = 0;
    *(_QWORD *)(v23 + 48) = *((_QWORD *)this + 596);
    *((_BYTE *)this + 5088) = 1;
    GLDQueryStagingBuffer::allocateResultOffset(*((GLDQueryStagingBuffer **)this + 595), &v26, v24);
    objc_msgSend(*((id *)this + 2), "setVisibilityResultMode:offset:", 1, v26);
    *((_QWORD *)this + 53) |= 0x1000uLL;
  }
  objc_msgSend(*((id *)this + 2), "setProvokingVertexMode:", 1);
  *((_DWORD *)this + 618) |= 0x1FFFFu;
  result = NAN;
  *((_QWORD *)this + 330) = -1;
  *((_DWORD *)this + 667) = -1;
  return result;
}

void GLDObject::operator new(GLDObject *this)
{
  void *v2;

  v2 = malloc_type_malloc((size_t)this, 0xAF26814AuLL);
  bzero(v2, (size_t)this);
}

uint64_t gldChoosePixelFormat(_QWORD *a1, unsigned int *a2, const int *a3)
{
  uint64_t v4;
  unsigned int v6;

  v6 = 0;
  v4 = GLRPixelFormat::create((GLRPixelFormat *)&v6, a2, a3);
  if (v4)
    *a1 = v4 + 64;
  return v6;
}

BOOL GLRResource::decrementUsage(GLRResource *this)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)((char *)this + 12);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stxr(v3, v1));
  return v3 == 0;
}

intptr_t GLDContextRec::flushContext(id *this)
{
  id v2;

  if (*((_DWORD *)this + 1151))
    GLDContextRec::beginRenderPass((GLDContextRec *)this);
  if (this[2])
    GLDContextRec::endRenderPass((GLDContextRec *)this);
  v2 = this[4];
  if (v2)
  {
    objc_msgSend(v2, "endEncoding");

    this[4] = 0;
  }
  return GLDContextRec::flushContextInternal((GLDContextRec *)this);
}

uint64_t GLDQueryStagingBuffer::dealloc(GLDQueryStagingBuffer *this)
{
  (*(void (**)(_QWORD))(**((_QWORD **)this + 3) + 24))(*((_QWORD *)this + 3));
  free(*((void **)this + 7));
  GLDObject::release(*((unsigned int **)this + 2));
  return GLDObject::dealloc((uint64_t)this);
}

void GLDSamplerRec::~GLDSamplerRec(GLDSamplerRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDTextureRec::update(GLDTextureRec *this, char a2, unsigned __int16 *a3)
{
  int v5;
  _WORD *v6;
  BOOL v7;
  int v8;
  uint64_t result;
  GLDContextRec *v10;
  int v11;
  int *v12;

  if ((a2 & 2) != 0)
    GLDTextureRec::updatePixelFormat(this);
  v5 = *((_DWORD *)this + 16);
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      GLDTextureRec::update((uint64_t)this);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      GLDTextureRec::update((uint64_t)this);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      GLDTextureRec::update(a2, (a2 & 2) == 0);
    MTLReleaseAssertionFailure();
    goto LABEL_27;
  }
  if ((a2 & 1) != 0)
  {
    GLDTextureRec::updateDescriptor(this);
    v5 = *((_DWORD *)this + 16);
  }
  v6 = (_WORD *)*((_QWORD *)this + 6);
  v7 = v5 == 52 && (unsigned __int16)(v6[96] + 29522) != 65534 && (unsigned __int16)(v6[96] + 29522) != 0xFFFF;
  *((_BYTE *)this + 74) = v7;
  v8 = *v6 & 0x1C00;
  if (v8 == 2048)
  {
    result = GLDTextureRec::loadIOSurfaceTexture(this, a2);
    if (!(_DWORD)result)
      return result;
    goto LABEL_16;
  }
  if (v8 != 4096)
  {
LABEL_27:
    v10 = (GLDContextRec *)MTLReleaseAssertionFailure();
    return gldSetInteger(v10, v11, v12);
  }
  if ((GLDTextureRec::loadPrivateTexture((id *)this, a2, a3) & 1) == 0)
    return 0;
LABEL_16:
  if ((*(_BYTE *)(*((_QWORD *)this + 6) + 24) & 8) != 0)
    GLDTextureRec::updateSamplerState((MTLTextureType *)this, a2);
  return 1;
}

uint64_t gldSetInteger(GLDContextRec *this, int a2, int *aBlock)
{
  uint64_t result;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int *v12;
  int v13;
  unsigned int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  void *v29;

  result = 0;
  if (a2 > 702)
  {
    if (a2 > 1410)
    {
      if (a2 != 1411)
      {
        if (a2 == 1412)
        {
          if (*((_DWORD *)this + 1151))
            GLDContextRec::beginRenderPass(this);
          if (*((_QWORD *)this + 2))
            GLDContextRec::endRenderPass(this);
          result = 0;
          *((_BYTE *)this + 2232) = 1;
        }
        else if (a2 == 1413)
        {
          if (*((_DWORD *)this + 1151))
            GLDContextRec::beginRenderPass(this);
          if (*((_QWORD *)this + 2))
            GLDContextRec::endRenderPass(this);
          result = 0;
          *((_BYTE *)this + 2232) = 0;
        }
        return result;
      }
      v17 = *(void **)(*((_QWORD *)this + 12) + 24);
      v18 = *(void **)aBlock;
      *((_BYTE *)this + 2232) = 0;
      if (v18)
      {
        objc_msgSend(v17, "setShaderDebugInfoCaching:", 1);
        memset(*((void **)aBlock + 2), 255, *((_QWORD *)aBlock + 4));
        memset(*(void **)aBlock, 255, 40 * *((_QWORD *)aBlock + 1));
        *((_QWORD *)this + 280) = *(_QWORD *)aBlock;
        v19 = *((_QWORD *)aBlock + 1);
        *((_QWORD *)this + 281) = v19;
        *((_QWORD *)this + 282) = 0;
        *((_DWORD *)this + 566) = 0;
        *((_QWORD *)this + 285) = *((_QWORD *)this + 284);
        *((_QWORD *)this + 288) = 2 * v19;
        v20 = (void *)operator new[]();
        *((_QWORD *)this + 287) = v20;
        memset(v20, 255, 24 * *((_QWORD *)this + 288));
        if ((objc_msgSend(v17, "mapShaderSampleBufferWithBuffer:capacity:size:", *((_QWORD *)aBlock + 2), *((_QWORD *)aBlock + 3), *((_QWORD *)aBlock + 4)) & 1) == 0)return 10016;
      }
      else
      {
        *((_DWORD *)this + 566) = 0;
        *((_QWORD *)this + 282) = 0;
        *((_OWORD *)this + 140) = 0u;
        v22 = *((_QWORD *)this + 287);
        if (v22)
          MEMORY[0x2348CEF08](v22, 0x1000C80504FFAC1);
        *((_QWORD *)this + 287) = 0;
        *((_QWORD *)this + 288) = 0;
        objc_msgSend(v17, "unmapShaderSampleBuffer");
      }
    }
    else if (a2 == 703)
    {
      v12 = (unsigned int *)(*((_QWORD *)this + 12) + 960);
      v13 = 1 << *aBlock;
      do
        v14 = __ldxr(v12);
      while (__stxr(v14 | v13, v12));
    }
    else
    {
      if (a2 != 707)
      {
        if (a2 == 1402)
        {
          result = 0;
          *(_BYTE *)(*((_QWORD *)this + 11) + 440) = *aBlock != 0;
        }
        return result;
      }
      if (*((_QWORD *)aBlock + 23))
      {
        if (*((_DWORD *)this + 1151))
          GLDContextRec::beginRenderPass(this);
        if (*((_QWORD *)this + 2))
          GLDContextRec::endRenderPass(this);
        if (!*((_QWORD *)this + 5))
          GLDContextRec::getCommandBuffer(this);
        v15 = (void *)MEMORY[0x2348CF1D8](result);
        v16 = (id)objc_msgSend(*((id *)this + 5), "blitCommandEncoder");
        objc_autoreleasePoolPop(v15);
        objc_msgSend(v16, "setLabel:", *MEMORY[0x24BDDD9C0]);
        GLDTextureRec::blitAccum((uint64_t)aBlock, v16, *((_QWORD *)this + 8));
        objc_msgSend(v16, "endEncoding");

      }
    }
    return 0;
  }
  if (a2 <= 665)
  {
    switch(a2)
    {
      case 607:
        v6 = *aBlock;
        if (*aBlock == 2)
        {
          v23 = (void *)*((_QWORD *)this + 2);
          v24 = 2;
        }
        else
        {
          if (v6 != 1)
          {
            if (v6)
              return 0;
            result = 0;
            *(_DWORD *)(*((_QWORD *)this + 12) + 16) = 1;
            return result;
          }
          v23 = (void *)*((_QWORD *)this + 2);
          v24 = 1;
        }
        objc_msgSend(v23, "setCommandDataCorruptModeSPI:", v24);
        return 0;
      case 608:
        GLDContextRec::flushContext((id *)this);
        v9 = *aBlock;
        if (v9 > 4)
          v10 = 1;
        else
          v10 = qword_23106B888[v9];
        objc_msgSend(*((id *)this + 10), "setGPUPriority:", v10);
        return 0;
      case 609:
      case 610:
        return result;
      case 611:
        result = 0;
        *((_QWORD *)this + 655) = aBlock;
        return result;
      case 612:
        if (!*((_QWORD *)this + 655))
          return 10007;
        v28[0] = 0;
        v28[1] = v28;
        v28[2] = 0x3052000000;
        v28[3] = __Block_byref_object_copy__0;
        v28[4] = __Block_byref_object_dispose__0;
        v29 = 0;
        v29 = _Block_copy(aBlock);
        v26[0] = 0;
        v26[1] = v26;
        v26[2] = 0x3052000000;
        v26[3] = __Block_byref_object_copy__8;
        v26[4] = __Block_byref_object_dispose__9;
        v27 = 0;
        v27 = *((id *)this + 655);
        GLDContextRec::flushContext((id *)this);
        v11 = (void *)*((_QWORD *)this + 5);
        if (!v11)
        {
          GLDContextRec::getCommandBuffer(this);
          v11 = (void *)*((_QWORD *)this + 5);
        }
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = ___ZN13GLDContextRec10setIntegerEjPKi_block_invoke;
        v25[3] = &unk_24FFED610;
        v25[4] = v26;
        v25[5] = v28;
        objc_msgSend(v11, "addCompletedHandler:", v25);
        _Block_object_dispose(v26, 8);
        _Block_object_dispose(v28, 8);
        return 0;
      default:
        if (a2 == 318)
        {
          result = 0;
          *((_BYTE *)this + 6277) = *aBlock == 0;
        }
        return result;
    }
  }
  if (a2 == 666)
  {
    v21 = *((_DWORD *)this + 95);
    result = 0;
    if (*aBlock)
      v8 = v21 & 0xFFFFFDFF;
    else
      v8 = v21 | 0x200;
  }
  else
  {
    if (a2 != 667)
      return result;
    v7 = *((_DWORD *)this + 95);
    result = 0;
    if (*aBlock)
      v8 = v7 & 0xFFDFFFFF;
    else
      v8 = v7 | 0x200000;
  }
  *((_DWORD *)this + 95) = v8;
  return result;
}

void sub_231056270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t GLRResourceList::addFence(GLRResourceList *this, GLRResource *a2)
{
  int v4;
  unsigned int v5;
  _QWORD *v6;

  v4 = *((_DWORD *)this + 44);
  if (v4 == *((_DWORD *)this + 45))
  {
    v5 = 2 * v4;
    *((_DWORD *)this + 45) = v5;
    v6 = malloc_type_realloc(*((void **)this + 21), 8 * v5, 0x2004093837F09uLL);
    *((_QWORD *)this + 21) = v6;
    v4 = *((_DWORD *)this + 44);
  }
  else
  {
    v6 = (_QWORD *)*((_QWORD *)this + 21);
  }
  *((_DWORD *)this + 44) = v4 + 1;
  v6[v4] = a2;
  (*(void (**)(GLRResource *))(*(_QWORD *)a2 + 16))(a2);
  return GLRResource::incrementUsage((uint64_t)a2);
}

uint64_t GLDContextRec::addRenderPassResources(GLDContextRec *this)
{
  uint64_t v2;
  GLDTextureRec *v3;
  uint64_t TextureResource;

  v2 = -80;
  do
  {
    v3 = *(GLDTextureRec **)((char *)this + v2 + 4216);
    if (v3)
    {
      TextureResource = GLDTextureRec::getTextureResource(v3, 0);
      if (!TextureResource)
        goto LABEL_5;
LABEL_4:
      GLRResourceList::addResource(*((_QWORD *)this + 8), TextureResource);
      goto LABEL_5;
    }
    TextureResource = *(_QWORD *)((char *)this + v2 + 4296);
    if (TextureResource)
      goto LABEL_4;
LABEL_5:
    v2 += 8;
  }
  while (v2);
  return GLRResourceList::addResource(*((_QWORD *)this + 8), *(_QWORD *)(*((_QWORD *)this + 595) + 24));
}

uint64_t GLRResource::waitIdle(uint64_t this, GLDShareGroupRec *a2)
{
  if (*(_DWORD *)(this + 16))
    return GLDShareGroupRec::waitUsage(a2, (volatile int *)(this + 16));
  return this;
}

intptr_t GLDContextRec::flushContextInternal(GLDContextRec *this)
{
  char *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  intptr_t result;
  _QWORD v14[11];
  char v15;
  _QWORD v16[6];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD block[5];

  v2 = (char *)this + 5087;
  *((_DWORD *)this + 1256) = 0;
  *((_BYTE *)this + 5087) = 0;
  if (*((_QWORD *)this + 5))
  {
    v3 = *((_QWORD *)this + 53);
    v4 = (unint64_t *)(*((_QWORD *)this + 12) + 536);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 | v3, v4));
    *((_QWORD *)this + 53) = 0;
    v6 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN13GLDContextRec20flushContextInternalEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    if (GLDContextRec::flushContextInternal(void)::once != -1)
      dispatch_once(&GLDContextRec::flushContextInternal(void)::once, block);
    *((_DWORD *)this + 1263) |= 0x4000u;
    v7 = *((_QWORD *)this + 657);
    if (v7)
      dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    GLRResourceList::addFence(*((GLRResourceList **)this + 8), *((GLRResource **)this + 9));
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3052000000;
    v20[3] = __Block_byref_object_copy__1;
    v20[4] = __Block_byref_object_dispose__1;
    v20[5] = *((_QWORD *)this + 698);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3052000000;
    v19[3] = __Block_byref_object_copy__1;
    v19[4] = __Block_byref_object_dispose__1;
    v19[5] = *((_QWORD *)this + 743);
    *((_QWORD *)this + 628) = 0;
    GLRDataBufferManager::reset((GLDContextRec *)((char *)this + 5272));
    GLRDataBufferManager::reset((GLDContextRec *)((char *)this + 5632));
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = *((_QWORD *)this + 8);
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = *((_QWORD *)this + 11);
    *((_QWORD *)this + 8) = 0;
    dispatch_group_enter(*((dispatch_group_t *)this + 658));
    v8 = (void *)*((_QWORD *)this + 5);
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = ___ZN13GLDContextRec20flushContextInternalEv_block_invoke_1;
    v16[3] = &unk_24FFED7D8;
    v16[4] = v18;
    v16[5] = this;
    objc_msgSend(v8, "addScheduledHandler:", v16);
    v9 = v2[1];
    if (v9)
    {
      v10 = *((_QWORD *)this + 596);
      *((_QWORD *)this + 596) = v10 + 1;
      *((_QWORD *)this + 597) = v10;
      v2[1] = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = (void *)*((_QWORD *)this + 5);
    v12 = *((_QWORD *)this + 6);
    *((_QWORD *)this + 6) = 0;
    *((_QWORD *)this + 7) = 0;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = ___ZN13GLDContextRec20flushContextInternalEv_block_invoke_2;
    v14[3] = &unk_24FFED800;
    v14[4] = v20;
    v14[5] = v19;
    v14[8] = this;
    v14[9] = v12;
    v15 = v9;
    v14[10] = v10;
    v14[6] = v18;
    v14[7] = v17;
    objc_msgSend(v11, "addCompletedHandler:", v14);
    objc_msgSend(*((id *)this + 5), "commit");

    *((_QWORD *)this + 5) = 0;
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v20, 8);
  }
  result = dispatch_group_wait(*((dispatch_group_t *)this + 658), 0xFFFFFFFFFFFFFFFFLL);
  if (*((_QWORD *)this + 783) == 4 && !*(_DWORD *)(*((_QWORD *)this + 12) + 16) && !v2[1190])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      GLDContextRec::flushContextInternal();
    abort();
  }
  return result;
}

void sub_23105665C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void GLRDataBufferManager::dealloc(id *this)
{
  unint64_t v2;

  if (this[32])
  {
    v2 = 0;
    do
    {

      this[v2++] = 0;
    }
    while (v2 < (unint64_t)this[32]);
  }
  this[32] = 0;
}

uint64_t gldDestroyTexture(uint64_t a1, GLDTextureRec *this)
{
  GLDTextureRec::finishImageQueue(this);
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  if (this)
  {
    *((_QWORD *)this + 6) = 0;
    GLDObject::release((unsigned int *)this);
  }
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  return 0;
}

uint64_t gldDestroyVertexArray(uint64_t a1, GLDObject *this)
{
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  if (this)
    GLDObject::release((unsigned int *)this);
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  return 0;
}

void GLDObject::GLDObject(GLDObject *this)
{
  *(_QWORD *)this = off_24FFEB310;
  *((_DWORD *)this + 2) = 1;
}

uint64_t gldCreateContext(pthread_mutex_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  GLDContextRec *v12;
  uint64_t result;
  void *memptr;

  if (!a3)
    return 10002;
  v11 = a3 - 64;
  if (!GLRPixelFormat::validate((GLRPixelFormat *)(a3 - 64)))
    return 10002;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x40uLL, 0x18C0uLL, 0x10F1040CC762082uLL);
  v12 = (GLDContextRec *)memptr;
  bzero(memptr, 0x18C0uLL);
  GLDContextRec::GLDContextRec(v12);
  if (GLDContextRec::initWithShareGroup((uint64_t)memptr, a1, a5, a6, v11, a4))
  {
    result = 0;
    if (memptr)
      *a2 = memptr;
  }
  else
  {
    GLDObject::release((unsigned int *)memptr);
    return 10016;
  }
  return result;
}

CFMutableArrayRef GLRFunctionCache::init(pthread_rwlock_t *this)
{
  CFMutableArrayRef result;

  pthread_rwlock_init(this, 0);
  this[1].__sig = (uint64_t)CFDictionaryCreateMutable(0, 0, &_cachedFunctionKeyCallbacks, &_cachedFunctionValueCallbacks);
  *(_QWORD *)this[1].__opaque = CFDictionaryCreateMutable(0, 0, &_cachedFunctionKeyCallbacks, &_cachedFunctionValueCallbacks);
  result = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  *(_QWORD *)&this[1].__opaque[8] = result;
  return result;
}

CFMutableDictionaryRef GLRDepthStencilCache::init(GLRDepthStencilCache *this)
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(0, 0, &_depthStencilKeyCallbacks, MEMORY[0x24BDBD6B0]);
  *(_QWORD *)this = result;
  return result;
}

void GLDContextRec::updateDrawBufferState(GLDContextRec *this, int a2)
{
  if ((a2 & 0x400) != 0 && *((unsigned __int8 *)this + 5085) != *(unsigned __int8 *)(*((_QWORD *)this + 13) + 12952))
  {
    if (*((_DWORD *)this + 1151))
      GLDContextRec::beginRenderPass(this);
    if (*((_QWORD *)this + 2))
      GLDContextRec::endRenderPass(this);
    *((_BYTE *)this + 5085) = *(_BYTE *)(*((_QWORD *)this + 13) + 12952) != 0;
  }
  if ((a2 & 0x44000000) != 0)
  {
    GLDContextRec::updateRenderScissor((uint64_t)this);
    *((_DWORD *)this + 453) |= 0x10804202u;
  }
  if ((a2 & 0x40000) != 0)
  {
    GLDContextRec::updateRenderColorMaskMode((uint64_t)this);
    if ((a2 & 0x80000) == 0)
    {
LABEL_12:
      if ((a2 & 0x100000) == 0)
        return;
      goto LABEL_13;
    }
  }
  else if ((a2 & 0x80000) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)this + 453) |= 0x200u;
  if ((a2 & 0x100000) == 0)
    return;
LABEL_13:
  *((_DWORD *)this + 453) |= 0x10000000u;
}

uint64_t gldUpdateDrawFramebuffer(GLDContextRec *this, int a2)
{
  int v4;
  GLDFramebufferRec *v5;
  int v6;
  GLDFramebufferRec *v7;

  if ((a2 & 0x40000000) == 0)
  {
    v4 = a2 & 0x43C0478;
    goto LABEL_9;
  }
  v5 = *(GLDFramebufferRec **)(*((_QWORD *)this + 14) + 416);
  if (!v5)
  {
    *((_DWORD *)this + 450) = 0;
    v7 = 0;
    goto LABEL_7;
  }
  v6 = *((_DWORD *)v5 + 6);
  if (*((_DWORD *)this + 450) != v6)
  {
    *((_DWORD *)this + 450) = v6;
    v7 = v5;
LABEL_7:
    GLDContextRec::bindDrawFramebuffer(this, v7);
  }
  *((_QWORD *)this + 50) = v5;
  v4 = *((_DWORD *)this + 452) | a2 & 0x43C0478;
  *((_DWORD *)this + 452) = 0;
LABEL_9:
  *((_BYTE *)this + 5080) = GLDContextRec::drawableInvert(this);
  if (v4)
    GLDContextRec::updateDrawBufferState(this, v4);
  if (*((_DWORD *)this + 453))
    return 2;
  else
    return 1;
}

uint64_t gldCreateTexture(uint64_t a1, GLDObject **a2, uint64_t a3, uint64_t a4)
{
  GLDObject *v8;
  GLDObject *v9;
  int v10;

  GLDObject::operator new((GLDObject *)0xC8);
  v9 = v8;
  GLDObject::GLDObject(v8);
  *(_QWORD *)v9 = off_24FFEB718;
  GLDLibrary::getAllDisplayMask(v9);
  *((_QWORD *)v9 + 5) = a1;
  *((_QWORD *)v9 + 6) = a3;
  *((_QWORD *)v9 + 7) = a4;
  v10 = *(_DWORD *)(a1 + 24) + 1;
  *(_DWORD *)(a1 + 24) = v10;
  *((_DWORD *)v9 + 3) = v10;
  *a2 = v9;
  return 0;
}

void sub_231056B80(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDPipelineProgramRec::dealloc(id *this)
{

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRResourceList::makeResourcesNotBusyAndReset(GLRResourceList *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int128 v14;
  uint64_t result;

  v2 = *((unsigned int *)this + 35);
  if ((_DWORD)v2)
  {
    v3 = 0;
    for (i = 0; i != v2; ++i)
    {
      v5 = *((_QWORD *)this + 20);
      v6 = v5 + (i << 6);
      v7 = *(unsigned __int16 *)(v6 + 60);
      *(_WORD *)(v6 + 60) = 0;
      if (v7)
      {
        v8 = (uint64_t *)(v5 + v3);
        do
        {
          v9 = *v8++;
          (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
          --v7;
        }
        while (v7);
      }
      v3 += 64;
    }
  }
  v10 = *((unsigned int *)this + 44);
  if ((_DWORD)v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 8 * v10;
    do
    {
      v12 |= GLRResource::decrementBusy(*(GLRResource **)(*((_QWORD *)this + 21) + v11));
      (*(void (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)this + 21) + v11) + 24))(*(_QWORD *)(*((_QWORD *)this + 21) + v11));
      v11 += 8;
    }
    while (v13 != v11);
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  *(_QWORD *)&v14 = -1;
  *((_QWORD *)&v14 + 1) = -1;
  *(_OWORD *)((char *)this + 124) = v14;
  *(_OWORD *)((char *)this + 108) = v14;
  *(_OWORD *)((char *)this + 92) = v14;
  *(_OWORD *)((char *)this + 76) = v14;
  *(_OWORD *)((char *)this + 60) = v14;
  *(_OWORD *)((char *)this + 44) = v14;
  *(_OWORD *)((char *)this + 28) = v14;
  *(_OWORD *)((char *)this + 12) = v14;
  *((_DWORD *)this + 35) = 0;
  *((_DWORD *)this + 44) = 0;
  result = v12 & 1;
  *((_QWORD *)this + 19) = 0;
  return result;
}

void GLDObject::~GLDObject(GLDObject *this)
{
  *(_QWORD *)this = off_24FFEB310;
  *((_DWORD *)this + 2) = -1;
}

{
  *(_QWORD *)this = off_24FFEB310;
  *((_DWORD *)this + 2) = -1;
}

void *GLRFunctionCache::newFunctionWithGLIR(CFArrayRef *this, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const __CFDictionary **v6;
  const __CFDictionary *v7;
  void *v8;
  CFIndex Count;
  unint64_t v10;
  void *value;

  if (a5 == 2)
  {
    v6 = this + 26;
  }
  else
  {
    if (a5 != 1)
    {
      LODWORD(v7) = 0;
      return (void *)(id)GLRFunctionCache::getFunction((GLRFunctionCache *)this, (int)v7);
    }
    v6 = this + 25;
  }
  v7 = *v6;
  if (!*v6)
    return (void *)(id)GLRFunctionCache::getFunction((GLRFunctionCache *)this, (int)v7);
  v8 = (void *)objc_msgSend(a2, "newFunctionWithGLESIR:inputsDescription:functionType:");
  if (!v8)
  {
    LODWORD(v7) = 0;
LABEL_15:

    return (void *)(id)GLRFunctionCache::getFunction((GLRFunctionCache *)this, (int)v7);
  }
  value = 0;
  pthread_rwlock_wrlock((pthread_rwlock_t *)this);
  if (CFDictionaryGetValueIfPresent(v7, v8, (const void **)&value))
  {
    LODWORD(v7) = (_DWORD)value;
LABEL_14:
    pthread_rwlock_unlock((pthread_rwlock_t *)this);
    goto LABEL_15;
  }
  Count = CFArrayGetCount(this[27]);
  if (Count >= 0xFFFFFF)
  {
    LODWORD(v7) = 0;
    goto LABEL_14;
  }
  v10 = (Count + 1);
  CFArrayAppendValue(this[27], v8);
  CFDictionarySetValue(v7, v8, (const void *)v10);
  pthread_rwlock_unlock((pthread_rwlock_t *)this);
  return v8;
}

void ___ZN13GLDContextRec20flushContextInternalEv_block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  GLRResourceList::makeResourcesBusy(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  if (objc_msgSend(a2, "error"))
    *(_BYTE *)(v3 + 6276) = 1;
  else
    dispatch_group_leave(*(dispatch_group_t *)(v3 + 5264));
}

uint64_t gldDestroyPixelFormat(uint64_t a1)
{
  if (a1)
    GLDObject::release((unsigned int *)(a1 - 64));
  return 0;
}

uint64_t GLDContextRec::buildRenderPassDescriptor(GLDContextRec *this)
{
  id v2;
  void *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  unsigned int *v7;
  double *v8;
  void *v9;
  uint64_t TextureResource;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t result;

  v2 = (id)*((_QWORD *)this + 231);
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDDD690]);
    *((_QWORD *)this + 231) = v2;
  }
  v3 = (void *)objc_msgSend(v2, "colorAttachments");
  objc_msgSend(*((id *)this + 231), "setOpenGLModeEnabled:", 1);
  objc_msgSend(*((id *)this + 231), "setPointCoordYFlipEnabled:", 1);
  objc_msgSend(*((id *)this + 231), "setDitherEnabled:", *((unsigned __int8 *)this + 5085));
  v4 = 0;
  *((_DWORD *)this + 1312) = 0;
  *((_DWORD *)this + 1187) = 0;
  v5 = (char *)this + 4136;
  v6 = (char *)this + 4632;
  v7 = (unsigned int *)((char *)this + 4376);
  v8 = (double *)((char *)this + 4632);
  do
  {
    v9 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    if (*(_QWORD *)v5)
    {
      TextureResource = GLDTextureRec::getTextureResource(*(GLDTextureRec **)v5, 0);
      if (!TextureResource)
        goto LABEL_9;
    }
    else
    {
      TextureResource = *((_QWORD *)v5 + 10);
      if (!TextureResource)
      {
LABEL_9:
        objc_msgSend(v9, "setTexture:", 0);
        objc_msgSend(v9, "setResolveTexture:", 0);
        objc_msgSend(v9, "setStoreAction:", 0);
        *(_QWORD *)&v6[8 * v4 - 136] = 0;
        goto LABEL_15;
      }
    }
    objc_msgSend(v9, "setTexture:", *(_QWORD *)(TextureResource + 32));
    objc_msgSend(v9, "setResolveTexture:", 0);
    objc_msgSend(v9, "setLevel:", *(v7 - 10));
    objc_msgSend(v9, "setSlice:", *(v7 - 20));
    objc_msgSend(v9, "setDepthPlane:", *v7);
    objc_msgSend(v9, "setStoreAction:", 4);
    *(_QWORD *)&v6[8 * v4 - 136] = 1;
    *((_DWORD *)this + 1187) |= 1 << v4;
    objc_msgSend(v9, "setYInvert:", v6[v4 - 56]);
    if ((*((_DWORD *)this + 1151) & (1 << v4)) != 0)
    {
      objc_msgSend(v9, "setClearColor:", *(v8 - 3), *(v8 - 2), *(v8 - 1), *v8);
      v11 = v9;
      v12 = 2;
    }
    else
    {
      if (*((_DWORD *)this + 1149) <= 1u)
        v13 = *((_DWORD *)this + 1312);
      else
        v13 = *((_DWORD *)this + 1312) | 0x100;
      *((_DWORD *)this + 1312) = v13 | 0x20;
      v11 = v9;
      v12 = 1;
    }
    objc_msgSend(v11, "setLoadAction:", v12);
LABEL_15:
    ++v4;
    v5 += 8;
    v8 += 4;
    ++v7;
  }
  while (v4 != 4);
  v14 = (void *)objc_msgSend(*((id *)this + 231), "depthAttachment");
  v15 = v14;
  v16 = *((_QWORD *)this + 535);
  if (v16)
  {
    objc_msgSend(v14, "setTexture:", *(_QWORD *)(v16 + 32));
    objc_msgSend(v15, "setLevel:", *((unsigned int *)this + 1092));
    objc_msgSend(v15, "setSlice:", *((unsigned int *)this + 1082));
    objc_msgSend(v15, "setDepthPlane:", *((unsigned int *)this + 1102));
    objc_msgSend(v15, "setStoreAction:", 4);
    *((_QWORD *)this + 570) = 1;
    *((_DWORD *)this + 1187) |= 0x100u;
    if ((*((_BYTE *)this + 4605) & 1) != 0)
    {
      objc_msgSend(v15, "setClearDepth:", *((double *)this + 592));
      v17 = v15;
      v18 = 2;
    }
    else
    {
      v17 = v15;
      v18 = 1;
    }
    objc_msgSend(v17, "setLoadAction:", v18);
  }
  else
  {
    objc_msgSend(v14, "setTexture:", 0);
    objc_msgSend(v15, "setStoreAction:", 0);
    *((_QWORD *)this + 570) = 0;
  }
  v19 = (void *)objc_msgSend(*((id *)this + 231), "stencilAttachment");
  v20 = v19;
  v21 = *((_QWORD *)this + 536);
  if (v21)
  {
    objc_msgSend(v19, "setTexture:", *(_QWORD *)(v21 + 32));
    objc_msgSend(v20, "setLevel:", *((unsigned int *)this + 1093));
    objc_msgSend(v20, "setSlice:", *((unsigned int *)this + 1083));
    objc_msgSend(v20, "setDepthPlane:", *((unsigned int *)this + 1103));
    objc_msgSend(v20, "setStoreAction:", 4);
    *((_QWORD *)this + 571) = 1;
    *((_DWORD *)this + 1187) |= 0x200u;
    if ((*((_BYTE *)this + 4605) & 2) != 0)
    {
      objc_msgSend(v20, "setClearStencil:", *((unsigned int *)this + 1186));
      v22 = v20;
      v23 = 2;
    }
    else
    {
      v22 = v20;
      v23 = 1;
    }
    objc_msgSend(v22, "setLoadAction:", v23);
  }
  else
  {
    objc_msgSend(v19, "setTexture:", 0);
    objc_msgSend(v20, "setStoreAction:", 0);
    *((_QWORD *)this + 571) = 0;
  }
  *((_DWORD *)this + 1150) = *((_DWORD *)this + 1149);
  result = objc_msgSend(*((id *)this + 231), "setVisibilityResultBuffer:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 595) + 24) + 40));
  if (*((_DWORD *)this + 1150) >= 2u)
    *((_QWORD *)this + 53) |= 0x40000uLL;
  *((_DWORD *)this + 1151) = 0;
  *((_DWORD *)this + 620) = 0;
  return result;
}

void gldTerminateLibrary()
{
  *(_DWORD *)g_Library = 0;
  g_Library = 0;
}

void GLRDataBufferManager::releaseDataBuffer(uint64_t a1, void *a2)
{
  uint64_t v3;

  _os_nospin_lock_lock();
  if (*(_QWORD *)(a1 + 256) <= 0x1FuLL && objc_msgSend(a2, "length") == *(_QWORD *)(a1 + 264))
  {
    v3 = *(_QWORD *)(a1 + 256);
    *(_QWORD *)(a1 + 256) = v3 + 1;
    *(_QWORD *)(a1 + 8 * v3) = a2;
    _os_nospin_lock_unlock();
  }
  else
  {
    _os_nospin_lock_unlock();
    if (a2)

  }
}

uint64_t GLRResourceList::makeResourcesBusy(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  GLRResource **v8;
  GLRResource *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = this;
  v2 = *(unsigned int *)(this + 140);
  if ((_DWORD)v2)
  {
    v3 = 0;
    for (i = 0; i != v2; ++i)
    {
      v5 = *(_QWORD *)(v1 + 160);
      v6 = v5 + (i << 6);
      v7 = *(unsigned __int16 *)(v6 + 60);
      if (*(_WORD *)(v6 + 60))
      {
        v8 = (GLRResource **)(v5 + v3);
        do
        {
          v9 = *v8++;
          this = GLRResource::decrementUsage(v9);
          --v7;
        }
        while (v7);
      }
      v3 += 64;
    }
  }
  v10 = *(unsigned int *)(v1 + 176);
  if ((_DWORD)v10)
  {
    v11 = 0;
    v12 = 8 * v10;
    do
    {
      GLRResource::incrementBusy(*(_QWORD *)(*(_QWORD *)(v1 + 168) + v11));
      this = GLRResource::decrementUsage(*(GLRResource **)(*(_QWORD *)(v1 + 168) + v11));
      v11 += 8;
    }
    while (v12 != v11);
  }
  return this;
}

void gldUnbindFramebuffer(GLDContextRec *this, uint64_t a2)
{
  if (*((_QWORD *)this + 50) == a2)
  {
    if (*((_DWORD *)this + 1151))
      GLDContextRec::beginRenderPass(this);
    *((_QWORD *)this + 50) = 0;
  }
}

uint64_t GLDContextRec::updateRenderBlendState(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  unsigned __int16 *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  v1 = this;
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = (unsigned __int16 *)(*(_QWORD *)(this + 104) + 12746);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(this + 104) + 12848);
  v7 = 4416;
  do
  {
    v8 = v1 + v2;
    v9 = v1 + 4 * v3;
    if (*(_QWORD *)(v1 + v7))
      v10 = ((1 << v3) & v6) == 0;
    else
      v10 = 1;
    if (v10 || ((*(_DWORD *)(v1 + 2624) | *(_DWORD *)(v1 + 2620)) & (1 << v3)) != 0)
    {
      if (!*(_BYTE *)(v8 + 2508))
        goto LABEL_10;
      *(_BYTE *)(v8 + 2508) = 0;
      *(_QWORD *)(v8 + 2496) = 65537;
      *(_DWORD *)(v1 + v2 + 2504) = -2147057658;
      v11 = *(_DWORD *)(v9 + 2152) & 0xFF800000 | 0x880;
      goto LABEL_9;
    }
    *(_QWORD *)(v1 + 424) |= 2uLL;
    if (!*(_BYTE *)(v1 + v2 + 2508))
    {
      v4 = 1;
      *(_BYTE *)(v1 + v2 + 2508) = 1;
      *(_DWORD *)(v9 + 2152) |= 1u;
    }
    v12 = *(v5 - 5);
    if (*(unsigned __int16 *)(v8 + 2496) != (_DWORD)v12)
    {
      *(_WORD *)(v8 + 2496) = v12;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFFFFF87F | (getMTLBlendFactor(v12) << 7);
      v4 = 1;
    }
    v13 = v1 + v2;
    v14 = *(v5 - 3);
    if (*(unsigned __int16 *)(v1 + v2 + 2498) != (_DWORD)v14)
    {
      *(_WORD *)(v13 + 2498) = v14;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFFFF87FF | (getMTLBlendFactor(v14) << 11);
      v4 = 1;
    }
    v15 = *(v5 - 4);
    if (*(unsigned __int16 *)(v13 + 2500) != (_DWORD)v15)
    {
      *(_WORD *)(v13 + 2500) = v15;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFFF87FFF | (getMTLBlendFactor(v15) << 15);
      v4 = 1;
    }
    v16 = v1 + v2;
    v17 = *(v5 - 2);
    if (*(unsigned __int16 *)(v1 + v2 + 2502) != (_DWORD)v17)
    {
      *(_WORD *)(v16 + 2502) = v17;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFF87FFFF | (getMTLBlendFactor(v17) << 19);
      v4 = 1;
    }
    v18 = *(v5 - 1);
    if (*(unsigned __int16 *)(v16 + 2504) != v18)
    {
      *(_WORD *)(v16 + 2504) = v18;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFFFFFFF1 | (2 * getMTLBlendOperation(v18));
      v4 = 1;
    }
    this = *v5;
    if (*(unsigned __int16 *)(v1 + v2 + 2506) != (_DWORD)this)
    {
      *(_WORD *)(v1 + v2 + 2506) = this;
      this = getMTLBlendOperation(this);
      v11 = *(_DWORD *)(v9 + 2152) & 0xFFFFFF8F | (16 * this);
LABEL_9:
      *(_DWORD *)(v9 + 2152) = v11;
      v4 = 1;
    }
LABEL_10:
    ++v3;
    v2 += 14;
    v5 += 6;
    v7 += 8;
  }
  while (v2 != 56);
  if ((v4 & 1) != 0)
    *(_DWORD *)(v1 + 2472) |= 8u;
  return this;
}

uint64_t GLRResourceList::releaseAllResources(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  GLRResource **v8;
  GLRResource *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = this;
  v2 = *(unsigned int *)(this + 140);
  if ((_DWORD)v2)
  {
    v3 = 0;
    for (i = 0; i != v2; ++i)
    {
      v5 = *(_QWORD *)(v1 + 160);
      v6 = v5 + (i << 6);
      v7 = *(unsigned __int16 *)(v6 + 60);
      *(_WORD *)(v6 + 60) = 0;
      if (v7)
      {
        v8 = (GLRResource **)(v5 + v3);
        do
        {
          GLRResource::decrementUsage(*v8);
          v9 = *v8++;
          this = (*(uint64_t (**)(GLRResource *))(*(_QWORD *)v9 + 24))(v9);
          --v7;
        }
        while (v7);
      }
      v3 += 64;
    }
  }
  v10 = *(unsigned int *)(v1 + 176);
  if ((_DWORD)v10)
  {
    v11 = 0;
    v12 = 8 * v10;
    do
    {
      GLRResource::decrementUsage(*(GLRResource **)(*(_QWORD *)(v1 + 168) + v11));
      this = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(v1 + 168) + v11) + 24))(*(_QWORD *)(*(_QWORD *)(v1 + 168) + v11));
      v11 += 8;
    }
    while (v12 != v11);
  }
  return this;
}

uint64_t GLDContextRec::dealloc(GLDContextRec *this)
{
  const void *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  unsigned int *v6;
  uint64_t v7;
  uint64_t j;
  uint64_t v9;
  uint64_t k;
  uint64_t v11;
  uint64_t m;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  char *v18;
  void *v19;
  void *v20;

  GLDContextRec::flushContext((id *)this);
  GLDContextRec::waitContext((dispatch_group_t *)this);
  dispatch_release(*((dispatch_object_t *)this + 658));
  GLRDataBufferManager::dealloc((id *)this + 659);
  GLRDataBufferManager::dealloc((id *)this + 704);

  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 627) = 0;

  v2 = (const void *)*((_QWORD *)this + 274);
  if (v2)
    CFRelease(v2);
  GLDObject::release(*((unsigned int **)this + 12));
  glgDestroyProcessor();
  GLDObject::release(*((unsigned int **)this + 594));
  *((_QWORD *)this + 594) = 0;
  GLDObject::release(*((unsigned int **)this + 595));
  *((_QWORD *)this + 595) = 0;
  GLDVertexArrayRec::updateSharedState((GLDContextRec *)((char *)this + 2336), v3);
  GLDVertexArrayRec::updateSharedState((GLDContextRec *)((char *)this + 2064), v4);

  for (i = 517; i != 527; ++i)
  {
    v6 = (unsigned int *)*((_QWORD *)this + i);
    if (v6)
      GLDObject::release(v6);
  }
  do
  {
    v7 = *((_QWORD *)this + i);
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    ++i;
  }
  while (i != 537);
  for (j = 3576; j != 3832; j += 8)
  {
    v9 = *(_QWORD *)((char *)this + j);
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  }
  for (k = 2672; k != 2800; k += 8)
  {
    v11 = *(_QWORD *)((char *)this + k);
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
  }
  for (m = 2872; m != 2968; m += 8)
  {
    v13 = *(_QWORD *)((char *)this + m);
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
  }
  do
  {
    v14 = *(_QWORD *)((char *)this + m);
    if (v14)
      (*(void (**)(uint64_t))(*(_QWORD *)v14 + 24))(v14);
    m += 8;
  }
  while (m != 3064);
  v15 = *((_QWORD *)this + 358);
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 24))(v15);
  (*(void (**)(_QWORD))(**((_QWORD **)this + 9) + 24))(*((_QWORD *)this + 9));
  GLDObject::release(*((unsigned int **)this + 11));
  *((_QWORD *)this + 11) = 0;
  v16 = *((_QWORD *)this + 657);
  if (v16)
  {
    dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*((dispatch_object_t *)this + 657));
  }
  if (*((_QWORD *)this + 781))
  {
    v17 = 0;
    v18 = (char *)this + 5992;
    do
    {
      GLDObject::release(*(unsigned int **)&v18[8 * v17]);
      *(_QWORD *)&v18[8 * v17++] = 0;
    }
    while (v17 < *((_QWORD *)this + 781));
  }
  v19 = (void *)*((_QWORD *)this + 277);
  if (v19)
    free(v19);
  v20 = (void *)*((_QWORD *)this + 278);
  if (v20)
    free(v20);
  return GLDObject::dealloc((uint64_t)this);
}

void GLDTextureRec::finishImageQueue(GLDTextureRec *this)
{
  NSObject *v2;

  v2 = *((_QWORD *)this + 17);
  if (v2)
  {
    dispatch_sync(v2, &__block_literal_global_0);
    dispatch_release(*((dispatch_object_t *)this + 17));
    *((_QWORD *)this + 17) = 0;
  }
}

CFMutableDictionaryRef GLRRenderPipelineCache::init(GLRRenderPipelineCache *this)
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(0, 128, &_renderPipelineKeyCallbacks, MEMORY[0x24BDBD6B0]);
  *(_QWORD *)this = result;
  return result;
}

uint64_t GLDDeviceRec::getDepthStencilStateFromKey(GLDDeviceRec *this, const GLRDepthStencilKey *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t result;
  _QWORD v9[7];
  _QWORD context[3];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  context[0] = (char *)this + 464;
  context[1] = a2;
  context[2] = &v16;
  dispatch_sync_f(*((dispatch_queue_t *)this + 56), context, (dispatch_function_t)_getDepthStencilState);
  v4 = v12[5];
  if (v4)
    goto LABEL_4;
  v5 = GLRDepthStencilKey::copyDescriptor(a2);
  v6 = objc_msgSend(*((id *)this + 3), "newDepthStencilStateWithDescriptor:", v5);
  v12[5] = v6;
  if (v6)
  {
    v7 = *((_QWORD *)this + 56);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN12GLDDeviceRec27getDepthStencilStateFromKeyEPK18GLRDepthStencilKey_block_invoke;
    v9[3] = &unk_24FFEB218;
    v9[5] = this;
    v9[6] = a2;
    v9[4] = &v11;
    dispatch_barrier_sync(v7, v9);

    v4 = v12[5];
LABEL_4:
    _Block_object_dispose(&v11, 8);
    return v4;
  }
  result = MTLReleaseAssertionFailure();
  __break(1u);
  return result;
}

void sub_231057A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _depthStencilKeyRelease(const __CFAllocator *a1, const void *a2)
{
  if (a2)
    JUMPOUT(0x2348CEF20);
}

unint64_t _renderPipelineKeyHash(char *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v1 = 0;
  v2 = 0;
  v3 = 0x61C8864E7A143579;
  v4 = 0x60EA27EEADC0B5D6;
  v5 = 0xC2B2AE3D27D4EB4FLL;
  do
  {
    v6 = __ROR8__(v4 - 0x3D4D51C2D82B14B1 * *(_QWORD *)&a1[v1], 33);
    v4 = 0x9E3779B185EBCA87 * v6;
    v7 = __ROR8__(v5 - 0x3D4D51C2D82B14B1 * *(_QWORD *)&a1[v1 + 8], 33);
    v5 = 0x9E3779B185EBCA87 * v7;
    v8 = __ROR8__(v2 - 0x3D4D51C2D82B14B1 * *(_QWORD *)&a1[v1 + 16], 33);
    v2 = 0x9E3779B185EBCA87 * v8;
    v9 = __ROR8__(v3 - 0x3D4D51C2D82B14B1 * *(_QWORD *)&a1[v1 + 24], 33);
    v3 = 0x9E3779B185EBCA87 * v9;
    v1 += 32;
  }
  while (v1 != 128);
  v10 = (0x9E3779B185EBCA87
       * ((0x9E3779B185EBCA87
         * ((0x9E3779B185EBCA87
           * ((((0x3C6EF3630BD7950ELL * v6) | (v4 >> 63))
             + 0x1BBCD8C2F5E54380 * v7
             + (v5 >> 57)
             + 0x779B185EBCA87000 * v8
             + (v2 >> 52)
             - 0x1939E850D5E40000 * v9
             + (v3 >> 46)) ^ (0x9E3779B185EBCA87 * ((0x87BCB65480000000 * v6) | ((0xDEF35B010F796CA9 * v6) >> 33))))
           - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                    * ((0x87BCB65480000000 * v7) | ((0xDEF35B010F796CA9 * v7) >> 33))))
         - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                  * ((0x87BCB65480000000 * v8) | ((0xDEF35B010F796CA9 * v8) >> 33))))
       - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                * ((0x87BCB65480000000 * v9) | ((0xDEF35B010F796CA9 * v9) >> 33)));
  v11 = 0xC2B2AE3D27D4EB4FLL
      * ((0x9E3779B185EBCA87 * v10 - 0x7A1435883D4D511DLL) ^ ((0x9E3779B185EBCA87 * v10 - 0x7A1435883D4D511DLL) >> 33));
  return (0x165667B19E3779F9 * (v11 ^ (v11 >> 29))) ^ ((0x165667B19E3779F9 * (v11 ^ (v11 >> 29))) >> 32);
}

uint64_t GLDObject::retain(uint64_t this)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(this + 8);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return this;
}

double gldPopulateContextDispatch(uint64_t a1, uint64_t a2)
{
  double result;

  *(_OWORD *)(a2 + 160) = xmmword_24FFED748;
  *(_OWORD *)(a2 + 176) = *(_OWORD *)&off_24FFED758;
  *(_QWORD *)(a2 + 192) = gldRenderVertexArray;
  *(_OWORD *)(a2 + 96) = xmmword_24FFED708;
  *(_OWORD *)(a2 + 112) = *(_OWORD *)&off_24FFED718;
  *(_OWORD *)(a2 + 128) = xmmword_24FFED728;
  *(_OWORD *)(a2 + 144) = *(_OWORD *)&off_24FFED738;
  *(_OWORD *)(a2 + 32) = xmmword_24FFED6C8;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)&off_24FFED6D8;
  *(_OWORD *)(a2 + 64) = xmmword_24FFED6E8;
  *(_OWORD *)(a2 + 80) = *(_OWORD *)&off_24FFED6F8;
  result = COERCE_DOUBLE(gldCopyPixels);
  *(_OWORD *)a2 = s_renderDispatchTable;
  *(_OWORD *)(a2 + 16) = *(_OWORD *)&off_24FFED6B8;
  return result;
}

id GLRDepthStencilKey::copyDescriptor(GLRDepthStencilKey *this)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDDD590]);
  v3 = (void *)objc_msgSend(v2, "frontFaceStencil");
  v4 = (void *)objc_msgSend(v2, "backFaceStencil");
  objc_msgSend(v3, "setReadMask:", *(unsigned __int8 *)this);
  objc_msgSend(v3, "setWriteMask:", *((unsigned __int8 *)this + 1));
  objc_msgSend(v3, "setStencilCompareFunction:", *((_DWORD *)this + 1) & 7);
  objc_msgSend(v3, "setStencilFailureOperation:", (*(_QWORD *)this >> 35) & 7);
  objc_msgSend(v3, "setDepthFailureOperation:", (*(_QWORD *)this >> 38) & 7);
  objc_msgSend(v3, "setDepthStencilPassOperation:", (*(_QWORD *)this >> 41) & 7);
  objc_msgSend(v4, "setReadMask:", *((unsigned __int8 *)this + 2));
  objc_msgSend(v4, "setWriteMask:", *((unsigned __int8 *)this + 3));
  objc_msgSend(v4, "setStencilCompareFunction:", (*(_QWORD *)this >> 44) & 7);
  objc_msgSend(v4, "setStencilFailureOperation:", (*(_QWORD *)this >> 47) & 7);
  objc_msgSend(v4, "setDepthFailureOperation:", (*(_QWORD *)this >> 50) & 7);
  objc_msgSend(v4, "setDepthStencilPassOperation:", (*(_QWORD *)this >> 53) & 7);
  objc_msgSend(v2, "setDepthWriteEnabled:", (*(_QWORD *)this >> 59) & 1);
  objc_msgSend(v2, "setDepthCompareFunction:", *((_BYTE *)this + 7) & 7);
  objc_msgSend(v2, "setLabel:", *MEMORY[0x24BDDD9C0]);
  return v2;
}

double GLDContextRec::setRenderPipeline(GLDContextRec *this)
{
  _QWORD *Value;
  _QWORD *RenderPipelineStateFromKey;
  double result;
  uint64_t v5;

  GLDContextRec::buildPipelineStateDescriptor(this);
  Value = CFDictionaryGetValue(*((CFDictionaryRef *)this + 274), (char *)this + 2064);
  if (!Value)
  {
    RenderPipelineStateFromKey = (_QWORD *)GLDDeviceRec::getRenderPipelineStateFromKey(*((GLDDeviceRec **)this + 12), (GLDContextRec *)((char *)this + 2064));
    if (!RenderPipelineStateFromKey)
    {
      result = 0.0;
      *(_OWORD *)((char *)this + 2200) = 0u;
      return result;
    }
    Value = RenderPipelineStateFromKey;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 274), (char *)this + 2064, RenderPipelineStateFromKey);
  }
  *((_QWORD *)this + 275) = Value[1];
  *((_QWORD *)this + 276) = Value[2];
  objc_msgSend(*((id *)this + 2), "setRenderPipelineState:");
  v5 = *((_QWORD *)this + 276);
  if ((v5 & 0x40) == 0)
  {
    if ((v5 & 8) == 0)
      goto LABEL_6;
LABEL_9:
    *((_QWORD *)this + 53) |= 0x800000uLL;
    if ((v5 & 0x10) == 0)
      return result;
    goto LABEL_10;
  }
  *((_DWORD *)this + 1263) |= 0x20000u;
  if ((v5 & 8) != 0)
    goto LABEL_9;
LABEL_6:
  if ((v5 & 0x10) != 0)
LABEL_10:
    *((_QWORD *)this + 53) |= 0x1000000uLL;
  return result;
}

void _renderPipelineKeyRelease(const __CFAllocator *a1, void *a2)
{
  free(a2);
}

void GLRBufferResource::GLRBufferResource(GLRBufferResource *this)
{
  _QWORD *v1;

  GLDObject::GLDObject(this);
  *v1 = off_24FFEB490;
}

void gldClearFramebufferData(GLDContextRec *this, unsigned int a2, uint32x4_t *a3, double a4, double a5, double a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  double *i;
  int v16;
  double v17;
  double v18;
  double v19;
  GLRQueryResultBuffer *v20;

  if (*((_QWORD *)this + 2) && *((_DWORD *)this + 620))
    GLDContextRec::endRenderPass(this);
  if (!*((_BYTE *)this + 5083))
  {
    v9 = *((_QWORD *)this + 50);
    v10 = **(_QWORD **)(v9 + 40);
    if ((!v10 || !*(_QWORD *)(v10 + 184)) && !*((_QWORD *)this + 2))
    {
      v11 = *((_QWORD *)this + 13);
      if (!*(_BYTE *)(v11 + 13284)
        || !*(_DWORD *)(v11 + 13268)
        && !*(_DWORD *)(v11 + 13272)
        && (v12 = *(_QWORD *)(v9 + 32), *(_DWORD *)(v11 + 13276) == *(unsigned __int16 *)(v12 + 178))
        && *(_DWORD *)(v11 + 13280) == *(unsigned __int16 *)(v12 + 180))
      {
        if (!*((_QWORD *)this + 5))
          GLDContextRec::getCommandBuffer(this);
        GLDContextRec::addRenderPassResources(this);
        if ((a2 & 0x100) != 0)
        {
          *((_DWORD *)this + 1151) |= 0x100u;
          *((_DWORD *)this + 1258) |= 0x100u;
          if (a3[1].i32[2])
          {
            LODWORD(a4) = a3[1].i32[0];
            a4 = (double)*(unint64_t *)&a4;
          }
          else
          {
            a4 = *(float *)a3[1].i32;
          }
          *((double *)this + 592) = a4;
          a2 &= ~0x100u;
        }
        if ((a2 & 0x200) == 0)
          goto LABEL_24;
        if (*(unsigned __int8 *)(*((_QWORD *)this + 13) + 13052) == 0xFF)
        {
          *((_DWORD *)this + 1151) |= 0x200u;
          *((_DWORD *)this + 1258) |= 0x200u;
          *((_DWORD *)this + 1186) = a3[1].i32[1];
          a2 &= ~0x200u;
LABEL_24:
          if (!(_BYTE)a2)
            return;
          v13 = 0;
          v14 = (_BYTE *)(*((_QWORD *)this + 13) + 13064);
          for (i = (double *)((char *)this + 4632); ; i += 4)
          {
            v16 = 1 << v13;
            if (((1 << v13) & a2) != 0)
              break;
LABEL_37:
            if (++v13 == 4)
              return;
          }
          if ((v16 & (v14[1] & *v14 & v14[2] & v14[3])) == 0)
            goto LABEL_39;
          *((_DWORD *)this + 1151) |= v16;
          *((_DWORD *)this + 1258) |= v16;
          if ((*((_DWORD *)this + 654) & v16) != 0 || (*((_DWORD *)this + 656) & v16) != 0)
          {
            if (a3[1].i32[2])
            {
              LODWORD(a4) = a3->i32[0];
              v17 = (double)*(unint64_t *)&a4;
              *(i - 3) = v17;
              LODWORD(v17) = a3->i32[1];
              v18 = (double)*(unint64_t *)&v17;
              *(i - 2) = v18;
              LODWORD(v18) = a3->i32[2];
              v19 = (double)*(unint64_t *)&v18;
              *(i - 1) = v19;
              LODWORD(v19) = a3->i32[3];
              a4 = (double)*(unint64_t *)&v19;
LABEL_36:
              *i = a4;
              a2 &= ~v16;
              goto LABEL_37;
            }
          }
          else
          {
            if ((*((_DWORD *)this + 655) & v16) == 0)
            {
              v20 = (GLRQueryResultBuffer *)MTLReleaseAssertionFailure();
              GLRQueryResultBuffer::GLRQueryResultBuffer(v20);
              return;
            }
            if (a3[1].i32[2])
            {
              *(i - 3) = (double)a3->i32[0];
              *(i - 2) = (double)a3->i32[1];
              *(i - 1) = (double)a3->i32[2];
              a4 = (double)a3->i32[3];
              goto LABEL_36;
            }
          }
          *(i - 3) = *(float *)a3->i32;
          *(i - 2) = *(float *)&a3->i32[1];
          *(i - 1) = *(float *)&a3->i32[2];
          a4 = *(float *)&a3->i32[3];
          goto LABEL_36;
        }
      }
    }
LABEL_39:
    GLDContextRec::clearBuffers((int8x8_t *)this, a2, a3, a4, a5, a6);
  }
}

void GLRQueryResultBuffer::GLRQueryResultBuffer(GLRQueryResultBuffer *this)
{
  _QWORD *v1;

  GLDObject::GLDObject(this);
  *v1 = off_24FFEAF00;
}

void GLRQueryResultBuffer::~GLRQueryResultBuffer(GLRQueryResultBuffer *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLRQueryResultBuffer::initWithShareGroup(uint64_t a1, GLDObject *this)
{
  void *v3;
  void *v4;

  *(_QWORD *)(a1 + 16) = this;
  GLDObject::retain((uint64_t)this);
  *(_DWORD *)(a1 + 52) = 2048;
  *(_DWORD *)(a1 + 24) = 0;
  v3 = malloc_type_malloc(0x100uLL, 0x7B340462uLL);
  *(_QWORD *)(a1 + 32) = v3;
  bzero(v3, (unint64_t)*(unsigned int *)(a1 + 52) >> 3);
  v4 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 52), 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 40) = v4;
  bzero(v4, 8 * *(unsigned int *)(a1 + 52));
  return 1;
}

uint64_t GLRQueryResultBuffer::dealloc(GLRQueryResultBuffer *this)
{
  free(*((void **)this + 4));
  free(*((void **)this + 5));
  GLDObject::release(*((unsigned int **)this + 2));
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRQueryResultBuffer::allocateQueryIndex(GLRQueryResultBuffer *this, unsigned int *a2)
{
  unsigned int v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;

  _os_nospin_lock_lock();
  v5 = *((unsigned int *)this + 12);
  v4 = *((_DWORD *)this + 13);
  if ((_DWORD)v5 == v4)
  {
    *((_DWORD *)this + 13) = 2 * v5;
    v6 = (char *)malloc_type_realloc(*((void **)this + 4), (v5 >> 2) & 0x1FFFFFFF, 0xFB525CB7uLL);
    *((_QWORD *)this + 4) = v6;
    bzero(&v6[(v5 >> 3) & 0x1FFFFFFC], (*((unsigned int *)this + 13) - v5) >> 3);
    v4 = *((_DWORD *)this + 13);
  }
  if (v4 > 0x1F)
  {
    v9 = 0;
    v7 = v4 >> 5;
    v8 = *((_QWORD *)this + 4);
    while (*(_DWORD *)(v8 + 4 * v9) == -1)
    {
      if (v7 == ++v9)
        goto LABEL_10;
    }
    LODWORD(v7) = v9;
  }
  else
  {
    LODWORD(v7) = 0;
    v8 = *((_QWORD *)this + 4);
  }
LABEL_10:
  v10 = *(_DWORD *)(v8 + 4 * v7);
  v11 = __clz(__rbit32(~v10));
  *(_DWORD *)(v8 + 4 * v7) = (1 << v11) | v10;
  *a2 = v11 + 32 * v7;
  return _os_nospin_lock_unlock();
}

uint64_t GLRQueryResultBuffer::processResults(GLRQueryResultBuffer *this, uint64_t *a2, unsigned int *a3, int a4, unsigned int a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  _os_nospin_lock_lock();
  if (a5)
  {
    v10 = *((_QWORD *)this + 5);
    v11 = a5;
    do
    {
      v12 = a3[a4];
      *(_QWORD *)(v10 + 8 * v12) += a2[a4++];
      --v11;
    }
    while (v11);
  }
  return _os_nospin_lock_unlock();
}

void GLDQueryStagingBuffer::~GLDQueryStagingBuffer(GLDQueryStagingBuffer *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDQueryStagingBuffer::initWithShareGroup(GLDQueryStagingBuffer *this, GLDShareGroupRec *a2)
{
  void *v3;
  GLRBufferResource *v4;
  GLDLibrary *v5;

  *((_QWORD *)this + 2) = a2;
  GLDObject::retain((uint64_t)a2);
  v3 = (void *)objc_msgSend(*(id *)(*((_QWORD *)this + 2) + 232), "newBufferWithLength:options:", 0x4000, 0);
  objc_msgSend(v3, "setLabel:", *MEMORY[0x24BDDD9C0]);
  *((_QWORD *)this + 6) = objc_msgSend(v3, "contents");
  *((_DWORD *)this + 10) = 2048;
  GLDObject::operator new((GLDObject *)0x30);
  v5 = v4;
  GLRBufferResource::GLRBufferResource(v4);
  *((_QWORD *)this + 3) = v5;
  GLRBufferResource::initWithMetalBuffer(v5, v3, 0x4000);

  *((_QWORD *)this + 7) = malloc_type_malloc(0x2000uLL, 0x100004052888210uLL);
  return 1;
}

void sub_2310584C4(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL GLDQueryStagingBuffer::allocateResultOffset(GLDQueryStagingBuffer *this, unsigned int *a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *((_DWORD *)this + 9);
  v4 = *((_DWORD *)this + 10);
  if (v3 != v4)
  {
    *a2 = 8 * v3;
    v5 = *((unsigned int *)this + 9);
    v6 = *((_QWORD *)this + 7);
    *(_QWORD *)(*((_QWORD *)this + 6) + 8 * v5) = 0;
    *(_DWORD *)(v6 + 4 * v5) = a3;
    ++*((_DWORD *)this + 9);
  }
  return v3 != v4;
}

_DWORD *GLDQueryStagingBuffer::deferProcessResults(_DWORD *this, GLDContextRec *a2, GLRQueryResultBuffer *a3, uint64_t a4)
{
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  _DWORD *v8;
  _QWORD v9[7];
  unsigned int v10;
  unsigned int v11;

  v4 = this[8];
  v5 = this[9];
  v6 = v5 >= v4;
  v7 = v5 - v4;
  if (v7 != 0 && v6)
  {
    v8 = this;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN21GLDQueryStagingBuffer19deferProcessResultsEP13GLDContextRecP20GLRQueryResultBuffery_block_invoke;
    v9[3] = &__block_descriptor_64_e28_v16__0___MTLCommandBuffer__8l;
    v9[4] = this;
    v9[5] = a3;
    v10 = v4;
    v11 = v7;
    v9[6] = a4;
    this = GLDContextRec::addCompletionBlock((uint64_t)a2, v9);
    v8[8] = v8[9];
  }
  return this;
}

uint64_t ___ZN21GLDQueryStagingBuffer19deferProcessResultsEP13GLDContextRecP20GLRQueryResultBuffery_block_invoke(uint64_t a1)
{
  return GLRQueryResultBuffer::processResults(*(GLRQueryResultBuffer **)(a1 + 40), *(uint64_t **)(*(_QWORD *)(a1 + 32) + 48), *(unsigned int **)(*(_QWORD *)(a1 + 32) + 56), *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60));
}

void GLDQueryRec::~GLDQueryRec(GLDQueryRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDQueryRec::dealloc(GLDQueryRec *this)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *((_QWORD *)this + 3);
  v3 = *((unsigned int *)this + 10);
  _os_nospin_lock_lock();
  *(_DWORD *)(*(_QWORD *)(v2 + 32) + ((v3 >> 3) & 0x1FFFFFFC)) &= ~(1 << v3);
  _os_nospin_lock_unlock();
  GLDObject::release(*((unsigned int **)this + 3));
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDQueryRec::setCounter(GLDQueryRec *this, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)this + 3);
  v4 = *((unsigned int *)this + 10);
  _os_nospin_lock_lock();
  *(_QWORD *)(*(_QWORD *)(v3 + 40) + 8 * v4) = a2;
  return _os_nospin_lock_unlock();
}

uint64_t GLDQueryRec::getCounter(GLDQueryRec *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  GLDContextRec::waitQueryStamp(*((_QWORD *)this + 2), *((_QWORD *)this + 6));
  v2 = *((_QWORD *)this + 3);
  v3 = *((unsigned int *)this + 10);
  _os_nospin_lock_lock();
  v4 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8 * v3);
  _os_nospin_lock_unlock();
  return v4;
}

intptr_t GLDContextRec::waitQueryStamp(intptr_t this, unint64_t a2)
{
  intptr_t v3;

  v3 = this;
  if (*(_QWORD *)(this + 4776) < a2)
    this = GLDContextRec::flushContext((id *)this);
  if (*(_QWORD *)(v3 + 4784) < a2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 4888));
    while (*(_QWORD *)(v3 + 4784) < a2)
      pthread_cond_wait((pthread_cond_t *)(v3 + 4952), (pthread_mutex_t *)(v3 + 4888));
    return pthread_mutex_unlock((pthread_mutex_t *)(v3 + 4888));
  }
  return this;
}

uint64_t GLDQueryRec::getQueryInfo(GLDQueryRec *this, unsigned int a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  GLDContextRec::waitQueryStamp(*((_QWORD *)this + 2), *((_QWORD *)this + 6));
  v5 = *((_QWORD *)this + 3);
  v6 = *((unsigned int *)this + 10);
  _os_nospin_lock_lock();
  v7 = *(_QWORD *)(*(_QWORD *)(v5 + 40) + 8 * v6);
  _os_nospin_lock_unlock();
  *a3 = v7;
  return 0;
}

uint64_t GLDContextRec::signalQueryStamp(GLDContextRec *this, uint64_t a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)((char *)this + 4888);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 4888));
  *((_QWORD *)this + 598) = a2;
  pthread_cond_broadcast((pthread_cond_t *)((char *)this + 4952));
  return pthread_mutex_unlock(v4);
}

unsigned int *GLDContextRec::releaseQueryStagingBuffer(GLDContextRec *this, GLDQueryStagingBuffer *a2)
{
  unint64_t v4;
  unsigned int *result;

  _os_nospin_lock_lock();
  v4 = *((_QWORD *)this + 781);
  if (v4 > 0x1F)
  {
    result = (unsigned int *)_os_nospin_lock_unlock();
    if (a2)
      return GLDObject::release((unsigned int *)a2);
  }
  else
  {
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)this + 781) = v4 + 1;
    *((_QWORD *)this + v4 + 749) = a2;
    return (unsigned int *)_os_nospin_lock_unlock();
  }
  return result;
}

GLDQueryStagingBuffer *GLDContextRec::allocQueryStagingBuffer(GLDContextRec *this)
{
  uint64_t v2;
  uint64_t v3;
  GLDQueryStagingBuffer *v4;
  GLDObject *v5;

  _os_nospin_lock_lock();
  v2 = *((_QWORD *)this + 781);
  if (!v2)
  {
    _os_nospin_lock_unlock();
LABEL_5:
    GLDObject::operator new((GLDObject *)0x40);
    v4 = v5;
    GLDObject::GLDObject(v5);
    *(_QWORD *)v4 = off_24FFEAF38;
    GLDQueryStagingBuffer::initWithShareGroup(v4, *((GLDShareGroupRec **)this + 11));
    return v4;
  }
  v3 = v2 - 1;
  *((_QWORD *)this + 781) = v3;
  v4 = (GLDQueryStagingBuffer *)*((_QWORD *)this + v3 + 749);
  _os_nospin_lock_unlock();
  if (!v4)
    goto LABEL_5;
  return v4;
}

void sub_231058930(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDContextRec::endQuery(uint64_t this, GLDQueryRec *a2, int a3)
{
  GLDContextRec *v3;
  GLDQueryRec *v4;
  int v5;

  if (a3 == 6)
  {
    *(_QWORD *)(this + 3368) = 0;
  }
  else if (a3)
  {
    v3 = (GLDContextRec *)MTLReleaseAssertionFailure();
    return GLDContextRec::beginQuery(v3, v4, v5);
  }
  else
  {
    *((_DWORD *)a2 + 8) = 0;
    return objc_msgSend(*(id *)(this + 16), "setVisibilityResultMode:offset:", 0, 0);
  }
  return this;
}

void *GLDContextRec::beginQuery(GLDContextRec *this, GLDQueryRec *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  int v9;
  uint64_t v10;
  GLDContextRec *v11;

  if (a3 == 6)
  {
    *((_DWORD *)a2 + 8) = 6;
    return (void *)GLDTransformFeedbackMachine::beginQuery((GLDContextRec *)((char *)this + 3352), a2);
  }
  else if (a3)
  {
    v11 = (GLDContextRec *)MTLReleaseAssertionFailure();
    return (void *)GLDContextRec::loadCurrentQueries(v11);
  }
  else
  {
    *((_DWORD *)a2 + 8) = 0;
    v5 = *((_QWORD *)this + 595);
    v6 = *(unsigned int *)(v5 + 36);
    if ((_DWORD)v6 == *(_DWORD *)(v5 + 40))
    {
      if (*((_DWORD *)this + 1151))
        GLDContextRec::beginRenderPass(this);
      if (*((_QWORD *)this + 2))
        GLDContextRec::endRenderPass(this);
      v7 = 0;
    }
    else
    {
      v9 = *((_DWORD *)a2 + 10);
      v10 = *(_QWORD *)(v5 + 56);
      *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v6) = 0;
      v7 = (8 * v6);
      *(_DWORD *)(v10 + 4 * v6) = v9;
      ++*(_DWORD *)(v5 + 36);
    }
    result = (void *)*((_QWORD *)this + 2);
    if (result)
    {
      *((_QWORD *)a2 + 6) = *((_QWORD *)this + 596);
      *((_BYTE *)this + 5088) = 1;
      result = (void *)objc_msgSend(result, "setVisibilityResultMode:offset:", 1, v7);
      *((_QWORD *)this + 53) |= 0x1000uLL;
    }
  }
  return result;
}

GLDContextRec *GLDContextRec::loadCurrentQueries(GLDContextRec *this)
{
  GLDContextRec *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int *v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = this;
  v2 = 0;
  v3 = (_QWORD *)((char *)this + 4792);
  do
  {
    v4 = *((_QWORD *)v1 + 14) + 8 * v2;
    v5 = *(int **)(v4 + 432);
    v6 = (int *)v3[v2];
    if (v5 != v6)
    {
      if (v5)
      {
        v7 = v5[9];
        if ((_DWORD)v7 != 12)
        {
          this = (GLDContextRec *)GLDContextRec::endQuery((uint64_t)v1, *(GLDQueryRec **)(v4 + 432), v5[9]);
          v5[9] = 12;
          *((_QWORD *)v1 + v7 + 599) = 0;
          v6 = (int *)v3[v2];
        }
      }
      if (v6)
      {
        v8 = v6[9];
        this = (GLDContextRec *)GLDContextRec::endQuery((uint64_t)v1, (GLDQueryRec *)v6, v6[9]);
        v6[9] = 12;
        *((_QWORD *)v1 + v8 + 599) = 0;
      }
      if (v5)
      {
        this = (GLDContextRec *)GLDContextRec::beginQuery(v1, (GLDQueryRec *)v5, v2);
        v5[9] = v2;
        v3[v2] = v5;
      }
    }
    ++v2;
  }
  while (v2 != 11);
  return this;
}

uint64_t gldCreateQuery(uint64_t a1, GLDObject **a2)
{
  GLDObject *v4;
  GLDObject *v5;
  uint64_t v6;

  GLDObject::operator new((GLDObject *)0x38);
  v5 = v4;
  GLDObject::GLDObject(v4);
  *(_QWORD *)v5 = off_24FFEAF90;
  *((_QWORD *)v5 + 2) = a1;
  GLRQueryResultBuffer::allocateQueryIndex(*(GLRQueryResultBuffer **)(a1 + 4752), (unsigned int *)v5 + 10);
  v6 = *(_QWORD *)(a1 + 4752);
  *((_QWORD *)v5 + 3) = v6;
  GLDObject::retain(v6);
  *((_QWORD *)v5 + 4) = 0xCFFFFFFFFLL;
  *a2 = v5;
  return 0;
}

void sub_231058BE0(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldDestroyQuery(uint64_t a1, GLDQueryRec *a2)
{
  uint64_t v3;

  v3 = *((int *)a2 + 9);
  if ((_DWORD)v3 != 12)
  {
    GLDContextRec::endQuery(a1, a2, *((_DWORD *)a2 + 9));
    *((_DWORD *)a2 + 9) = 12;
    *(_QWORD *)(a1 + 8 * v3 + 4792) = 0;
  }
  GLDObject::release((unsigned int *)a2);
  return 0;
}

uint64_t gldGetQueryInfo(uint64_t a1, GLDQueryRec *this, int a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t result;

  if (!a3)
    return 0;
  if (*((_DWORD *)this + 8) == -1)
  {
    if (a3 == 34918)
    {
      result = 0;
      *a4 = 0;
    }
    else if (a3 == 34919)
    {
      result = 0;
      *a4 = 1;
    }
    else
    {
      return 10010;
    }
  }
  else
  {
    v6 = *((int *)this + 9);
    if ((int)v6 <= 9)
    {
      GLDContextRec::endQuery(a1, this, *((_DWORD *)this + 9));
      *((_DWORD *)this + 9) = 12;
      *(_QWORD *)(a1 + 8 * v6 + 4792) = 0;
    }
    GLDQueryRec::getQueryInfo(this, this, a4);
    return 0;
  }
  return result;
}

uint64_t gldModifyQuery(uint64_t a1, GLDQueryRec *a2, int a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = *((int *)a2 + 9);
  if ((_DWORD)v7 != 12)
  {
    GLDContextRec::endQuery(a1, a2, *((_DWORD *)a2 + 9));
    *((_DWORD *)a2 + 9) = 12;
    *(_QWORD *)(a1 + 8 * v7 + 4792) = 0;
  }
  if (a3)
    return 10010;
  v10 = *a4;
  v11 = *((_QWORD *)a2 + 3);
  v12 = *((unsigned int *)a2 + 10);
  _os_nospin_lock_lock();
  *(_QWORD *)(*(_QWORD *)(v11 + 40) + 8 * v12) = v10;
  _os_nospin_lock_unlock();
  return 0;
}

void GLDMemoryPluginRec::~GLDMemoryPluginRec(GLDMemoryPluginRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDMemoryPluginRec::dealloc(GLDMemoryPluginRec *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 3);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  return GLDObject::dealloc((uint64_t)this);
}

void GLDBufferRec::~GLDBufferRec(GLDBufferRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDBufferRec::dealloc(GLDBufferRec *this)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *((_QWORD *)this + 5);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  v3 = *((_QWORD *)this + 6);
  if (v3)
  {
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*((dispatch_object_t *)this + 6));
  }
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDBufferRec::update(GLDBufferRec *this, char a2)
{
  void *v3;
  GLDObject *v4;
  GLDLibrary *v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  GLRBufferResource *v9;
  GLDLibrary *v10;
  uint64_t v11;
  uint64_t v12;

  if (!**((_QWORD **)this + 3))
    return 0;
  if ((a2 & 1) == 0)
    return 1;
  v3 = *(void **)(*((_QWORD *)this + 2) + 232);
  if (!*((_QWORD *)this + 5))
  {
    GLDObject::operator new((GLDObject *)0x20);
    v5 = v4;
    GLDObject::GLDObject(v4);
    *(_QWORD *)v5 = off_24FFEB010;
    *((_QWORD *)this + 5) = v5;
    v6 = *((_QWORD *)this + 2);
    GLDLibrary::getAllDisplayMask(v5);
    *((_QWORD *)v5 + 2) = v6;
  }
  result = objc_msgSend(v3, "newBufferWithBytesNoCopy:length:options:deallocator:");
  if (result)
  {
    v8 = (void *)result;
    objc_msgSend((id)result, "setLabel:", *MEMORY[0x24BDDD9C0]);
    GLDObject::operator new((GLDObject *)0x30);
    v10 = v9;
    GLRBufferResource::GLRBufferResource(v9);
    GLRBufferResource::initWithMetalBuffer(v10, v8, *(_QWORD *)(*((_QWORD *)this + 3) + 8));

    v11 = *((_QWORD *)this + 5);
    v12 = *(_QWORD *)(v11 + 24);
    if (v12)
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 24))(v12);
    if (v10)
    {
      *(_QWORD *)(v11 + 24) = v10;
      (*(void (**)(GLDLibrary *))(*(_QWORD *)v10 + 16))(v10);
    }
    (*(void (**)(GLDLibrary *))(*(_QWORD *)v10 + 24))(v10);
    return 1;
  }
  return result;
}

void sub_231058F78(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL GLDBufferRec::load(GLDBufferRec *this)
{
  int v1;
  uint64_t v3;
  uint64_t v4;

  v1 = **((_DWORD **)this + 4);
  if (v1)
  {
    v3 = *((_QWORD *)this + 2);
    if (!*(_DWORD *)(v3 + 248)
      || (pthread_mutex_lock((pthread_mutex_t *)(v3 + 256)), (v1 = **((_DWORD **)this + 4)) != 0))
    {
      if (GLDBufferRec::update(this, v1))
      {
        v1 = 0;
        **((_DWORD **)this + 4) = 0;
      }
    }
    v4 = *((_QWORD *)this + 2);
    if (*(_DWORD *)(v4 + 248))
      pthread_mutex_unlock((pthread_mutex_t *)(v4 + 256));
  }
  return v1 == 0;
}

uint64_t GLDBufferRec::loadUnlocked(GLDBufferRec *this)
{
  int v1;
  uint64_t result;

  v1 = **((_DWORD **)this + 4);
  if (v1)
  {
    result = GLDBufferRec::update(this, v1);
    if (!(_DWORD)result)
      return result;
    **((_DWORD **)this + 4) = 0;
  }
  return 1;
}

void GLDBufferRec::dispatchGroupAsync(uint64_t a1, dispatch_queue_t queue, dispatch_block_t block)
{
  NSObject *v6;

  v6 = *(NSObject **)(a1 + 48);
  if (!v6)
  {
    v6 = dispatch_group_create();
    *(_QWORD *)(a1 + 48) = v6;
  }
  dispatch_group_async(v6, queue, block);
}

NSObject *GLDBufferRec::finishCPUAccess(GLDBufferRec *this)
{
  NSObject *result;

  result = *((_QWORD *)this + 6);
  if (result)
    return dispatch_group_wait(result, 0xFFFFFFFFFFFFFFFFLL);
  return result;
}

uint64_t GLDBufferRec::restoreData(uint64_t this)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (_QWORD *)this;
  v2 = *(_QWORD *)(this + 16);
  if (*(_DWORD *)(v2 + 248))
    this = pthread_mutex_lock((pthread_mutex_t *)(v2 + 256));
  v3 = v1[5];
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 24);
    if (v4)
      this = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  }
  else
  {
    v4 = 0;
  }
  v5 = v1[2];
  if (*(_DWORD *)(v5 + 248))
    this = pthread_mutex_unlock((pthread_mutex_t *)(v5 + 256));
  if (v4)
  {
    if (*(_BYTE *)(v1[3] + 29))
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 40))(v4, v1[2]);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  }
  return this;
}

uint64_t gldCreateBuffer(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject *v8;
  GLDLibrary *v9;

  GLDObject::operator new((GLDObject *)0x38);
  v9 = v8;
  GLDObject::GLDObject(v8);
  *(_QWORD *)v9 = off_24FFEB048;
  GLDLibrary::getAllDisplayMask(v9);
  *((_QWORD *)v9 + 2) = a1;
  *((_QWORD *)v9 + 3) = a3;
  *((_QWORD *)v9 + 4) = a4;
  *a2 = v9;
  return 0;
}

void sub_2310591C8(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL gldLoadBuffer(int a1, GLDBufferRec *this)
{
  return GLDBufferRec::load(this);
}

uint64_t gldReclaimBuffer()
{
  int v0;
  GLDBufferRec *v1;

  v0 = MTLReleaseAssertionFailure();
  return gldRestoreBufferData(v0, v1);
}

uint64_t gldRestoreBufferData(int a1, GLDBufferRec *this)
{
  return GLDBufferRec::restoreData((uint64_t)this);
}

void gldGetBufferAllocationIdentifiers(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
}

void gldGetMemoryPlugin(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 40);
  if (v3)
  {
    *(_QWORD *)(a2 + 40) = 0;
    **(_DWORD **)(a2 + 32) |= 1u;
  }
  *a3 = v3;
}

void gldSetMemoryPlugin(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a2 + 40) = a3;
  **(_DWORD **)(a2 + 32) &= ~1u;
}

BOOL gldTestMemoryPlugin(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;

  v2 = *(_DWORD **)(a2 + 24);
  return !v2[3] && ((*(uint64_t (**)(_DWORD *))(*(_QWORD *)v2 + 48))(v2) & 1) != 0;
}

uint64_t gldDestroyMemoryPlugin(uint64_t a1, _QWORD **a2)
{
  if (a2)
  {
    (*(void (**)(_QWORD *, uint64_t))(*a2[3] + 40))(a2[3], a1);
    ((void (*)(_QWORD **))(*a2)[3])(a2);
  }
  return 0;
}

void GLDDeviceRec::~GLDDeviceRec(GLDDeviceRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

BOOL GLDDeviceRec::init(GLDDeviceRec *this)
{
  id v2;
  void *v3;
  id v4;
  const char *v5;
  size_t v6;
  char *v7;
  const char *v8;
  size_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int v15;
  GLRResourceListPool *v16;
  GLRResourceListPool *v17;
  void *v18;
  unsigned __int8 v19;
  _QWORD block[6];

  GLDLibrary::getAllDisplayMask(this);
  v2 = MTLCreateSystemDefaultDevice();
  *((_QWORD *)this + 3) = v2;
  if (v2)
  {
    if (GLDDeviceRec::init(void)::onceToken != -1)
      goto LABEL_22;
    while (1)
    {
      v3 = (void *)*((_QWORD *)this + 3);
      if (!GLDDeviceRec::init(void)::enableMetalCapture)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v3 = (void *)objc_msgSend(v3, "originalObject");
        v4 = v3;

        *((_QWORD *)this + 3) = v3;
      }
      v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "name"), "cStringUsingEncoding:", 1);
      v6 = strlen(v5) + 1;
      v7 = (char *)malloc_type_malloc(v6, 0xB4C3F624uLL);
      *((_QWORD *)this + 121) = v7;
      strncpy(v7, v5, v6);
      v8 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Metal%@GLDriver"), objc_msgSend(*((id *)this + 3), "familyName")), "cStringUsingEncoding:", 1);
      v9 = strlen(v8) + 1;
      v10 = (char *)malloc_type_malloc(v9, 0xD075EFC9uLL);
      *((_QWORD *)this + 122) = v10;
      strncpy(v10, v8, v9);
      *((_QWORD *)this + 4) = 850045863;
      *(_OWORD *)((char *)this + 40) = 0u;
      *(_OWORD *)((char *)this + 56) = 0u;
      *(_OWORD *)((char *)this + 72) = 0u;
      *((_QWORD *)this + 11) = 0;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", CFSTR("/System/Library/Extensions/AppleMetalGLRenderer.bundle"));
      v12 = objc_msgSend(v11, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = ___ZN12GLDDeviceRec4initEv_block_invoke_2;
      block[3] = &unk_24FFEB120;
      block[4] = v12;
      block[5] = this;
      if (GLDDeviceRec::init(void)::once != -1)
        dispatch_once(&GLDDeviceRec::init(void)::once, block);
      v13 = (id)GLDDeviceRec::init(void)::defaultLibrary;
      *((_QWORD *)this + 12) = v13;
      if (v13)
        break;
LABEL_21:
      MTLReleaseAssertionFailure();
LABEL_22:
      dispatch_once(&GLDDeviceRec::init(void)::onceToken, &__block_literal_global);
    }

    *((_QWORD *)this + 55) = objc_alloc_init(MEMORY[0x24BDBCED8]);
    *((_QWORD *)this + 26) = objc_alloc_init(MEMORY[0x24BDBCED8]);
    GLRFunctionCache::init((pthread_rwlock_t *)((char *)this + 216));
    *((_QWORD *)this + 56) = dispatch_queue_create("glmtl.pipelinecache", MEMORY[0x24BDAC9C0]);
    GLRRenderPipelineCache::init((GLDDeviceRec *)((char *)this + 456));
    GLRDepthStencilCache::init((GLDDeviceRec *)((char *)this + 464));
    *((_DWORD *)this + 26) = GLRFunctionCache::registerBuiltInFunction((uint64_t)this + 216, (void *)objc_msgSend(*((id *)this + 12), "newFunctionWithName:", CFSTR("clearVertex")));
    v14 = 0;
    *((_QWORD *)this + 14) = malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
    do
    {
      v15 = GLRFunctionCache::registerBuiltInFunction((uint64_t)this + 216, (void *)objc_msgSend(*((id *)this + 12), "newFunctionWithName:", off_24FFEB140[v14]));
      *((_DWORD *)this + v14 + 30) = v15;
      if (!v15)
        goto LABEL_21;
      ++v14;
    }
    while (v14 != 17);
    GLDObject::operator new((GLDObject *)0x30);
    v17 = v16;
    GLRResourceListPool::GLRResourceListPool(v16);
    *((_QWORD *)this + 59) = v17;
    GLRResourceListPool::initWithResourceListCapacity(v17, 4096);
    v18 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    if (v18
      && objc_msgSend((id)objc_msgSend(v18, "bundlePath"), "rangeOfString:", CFSTR("Application")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      *((_QWORD *)this + 61) = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
      *((_QWORD *)this + 62) = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 64);
      *((_QWORD *)this + 64) = dispatch_queue_create("glmtl.telemetry", 0);
      GLDDeviceRec::telemetryStartTimer(this, 60.0);
    }
    *((_BYTE *)this + 480) = 0;
    {
      GLDDeviceRec::init(void)::useMaxDataBufferSizeEV = (uint64_t)getenv("GLMTL_SET_MAX_DATA_BUFFER_SIZE");
    }
    if (GLDDeviceRec::init(void)::useMaxDataBufferSizeEV
      && *(_BYTE *)GLDDeviceRec::init(void)::useMaxDataBufferSizeEV == 49)
    {
      *((_BYTE *)this + 480) = 1;
    }
  }
  return v2 != 0;
}

void sub_23105970C(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN12GLDDeviceRec4initEv_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("MetalCaptureEnabled"), CFSTR("com.apple.opengl"), &keyExistsAndHasValidFormat);
  GLDDeviceRec::init(void)::enableMetalCapture = (_DWORD)result != 0;
  return result;
}

void ___ZN12GLDDeviceRec4initEv_block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  GLDDeviceRec::init(void)::defaultLibrary = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "newLibraryWithFile:error:", *(_QWORD *)(a1 + 32), &v1);
  if (v1)
    NSLog(CFSTR("Error loading built in shader library: %@"), v1);
}

uint64_t GLDDeviceRec::dealloc(GLDDeviceRec *this)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;
  const void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[5];

  v2 = *((_QWORD *)this + 64);
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN12GLDDeviceRec7deallocEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v2, block);
    dispatch_release(*((dispatch_object_t *)this + 64));
  }
  v3 = *((_QWORD *)this + 63);
  if (v3)
    dispatch_release(v3);

  GLRFunctionCache::destroy((pthread_rwlock_t *)((char *)this + 216));
  v4 = (const void *)*((_QWORD *)this + 57);
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 58);
  if (v5)
    CFRelease(v5);
  v6 = *((_QWORD *)this + 56);
  if (v6)
    dispatch_release(v6);

  free(*((void **)this + 14));
  *((_QWORD *)this + 14) = 0;

  v7 = *((_QWORD *)this + 59);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);

  free(*((void **)this + 121));
  free(*((void **)this + 122));
  return GLDObject::dealloc((uint64_t)this);
}

void ___ZN12GLDDeviceRec7deallocEv_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  dispatch_source_cancel(*(dispatch_source_t *)(v1 + 520));
  dispatch_release(*(dispatch_object_t *)(v1 + 520));
}

GLRResourceList *GLDDeviceRec::newResourceList(GLRResourceListPool **this)
{
  return GLRResourceListPool::newResourceList(this[59]);
}

void *GLDDeviceRec::getDepthStencilStateFromDescriptor(id *this, MTLDepthStencilDescriptor *a2)
{
  pthread_mutex_t *v4;
  void *v5;

  v4 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  v5 = (void *)objc_msgSend(this[55], "objectForKey:", a2);
  if (!v5)
  {
    v5 = (void *)objc_msgSend(this[3], "newDepthStencilStateWithDescriptor:", a2);
    if (v5)
    {
      objc_msgSend(this[55], "setObject:forKey:", v5, a2);

    }
  }
  pthread_mutex_unlock(v4);
  return v5;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

const void *_getRenderPipelineState(uint64_t a1)
{
  const void *result;

  result = CFDictionaryGetValue(**(CFDictionaryRef **)a1, *(const void **)(a1 + 8));
  **(_QWORD **)(a1 + 16) = result;
  return result;
}

const void *_getDepthStencilState(uint64_t a1)
{
  const void *result;

  result = CFDictionaryGetValue(**(CFDictionaryRef **)a1, *(const void **)(a1 + 8));
  **(_QWORD **)(a1 + 16) = result;
  return result;
}

void ___ZN12GLDDeviceRec27getDepthStencilStateFromKeyEPK18GLRDepthStencilKey_block_invoke(uint64_t a1)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 464), *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t GLDDeviceRec::getClearShaderFragmentFunction(GLDDeviceRec *this, uint64_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  GLDDeviceRec *v10;
  unsigned int v11;

  v4 = (pthread_mutex_t *)((char *)this + 32);
  v5 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  v6 = *(unsigned int *)(*((_QWORD *)this + 14) + 4 * a2);
  if ((_DWORD)v6)
    goto LABEL_4;
  v7 = (void *)MEMORY[0x2348CF1D8](v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("clearFragment%02X"), a2);
  v6 = GLRFunctionCache::registerBuiltInFunction((uint64_t)this + 216, (void *)objc_msgSend(*((id *)this + 12), "newFunctionWithName:", v8));

  if ((_DWORD)v6)
  {
    *(_DWORD *)(*((_QWORD *)this + 14) + 4 * a2) = v6;
    objc_autoreleasePoolPop(v7);
LABEL_4:
    pthread_mutex_unlock(v4);
    return v6;
  }
  v10 = (GLDDeviceRec *)MTLReleaseAssertionFailure();
  return GLDDeviceRec::getBlitFramebufferSampler(v10, v11);
}

uint64_t GLDDeviceRec::getBlitFramebufferSampler(id *this, int a2)
{
  int v4;
  pthread_mutex_t *v5;
  id *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;

  v4 = a2 - 9728;
  v5 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  v6 = &this[v4];
  v9 = (uint64_t)v6[24];
  v8 = (uint64_t *)(v6 + 24);
  v7 = v9;
  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDDD6F0]);
    v11 = v10;
    if (a2 == 9728)
    {
      v12 = 0;
    }
    else
    {
      if (a2 != 9729)
      {
LABEL_7:
        objc_msgSend(v11, "setMipFilter:", 0);
        objc_msgSend(v11, "setMaxAnisotropy:", 1);
        objc_msgSend(v11, "setSAddressMode:", 0);
        objc_msgSend(v11, "setTAddressMode:", 0);
        objc_msgSend(v11, "setRAddressMode:", 0);
        objc_msgSend(v11, "setNormalizedCoordinates:", 0);
        LODWORD(v13) = 0;
        objc_msgSend(v11, "setLodMinClamp:", v13);
        LODWORD(v14) = 0;
        objc_msgSend(v11, "setLodMaxClamp:", v14);
        v7 = objc_msgSend(this[3], "newSamplerStateWithDescriptor:", v11);
        *v8 = v7;
        goto LABEL_8;
      }
      v12 = 1;
    }
    objc_msgSend(v10, "setMinFilter:", v12);
    objc_msgSend(v11, "setMagFilter:", v12);
    goto LABEL_7;
  }
LABEL_8:
  pthread_mutex_unlock(v5);
  return v7;
}

const char *GLDDeviceRec::getBlitPipelineStateFromDescriptor(id *this, MTLRenderPipelineDescriptor *a2)
{
  pthread_mutex_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v4 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  v5 = (void *)objc_msgSend(this[26], "objectForKey:", a2);
  if (v5)
    goto LABEL_4;
  v10 = 0;
  v6 = objc_msgSend(this[3], "newRenderPipelineStateWithDescriptor:error:", a2, &v10);
  if (v6)
  {
    v5 = (void *)v6;
    objc_msgSend(this[26], "setObject:forKey:", v6, a2);

LABEL_4:
    pthread_mutex_unlock(v4);
    return (const char *)v5;
  }
  v8 = MTLReleaseAssertionFailure();
  return gldGetDeviceString(v8, v9);
}

const char *gldGetDeviceString(uint64_t a1, int a2)
{
  const char *result;

  result = 0;
  switch(a2)
  {
    case 7936:
      result = "Apple Inc.";
      break;
    case 7937:
      result = *(const char **)(a1 + 968);
      break;
    case 7938:
      result = "Metal - 101";
      break;
    case 7940:
      result = *(const char **)(a1 + 976);
      break;
    case 7941:
      result = (const char *)&gl_device;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t gldPopulateRendererInfo(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)g_Library;
  *(_QWORD *)a2 = 0;
  *(_OWORD *)(a2 + 8) = xmmword_23106AED0;
  *(_QWORD *)(a2 + 24) = 0x100108000000;
  *(_DWORD *)(a2 + 32) = 129;
  *(_DWORD *)(a2 + 36) = v2;
  *(_DWORD *)(a2 + 40) = 0x10000;
  *(_WORD *)(a2 + 44) = 16;
  *(_DWORD *)(a2 + 48) = 1;
  *(_BYTE *)(a2 + 46) = 1;
  *(_OWORD *)(a2 + 60) = 0u;
  *(_OWORD *)(a2 + 76) = 0u;
  *(_OWORD *)(a2 + 92) = 0u;
  *(_OWORD *)(a2 + 108) = 0u;
  *(_OWORD *)(a2 + 120) = 0u;
  return 0;
}

void GLDFenceRec::~GLDFenceRec(GLDFenceRec *this)
{
  void *v1;

  GLRResource::~GLRResource(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDFenceRec::getStatus(GLDFenceRec *this)
{
  BOOL v2;

  if (*((_DWORD *)this + 8))
    return 3;
  if (*((_DWORD *)this + 3))
    return 0;
  v2 = *((_DWORD *)this + 4) == 0;
  *((_DWORD *)this + 8) = v2;
  if (v2)
    return 3;
  else
    return 1;
}

uint64_t gldCreateFence(uint64_t a1, GLRResource **a2)
{
  GLRResource *v3;
  GLRResource *v4;

  GLDObject::operator new((GLDObject *)0x28);
  v4 = v3;
  GLRResource::GLRResource(v3);
  *(_QWORD *)v4 = off_24FFEB260;
  GLDLibrary::getAllDisplayMask(v4);
  *((_DWORD *)v4 + 8) = 1;
  *a2 = v4;
  return 0;
}

void sub_231059E24(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void gldClearFence(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_DWORD *)(a2 + 32) = 1;
}

uint64_t gldDestroyFence(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  return 0;
}

uint64_t gldGetFenceStatus(uint64_t a1, _DWORD *a2)
{
  BOOL v3;

  if (!a2 || a2[8])
    return 3;
  if (a2[3])
    return 0;
  v3 = a2[4] == 0;
  a2[8] = v3;
  if (v3)
    return 3;
  else
    return 1;
}

BOOL GLRResource::testIdle(GLRResource *this)
{
  return *((_DWORD *)this + 4) == 0;
}

void GLDFramebufferRec::~GLDFramebufferRec(GLDFramebufferRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDFramebufferRec::dealloc(uint64_t this)
{
  *(_QWORD *)(this + 16) = 0;
  return GLDObject::dealloc(this);
}

BOOL GLDFramebufferRec::load(GLDFramebufferRec *this)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int updated;
  uint64_t v14;
  int v15;
  uint64_t v16;

  v2 = *((_QWORD *)this + 2);
  if (*(_DWORD *)(v2 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 256));
  v3 = *(_DWORD *)(*((_QWORD *)this + 4) + 200);
  *(_BYTE *)(*((_QWORD *)this + 5) + 81) = 1;
  if (!v3)
  {
LABEL_8:
    v11 = *((_QWORD *)this + 2);
    v12 = *(_DWORD *)(v11 + 20) + 1;
    *(_DWORD *)(v11 + 20) = v12;
    *((_DWORD *)this + 6) = v12;
    updated = GLDFramebufferRec::updateState(this);
    v14 = *((_QWORD *)this + 5);
    v15 = updated ^ 1;
    *(_BYTE *)(v14 + 81) = updated ^ 1;
    *(_BYTE *)(v14 + 80) = 0;
    goto LABEL_10;
  }
  while (1)
  {
    v4 = __clz(__rbit32(v3));
    v5 = *(_QWORD *)(*((_QWORD *)this + 5) + 8 * v4);
    v6 = *(_QWORD *)(v5 + 56);
    v7 = *(_BYTE *)(v6 + 20);
    if (v7)
      break;
LABEL_7:
    v3 ^= 1 << v4;
    if (!v3)
      goto LABEL_8;
  }
  v8 = *((_QWORD *)this + 2);
  v9 = *(_DWORD *)(v8 + 24) + 1;
  *(_DWORD *)(v8 + 24) = v9;
  *(_DWORD *)(v5 + 12) = v9;
  if (GLDTextureRec::update((GLDTextureRec *)v5, v7, (unsigned __int16 *)(v6 + 8)))
  {
    v10 = *(_QWORD *)(v5 + 56);
    *(_QWORD *)(v10 + 13) = 0;
    *(_QWORD *)(v10 + 8) = 0;
    goto LABEL_7;
  }
  v15 = *(unsigned __int8 *)(*((_QWORD *)this + 5) + 81);
LABEL_10:
  v16 = *((_QWORD *)this + 2);
  if (*(_DWORD *)(v16 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(v16 + 256));
  return v15 == 0;
}

uint64_t GLDFramebufferRec::updateState(GLDFramebufferRec *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  char v4;
  unint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  int *v11;
  int v12;
  char **v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char **v19;
  BOOL v20;
  char v21;
  __int128 v22;
  uint64_t v23;

  v1 = *((_QWORD *)this + 5);
  *(_BYTE *)(v1 + 82) = 0;
  v2 = *((_QWORD *)this + 4);
  if (*(unsigned __int16 *)(v2 + 178) <= 0x4000u)
  {
    v4 = 1;
    if (*(unsigned __int16 *)(v2 + 180) > 0x4000u)
    {
      result = 0;
      goto LABEL_5;
    }
    v6 = 0;
    v7 = 0;
    v8 = 0;
    do
    {
      if ((*(_DWORD *)(v2 + 200) & (1 << v6)) != 0)
      {
        v1 = *((_QWORD *)this + 5);
        v9 = *(_QWORD *)(v1 + 8 * v6);
        if (!v9)
          return 0;
        if (v6 <= 7)
        {
          v10 = *(_DWORD *)(v9 + 64);
          if ((*((_BYTE *)&glrTextureFormats + 40 * v10 + 36) & 1) == 0)
            goto LABEL_2;
          v23 = 0;
          v22 = 0u;
          MTLPixelFormatGetInfoForDevice();
          if (*(unsigned __int8 *)(*(_QWORD *)(v9 + 48) + 212) <= 1u)
            v11 = (int *)&v22 + 2;
          else
            v11 = (int *)&v23;
          v12 = *v11;
          v2 = *((_QWORD *)this + 4);
          if (*(_WORD *)(v2 + 176) && v6 == *(unsigned __int16 *)(v2 + 176) - 36064)
          {
            v13 = &(&glrTextureFormats)[5 * v10];
            v14 = *((_QWORD *)this + 5);
            *(_WORD *)(v14 + 84) = *((_DWORD *)v13 + 2);
            *(_WORD *)(v14 + 86) = *((_DWORD *)v13 + 3);
          }
          v8 += 8 * v12;
          v7 |= 1 << v6;
        }
      }
      ++v6;
    }
    while (v6 != 10);
    v15 = objc_msgSend(*(id *)(*((_QWORD *)this + 2) + 232), "maxFramebufferStorageBits");
    v1 = *((_QWORD *)this + 5);
    if (v15 >= v8)
    {
      v16 = *(_QWORD *)(v1 + 64);
      if (!v16 || (*((_BYTE *)&glrTextureFormats + 40 * *(unsigned int *)(v16 + 64) + 36) & 2) != 0)
      {
        v17 = *(_QWORD *)(v1 + 72);
        if (v17)
        {
          result = 0;
          v18 = 68;
          if (*(_DWORD *)(v17 + 76) == 1)
            v18 = 64;
          v19 = &(&glrTextureFormats)[5 * *(unsigned int *)(v17 + v18)];
          if (v16)
            v20 = v17 == v16;
          else
            v20 = 1;
          v21 = !v20;
          v4 = 1;
          if ((*((_BYTE *)v19 + 36) & 4) == 0 || (v21 & 1) != 0)
            goto LABEL_5;
          goto LABEL_38;
        }
        if (v7 || v16)
        {
LABEL_38:
          v4 = 0;
          result = 1;
          goto LABEL_5;
        }
      }
    }
  }
LABEL_2:
  result = 0;
  v4 = 1;
LABEL_5:
  *(_BYTE *)(v1 + 81) = v4;
  return result;
}

uint64_t gldCreateFramebuffer(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject *v8;
  GLDLibrary *v9;

  GLDObject::operator new((GLDObject *)0x30);
  v9 = v8;
  GLDObject::GLDObject(v8);
  *(_QWORD *)v9 = off_24FFEB2C0;
  GLDLibrary::getAllDisplayMask(v9);
  *((_QWORD *)v9 + 2) = a1;
  *((_QWORD *)v9 + 4) = a3;
  *((_QWORD *)v9 + 5) = a4;
  *a2 = v9;
  return 0;
}

void sub_23105A260(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldDestroyFramebuffer(uint64_t a1, GLDObject *this)
{
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  if (this)
    GLDObject::release((unsigned int *)this);
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  return 0;
}

BOOL gldLoadFramebuffer(int a1, GLDFramebufferRec *this)
{
  return GLDFramebufferRec::load(this);
}

uint64_t GLDContextRec::loadCurrentProgram(GLDContextRec *this, GLDProgramRec *a2, GLDPipelineProgramRec *a3, unsigned int *a4, unsigned int a5)
{
  uint64_t result;
  uint64_t v10;
  char *v11;
  char *v12;
  GLDContextRec *v13;
  unsigned int *v14;
  uint64_t v15;

  v15 = 0;
  if (a3)
  {
    result = GLDPipelineProgramRec::update((uint64_t)a3, (uint64_t)a2, a5, &v15);
    if (!result)
    {
      v13 = (GLDContextRec *)MTLReleaseAssertionFailure();
      return GLDContextRec::loadCurrentPipelinePrograms(v13, v14);
    }
    v10 = v15;
  }
  else
  {
    v10 = 0;
    result = 0;
  }
  v11 = (char *)this + 8 * a5;
  if (*((_QWORD *)v11 + 511) != result)
  {
    *((_QWORD *)v11 + 511) = result;
    *((_QWORD *)this + 330) = -1;
    *((_DWORD *)this + 618) |= 0x40Cu;
  }
  if (!a5)
    *((_QWORD *)this + 516) = v10;
  v12 = (char *)this + 8 * a5;
  *((_QWORD *)v12 + 188) = a2;
  *((_QWORD *)v12 + 183) = a3;
  return result;
}

uint64_t GLDContextRec::loadCurrentPipelinePrograms(uint64_t this, unsigned int *a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v5;
  unsigned int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  GLDPipelineProgramRec *v11;
  GLDPipelineProgramRec **v12;
  uint64_t v13;
  uint64_t v14;
  GLDPipelineProgramRec **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = this;
  v6 = a2[3];
  if ((v6 & 0x20000000) != 0)
  {
    this = GLDContextRec::updateUniformBuffers((GLDContextRec *)this);
    v7 = this;
    v6 = a2[3];
  }
  else
  {
    v7 = 1;
  }
  if ((v6 & 0x90040000) != 0)
  {
    v8 = *(_QWORD *)(v5 + 112);
    v9 = *(_QWORD *)(v8 + 328);
    v10 = *(_DWORD *)(v5 + 384);
    *(_DWORD *)(v5 + 384) = v10 & 0xFFF7FF00;
    if ((v10 & 0x3F03F00) != 0)
    {
      v9 = 0;
      v11 = 0;
    }
    else
    {
      if (v9 && (**(_BYTE **)(v9 + 24) & 1) != 0)
      {
        if ((v7 & 1) == 0)
          goto LABEL_30;
        v12 = *(GLDPipelineProgramRec ***)(v9 + 32);
      }
      else
      {
        v9 = 0;
        v12 = (GLDPipelineProgramRec **)(v8 + 256);
      }
      v11 = *v12;
    }
    this = GLDContextRec::loadCurrentProgram((GLDContextRec *)v5, (GLDProgramRec *)v9, v11, a4, 0);
    v6 = a2[3];
  }
  if ((v6 & 0x10400000) != 0)
  {
    v13 = *(_QWORD *)(v5 + 112);
    v14 = *(_QWORD *)(v13 + 360);
    if (!v14 || (**(_BYTE **)(v14 + 24) & 0x10) == 0)
    {
      v14 = 0;
      v15 = (GLDPipelineProgramRec **)(v13 + 288);
LABEL_20:
      this = GLDContextRec::loadCurrentProgram((GLDContextRec *)v5, (GLDProgramRec *)v14, *v15, a4, 4u);
      v6 = a2[3];
      goto LABEL_21;
    }
    if ((v7 & 1) != 0)
    {
      v15 = (GLDPipelineProgramRec **)(*(_QWORD *)(v14 + 32) + 32);
      goto LABEL_20;
    }
LABEL_30:
    MTLReleaseAssertionFailure();
    return gldGetPipelineProgramInfo();
  }
LABEL_21:
  if ((v6 & 0x903C0000) != 0)
  {
    if (*(_WORD *)(v5 + 384))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(v5 + 112) + 296);
      if (*(_QWORD *)(v5 + 1464) != v16)
      {
        v18 = 0;
        this = GLDPipelineProgramRec::update(v16, 0, 0, &v18);
        if (!this)
        {
          v16 = 0;
          *(_DWORD *)(v5 + 384) |= 0x80000u;
          a2[3] |= 0x10400000u;
        }
        v17 = v18;
        if (*(_QWORD *)(v5 + 4088) != this)
        {
          *(_QWORD *)(v5 + 4088) = this;
          *(_QWORD *)(v5 + 2640) = -1;
          *(_DWORD *)(v5 + 2472) |= 0x40Cu;
        }
        *(_QWORD *)(v5 + 4128) = v17;
        *(_QWORD *)(v5 + 1504) = 0;
        *(_QWORD *)(v5 + 1464) = v16;
      }
    }
  }
  return this;
}

uint64_t gldGetPipelineProgramInfo()
{
  return 0;
}

uint64_t gpusPixelBytes(int a1, int a2)
{
  uint64_t result;
  int v4;
  char v5;
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;

  result = 2;
  if (a2 <= 33634)
  {
    if (a2 <= 32818)
    {
      if ((a2 - 5120) <= 0xB)
      {
        if (((1 << a2) & 0x70) != 0)
          return 4 * gpulComponents(a1);
        if (((1 << a2) & 0x80C) != 0)
          return 2 * gpulComponents(a1);
        if (((1 << a2) & 3) != 0)
        {
          result = 1;
          v5 = a1 - 101;
          if ((a1 - 35429) > 0xF)
          {
            if ((a1 - 37883) < 3)
              return result;
            if (a1 != 37902 && (a1 - 37875) >= 6)
            {
              v7 = a1;
              return gpulComponents(v7);
            }
          }
          else if (((1 << v5) & 0xE2E2) == 0)
          {
            if (((1 << v5) & 0xD0D) == 0)
              return 4;
            return result;
          }
          return 2;
        }
      }
      if (a2)
      {
LABEL_53:
        MTLReleaseAssertionFailure();
        goto LABEL_54;
      }
      if (a1 > 37839)
      {
        v8 = a1 - 37840;
        if (v8 > 0x3D || ((1 << v8) & 0x3FFFC00000003FFFLL) == 0)
          goto LABEL_54;
      }
      else if (a1 > 37807)
      {
        if ((a1 - 37808) >= 0xE)
          goto LABEL_54;
      }
      else
      {
        result = 8;
        if (a1 > 37487)
        {
          v9 = a1 - 37488;
          if (v9 > 9)
          {
LABEL_54:
            v7 = MTLReleaseAssertionFailure();
            return gpulComponents(v7);
          }
          if (((1 << v9) & 0xF3) != 0)
            return result;
        }
        else
        {
          if ((a1 - 35412) < 4)
            return result;
          if ((a1 - 35420) >= 4)
          {
            if ((a1 - 35840) >= 4)
              goto LABEL_54;
            return result;
          }
        }
      }
      return 16;
    }
    if ((a2 - 32819) < 2)
      return result;
    v4 = 32822;
LABEL_24:
    if (a2 == v4)
      return 4;
    goto LABEL_53;
  }
  if (a2 <= 34233)
  {
    if ((a2 - 33635) <= 5)
    {
      v6 = 1 << (a2 - 99);
      if ((v6 & 0xD) != 0)
        return result;
      if ((v6 & 0x30) != 0)
        return 4;
    }
    v4 = 34042;
    goto LABEL_24;
  }
  if (a2 > 36192)
  {
    if (a2 != 36193)
    {
      if (a2 == 36269)
        return 8;
      v4 = 37882;
      goto LABEL_24;
    }
    return 2 * gpulComponents(a1);
  }
  if ((a2 - 34234) >= 2)
  {
    if (a2 != 35899)
    {
      v4 = 35902;
      goto LABEL_24;
    }
    return 4;
  }
  return result;
}

uint64_t gpulComponents(int a1)
{
  uint64_t result;
  unsigned int v3;

  result = 1;
  if (a1 > 35428)
  {
    if ((a1 - 35429) < 0x10 || (a1 - 37875) <= 0x1B && ((1 << (a1 + 13)) & 0x800073F) != 0)
      return 3;
    v3 = a1 - 36244;
    if (v3 > 9)
      return 4;
    if (((1 << v3) & 0x10F) != 0)
      return result;
    if (((1 << v3) & 0x50) != 0)
      return 3;
    if (v3 != 9)
      return 4;
    return 2;
  }
  if (a1 > 32840)
  {
    if ((a1 - 33319) >= 2)
    {
      if (a1 == 32841)
        return result;
      if (a1 == 32992)
        return 3;
      return 4;
    }
    return 2;
  }
  switch(a1)
  {
    case 6400:
    case 6401:
    case 6402:
    case 6403:
    case 6404:
    case 6405:
    case 6406:
    case 6409:
      return result;
    case 6407:
      return 3;
    case 6410:
      return 2;
    default:
      return 4;
  }
  return result;
}

uint64_t gpusRowBytes(int a1, int a2, int a3)
{
  int v4;
  int v5;
  uint64_t v6;

  if (a2)
    return gpusPixelBytes(a1, a2) * a3;
  if (a1 > 37807)
  {
    switch(a1)
    {
      case 37808:
      case 37840:
      case 37886:
      case 37887:
        goto LABEL_8;
      case 37809:
      case 37810:
      case 37841:
      case 37842:
      case 37888:
      case 37889:
        v4 = 1;
        v5 = 5;
        return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
      case 37811:
      case 37812:
      case 37843:
      case 37844:
      case 37890:
      case 37891:
        v4 = 1;
        v5 = 6;
        return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
      case 37813:
      case 37814:
      case 37815:
      case 37845:
      case 37846:
      case 37847:
      case 37892:
      case 37893:
      case 37894:
      case 37895:
        goto LABEL_9;
      case 37816:
      case 37817:
      case 37818:
      case 37819:
      case 37848:
      case 37849:
      case 37850:
      case 37851:
      case 37896:
      case 37897:
      case 37898:
      case 37899:
        v4 = 1;
        v5 = 10;
        return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
      case 37820:
      case 37821:
      case 37852:
      case 37853:
      case 37900:
      case 37901:
        v4 = 1;
        v5 = 12;
        return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
      default:
        goto LABEL_18;
    }
  }
  if ((a1 - 37488) >= 0xA)
  {
    switch(a1)
    {
      case 35412:
      case 35414:
LABEL_16:
        v4 = 8;
        v5 = 16;
        return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
      case 35413:
      case 35415:
LABEL_15:
        v5 = 8;
        v4 = 8;
        return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
      case 35416:
      case 35417:
      case 35418:
      case 35419:
LABEL_18:
        v6 = MTLReleaseAssertionFailure();
        return glrPixelSettings(v6);
      case 35420:
      case 35422:
LABEL_8:
        v4 = 1;
        v5 = 4;
        return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
      case 35421:
      case 35423:
LABEL_9:
        v4 = 1;
        v5 = 8;
        return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
      default:
        switch(a1)
        {
          case 35840:
          case 35842:
            goto LABEL_15;
          case 35841:
          case 35843:
            goto LABEL_16;
          default:
            goto LABEL_18;
        }
    }
  }
  v5 = 4;
  v4 = 4;
  return ((int)((a3 + v5 - 1) / v5 * gpusPixelBytes(a1, 0)) / v4);
}

uint64_t glrPixelSettings(int a1, int a2, int a3, int a4, int *a5, _DWORD *a6, _DWORD *a7, int *a8, char a9)
{
  uint64_t result;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;

  result = gpusPixelBytes(a1, a2);
  *a6 = result;
  if (a2 && a8)
  {
    v18 = result;
    v19 = a8[1];
    if (!v19)
    {
      result = *a8 < 1 ? gpusRowBytes(a1, a2, a3) : (*a8 * result);
      v20 = a8[7];
      v21 = (int)result % v20;
      v19 = v20 + result - (int)result % v20;
      if (!v21)
        v19 = result;
    }
    *a5 = v19;
    v22 = a8[3];
    if (!v22)
    {
      v23 = a8[2];
      if (v23 <= 0)
        v23 = a4;
      v22 = v23 * v19;
    }
    if ((a9 & 4) != 0)
      v24 = a8[6];
    else
      v24 = 0;
    *a7 = a8[5] * v18 + v24 * v22 + a8[4] * v19;
  }
  else
  {
    *a7 = 0;
    result = gpusRowBytes(a1, a2, a3);
    *a5 = result;
  }
  return result;
}

void *GLDPipelineProgramRec::createMetalFunction(GLDPipelineProgramRec *this, GLDProgramRec *a2, unsigned int a3, int a4)
{
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int v8;
  int *v9;
  uint64_t v10;
  int v11;
  size_t v12;
  _WORD *v13;
  int v14;
  unsigned int *v15;
  _WORD *v16;
  _WORD *v17;
  __int16 v18;
  __int16 v19;
  unsigned int v20;
  unint64_t v21;
  BOOL v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;

  v5 = *((_QWORD *)this + 3);
  if (!a4)
  {
    v24 = 0;
    v25 = 1;
LABEL_25:
    v26 = GLRFunctionCache::newFunctionWithGLIR((CFArrayRef *)(*(_QWORD *)(*((_QWORD *)this + 2) + 224) + 216), *(void **)(*(_QWORD *)(*((_QWORD *)this + 2) + 224) + 24), *(_QWORD *)(v5 + 16), (uint64_t)v24, v25);
    if (v24)
      dispatch_release(v24);
    return v26;
  }
  if (a4 == 4)
  {
    v6 = *(unsigned int **)(v5 + 56);
    if (!v6)
      goto LABEL_23;
    v7 = *v6;
    if (!(_DWORD)v7)
      goto LABEL_23;
    v8 = 0;
    v9 = (int *)(v6 + 2);
    v10 = *v6;
    do
    {
      v11 = *v9;
      v9 += 2;
      if ((v11 & 0x1F00) == 0x1C00)
        ++v8;
      --v10;
    }
    while (v10);
    if (v8)
    {
      v12 = 2 * v8 + 2;
      v13 = malloc_type_malloc(v12, 0x4C839DAEuLL);
      bzero(v13, v12);
      v14 = 0;
      *v13 = v8;
      v15 = v6 + 2;
      do
      {
        if ((*v15 & 0x1F00) == 0x1C00)
        {
          v16 = &v13[v14];
          v18 = v16[1];
          v17 = v16 + 1;
          v19 = v18 & 0xFFE0 | v15[1] & 0x1F;
          *v17 = v19;
          v20 = *v15 & 7;
          LOWORD(v21) = 1696;
          switch((*v15 >> 3) & 7)
          {
            case 0u:
              v22 = v20 >= 4;
              v21 = 0x200020000600060uLL >> (16 * v20);
              goto LABEL_16;
            case 1u:
              goto LABEL_19;
            case 2u:
              v22 = v20 >= 4;
              v21 = 0x4A004A003A003A0uLL >> (16 * v20);
              goto LABEL_16;
            case 3u:
              v22 = v20 >= 4;
              v21 = 0x520052004200420uLL >> (16 * v20);
LABEL_16:
              if (v22)
                LOWORD(v21) = 1696;
LABEL_19:
              v23 = v21 | v19 & 0xF81F;
              *v17 = v23;
              *v17 = (32 * *(_WORD *)v15) & 0x1800 | v23 & 0xE7FF;
              ++v14;
              break;
            default:
              goto LABEL_29;
          }
        }
        v15 += 2;
        --v7;
      }
      while (v7);
      v24 = dispatch_data_create(v13, v12, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
    }
    else
    {
LABEL_23:
      v24 = 0;
    }
    v25 = 2;
    goto LABEL_25;
  }
  MTLReleaseAssertionFailure();
LABEL_29:
  v28 = MTLReleaseAssertionFailure();
  return (void *)GLDPipelineProgramRec::update(v28);
}

uint64_t GLDPipelineProgramRec::update(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
  int *v6;
  int v7;
  GLDProgramRec *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;

  v6 = *(int **)(a1 + 32);
  v7 = *v6;
  *v6 = 0;
  if ((v7 & 1) != 0)
  {

    *(_QWORD *)(a1 + 40) = GLDPipelineProgramRec::createMetalFunction((GLDPipelineProgramRec *)a1, v9, v10, a3);
    if (!a3)
    {

      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 80);
      if (v11)
        v12 = GLRFunctionCache::newFunctionWithGLIR((CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 224) + 216), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 224) + 24), v11, 0, 1);
      else
        v12 = 0;
      *(_QWORD *)(a1 + 48) = v12;
    }
  }
  *a4 = *(_QWORD *)(a1 + 48);
  return *(_QWORD *)(a1 + 40);
}

void GLDProgramRec::~GLDProgramRec(GLDProgramRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t gldDestroyProgram(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  if (a2)
    (*(void (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  return 0;
}

void GLRResourceListPool::GLRResourceListPool(GLRResourceListPool *this)
{
  _QWORD *v1;

  GLDObject::GLDObject(this);
  *v1 = off_24FFEB3F8;
}

void GLRResourceListPool::~GLRResourceListPool(GLRResourceListPool *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLRResourceListPool::initWithResourceListCapacity(GLRResourceListPool *this, int a2)
{
  GLRResourceListPool *v3;

  v3 = this;
  GLDLibrary::getAllDisplayMask(this);
  *((_QWORD *)v3 + 2) = 0;
  v3 = (GLRResourceListPool *)((char *)v3 + 16);
  *((_DWORD *)v3 + 6) = a2;
  *((_QWORD *)v3 + 1) = v3;
  *((_QWORD *)v3 + 2) = 0;
  return 1;
}

GLRResourceList *GLRResourceListPool::newResourceList(GLRResourceListPool *this)
{
  GLRResourceList *v2;
  uint64_t v3;
  _QWORD *v4;
  GLRResourceList *v5;

  _os_nospin_lock_lock();
  v2 = (GLRResourceList *)*((_QWORD *)this + 2);
  if (v2)
  {
    v3 = *((_QWORD *)v2 + 24);
    v4 = (_QWORD *)*((_QWORD *)v2 + 25);
    if (v3)
    {
      *(_QWORD *)(v3 + 200) = v4;
      v4 = (_QWORD *)*((_QWORD *)v2 + 25);
    }
    else
    {
      *((_QWORD *)this + 3) = v4;
    }
    *v4 = v3;
    --*((_DWORD *)this + 9);
    *((_QWORD *)v2 + 24) = 0;
    *((_QWORD *)v2 + 25) = 0;
    _os_nospin_lock_unlock();
    goto LABEL_8;
  }
  _os_nospin_lock_unlock();
  GLDObject::operator new((GLDObject *)0xD8);
  v2 = v5;
  GLRResourceList::GLRResourceList(v5);
  if (v2)
  {
    GLRResourceList::initWithCapacity(v2, *((_DWORD *)this + 10));
LABEL_8:
    *((_QWORD *)v2 + 23) = this;
    (*(void (**)(GLRResourceListPool *))(*(_QWORD *)this + 16))(this);
  }
  return v2;
}

void sub_23105B094(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void GLRResource::GLRResource(GLRResource *this)
{
  _QWORD *v1;

  GLDObject::GLDObject(this);
  *v1 = off_24FFEB448;
}

void GLRResource::~GLRResource(GLRResource *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

BOOL GLRResource::decrementBusy(GLRResource *this)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)((char *)this + 16);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stxr(v3, v1));
  return v3 == 0;
}

void GLRBufferResource::~GLRBufferResource(GLRBufferResource *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLRBufferResource::initWithMetalBuffer(GLDLibrary *a1, void *a2, uint64_t a3)
{
  id v6;

  GLDLibrary::getAllDisplayMask(a1);
  *((_QWORD *)a1 + 3) = a3;
  *((_QWORD *)a1 + 5) = a2;
  v6 = a2;
  return 1;
}

uint64_t GLRBufferResource::dealloc(id *this)
{

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRBufferResource::testIdle(id *this)
{
  return objc_msgSend(this[5], "isComplete");
}

uint64_t GLRBufferResource::waitIdle(id *this, GLDShareGroupRec *a2)
{
  return objc_msgSend(this[5], "waitUntilComplete");
}

void GLRSamplerResource::GLRSamplerResource(GLRSamplerResource *this)
{
  _QWORD *v1;

  GLDObject::GLDObject(this);
  *v1 = off_24FFEB4D8;
}

void GLRSamplerResource::~GLRSamplerResource(GLRSamplerResource *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLRSamplerResource::initWithMetalSampler(GLDLibrary *a1, void *a2)
{
  GLDLibrary::getAllDisplayMask(a1);
  *((_QWORD *)a1 + 3) = 1;
  *((_QWORD *)a1 + 4) = a2;
  return 1;
}

uint64_t GLRSamplerResource::dealloc(id *this)
{

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRSamplerResource::testIdle(GLRSamplerResource *this)
{
  return 1;
}

void GLRTextureViewResource::~GLRTextureViewResource(GLRTextureViewResource *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLRTextureViewResource::testIdle(id *this)
{
  return objc_msgSend(this[4], "isComplete");
}

uint64_t GLRTextureViewResource::waitIdle(id *this, GLDShareGroupRec *a2)
{
  return objc_msgSend(this[4], "waitUntilComplete");
}

void GLRTextureResource::GLRTextureResource(GLRTextureResource *this)
{
  _QWORD *v1;

  GLDObject::GLDObject(this);
  *v1 = off_24FFEB568;
}

uint64_t GLRTextureResource::testIdle(id *this)
{
  return objc_msgSend(this[4], "isComplete");
}

uint64_t GLRTextureResource::waitIdle(id *this, GLDShareGroupRec *a2)
{
  return objc_msgSend(this[4], "waitUntilComplete");
}

uint64_t GLRTextureResource::setBaseLevelMaxLevel(uint64_t this, int a2, int a3)
{
  if (*(_DWORD *)(this + 48) != a2)
  {
    *(_DWORD *)(this + 48) = a2;
    *(_BYTE *)(this + 56) = 1;
  }
  if (*(_DWORD *)(this + 52) != a3)
  {
    *(_DWORD *)(this + 52) = a3;
    *(_BYTE *)(this + 56) = 1;
  }
  return this;
}

uint64_t GLRTextureResource::setSwizzleKey(uint64_t this, int a2)
{
  if (*(_DWORD *)(this + 60) != a2)
  {
    *(_DWORD *)(this + 60) = a2;
    *(_BYTE *)(this + 56) = 1;
  }
  return this;
}

void GLRTextureResource::updateSampleViewIfNeeded(GLRTextureResource *this, MTLPixelFormat a2, MTLTextureType a3, _NSRange a4)
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  GLDObject *v10;
  GLDObject *v11;
  unsigned int v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  MTLPixelFormat v17;
  int v18;
  GLDLibrary *v19;
  void *v20;
  void *v21;
  GLDLibrary *v22;

  length = a4.length;
  location = a4.location;
  v9 = *((_QWORD *)this + 5);
  if (v9)
  {
    if (!*((_BYTE *)this + 56))
      return;
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
    *((_QWORD *)this + 5) = 0;
  }
  GLDObject::operator new((GLDObject *)0x28);
  v11 = v10;
  GLDObject::GLDObject(v10);
  *(_QWORD *)v11 = off_24FFEB520;
  *((_QWORD *)this + 5) = v11;
  v13 = *((unsigned int *)this + 12);
  v12 = *((_DWORD *)this + 13);
  v14 = v12 >= v13;
  v15 = v12 - v13;
  if (v14)
    v16 = (v15 + 1);
  else
    v16 = 1;
  if (v16 + v13 > (unint64_t)objc_msgSend(*((id *)this + 4), "mipmapLevelCount"))
    v16 = objc_msgSend(*((id *)this + 4), "mipmapLevelCount") - *((unsigned int *)this + 12);
  if (a2 - 221 >= 0x10)
    v17 = a2;
  else
    v17 = a2 - 18;
  if (*((_BYTE *)this + 57))
    a2 = v17;
  if (!*((_DWORD *)this + 12)
    && v16 == objc_msgSend(*((id *)this + 4), "mipmapLevelCount")
    && (v18 = *((_DWORD *)this + 15), v18 == objc_msgSend(*((id *)this + 4), "swizzleKey"))
    && objc_msgSend(*((id *)this + 4), "pixelFormat") == a2)
  {
    v20 = (void *)*((_QWORD *)this + 4);
    v19 = (GLDLibrary *)*((_QWORD *)this + 5);
    GLDLibrary::getAllDisplayMask(v19);
    *((_QWORD *)v19 + 3) = 1;
    *((_QWORD *)v19 + 4) = v20;
  }
  else
  {
    v21 = (void *)objc_msgSend(*((id *)this + 4), "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a2, a3, *((unsigned int *)this + 12), v16, location, length, MTLTextureSwizzleKeyToChannels());
    objc_msgSend(v21, "setLabel:", *MEMORY[0x24BDDD9C0]);
    v22 = (GLDLibrary *)*((_QWORD *)this + 5);
    GLDLibrary::getAllDisplayMask(v22);
    *((_QWORD *)v22 + 3) = 1;
    *((_QWORD *)v22 + 4) = v21;

  }
  *((_BYTE *)this + 56) = 0;
}

void sub_23105B4A0(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void GLRResourceList::GLRResourceList(GLRResourceList *this)
{
  _QWORD *v1;

  GLDObject::GLDObject(this);
  *v1 = off_24FFEB628;
}

void GLRResourceList::~GLRResourceList(GLRResourceList *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLRResourceList::initWithCapacity(GLRResourceList *this, unsigned int a2)
{
  __int128 v4;

  GLDLibrary::getAllDisplayMask(this);
  *(_QWORD *)&v4 = -1;
  *((_QWORD *)&v4 + 1) = -1;
  *(_OWORD *)((char *)this + 12) = v4;
  *(_OWORD *)((char *)this + 28) = v4;
  *(_OWORD *)((char *)this + 44) = v4;
  *(_OWORD *)((char *)this + 60) = v4;
  *(_OWORD *)((char *)this + 76) = v4;
  *(_OWORD *)((char *)this + 92) = v4;
  *(_OWORD *)((char *)this + 108) = v4;
  *(_OWORD *)((char *)this + 124) = v4;
  *((_DWORD *)this + 36) = a2;
  *((_QWORD *)this + 20) = malloc_type_malloc((unint64_t)a2 << 6, 0x102004061925B30uLL);
  *((_QWORD *)this + 22) = 0x20000000000;
  *((_QWORD *)this + 21) = malloc_type_realloc(*((void **)this + 21), 0x1000uLL, 0x2004093837F09uLL);
  return 1;
}

uint64_t GLRResourceList::releaseToPool(GLRResourceList *this)
{
  GLRResourceList *v1;
  uint64_t v2;
  GLRResourceList **v3;

  v1 = this;
  v2 = *((_QWORD *)this + 23);
  if (v2)
  {
    *((_QWORD *)this + 23) = 0;
    _os_nospin_lock_lock();
    *((_QWORD *)v1 + 24) = 0;
    v3 = *(GLRResourceList ***)(v2 + 24);
    *((_QWORD *)v1 + 25) = v3;
    *v3 = v1;
    *(_QWORD *)(v2 + 24) = (char *)v1 + 192;
    ++*(_DWORD *)(v2 + 36);
    _os_nospin_lock_unlock();
    v1 = (GLRResourceList *)v2;
  }
  return (*(uint64_t (**)(GLRResourceList *))(*(_QWORD *)v1 + 24))(v1);
}

uint64_t GLRResourceList::addResource(uint64_t this, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GLRResource **v12;
  uint64_t i;
  unsigned int v14;
  _WORD *v15;
  unsigned int v16;
  uint64_t v17;
  GLRResource **v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v3 = this;
  v4 = this + 2 * (((unint64_t)a2 >> 6) & 0x3F);
  v7 = *(unsigned __int16 *)(v4 + 12);
  v6 = (_WORD *)(v4 + 12);
  v5 = v7;
  if (v7 == 0xFFFFLL)
  {
LABEL_15:
    v19 = *(_DWORD *)(this + 140);
    if (v19 >= 0xFFFE)
      abort();
    v20 = *(unsigned int *)(this + 144);
    if (v19 >= v20)
    {
      *(_DWORD *)(this + 144) = 2 * v20;
      *(_QWORD *)(this + 160) = malloc_type_realloc(*(void **)(this + 160), v20 << 7, 0x102004061925B30uLL);
      v19 = *(_DWORD *)(v3 + 140);
    }
    *(_DWORD *)(v3 + 140) = v19 + 1;
    (*(void (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
    this = GLRResource::incrementUsage(a2);
    v21 = *(_QWORD *)(v3 + 160);
    *(_QWORD *)(v3 + 152) += *(_QWORD *)(a2 + 24);
    *(_QWORD *)(v21 + ((unint64_t)(unsigned __int16)v19 << 6)) = a2;
    v22 = *(_QWORD *)(v3 + 160) + ((unint64_t)(unsigned __int16)v19 << 6);
    *(_WORD *)(v22 + 60) = 1;
    *(_WORD *)(v22 + 62) = *v6;
    *v6 = v19;
  }
  else
  {
    v8 = *(_QWORD *)(this + 160);
    v9 = v8 + (v5 << 6);
    v10 = *(unsigned __int16 *)(v9 + 60);
    if (*(_WORD *)(v9 + 60))
    {
      v11 = *(unsigned __int16 *)(v9 + 60);
      v12 = (GLRResource **)(v8 + (v5 << 6));
      while (*v12 != (GLRResource *)a2)
      {
        ++v12;
        if (!--v11)
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      for (i = v8 + (v5 << 6); ; i = v8 + ((unint64_t)v14 << 6))
      {
        v16 = *(unsigned __int16 *)(i + 62);
        v15 = (_WORD *)(i + 62);
        v14 = v16;
        if (v10 <= 6 && v14 == 0xFFFF)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
          this = GLRResource::incrementUsage(a2);
          *(_QWORD *)(v3 + 152) += *(_QWORD *)(a2 + 24);
          *(_QWORD *)(v9 + 8 * v10) = a2;
          *(_WORD *)(v9 + 60) = v10 + 1;
          return this;
        }
        if (v14 == 0xFFFF)
          goto LABEL_15;
        if (*(_WORD *)(v9 + 60))
          break;
LABEL_14:
        ;
      }
      v17 = *(unsigned __int16 *)(v9 + 60);
      v18 = (GLRResource **)(v8 + (v5 << 6));
      while (*v18 != (GLRResource *)a2)
      {
        ++v18;
        if (!--v17)
          goto LABEL_14;
      }
      v23 = v8 + ((unint64_t)v14 << 6);
      *v15 = *(_WORD *)(v23 + 62);
      *(_WORD *)(v23 + 62) = v5;
      *v6 = v14;
    }
  }
  return this;
}

uint64_t GLDSamplerRec::initWithShareGroup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8;
  id v9;

  GLDLibrary::getAllDisplayMask((GLDLibrary *)a1);
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a4;
  v8 = *(_DWORD *)(a2 + 28) + 1;
  *(_DWORD *)(a2 + 28) = v8;
  *(_DWORD *)(a1 + 12) = v8;
  v9 = objc_alloc_init(MEMORY[0x24BDDD6F0]);
  *(_QWORD *)(a1 + 48) = v9;
  objc_msgSend(v9, "setLabel:", *MEMORY[0x24BDDD9C0]);
  return 1;
}

uint64_t GLDSamplerRec::dealloc(GLDSamplerRec *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 5);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDSamplerRec::update(GLDSamplerRec *this)
{
  uint64_t v1;
  float *v3;
  int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t MetalWrapMode;
  uint64_t v10;
  uint64_t v11;
  float v12;
  double v13;
  int v14;
  unint64_t *v15;
  unint64_t v16;
  double v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  GLRSamplerResource *v21;
  GLRSamplerResource *v22;
  void *v23;
  _Unwind_Exception *v25;

  v3 = (float *)*((_QWORD *)this + 3);
  v4 = *(unsigned __int16 *)v3;
  v5 = *((unsigned __int16 *)v3 + 1);
  if (v4 == 35416 || v5 == 35416)
  {
    LOWORD(v5) = -30120;
    LOWORD(v4) = -30120;
  }
  if ((unsigned __int16)v4 <= 0x26FFu)
  {
    if ((unsigned __int16)v4 == 9728)
    {
      v1 = 0;
      v7 = 0;
    }
    else
    {
      if ((unsigned __int16)v4 != 9729)
        goto LABEL_53;
      v1 = 0;
LABEL_15:
      v7 = 1;
    }
  }
  else
  {
    switch((__int16)v4)
    {
      case 9984:
        v7 = 0;
        v1 = 1;
        break;
      case 9985:
        v1 = 1;
        goto LABEL_15;
      case 9986:
        v7 = 0;
        goto LABEL_18;
      case 9987:
        v7 = 1;
LABEL_18:
        v1 = 2;
        break;
      default:
        if ((unsigned __int16)v4 != 35416)
          goto LABEL_53;
        v1 = 0;
        v7 = 2;
        break;
    }
  }
  if ((unsigned __int16)v5 == 9728)
  {
    v8 = 0;
  }
  else
  {
    if ((unsigned __int16)v5 != 35416)
    {
      if ((unsigned __int16)v5 == 9729)
      {
        v8 = 1;
        goto LABEL_26;
      }
      MTLReleaseAssertionFailure();
LABEL_53:
      v25 = (_Unwind_Exception *)MTLReleaseAssertionFailure();
      GLDObject::operator delete((void *)v1);
      _Unwind_Resume(v25);
    }
    v8 = 2;
  }
LABEL_26:
  objc_msgSend(*((id *)this + 6), "setMinFilter:", v7);
  objc_msgSend(*((id *)this + 6), "setMagFilter:", v8);
  objc_msgSend(*((id *)this + 6), "setMipFilter:", v1);
  MetalWrapMode = getMetalWrapMode(*((unsigned __int16 *)v3 + 4));
  v10 = getMetalWrapMode(*((unsigned __int16 *)v3 + 5));
  v11 = getMetalWrapMode(*((unsigned __int16 *)v3 + 6));
  objc_msgSend(*((id *)this + 6), "setSAddressMode:", MetalWrapMode);
  objc_msgSend(*((id *)this + 6), "setTAddressMode:", v10);
  objc_msgSend(*((id *)this + 6), "setRAddressMode:", v11);
  v12 = v3[4];
  if (v12 >= 0x10)
  {
    objc_msgSend(*((id *)this + 6), "setMaxAnisotropy:", 16);
LABEL_38:
    v15 = (unint64_t *)(*(_QWORD *)(*((_QWORD *)this + 2) + 224) + 536);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 | 0x20000, v15));
    goto LABEL_40;
  }
  if (v12 <= 1.0)
  {
    v14 = 0;
  }
  else if (v12 <= 2.0)
  {
    v14 = 1;
  }
  else if (v12 <= 4.0)
  {
    v14 = 2;
  }
  else if (v12 <= 8.0)
  {
    v14 = 3;
  }
  else
  {
    v14 = 4;
  }
  objc_msgSend(*((id *)this + 6), "setMaxAnisotropy:", (1 << v14));
  if (v14)
    goto LABEL_38;
LABEL_40:
  *(float *)&v13 = v3[5];
  if (*(float *)&v13 < 0.0)
    *(float *)&v13 = 0.0;
  objc_msgSend(*((id *)this + 6), "setLodMinClamp:", v13);
  *(float *)&v17 = v3[6];
  if (*(float *)&v17 < 0.0)
    *(float *)&v17 = 0.0;
  objc_msgSend(*((id *)this + 6), "setLodMaxClamp:", v17);
  if (*((unsigned __int16 *)v3 + 3) == 34894)
  {
    objc_msgSend(*((id *)this + 6), "setCompareFunction:", *((unsigned __int16 *)v3 + 2) - 512);
    v18 = (unint64_t *)(*(_QWORD *)(*((_QWORD *)this + 2) + 224) + 536);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 | 0x10000, v18));
  }
  else
  {
    objc_msgSend(*((id *)this + 6), "setCompareFunction:", 0);
  }
  v20 = *((_QWORD *)this + 5);
  if (v20)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
    *((_QWORD *)this + 5) = 0;
  }
  GLDObject::operator new((GLDObject *)0x28);
  v22 = v21;
  GLRSamplerResource::GLRSamplerResource(v21);
  *((_QWORD *)this + 5) = v22;
  v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)this + 2) + 232), "newSamplerStateWithDescriptor:", *((_QWORD *)this + 6));
  GLRSamplerResource::initWithMetalSampler(*((GLDLibrary **)this + 5), v23);

  return 1;
}

uint64_t getMetalWrapMode(int a1)
{
  uint64_t v2;
  GLDObject *v3;

  if (a1 > 33647)
  {
    if (a1 == 33648)
      return 3;
    if (a1 == 37905)
      return 4;
  }
  else
  {
    if (a1 == 10497)
      return 2;
    if (a1 == 33071)
      return 0;
  }
  v2 = MTLReleaseAssertionFailure();
  return gldDestroySampler(v2, v3);
}

uint64_t gldDestroySampler(uint64_t a1, GLDObject *this)
{
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  if (this)
    GLDObject::release((unsigned int *)this);
  if (*(_DWORD *)(a1 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  return 0;
}

void GLDShareGroupRec::~GLDShareGroupRec(GLDShareGroupRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDShareGroupRec::initWithDevice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  GLDLibrary::getAllDisplayMask((GLDLibrary *)a1);
  *(_QWORD *)(a1 + 224) = a2;
  GLDObject::retain(a2);
  *(_QWORD *)(a1 + 216) = a3;
  *(_QWORD *)(a1 + 232) = *(id *)(a2 + 24);
  *(_QWORD *)(a1 + 256) = 850045863;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_QWORD *)(a1 + 312) = 0;
  *(_QWORD *)(a1 + 320) = 850045863;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_QWORD *)(a1 + 376) = 0;
  *(_QWORD *)(a1 + 384) = 1018212795;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_QWORD *)(a1 + 424) = 0;
  *(_QWORD *)(a1 + 432) = glgCreateProcessor();
  return 1;
}

uint64_t GLDShareGroupRec::dealloc(GLDShareGroupRec *this)
{
  uint64_t v2;
  char v3;
  char v4;
  char *v5;
  uint64_t i;
  unsigned int *v7;

  glgDestroyProcessor();

  GLDObject::release(*((unsigned int **)this + 28));
  v2 = 0;
  v3 = 1;
  do
  {
    v4 = v3;
    v5 = (char *)this + 88 * v2;
    for (i = 40; i != 128; i += 8)
    {
      v7 = *(unsigned int **)&v5[i];
      if (v7)
        GLDObject::release(v7);
    }
    v3 = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDShareGroupRec::contextRetain(pthread_mutex_t *this)
{
  pthread_mutex_t *v2;

  v2 = this + 4;
  pthread_mutex_lock(this + 4);
  GLDObject::retain((uint64_t)this);
  if (*(int *)this->__opaque >= 3)
    *(_DWORD *)&this[3].__opaque[48] = 1;
  return pthread_mutex_unlock(v2);
}

GLDObject *GLDShareGroupRec::createZeroTexture(GLDShareGroupRec *this, int a2, int a3)
{
  int v6;
  int v7;
  char v8;
  unsigned int v9;
  _BOOL4 v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  char v19;
  __int16 v20;
  __int16 v21;
  char v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  GLDObject *result;
  GLDObject *v33;

  if (a3 == 10)
  {
    v11 = 15;
    v7 = 1;
    v9 = 6;
    v8 = 2;
    v10 = 1;
  }
  else
  {
    if (a3)
      v6 = 1;
    else
      v6 = 6;
    if (a3 == 2)
      v7 = 1;
    else
      v7 = v6;
    v8 = 0;
    v9 = 1;
    v10 = a3 != 2;
    if (a3 == 2)
      v11 = 1;
    else
      v11 = 15;
  }
  v33 = 0;
  v12 = 32 * v7 * v11 + 264;
  v13 = (char *)malloc_type_calloc(1uLL, v12 + 4 * v9 + 24, 0x18477F53uLL);
  v14 = (uint64_t)v13;
  v15 = 0;
  v16 = (uint64_t)&v13[v12];
  v17 = (uint64_t)&v13[v12 + 24];
  do
  {
    *(_DWORD *)(v17 + v15) = -16777216;
    v15 += 4;
  }
  while (4 * v9 != v15);
  *(_WORD *)v13 = a3 & 0xF | 0x1000;
  *((_WORD *)v13 + 3) = 1028;
  *((_DWORD *)v13 + 2) = 1065353216;
  if (a2)
    v18 = 6402;
  else
    v18 = 6408;
  *((_WORD *)v13 + 2) = v18;
  v19 = v13[24] & 0xE3 | 0xC;
  *((_QWORD *)v13 + 4) = 0;
  *((_QWORD *)v13 + 5) = 0;
  v13[24] = v19;
  *((_DWORD *)v13 + 38) = 687941889;
  *((_WORD *)v13 + 78) = 10497;
  *((_OWORD *)v13 + 10) = xmmword_23106B060;
  *((_QWORD *)v13 + 18) = 0x20326002600;
  *(_QWORD *)(v13 + 116) = 0x3E800000000;
  *((_DWORD *)v13 + 31) = 0;
  v13[130] &= 0xFAu;
  *((_DWORD *)v13 + 28) = 420054461;
  *((_DWORD *)v13 + 33) = 0;
  v20 = *((_WORD *)v13 + 64) & 0xF000;
  *((_QWORD *)v13 + 17) = 0;
  *((_WORD *)v13 + 64) = v20 | 0x688;
  switch(a3)
  {
    case 1:
      v21 = *((_WORD *)v13 + 107);
      v22 = 20;
      goto LABEL_26;
    case 2:
    case 8:
      v21 = *((_WORD *)v13 + 107);
      v22 = 5;
      goto LABEL_26;
    case 4:
      v23 = *((_WORD *)v13 + 107) & 0xC0FF;
      break;
    case 5:
    case 10:
      v21 = *((_WORD *)v13 + 107);
      v22 = 36;
      goto LABEL_26;
    case 6:
      v23 = *((_WORD *)v13 + 107) & 0xC0FF | 0x2000;
      break;
    case 7:
      v23 = *((_WORD *)v13 + 107) & 0xC0FF | 0x100;
      break;
    case 9:
      v21 = *((_WORD *)v13 + 107);
      v22 = 37;
LABEL_26:
      v23 = v21 & 0xC0FF | ((v22 & 0x3F) << 8);
      break;
    default:
      v23 = *((_WORD *)v13 + 107) & 0xC0FF | 0x400;
      break;
  }
  v24 = 0;
  v13[211] = v7;
  v13[213] = v11;
  *((_DWORD *)v13 + 50) = -2090368799;
  *((_WORD *)v13 + 98) = 1;
  *((_WORD *)v13 + 99) = v9;
  *((_WORD *)v13 + 107) = v23 & 0xBF00 | 0x4000;
  *((_DWORD *)v13 + 48) = 98392;
  *((_WORD *)v13 + 102) = 0;
  if (v11 <= 2)
    v25 = 2;
  else
    v25 = v11;
  v13[206] = v8;
  *(_DWORD *)(v13 + 207) = 0x10000;
  *(_BYTE *)(v16 + 20) = -113;
  v26 = v13 + 314;
  v27 = v25 - 1;
  *(_QWORD *)(v16 + 8) = -1;
  *(_DWORD *)(v16 + 16) = -1;
  do
  {
    v28 = v14 + 480 * v24;
    *(_DWORD *)(v28 + 268) = 65537;
    *(_WORD *)(v28 + 272) = v9;
    *(_QWORD *)(v28 + 288) = v17;
    *(_QWORD *)(v28 + 276) = 0x836780E100010001;
    *(_BYTE *)(v28 + 275) = 48;
    v29 = v14 + 2 * v24;
    *(_WORD *)(v29 + 216) |= 1u;
    *(_WORD *)(v29 + 228) |= 1u;
    if (v10)
    {
      v30 = v27;
      v31 = v26;
      do
      {
        *(_DWORD *)(v31 - 2) = 335616264;
        v31 += 32;
        --v30;
      }
      while (v30);
    }
    ++v24;
    v26 += 480;
  }
  while (v24 != v7);
  gldCreateTexture((uint64_t)this, &v33, v14, v16);
  result = v33;
  *((_QWORD *)v33 + 2) = v14;
  return result;
}

uint64_t gldCreateShareGroup(uint64_t a1, GLDObject **a2, uint64_t a3)
{
  GLDObject *v6;
  GLDObject *v7;

  GLDObject::operator new((GLDObject *)0x1C0);
  v7 = v6;
  GLDObject::GLDObject(v6);
  *(_QWORD *)v7 = off_24FFEB6C8;
  GLDShareGroupRec::initWithDevice((uint64_t)v7, a1, a3);
  *a2 = v7;
  return 0;
}

void sub_23105C214(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldDestroyShareGroup(unsigned int *a1)
{
  if (a1)
    GLDObject::release(a1);
  return 0;
}

uint64_t GLDShareGroupRec::signalUsage(GLDShareGroupRec *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 320);
  pthread_mutex_lock((pthread_mutex_t *)this + 5);
  pthread_cond_broadcast((pthread_cond_t *)this + 8);
  return pthread_mutex_unlock(v2);
}

uint64_t GLDShareGroupRec::waitUsage(GLDShareGroupRec *this, volatile int *a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)((char *)this + 320);
  pthread_mutex_lock((pthread_mutex_t *)this + 5);
  while (*a2)
  {
    *((_DWORD *)this + 8) |= 0x8000u;
    pthread_cond_wait((pthread_cond_t *)this + 8, v4);
  }
  return pthread_mutex_unlock(v4);
}

uint64_t GLDShareGroupRec::waitForObject(GLDShareGroupRec *this, int a2, unsigned int a3, GLDTextureRec *a4)
{
  GLDTextureRec *v4;
  uint64_t MemoryPlugin;
  uint64_t TextureResource;

  v4 = a4;
  if (!a2)
    goto LABEL_10;
  if (a2 != 1)
  {
    if (a2 != 3)
      return 0;
    MemoryPlugin = GLDBufferRec::getMemoryPlugin(a4);
    if (!MemoryPlugin)
      return 0;
    v4 = *(GLDTextureRec **)(MemoryPlugin + 24);
    if (!v4)
      return 0;
LABEL_10:
    (*(void (**)(GLDTextureRec *, GLDShareGroupRec *))(*(_QWORD *)v4 + 40))(v4, this);
    return 0;
  }
  TextureResource = GLDTextureRec::getTextureResource(a4, 0);
  if (TextureResource)
    (*(void (**)(uint64_t, GLDShareGroupRec *))(*(_QWORD *)TextureResource + 40))(TextureResource, this);
  v4 = (GLDTextureRec *)GLDTextureRec::getTextureResource(v4, 1u);
  if (v4)
    goto LABEL_10;
  return 0;
}

uint64_t gldWaitForObject(GLDShareGroupRec *a1, int a2, unsigned int a3, GLDTextureRec *a4)
{
  GLDShareGroupRec::waitForObject(a1, a2, a3, a4);
  return 0;
}

void GLDTextureRec::~GLDTextureRec(GLDTextureRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t glrConvertMultisampleCount(unsigned int a1)
{
  unsigned int v1;

  if (a1 == 2)
    v1 = 2;
  else
    v1 = 4 * (a1 < 5);
  if (a1 >= 2)
    return v1;
  else
    return 1;
}

uint64_t GLDTextureRec::dealloc(GLDTextureRec *this)
{
  NSObject *v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *((_QWORD *)this + 17);
  if (v2)
  {
    dispatch_release(v2);
    *((_QWORD *)this + 17) = 0;
  }
  for (i = 152; i != 184; i += 8)
  {
    v4 = *(_QWORD *)((char *)this + i);
    if (v4)
    {
      objc_msgSend(*(id *)(v4 + 32), "waitUntilComplete");
      (*(void (**)(_QWORD))(**(_QWORD **)((char *)this + i) + 24))(*(_QWORD *)((char *)this + i));
    }
  }
  v5 = *((_QWORD *)this + 3);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);

  v6 = *((_QWORD *)this + 24);
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
  v7 = *((_QWORD *)this + 4);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  v8 = *((_QWORD *)this + 23);
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
  v9 = (void *)*((_QWORD *)this + 2);
  if (v9)
    free(v9);
  return GLDObject::dealloc((uint64_t)this);
}

BOOL GLDTextureRec::load(GLDTextureRec *this)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *((_QWORD *)this + 7);
  v2 = *(unsigned __int8 *)(v1 + 20);
  if (!*(_BYTE *)(v1 + 20))
    return v2 == 0;
  v4 = *((_QWORD *)this + 5);
  if (!*(_DWORD *)(v4 + 248))
  {
    v7 = *(_DWORD *)(v4 + 24) + 1;
    *(_DWORD *)(v4 + 24) = v7;
    *((_DWORD *)this + 3) = v7;
LABEL_6:
    if (GLDTextureRec::update(this, v2, (unsigned __int16 *)(v1 + 8)))
    {
      v8 = *((_QWORD *)this + 7);
      *(_QWORD *)(v8 + 13) = 0;
      *(_QWORD *)(v8 + 8) = 0;
      GLDDeviceRec::telemetryTexture(*(_QWORD *)(*((_QWORD *)this + 5) + 224), this);
      v2 = 0;
    }
    goto LABEL_8;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 256));
  v1 = *((_QWORD *)this + 7);
  v2 = *(unsigned __int8 *)(v1 + 20);
  v5 = *((_QWORD *)this + 5);
  v6 = *(_DWORD *)(v5 + 24) + 1;
  *(_DWORD *)(v5 + 24) = v6;
  *((_DWORD *)this + 3) = v6;
  if (v2)
    goto LABEL_6;
LABEL_8:
  v9 = *((_QWORD *)this + 5);
  if (*(_DWORD *)(v9 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 256));
  return v2 == 0;
}

uint64_t GLDTextureRec::reclaim(GLDTextureRec *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = *((_QWORD *)this + 3);
  if (v2)
  {
    v3 = *((_QWORD *)this + 5);
    if (!*(_DWORD *)(v3 + 248)
      || (pthread_mutex_lock((pthread_mutex_t *)(v3 + 256)), (v2 = *((_QWORD *)this + 3)) != 0))
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
      *((_QWORD *)this + 3) = 0;
    }
    v4 = *((_QWORD *)this + 4);
    if (v4)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
      *((_QWORD *)this + 4) = 0;
    }
    v5 = *((_QWORD *)this + 5);
    if (*(_DWORD *)(v5 + 248))
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 256));
  }
  result = *((_QWORD *)this + 24);
  if (result)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
    *((_QWORD *)this + 24) = 0;
  }
  *(_BYTE *)(*((_QWORD *)this + 7) + 20) = 15;
  return result;
}

uint64_t GLDTextureRec::modify(GLDTextureRec *this)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(*((_QWORD *)this + 7) + 20) |= 2u;
  if (*((_QWORD *)this + 3))
  {
    v2 = *((_QWORD *)this + 5);
    if (!*(_DWORD *)(v2 + 248) || (pthread_mutex_lock((pthread_mutex_t *)(v2 + 256)), *((_QWORD *)this + 3)))
    {
      v3 = 0;
      v4 = (char *)this + 152;
      do
      {
        v5 = *(_QWORD *)&v4[v3];
        if (v5)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
          *(_QWORD *)&v4[v3] = 0;
        }
        v3 += 8;
      }
      while (v3 != 32);
      (*(void (**)(_QWORD))(**((_QWORD **)this + 3) + 24))(*((_QWORD *)this + 3));
      *((_QWORD *)this + 3) = 0;
    }
    v6 = *((_QWORD *)this + 4);
    if (v6)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
      *((_QWORD *)this + 4) = 0;
    }
    v7 = *((_QWORD *)this + 5);
    if (*(_DWORD *)(v7 + 248))
      pthread_mutex_unlock((pthread_mutex_t *)(v7 + 256));
  }
  v8 = *((_QWORD *)this + 24);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
    *((_QWORD *)this + 24) = 0;
  }
  return 0;
}

uint64_t GLDTextureRec::restoreData(GLDTextureRec *this, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  NSObject *v5;
  uint64_t v6;
  _QWORD block[6];
  int v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN13GLDTextureRec11restoreDataEii_block_invoke;
  block[3] = &unk_24FFEB218;
  block[4] = &v11;
  block[5] = this;
  v9 = a2;
  v10 = a3;
  v5 = *((_QWORD *)this + 17);
  if (v5)
    dispatch_sync(v5, block);
  else
    ___ZN13GLDTextureRec11restoreDataEii_block_invoke((uint64_t)block, a2, a3, a4, a5);
  v6 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_23105C780(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN13GLDTextureRec11restoreDataEii_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  GLDTextureRec *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(GLDTextureRec **)(a1 + 40);
  v7 = *((_QWORD *)v6 + 5);
  if (*(_DWORD *)(v7 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(v7 + 256));
  if (*((_QWORD *)v6 + 3))
  {
    GLDTextureRec::readTextureDataInternal(v6, *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), a4, a5, *(char **)(*((_QWORD *)v6 + 6) + 480 * *(int *)(a1 + 48) + 32 * *(int *)(a1 + 52) + 288));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  v8 = *((_QWORD *)v6 + 5);
  *(_DWORD *)(v8 + 32) |= 1u;
  if (*(_DWORD *)(v8 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + 256));
}

void GLDTextureRec::readTextureDataInternal(GLDTextureRec *this, int a2, int a3, unsigned int a4, unsigned int a5, char *a6)
{
  uint64_t v7;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  unsigned __int16 *v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  unsigned __int16 *v28;
  int v29;
  char *v30;
  int v31;
  char *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int16 *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unsigned __int16 *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void *v51;
  GLDTextureRec *v52;
  unsigned int v53;
  void *v54;
  char v55;
  void *v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  int v70;
  int v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v7 = *((_QWORD *)this + 3);
  if (v7)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v7 + 40))(v7, *((_QWORD *)this + 5));
    if (objc_msgSend(*((id *)this + 15), "textureType") == 7)
      v11 = 4;
    else
      v11 = 3;
    v12 = *((_DWORD *)this + 16);
    v80 = 0;
    v78 = 0u;
    v79 = 0u;
    v77 = 0u;
    MTLPixelFormatGetInfo();
    v13 = *((_QWORD *)this + 6);
    v14 = a2;
    v15 = *(unsigned __int16 *)(v13 + 480 * a2 + 32 * a3 + 280);
    v16 = *((_DWORD *)this + 16);
    v17 = LODWORD((&glrTextureFormats)[5 * v16 + 1]) != v15
       || *((_DWORD *)&glrTextureFormats + 10 * v16 + 3) != *(unsigned __int16 *)(v13 + 480 * a2 + 32 * a3 + 282);
    if (v15 == 6402 && *(_WORD *)(v13 + 480 * a2 + 32 * a3 + 282) == 5126)
      v17 = 1;
    v18 = *(void **)(*((_QWORD *)this + 3) + 32);
    v19 = *(unsigned __int8 *)(v13 + 24);
    v76 = 0;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v56 = a6;
    v55 = v19 | v17;
    if (((v19 | v17) & 1) != 0)
    {
      LODWORD(v68) = 0;
      v67 = 0;
      v20 = (unsigned __int16 *)(v13 + 480 * v14 + 32 * a3);
      glrPixelSettings(v15, v20[141], v20[134], v20[135], (int *)&v68, (_DWORD *)&v67 + 1, &v67, 0, v11);
      v21 = v68;
      LODWORD(v68) = v21 * objc_msgSend(*((id *)this + 15), "sampleCount");
      v22 = *(unsigned __int16 *)(*((_QWORD *)this + 6) + 480 * v14 + 32 * a3 + 268) * DWORD2(v78);
      v23 = v22 * objc_msgSend(*((id *)this + 15), "sampleCount");
      v24 = *((_QWORD *)this + 6) + 480 * v14 + 32 * a3;
      v25 = *(unsigned __int16 *)(v24 + 270) * (uint64_t)v23;
      v26 = (char *)malloc_type_malloc(v25 * *(unsigned __int16 *)(v24 + 272), 0xD7567202uLL);
      v53 = v12;
      v27 = v26;
      v28 = (unsigned __int16 *)(*((_QWORD *)this + 6) + 480 * v14 + 32 * a3);
      DWORD1(v75) = v28[134];
      v29 = v28[136] * v28[135];
      v30 = &v26[(v29 - 1) * v23];
      if ((v19 & 1) != 0)
      {
        v31 = -v23;
      }
      else
      {
        v30 = v26;
        v31 = v23;
      }
      *(_QWORD *)&v72 = v30;
      DWORD2(v75) = v29;
      LODWORD(v73) = v31;
      glgConvertType();
      *((_QWORD *)&v72 + 1) = a6;
      HIDWORD(v73) = v68;
      glgConvertType();
      v32 = v27;
      HIDWORD(v74) = (&glrTextureFormats)[5 * v53 + 2];
      LODWORD(v75) = -1;
      v33 = v25;
    }
    else
    {
      if ((BYTE9(v77) & 0x20) != 0)
      {
        v23 = 0;
        v33 = 0;
      }
      else
      {
        objc_msgSend(*((id *)this + 15), "sampleCount");
        MTLGetTextureLevelInfoForDeviceWithOptions();
        v23 = v70;
        v33 = v71;
      }
      v32 = a6;
    }
    v34 = *((_QWORD *)this + 11);
    v54 = v32;
    switch(v34)
    {
      case 0:
        v36 = (unsigned __int16 *)(*((_QWORD *)this + 6) + 480 * (int)v14 + 32 * a3 + 268);
        v37 = 1;
        goto LABEL_25;
      case 1:
        v41 = v18;
        v42 = *((_QWORD *)this + 6);
        v43 = (unsigned __int16 *)(v42 + 480 * (int)v14 + 32 * a3 + 270);
        v40 = 1;
        goto LABEL_35;
      case 2:
      case 4:
      case 5:
        v35 = *((_QWORD *)this + 6) + 480 * (int)v14 + 32 * a3;
        v36 = (unsigned __int16 *)(v35 + 268);
        v37 = *(unsigned __int16 *)(v35 + 270);
LABEL_25:
        LODWORD(v38) = 1;
        goto LABEL_26;
      case 3:
        v41 = v18;
        v42 = *((_QWORD *)this + 6);
        v44 = v42 + 480 * (int)v14 + 32 * a3;
        v40 = *(unsigned __int16 *)(v44 + 270);
        v43 = (unsigned __int16 *)(v44 + 272);
LABEL_35:
        v45 = *v43;
        v39 = *(unsigned __int16 *)(v42 + 480 * (int)v14 + 32 * a3 + 268);
        v68 = 0uLL;
        v69 = 0;
        if (v45)
        {
          v46 = 0;
          if (v34 == 1)
            v47 = v23;
          else
            v47 = v33;
          v48 = v33;
          v49 = v47;
          v50 = v32;
          v51 = v41;
          do
          {
            v57 = v68;
            v58 = v69;
            v59 = v39;
            v60 = v40;
            v61 = 1;
            objc_msgSend(v51, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v50, v23, v48, &v57, a3, v46);
            v50 += v49;
            ++v46;
          }
          while (v45 != v46);
        }
        else
        {
          v38 = 1;
          v18 = v41;
LABEL_27:
          v62 = v68;
          v63 = v69;
          v64 = v39;
          v65 = v40;
          v66 = v38;
          objc_msgSend(v18, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:");
        }
        if ((v55 & 1) != 0)
          glgProcessPixelsWithProcessor();
        if (v54 != v56)
          free(v54);
        break;
      case 6:
      case 7:
        v38 = *((_QWORD *)this + 6) + 480 * (int)v14 + 32 * a3;
        v36 = (unsigned __int16 *)(v38 + 268);
        v37 = *(unsigned __int16 *)(v38 + 270);
        LODWORD(v38) = *(unsigned __int16 *)(v38 + 272);
LABEL_26:
        v38 = v38;
        v39 = *v36;
        v68 = 0uLL;
        v69 = 0;
        v40 = v37;
        goto LABEL_27;
      default:
        v52 = (GLDTextureRec *)MTLReleaseAssertionFailure();
        GLDTextureRec::updatePixelFormat(v52);
        return;
    }
  }
}

void GLDTextureRec::updatePixelFormat(GLDTextureRec *this)
{
  _WORD *v2;
  int v3;
  unsigned int v4;
  unsigned __int16 *v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  char v11;
  int v12;

  v2 = (_WORD *)*((_QWORD *)this + 6);
  v3 = (unsigned __int16)v2[96];
  v4 = (unsigned __int16)v2[100];
  if (v4 == 5 || v4 == 3)
  {
    v4 = (unsigned __int16)v2[140];
    v6 = v2 + 141;
  }
  else
  {
    v6 = v2 + 101;
  }
  v7 = 0;
  v8 = *v6;
  v9 = v3 == 35056 || v3 == 36013;
  if (v9)
    v10 = 2;
  else
    v10 = 1;
  v11 = v9;
  *((_DWORD *)this + 19) = v10;
  *((_BYTE *)this + 72) = v11;
  *((_BYTE *)this + 73) = (*v2 & 0x800) != 0;
  *((_QWORD *)this + 8) = 0;
  do
  {
    GLDTextureRec::chooseTextureFormat(this, v4, v8, v3);
    *((_DWORD *)this + v7++ + 16) = v12;
  }
  while (v7 < *((int *)this + 19));
  *((_BYTE *)this + 75) = 0;
}

uint64_t GLDTextureRec::getMetalSwizzleKey(GLDTextureRec *this)
{
  unsigned int v1;
  int v2;
  int v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  int v9;
  __int16 v10;

  v1 = *((_DWORD *)this + 16);
  v2 = (int)(&glrTextureFormats)[5 * v1 + 1];
  if (v2 == 34041 || v2 == 6402)
  {
    v6 = *((_QWORD *)this + 6);
    v4 = *(unsigned __int16 *)(v6 + 114);
    if (v4 == 6409)
    {
      v5 = 16908802;
    }
    else
    {
      if (v4 != 6403)
        goto LABEL_11;
      v5 = 16777218;
    }
    v9 = v5;
    goto LABEL_11;
  }
  v9 = (int)(&glrTextureFormats)[5 * v1 + 4];
  v6 = *((_QWORD *)this + 6);
LABEL_11:
  v10 = 256;
  v7 = *(unsigned __int16 *)(v6 + 128);
  return *((unsigned __int8 *)&v9 + (v7 & 7)) | (*((unsigned __int8 *)&v9 + ((v7 >> 3) & 7)) << 8) | (*((unsigned __int8 *)&v9 + ((v7 >> 6) & 7)) << 16) | (*((unsigned __int8 *)&v9 + ((v7 >> 9) & 7)) << 24);
}

void *GLDTextureRec::updateDescriptor(GLDTextureRec *this)
{
  int v2;
  void *v3;
  uint64_t v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char **v28;
  uint64_t v29;
  uint64_t v30;
  void *result;
  char **v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;

  if (!*((_QWORD *)this + 15))
    *((_QWORD *)this + 15) = objc_alloc_init(MEMORY[0x24BDDD740]);
  v2 = *((_DWORD *)this + 19);
  if (v2 == 2)
  {
    if (!*((_QWORD *)this + 16))
      *((_QWORD *)this + 16) = objc_alloc_init(MEMORY[0x24BDDD740]);
  }
  else if (v2 == 1)
  {
    v3 = (void *)*((_QWORD *)this + 16);
    if (v3)
    {

      *((_QWORD *)this + 16) = 0;
    }
  }
  v4 = *((_QWORD *)this + 6);
  if (*(unsigned __int8 *)(v4 + 211) <= 1u)
  {
    if ((*(_WORD *)(v4 + 214) & 0x1800) != 0)
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 1;
      v9 = 7;
    }
    else
    {
      v10 = *(_WORD *)(v4 + 214) & 0x2000;
      if ((*(_WORD *)(v4 + 214) & 0x600) != 0)
      {
        if ((*(_WORD *)(v4 + 214) & 0x2000) != 0)
        {
          v6 = 0;
          v7 = 0;
          v5 = 1;
          v9 = 3;
        }
        else
        {
          v5 = 0;
          v6 = 0;
          v7 = *(unsigned __int8 *)(v4 + 212) > 1u;
          if (*(unsigned __int8 *)(v4 + 212) <= 1u)
            v9 = 2;
          else
            v9 = 4;
        }
      }
      else
      {
        v5 = 0;
        v7 = 0;
        v6 = v10 != 0;
        v9 = v10 >> 13;
      }
      v8 = 1;
    }
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 6;
    v9 = 5;
  }
  *((_QWORD *)this + 11) = v9;
  v11 = *(unsigned __int16 *)(v4 + 194);
  v12 = *(_BYTE *)(v4 + 208);
  v13 = *((_DWORD *)&glrTextureFormats + 10 * *((unsigned int *)this + 16) + 9);
  if ((v13 & 0x20) != 0)
    v14 = 1;
  else
    v14 = *(unsigned __int8 *)(v4 + 209);
  if (*(_BYTE *)(v4 + 208))
    v11 = (v11 >> v12) | (v11 >> v12 == 0);
  v40 = v11;
  v41 = v14;
  if (*(_BYTE *)(v4 + 208))
    v15 = ((unint64_t)*(unsigned __int16 *)(v4 + 196) >> v12) | ((unint64_t)*(unsigned __int16 *)(v4 + 196) >> v12 == 0);
  else
    v15 = *(unsigned __int16 *)(v4 + 196);
  if (*(_BYTE *)(v4 + 208))
    v16 = ((unint64_t)*(unsigned __int16 *)(v4 + 198) >> v12) | ((unint64_t)*(unsigned __int16 *)(v4 + 198) >> v12 == 0);
  else
    v16 = *(unsigned __int16 *)(v4 + 198);
  v17 = v5 == 0;
  if (v5)
    v18 = 1;
  else
    v18 = v16;
  v39 = v18;
  if (v17)
    v19 = 1;
  else
    v19 = *(unsigned __int16 *)(v4 + 198);
  v20 = !v6;
  if (v6)
    v21 = 1;
  else
    v21 = v15;
  v38 = v21;
  if (v20)
    v22 = v19;
  else
    v22 = *(unsigned __int16 *)(v4 + 196);
  v37 = v22 * v8;
  if (v7)
  {
    v23 = *(unsigned __int8 *)(v4 + 212);
    v24 = v23 >= 2;
    if (v23 == 2)
      v25 = 2;
    else
      v25 = 4 * (v23 < 5);
    if (v24)
      v26 = v25;
    else
      v26 = 1;
  }
  else
  {
    v26 = 1;
  }
  if ((v13 & 0x100) != 0)
    v27 = 17;
  else
    v27 = 1;
  v36 = v9;
  objc_msgSend(*((id *)this + 15), "setTextureType:");
  objc_msgSend(*((id *)this + 15), "setPixelFormat:", (&glrTextureFormats)[5 * *((unsigned int *)this + 16) + 3]);
  objc_msgSend(*((id *)this + 15), "setWidth:", v40);
  objc_msgSend(*((id *)this + 15), "setHeight:", v38);
  objc_msgSend(*((id *)this + 15), "setDepth:", v39);
  objc_msgSend(*((id *)this + 15), "setSampleCount:", v26);
  objc_msgSend(*((id *)this + 15), "setArrayLength:", v22);
  objc_msgSend(*((id *)this + 15), "setMipmapLevelCount:", v41);
  objc_msgSend(*((id *)this + 15), "setWriteSwizzleEnabled:", 1);
  v28 = &(&glrTextureFormats)[5 * *((unsigned int *)this + 16)];
  if (v28[3] == (char *)253)
    v29 = v27 & 0x10;
  else
    v29 = v27;
  if ((*((_DWORD *)v28 + 9) & 7) != 0)
    v30 = v29 | 4;
  else
    v30 = v29;
  objc_msgSend(*((id *)this + 15), "setUsage:", v30);
  *((_DWORD *)this + 28) = v37;
  MTLGetTextureLevelInfoForDeviceWithOptions();
  *((_QWORD *)this + 12) = 0;
  objc_msgSend(*((id *)this + 15), "setSwizzleKey:", GLDTextureRec::getMetalSwizzleKey(this));
  result = (void *)*((_QWORD *)this + 16);
  if (result)
  {
    objc_msgSend(result, "setTextureType:", v36);
    objc_msgSend(*((id *)this + 16), "setPixelFormat:", (&glrTextureFormats)[5 * *((unsigned int *)this + 17) + 3]);
    objc_msgSend(*((id *)this + 16), "setWidth:", v40);
    objc_msgSend(*((id *)this + 16), "setHeight:", v38);
    objc_msgSend(*((id *)this + 16), "setDepth:", v39);
    objc_msgSend(*((id *)this + 16), "setSampleCount:", v26);
    objc_msgSend(*((id *)this + 16), "setArrayLength:", v22);
    objc_msgSend(*((id *)this + 16), "setMipmapLevelCount:", v41);
    objc_msgSend(*((id *)this + 16), "setWriteSwizzleEnabled:", 1);
    v32 = &(&glrTextureFormats)[5 * *((unsigned int *)this + 17)];
    v33 = v27;
    if (v32[3] == (char *)253)
      v33 = v27 & 0x10;
    if ((*((_DWORD *)v32 + 9) & 7) != 0)
      v34 = v33 | 4;
    else
      v34 = v33;
    objc_msgSend(*((id *)this + 16), "setUsage:", v34);
    result = (void *)MTLGetTextureLevelInfoForDeviceWithOptions();
    v35 = v42;
    if (v41 >= 2)
      v35 = 4 * v42 / 3;
    *((_QWORD *)this + 13) = v35;
  }
  return result;
}

uint64_t GLDTextureRec::getTextureResource(GLDTextureRec *this, unsigned int a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  GLRTextureResource *v17;
  GLRTextureResource *v18;
  int MetalSwizzleKey;
  __int128 v20;
  uint64_t v21;
  _NSRange v22;

  GLDTextureRec::ensureResource((uint64_t)this);
  if ((*(_BYTE *)(*((_QWORD *)this + 6) + 24) & 8) != 0)
    return *((_QWORD *)this + a2 + 3);
  result = *((_QWORD *)this + 24);
  if (!result)
  {
    if ((*(_BYTE *)(*((_QWORD *)this + 7) + 20) & 1) != 0)
      return *((_QWORD *)this + a2 + 3);
    v20 = 0u;
    objc_msgSend(*((id *)this + 15), "pixelFormat", 0, 0, 0, 0, (unsigned __int128)0, 0);
    MTLPixelFormatGetInfoForDevice();
    v5 = objc_msgSend(*((id *)this + 15), "width");
    v6 = objc_msgSend(*((id *)this + 15), "sampleCount");
    v7 = (uint64_t *)&v20 + 1;
    if (v6 > 1)
      v7 = &v21;
    v8 = *v7;
    v9 = objc_msgSend(*(id *)(*((_QWORD *)this + 5) + 232), "deviceLinearTextureAlignmentBytes");
    v10 = (v9 + v8 * v5 - 1) & -v9;
    v11 = v10 * objc_msgSend(*((id *)this + 15), "height");
    v12 = objc_msgSend(*(id *)(*((_QWORD *)this + 5) + 232), "newBufferWithLength:options:", v11, 32);
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(*((id *)this + 15), "setStorageMode:", 2);
      v14 = (_QWORD *)MEMORY[0x24BDDD9C0];
      objc_msgSend(v13, "setLabel:", *MEMORY[0x24BDDD9C0]);
      v15 = (void *)objc_msgSend(v13, "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", *((_QWORD *)this + 15), 0, v10, v11);
      if (v15)
      {
        v16 = v15;
        objc_msgSend(v15, "setLabel:", *v14);
        GLDObject::operator new((GLDObject *)0x40);
        v18 = v17;
        GLRTextureResource::GLRTextureResource(v17);
        if (GLRTextureResource::initWithMetalTexture(v18, v16, *((_QWORD *)this + 12)))
        {
          MetalSwizzleKey = GLDTextureRec::getMetalSwizzleKey(this);
          GLRTextureResource::setSwizzleKey((uint64_t)v18, MetalSwizzleKey);
          GLRTextureResource::setBaseLevelMaxLevel((uint64_t)v18, *(_WORD *)(*((_QWORD *)this + 6) + 214) & 0xF, *(_WORD *)(*((_QWORD *)this + 6) + 214) >> 4);
          v22.length = *((unsigned int *)this + 28);
          v22.location = 0;
          GLRTextureResource::updateSampleViewIfNeeded(v18, (MTLPixelFormat)(&glrTextureFormats)[5 * *((unsigned int *)this + 16) + 3], *((MTLTextureType *)this + 11), v22);
          *((_QWORD *)this + 24) = v18;
        }
        else
        {
          (*(void (**)(GLRTextureResource *))(*(_QWORD *)v18 + 24))(v18);
        }

      }
    }
    result = *((_QWORD *)this + 24);
    if (!result)
      return *((_QWORD *)this + a2 + 3);
  }
  return result;
}

void sub_23105D5A0(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDTextureRec::getIOSurfaceResource(GLDTextureRec *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  char *v10;
  uint64_t v11;
  __IOSurface *v12;
  __IOSurface *v13;
  IOSurfaceID ID;
  id *v15;
  int MetalSwizzleKey;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  __IOSurface *v20;
  GLDLibrary *v21;
  size_t v22;
  void *v23;
  size_t BytesPerRowOfPlane;
  uint64_t result;
  void *v26;
  GLRTextureResource *v27;
  size_t AllocSize;
  uint64_t v29;
  uint64_t v30;
  _NSRange v31;

  v1 = *((_QWORD *)this + 6);
  v2 = *(_QWORD *)(v1 + 256);
  if (!v2)
    return 0;
  v4 = *((_QWORD *)this + 24);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
    *((_QWORD *)this + 24) = 0;
    v1 = *((_QWORD *)this + 6);
    v2 = *(_QWORD *)(v1 + 256);
  }
  v5 = 0;
  v6 = v1 + 48;
  v7 = -1;
  do
  {
    if (v2 == *(_QWORD *)(v6 + 8 * v5))
      v7 = v5;
    ++v5;
  }
  while (v5 != 4);
  if (*((_QWORD *)this + 3))
  {
    v8 = 0;
    v9 = 0;
    v10 = (char *)this + 152;
    do
    {
      v11 = *(_QWORD *)&v10[v8];
      if (v11)
      {
        v12 = (__IOSurface *)objc_msgSend(*(id *)(v11 + 32), "iosurface");
        v13 = *(__IOSurface **)(*((_QWORD *)this + 6) + v8 + 48);
        if (!v13 || (ID = IOSurfaceGetID(v13), ID != IOSurfaceGetID(v12)))
        {
          v15 = *(id **)&v10[v8];
          if (v15 == *((id **)this + 23))
          {
            v9 = 1;
          }
          else
          {
            objc_msgSend(v15[4], "waitUntilComplete");
            (*(void (**)(_QWORD))(**(_QWORD **)&v10[v8] + 24))(*(_QWORD *)&v10[v8]);
            v15 = *(id **)&v10[v8];
          }
          if (v15 == *((id **)this + 3))
          {
            (*((void (**)(id *))*v15 + 3))(v15);
            *((_QWORD *)this + 3) = 0;
          }
          *(_QWORD *)&v10[v8] = 0;
        }
      }
      v8 += 8;
    }
    while (v8 != 32);
    if ((objc_msgSend(*((id *)this + 15), "width") != *(unsigned __int16 *)(*((_QWORD *)this + 6) + 194)
       || objc_msgSend(*((id *)this + 15), "height") != *(unsigned __int16 *)(*((_QWORD *)this + 6) + 196))
      && v9)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)this + 23) + 24))(*((_QWORD *)this + 23));
      *((_QWORD *)this + 23) = 0;
    }
  }
  MetalSwizzleKey = GLDTextureRec::getMetalSwizzleKey(this);
  v17 = 0;
  v18 = (char *)this + 152;
  do
  {
    v19 = *((_QWORD *)this + 6);
    v20 = *(__IOSurface **)(v19 + v17 + 48);
    v21 = *(GLDLibrary **)&v18[v17];
    if (!v20)
      goto LABEL_31;
    if (!v21)
    {
      v22 = *(unsigned __int16 *)(v19 + 248);
      v23 = *(void **)(*((_QWORD *)this + 5) + 232);
      BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v20, v22);
      if (((objc_msgSend(v23, "iosurfaceReadOnlyTextureAlignmentBytes") - 1) & BytesPerRowOfPlane) != 0)
        return 0;
      objc_msgSend(*((id *)this + 15), "setUsage:", ((objc_msgSend(v23, "iosurfaceTextureAlignmentBytes") - 1) & BytesPerRowOfPlane) != 0);
      objc_msgSend(*((id *)this + 15), "setStorageMode:", 0);
      result = objc_msgSend(v23, "newTextureWithDescriptor:iosurface:plane:", *((_QWORD *)this + 15), v20, v22);
      if (!result)
        return result;
      v26 = (void *)result;
      objc_msgSend((id)result, "setLabel:", *MEMORY[0x24BDDD9C0]);
      GLDObject::operator new((GLDObject *)0x40);
      v21 = v27;
      GLRTextureResource::GLRTextureResource(v27);
      AllocSize = IOSurfaceGetAllocSize(v20);
      if ((GLRTextureResource::initWithMetalTexture(v21, v26, AllocSize) & 1) == 0)
      {
        (*(void (**)(GLDLibrary *))(*(_QWORD *)v21 + 24))(v21);
        return 0;
      }

      *(_QWORD *)&v18[v17] = v21;
LABEL_31:
      if (!v21)
        goto LABEL_33;
    }
    GLRTextureResource::setSwizzleKey((uint64_t)v21, MetalSwizzleKey);
    GLRTextureResource::setBaseLevelMaxLevel(*(_QWORD *)&v18[v17], *(_WORD *)(*((_QWORD *)this + 6) + 214) & 0xF, *(_WORD *)(*((_QWORD *)this + 6) + 214) >> 4);
    v31.length = *((unsigned int *)this + 28);
    v31.location = 0;
    GLRTextureResource::updateSampleViewIfNeeded(*(GLRTextureResource **)&v18[v17], (MTLPixelFormat)(&glrTextureFormats)[5 * *((unsigned int *)this + 16) + 3], *((MTLTextureType *)this + 11), v31);
LABEL_33:
    v17 += 8;
  }
  while (v17 != 32);
  v29 = *((_QWORD *)this + 3);
  if (v29)
    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 24))(v29);
  v30 = *((_QWORD *)this + v7 + 19);
  *((_QWORD *)this + 3) = v30;
  (*(void (**)(uint64_t))(*(_QWORD *)v30 + 16))(v30);
  *((_DWORD *)this + 20) = v7;
  return 1;
}

void sub_23105D8E0(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDTextureRec::blitAccum(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];

  GLDTextureRec::ensureResource(a1);
  v6 = *(void **)(*(_QWORD *)(a1 + 184) + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 32);
  memset(v11, 0, sizeof(v11));
  v10[0] = objc_msgSend(v6, "width");
  v10[1] = objc_msgSend(v6, "height");
  v10[2] = 1;
  memset(v9, 0, sizeof(v9));
  objc_msgSend(a2, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v6, 0, 0, v11, v10, v7, 0, 0, v9);
  GLRResourceList::addResource(a3, *(_QWORD *)(a1 + 184));
  GLRResourceList::addResource(a3, *(_QWORD *)(a1 + 24));
  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 184) + 24))(*(_QWORD *)(a1 + 184));
  *(_QWORD *)(a1 + 184) = 0;
  return result;
}

uint64_t GLDTextureRec::loadIOSurfaceTexture(GLDTextureRec *this, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *((_QWORD *)this + 6);
  if ((*(_BYTE *)(v4 + 24) & 8) == 0)
  {
    if ((*(_BYTE *)(v4 + 24) & 2) != 0 && !*((_QWORD *)this + 23))
    {
      v5 = *((_QWORD *)this + *((unsigned int *)this + 20) + 19);
      if (v5)
      {
        *((_QWORD *)this + 23) = v5;
        (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
        v4 = *((_QWORD *)this + 6);
      }
    }
    if ((*(unsigned int (**)(_QWORD))(g_Library + 8))(*(_QWORD *)(v4 + 32)))
      return 0;
    if ((a2 & 0xF) == 4)
      return 1;
    if ((*(unsigned int (**)(_QWORD))(g_Library + 16))(*(_QWORD *)(*((_QWORD *)this + 6) + 32)))
      return 0;
    a2 |= 1u;
  }
  if ((a2 & 0xF) == 0)
    return 1;
  result = GLDTextureRec::getIOSurfaceResource(this);
  if ((_DWORD)result)
    return 1;
  return result;
}

BOOL GLDTextureRec::allocMetalTexture(GLDTextureRec *this)
{
  uint64_t v2;
  char v3;
  char v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  GLRTextureResource *v16;
  GLDLibrary *v17;
  char *v18;

  v2 = 0;
  v3 = 1;
  do
  {
    v4 = v3;
    v5 = (char *)this + 8 * v2;
    v8 = *((_QWORD *)v5 + 3);
    v7 = v5 + 24;
    v6 = v8;
    if (v8)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
      *v7 = 0;
    }
    v3 = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);
  if (*((int *)this + 19) < 1)
    return 1;
  v9 = 0;
  v10 = (_QWORD *)MEMORY[0x24BDDD9C0];
  do
  {
    v11 = *(void **)(*((_QWORD *)this + 5) + 232);
    v12 = (id *)((char *)this + 8 * v9);
    objc_msgSend(v12[15], "setCpuCacheMode:", 1);
    v13 = (void *)objc_msgSend(v11, "newTextureWithDescriptor:", v12[15]);
    v14 = v13 != 0;
    if (!v13)
      break;
    v15 = v13;
    objc_msgSend(v13, "setLabel:", *v10);
    GLDObject::operator new((GLDObject *)0x40);
    v17 = v16;
    GLRTextureResource::GLRTextureResource(v16);
    v18 = (char *)this + 8 * v9;
    GLRTextureResource::initWithMetalTexture(v17, v15, *((_QWORD *)v18 + 12));

    *((_QWORD *)v18 + 3) = v17;
    ++v9;
  }
  while (v9 < *((int *)this + 19));
  return v14;
}

void sub_23105DB98(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void *GLDTextureRec::newCubeView(GLDTextureRec *this, int a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(*(_QWORD *)(GLDTextureRec::getTextureResource(this, 0) + 40) + 32);
  v5 = (void *)objc_msgSend(v4, "newTextureViewWithPixelFormat:textureType:levels:slices:", (&glrTextureFormats)[5 * *((unsigned int *)this + 16) + 3], 2, 0, objc_msgSend(v4, "mipmapLevelCount"), a2, 1);
  objc_msgSend(v5, "setLabel:", *MEMORY[0x24BDDD9C0]);
  return v5;
}

uint64_t GLDTextureRec::loadPrivateTexture(id *this, char a2, unsigned __int16 *a3)
{
  uint64_t result;
  char v6;
  unsigned __int8 *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int16 *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v37;
  char v38;
  uint64_t v39;
  _QWORD block[11];
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  int v52;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  if ((a2 & 1) == 0 || (result = GLDTextureRec::allocMetalTexture((GLDTextureRec *)this), (_DWORD)result))
  {
    if (objc_msgSend(this[15], "textureType", a3) == 7)
      v6 = 4;
    else
      v6 = 3;
    v38 = v6;
    if ((a2 & 5) != 0)
    {
      v7 = (unsigned __int8 *)this[6];
      result = 1;
      if (!v7[211])
        return result;
      v8 = 0;
      do
      {
        v9 = v7[208];
        if (v9 <= v7[210])
        {
          do
          {
            if (((1 << v9) & *((unsigned __int16 *)this[7] + v8 + 4)) != 0
              && ((1 << v9) & *(unsigned __int16 *)&v7[2 * v8 + 228]) != 0)
            {
              *((_DWORD *)this[5] + 8) |= 2u;
              if (*((_DWORD *)this + 19))
              {
                v10 = 0;
                while (2)
                {
                  v11 = (char *)this + 4 * v10;
                  v12 = *((_DWORD *)v11 + 16);
                  v57 = 0;
                  v55 = 0u;
                  v56 = 0u;
                  v54 = 0u;
                  MTLPixelFormatGetInfo();
                  v13 = this[v10 + 3];
                  v14 = v13[4];
                  (*(void (**)(_QWORD *, id))(*v13 + 40))(v13, this[5]);
                  v15 = this[6];
                  v16 = (uint64_t)&v15[60 * v8 + 4 * v9];
                  v17 = *(unsigned __int16 *)(v16 + 280);
                  v18 = *((_DWORD *)v11 + 16);
                  v39 = v14;
                  if (LODWORD((&glrTextureFormats)[5 * v18 + 1]) == v17
                    && (v19 = WORD1(v15[60 * v8 + 35 + 4 * v9]), *((_DWORD *)&glrTextureFormats + 10 * v18 + 3) == v19)
                    && (v17 == 6402 ? (v20 = v19 == 5126) : (v20 = 0), !v20))
                  {
                    if ((BYTE9(v54) & 0x20) != 0)
                    {
                      LODWORD(v21) = 0;
                      LODWORD(v22) = 0;
                    }
                    else
                    {
                      objc_msgSend(this[v10 + 15], "sampleCount");
                      MTLGetTextureLevelInfoForDeviceWithOptions();
                      LODWORD(v21) = v52;
                      LODWORD(v22) = v53;
                      v15 = this[6];
                    }
                    v24 = (void *)v15[60 * v8 + 36 + 4 * v9];
                  }
                  else
                  {
                    v46 = 0;
                    v45 = 0;
                    glrPixelSettings(*(unsigned __int16 *)(v16 + 280), WORD1(v15[60 * v8 + 35 + 4 * v9]), WORD2(v15[60 * v8 + 33 + 4 * v9]), HIWORD(v15[60 * v8 + 33 + 4 * v9]), (int *)&v46 + 1, &v46, &v45, 0, v38);
                    v23 = (unsigned __int16 *)((char *)this[6] + 480 * v8 + 32 * v9);
                    v21 = v23[134] * (uint64_t)SDWORD2(v55);
                    v22 = v21 * v23[135];
                    v24 = malloc_type_malloc(v22 * v23[136], 0x572BD29BuLL);
                    v51 = 0;
                    v49 = 0u;
                    v50 = 0u;
                    v48 = 0u;
                    v47 = 0u;
                    v25 = (uint64_t)this[6] + 480 * v8 + 32 * v9;
                    DWORD1(v50) = *(unsigned __int16 *)(v25 + 268);
                    DWORD2(v50) = *(unsigned __int16 *)(v25 + 272) * *(unsigned __int16 *)(v25 + 270);
                    *(_QWORD *)&v47 = *(_QWORD *)(v25 + 288);
                    LODWORD(v48) = HIDWORD(v46);
                    glgConvertType();
                    *((_QWORD *)&v47 + 1) = v24;
                    HIDWORD(v48) = v21;
                    glgConvertType();
                    HIDWORD(v49) = (&glrTextureFormats)[5 * v12 + 2];
                    LODWORD(v50) = -1;
                    glgProcessPixelsWithProcessor();
                  }
                  switch((unint64_t)this[11])
                  {
                    case 0uLL:
                      v26 = 0;
                      v28 = (unsigned __int16 *)((char *)this[6] + 480 * v8 + 32 * v9 + 268);
                      goto LABEL_28;
                    case 1uLL:
                      v32 = (uint64_t)this[6] + 480 * v8 + 32 * v9;
                      v28 = (unsigned __int16 *)(v32 + 268);
                      v26 = *(unsigned __int16 *)(v32 + 270);
LABEL_28:
                      v29 = 1;
                      goto LABEL_30;
                    case 2uLL:
                    case 4uLL:
                    case 5uLL:
                      v26 = 0;
                      v27 = (uint64_t)this[6] + 480 * v8 + 32 * v9;
                      v28 = (unsigned __int16 *)(v27 + 268);
                      v29 = *(unsigned __int16 *)(v27 + 270);
                      goto LABEL_30;
                    case 3uLL:
                      v33 = (uint64_t)this[6] + 480 * v8 + 32 * v9;
                      v28 = (unsigned __int16 *)(v33 + 268);
                      v29 = *(unsigned __int16 *)(v33 + 270);
                      v26 = *(unsigned __int16 *)(v33 + 272);
LABEL_30:
                      v31 = 1;
                      goto LABEL_31;
                    case 6uLL:
                    case 7uLL:
                      v26 = 0;
                      v30 = (uint64_t)this[6] + 480 * v8 + 32 * v9;
                      v28 = (unsigned __int16 *)(v30 + 268);
                      v29 = *(unsigned __int16 *)(v30 + 270);
                      v31 = *(unsigned __int16 *)(v30 + 272);
LABEL_31:
                      v34 = *v28;
                      block[0] = MEMORY[0x24BDAC760];
                      block[1] = 3221225472;
                      block[2] = ___ZN13GLDTextureRec18loadPrivateTextureEjPt_block_invoke;
                      block[3] = &unk_24FFEB768;
                      block[6] = v34;
                      block[7] = v29;
                      block[8] = v31;
                      block[9] = v26;
                      block[4] = v39;
                      block[5] = this;
                      v41 = v9;
                      v42 = v8;
                      block[10] = v24;
                      v43 = v21;
                      v44 = v22;
                      v35 = this[17];
                      if (v35)
                        dispatch_sync(v35, block);
                      else
                        ___ZN13GLDTextureRec18loadPrivateTextureEjPt_block_invoke((uint64_t)block);
                      if (v24 != *((void **)this[6] + 60 * v8 + 4 * v9 + 36))
                        free(v24);
                      if (++v10 < (unint64_t)*((unsigned int *)this + 19))
                        continue;
                      v7 = (unsigned __int8 *)this[6];
                      break;
                    default:
                      v37 = MTLReleaseAssertionFailure();
                      return ___ZN13GLDTextureRec18loadPrivateTextureEjPt_block_invoke(v37);
                  }
                  break;
                }
              }
            }
          }
          while (v9++ < v7[210]);
        }
        ++v8;
      }
      while (v8 < v7[211]);
    }
    return 1;
  }
  return result;
}

uint64_t ___ZN13GLDTextureRec18loadPrivateTextureEjPt_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[6];

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  if (*(_QWORD *)(a1 + 72))
  {
    v5 = 0;
    v6 = 100;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) == 1)
      v6 = 96;
    v7 = *(int *)(a1 + v6);
    v8 = *(_QWORD *)(a1 + 80);
    do
    {
      v9 = *(void **)(a1 + 32);
      memset(v12, 0, 24);
      v12[3] = v2;
      v12[4] = v3;
      v12[5] = v4;
      result = objc_msgSend(v9, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v12, *(unsigned int *)(a1 + 88), v5, v8, *(int *)(a1 + 96), *(int *)(a1 + 100));
      v8 += v7;
      ++v5;
    }
    while (v5 < *(_QWORD *)(a1 + 72));
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    memset(v13, 0, 24);
    v13[3] = v2;
    v13[4] = v3;
    v13[5] = v4;
    return objc_msgSend(v11, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v13, *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), *(_QWORD *)(a1 + 80), *(int *)(a1 + 96), *(int *)(a1 + 100));
  }
  return result;
}

void GLDTextureRec::setForceASTC_LP(GLDTextureRec *this, char a2)
{
  *((_BYTE *)this + 75) = a2;
  GLDTextureRec::updateSamplerState((MTLTextureType *)this, 128);
}

void GLDTextureRec::updateSamplerState(MTLTextureType *this, char a2)
{
  int MetalSwizzleKey;
  uint64_t v4;
  char v5;
  char v6;
  MTLTextureType *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _NSRange v11;

  if ((a2 & 0x81) != 0)
  {
    MetalSwizzleKey = GLDTextureRec::getMetalSwizzleKey((GLDTextureRec *)this);
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = v5;
      v7 = &this[v4];
      v10 = *((_QWORD *)v7 + 3);
      v9 = (uint64_t *)(v7 + 3);
      v8 = v10;
      if (v10)
      {
        GLRTextureResource::setForceASTC_LP(v8, *((unsigned __int8 *)this + 75));
        GLRTextureResource::setSwizzleKey(*v9, MetalSwizzleKey);
        GLRTextureResource::setBaseLevelMaxLevel(*v9, *(_WORD *)(*((_QWORD *)this + 6) + 214) & 0xF, *(_WORD *)(*((_QWORD *)this + 6) + 214) >> 4);
        v11.length = *((unsigned int *)this + 28);
        v11.location = 0;
        GLRTextureResource::updateSampleViewIfNeeded((GLRTextureResource *)*v9, (MTLPixelFormat)(&glrTextureFormats)[5 * *((unsigned int *)this + v4 + 16) + 3], this[11], v11);
      }
      v5 = 0;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
  }
}

uint64_t GLDTextureRec::readTextureData(GLDTextureRec *this, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, void *a6)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD block[7];
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN13GLDTextureRec15readTextureDataEiijjPvj_block_invoke;
  block[3] = &unk_24FFEB790;
  block[4] = &v14;
  block[5] = this;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  block[6] = a6;
  v6 = *((_QWORD *)this + 17);
  if (v6)
    dispatch_sync(v6, block);
  else
    ___ZN13GLDTextureRec15readTextureDataEiijjPvj_block_invoke((uint64_t)block, a2, a3, a4, a5);
  v7 = *((unsigned int *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void sub_23105E3A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN13GLDTextureRec15readTextureDataEiijjPvj_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  GLDTextureRec *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(GLDTextureRec **)(a1 + 40);
  v7 = *((_QWORD *)v6 + 5);
  if (*(_DWORD *)(v7 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(v7 + 256));
  GLDTextureRec::readTextureDataInternal(v6, *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), a4, a5, *(char **)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v8 = *((_QWORD *)v6 + 5);
  if (*(_DWORD *)(v8 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + 256));
}

uint64_t GLDTextureRec::getTextureInfo(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  int v8;
  __int16 v9;
  __int16 v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  unsigned __int16 v18;
  GLDTextureRec *v19;
  int v20;
  int v21;
  unsigned int v22;
  int *v23;

  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  v4 = *(_QWORD *)(result + 48);
  v5 = *(unsigned __int16 *)(v4 + 192);
  *(_WORD *)(a4 + 8) = v5;
  if (v5 <= 35055)
  {
    if (v5 > 33320)
    {
      switch(v5)
      {
        case 33321:
        case 33329:
        case 33330:
          goto LABEL_24;
        case 33322:
        case 33324:
          goto LABEL_86;
        case 33323:
        case 33335:
        case 33336:
          goto LABEL_31;
        case 33325:
        case 33331:
        case 33332:
          v6 = 16;
          goto LABEL_39;
        case 33326:
        case 33333:
        case 33334:
          v6 = 32;
          goto LABEL_39;
        case 33327:
        case 33337:
        case 33338:
          v11 = 1048592;
          goto LABEL_42;
        case 33328:
        case 33339:
        case 33340:
          v11 = 2097184;
          goto LABEL_42;
        default:
          switch(v5)
          {
            case 34836:
              goto LABEL_18;
            case 34837:
              goto LABEL_46;
            case 34838:
              v16 = 32;
              goto LABEL_78;
            case 34840:
              v17 = 32;
              goto LABEL_80;
            case 34841:
              v12 = 2097184;
              goto LABEL_73;
            case 34842:
              goto LABEL_26;
            case 34843:
              goto LABEL_47;
            case 34844:
              v16 = 16;
              goto LABEL_78;
            case 34846:
              v17 = 16;
              goto LABEL_80;
            case 34847:
              v12 = 1048592;
              goto LABEL_73;
            default:
              goto LABEL_86;
          }
      }
    }
    if (v5 > 32847)
    {
      switch(v5)
      {
        case 32848:
          goto LABEL_85;
        case 32849:
          goto LABEL_54;
        case 32850:
        case 32851:
        case 32852:
        case 32853:
          goto LABEL_86;
        case 32854:
          v7 = 0x4000400040004;
          goto LABEL_60;
        case 32855:
          v7 = 0x1000500050005;
          goto LABEL_60;
        case 32856:
          goto LABEL_27;
        case 32857:
          goto LABEL_57;
        default:
          if ((v5 - 33189) >= 3)
            goto LABEL_86;
          *(_WORD *)(a4 + 22) = 24;
          *(_WORD *)(a4 + 8) = -32346;
          break;
      }
      goto LABEL_61;
    }
    switch(v5)
    {
      case 32828:
        v16 = 8;
LABEL_78:
        *(_WORD *)(a4 + 16) = v16;
        goto LABEL_61;
      case 32832:
        v17 = 8;
LABEL_80:
        *(_WORD *)(a4 + 18) = v17;
        goto LABEL_61;
      case 32837:
        v12 = 524296;
LABEL_73:
        *(_DWORD *)(a4 + 16) = v12;
        goto LABEL_61;
    }
LABEL_86:
    v19 = (GLDTextureRec *)MTLReleaseAssertionFailure();
    return GLDTextureRec::getLevelInfo(v19, v20, v21, v22, v23);
  }
  if (v5 > 36207)
  {
    if (v5 <= 36755)
    {
      switch(v5)
      {
        case 36208:
        case 36226:
LABEL_18:
          v7 = 0x20002000200020;
          goto LABEL_60;
        case 36209:
        case 36227:
LABEL_46:
          *(_DWORD *)(a4 + 10) = 2097184;
          v9 = 32;
          goto LABEL_55;
        case 36210:
        case 36211:
        case 36212:
        case 36213:
        case 36216:
        case 36217:
        case 36218:
        case 36219:
        case 36222:
        case 36223:
        case 36224:
        case 36225:
          goto LABEL_86;
        case 36214:
LABEL_26:
          v7 = 0x10001000100010;
          goto LABEL_60;
        case 36215:
LABEL_47:
          *(_DWORD *)(a4 + 10) = 1048592;
          v9 = 16;
          goto LABEL_55;
        case 36220:
          goto LABEL_27;
        case 36221:
          goto LABEL_54;
        default:
          switch(v5)
          {
            case 36232:
              goto LABEL_26;
            case 36233:
              goto LABEL_47;
            case 36238:
              goto LABEL_27;
            case 36239:
              goto LABEL_54;
            default:
              goto LABEL_86;
          }
      }
    }
    if (v5 > 37873)
    {
      switch(v5)
      {
        case 37874:
          v8 = 655370;
          goto LABEL_22;
        case 37875:
        case 37876:
        case 37877:
        case 37878:
        case 37879:
        case 37880:
        case 37882:
          goto LABEL_86;
        case 37881:
          v7 = 0x8000A000A000ALL;
          goto LABEL_60;
        case 37883:
        case 37884:
        case 37885:
          goto LABEL_54;
        default:
          v13 = 37902;
          goto LABEL_53;
      }
    }
    switch(v5)
    {
      case 36756:
LABEL_24:
        v6 = 8;
LABEL_39:
        *(_WORD *)(a4 + 10) = v6;
        goto LABEL_61;
      case 36757:
LABEL_31:
        v11 = 524296;
LABEL_42:
        *(_DWORD *)(a4 + 10) = v11;
        goto LABEL_61;
      case 36758:
        goto LABEL_54;
      case 36759:
        goto LABEL_27;
      default:
        if (v5 != 36975)
          goto LABEL_86;
LABEL_57:
        v7 = 0x2000A000A000ALL;
        break;
    }
LABEL_60:
    *(_QWORD *)(a4 + 10) = v7;
    goto LABEL_61;
  }
  if (v5 <= 35897)
  {
    if (v5 > 35428)
    {
      switch(v5)
      {
        case 35429:
        case 35430:
        case 35437:
        case 35438:
          goto LABEL_54;
        case 35431:
        case 35432:
        case 35433:
        case 35434:
        case 35435:
        case 35436:
          goto LABEL_86;
        default:
          if ((v5 - 35446) >= 2)
            goto LABEL_86;
          v7 = 0xA000A000A000ALL;
          break;
      }
      goto LABEL_60;
    }
    v10 = -30480;
    if (v5 != 35056)
    {
      if (v5 != 35359)
      {
        v13 = 35409;
LABEL_53:
        if (v5 != v13)
          goto LABEL_86;
      }
LABEL_54:
      *(_DWORD *)(a4 + 10) = 524296;
      v9 = 8;
LABEL_55:
      *(_WORD *)(a4 + 14) = v9;
      goto LABEL_61;
    }
    v18 = 24;
    goto LABEL_82;
  }
  if (v5 <= 36011)
  {
    switch(v5)
    {
      case 35898:
        v8 = 720907;
LABEL_22:
        *(_DWORD *)(a4 + 10) = v8;
        v9 = 10;
        goto LABEL_55;
      case 35901:
        *(_DWORD *)(a4 + 10) = 589833;
        *(_WORD *)(a4 + 14) = 9;
        *(_WORD *)(a4 + 26) = 5;
        goto LABEL_61;
      case 35905:
        goto LABEL_54;
      case 35907:
LABEL_27:
        v7 = 0x8000800080008;
        goto LABEL_60;
      default:
        goto LABEL_86;
    }
  }
  if (v5 <= 36167)
  {
    v10 = -29524;
    if (v5 == 36012)
    {
      *(_WORD *)(a4 + 22) = 32;
LABEL_83:
      *(_WORD *)(a4 + 8) = v10;
      goto LABEL_61;
    }
    v10 = -29523;
    if (v5 != 36013)
      goto LABEL_86;
    v18 = 32;
LABEL_82:
    *(_DWORD *)(a4 + 22) = v18 | 0x80000;
    goto LABEL_83;
  }
  if (v5 != 36168)
  {
    if (v5 != 36194)
      goto LABEL_86;
LABEL_85:
    *(_DWORD *)(a4 + 10) = 393221;
    v9 = 5;
    goto LABEL_55;
  }
  *(_WORD *)(a4 + 24) = 8;
LABEL_61:
  v14 = *(unsigned __int8 *)(v4 + 212);
  if (v14 == 2)
    v15 = 2;
  else
    v15 = 4 * (v14 < 5);
  if (v14 >= 2)
    LOWORD(v14) = v15;
  *(_WORD *)(a4 + 28) = v14;
  return result;
}

uint64_t GLDTextureRec::getLevelInfo(GLDTextureRec *this, uint64_t a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  GLDTextureRec *v12;
  unint64_t v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;

  if ((*(_BYTE *)(*((_QWORD *)this + 7) + 20) & 2) != 0)
  {
    v8 = *((_QWORD *)this + 5);
    if (!*(_DWORD *)(v8 + 248)
      || (pthread_mutex_lock((pthread_mutex_t *)(v8 + 256)), (*(_BYTE *)(*((_QWORD *)this + 7) + 20) & 2) != 0))
    {
      GLDTextureRec::updatePixelFormat(this);
      *(_BYTE *)(*((_QWORD *)this + 7) + 20) &= ~2u;
    }
    v9 = *((_QWORD *)this + 5);
    if (*(_DWORD *)(v9 + 248))
      pthread_mutex_unlock((pthread_mutex_t *)(v9 + 256));
  }
  v13 = ((unint64_t)**((unsigned __int16 **)this + 6) >> 8) & 1;
  GLDTextureRec::getTextureInfo((uint64_t)this, a2, a3, (uint64_t)&v13);
  if (a4 <= 34889)
  {
    switch(a4)
    {
      case 32860:
        v10 = v15;
        goto LABEL_21;
      case 32861:
        v10 = v16;
        goto LABEL_21;
      case 32862:
        v10 = v17;
        goto LABEL_21;
      case 32863:
        v10 = v18;
        goto LABEL_21;
      default:
        if (a4 != 4099)
          goto LABEL_22;
        v10 = v14;
        break;
    }
    goto LABEL_21;
  }
  switch(a4)
  {
    case 34890:
      v10 = v19;
      goto LABEL_21;
    case 35057:
      v10 = v20;
      goto LABEL_21;
    case 36011:
      v10 = v21;
LABEL_21:
      *a5 = v10;
      return 0;
  }
LABEL_22:
  v12 = (GLDTextureRec *)MTLReleaseAssertionFailure();
  return GLDTextureRec::createTextureImageQueue(v12);
}

dispatch_queue_t GLDTextureRec::createTextureImageQueue(GLDTextureRec *this)
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.GLDRendererMetal.TexImage", 0);
  *((_QWORD *)this + 17) = result;
  return result;
}

uint64_t GLDTextureRec::canGenerateMipmapsWithCPU(GLDTextureRec *this, int8x8_t a2)
{
  _WORD *v2;
  unsigned __int16 v3;
  BOOL v4;
  uint64_t v6;

  v2 = (_WORD *)*((_QWORD *)this + 6);
  if (!v2[97])
    return 0;
  a2.i32[0] = (unsigned __int16)v2[98];
  v3 = vaddlv_u8((uint8x8_t)vcnt_s8(a2));
  v4 = ((unsigned __int16)v2[97] & ((unsigned __int16)v2[97] - 1)) != 0 || v2[98] == 0;
  if (v4 || v3 > 1u)
    return 0;
  if ((v2[107] & 0x1800) != 0)
    return 0;
  v6 = *((_QWORD *)this + 3);
  if (*(_QWORD *)(v6 + 24) > 0x100000uLL)
    return 0;
  else
    return objc_msgSend(*(id *)(v6 + 32), "canGenerateMipmapLevels");
}

uint64_t GLDTextureRec::generateMipmapsWithCPU(uint64_t this, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = this;
  v4 = *(_QWORD *)(this + 48);
  if ((*(_BYTE *)(v4 + 130) & 1) != 0)
  {
    v6 = *(unsigned __int8 *)(v4 + 210);
    v5 = *(_WORD *)(v4 + 214);
  }
  else
  {
    v5 = *(_WORD *)(v4 + 214);
    v6 = v5 >> 4;
  }
  v7 = v5 & 0xF;
  if (v7 < v6)
  {
    v8 = v7 + 1;
    v9 = v6;
    do
    {
      v10 = *(void **)(*(_QWORD *)(v3 + 24) + 32);
      this = objc_msgSend(v10, "arrayLength");
      if (this)
      {
        v11 = this;
        v12 = this * a2;
        do
        {
          this = objc_msgSend(v10, "generateMipmapLevel:slice:", v8, v12++);
          --v11;
        }
        while (v11);
      }
    }
    while (v8++ < v9);
  }
  return this;
}

BOOL gldLoadTexture(int a1, GLDTextureRec *this)
{
  return GLDTextureRec::load(this);
}

uint64_t gldReclaimTexture(int a1, GLDTextureRec *this)
{
  return GLDTextureRec::reclaim(this);
}

uint64_t gldModifyTexture(int a1, GLDTextureRec *this)
{
  GLDTextureRec::modify(this);
  return 0;
}

uint64_t gldRestoreTextureData(int a1, GLDTextureRec *this, uint64_t a3, uint64_t a4, unsigned int a5)
{
  return GLDTextureRec::restoreData(this, a3, a4, a4, a5);
}

uint64_t gldReadTextureData(int a1, GLDTextureRec *this, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, void *a7)
{
  return GLDTextureRec::readTextureData(this, a3, a4, a5, a6, a7);
}

void gldGetTextureAllocationIdentifiers(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
}

void GLDDeviceRec::telemetryEmitAPI(GLDDeviceRec *this)
{
  unsigned int v2;
  unsigned int i;
  uint64_t v4;
  const __CFString *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  unsigned int v9;
  unsigned int *v10;
  uint64_t v11;
  _QWORD block[5];

  v11 = MEMORY[0x2348CF1D8]();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN12GLDDeviceRec16telemetryEmitAPIEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  if (GLDDeviceRec::telemetryEmitAPI(void)::dimensionsOnce != -1)
    dispatch_once(&GLDDeviceRec::telemetryEmitAPI(void)::dimensionsOnce, block);
  v10 = (unsigned int *)((char *)this + 960);
  v2 = atomic_load((unsigned int *)this + 240);
  for (i = *((_DWORD *)this + 241) ^ v2; i; i &= ~(1 << v4))
  {
    v4 = __clz(__rbit32(i));
    v5 = &stru_24FFEDCC0;
    if ((v4 - 1) <= 7)
      v5 = *(&off_24FFEB858 + v4 - 1);
    v6 = *((_DWORD *)this + 132) - 2;
    v7 = &stru_24FFEDCC0;
    if (v6 <= 2)
      v7 = off_24FFEB898[v6];
    GLDDeviceRec::setMeasure<BOOL,0>(*((_QWORD *)this + 62), (uint64_t)CFSTR("Unused"), 1, 1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.opengl.%@%@.%@"), v5, v7, GLDDeviceRec::telemetryEmitAPI(void)::bundleIdentifier, v10));
  }
  v8 = (void *)v11;
  v9 = atomic_load(v10);
  *((_DWORD *)this + 241) = v9;
  objc_autoreleasePoolPop(v8);
}

CFStringRef ___ZN12GLDDeviceRec16telemetryEmitAPIEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  __CFBundle *MainBundle;
  CFTypeRef ValueForInfoDictionaryKey;
  CFStringRef result;
  unsigned int v5;
  const __CFString *v6;

  v1 = *(_QWORD *)(a1 + 32);
  MainBundle = CFBundleGetMainBundle();
  ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(MainBundle, (CFStringRef)*MEMORY[0x24BDBD2A0]);
  result = CFBundleGetIdentifier(MainBundle);
  GLDDeviceRec::telemetryEmitAPI(void)::bundleIdentifier = (uint64_t)result;
  if (result)
  {
    objc_msgSend(*(id *)(v1 + 488), "setObject:forKey:", result, CFSTR("BundleIdentifier"));
    v5 = *(_DWORD *)(v1 + 528) - 2;
    if (v5 > 2)
      v6 = &stru_24FFEDCC0;
    else
      v6 = off_24FFEB898[v5];
    result = (CFStringRef)objc_msgSend(*(id *)(v1 + 488), "setObject:forKey:", v6, CFSTR("API"));
    if (ValueForInfoDictionaryKey)
      return (CFStringRef)objc_msgSend(*(id *)(v1 + 488), "setObject:forKey:", ValueForInfoDictionaryKey, CFSTR("BundleVersion"));
  }
  return result;
}

uint64_t GLDDeviceRec::setMeasure<BOOL,0>(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  void *v8;

  v8 = (void *)result;
  if ((a4 & 1) == 0)
  {
    if ((a4 & 2) == 0)
      return result;
    return objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), a2);
  }
  if (!a5)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.opengl.%@"), a2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), "intValue");
  result = ADClientSetValueForScalarKey();
  if ((a4 & 2) != 0)
    return objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), a2);
  return result;
}

void GLDDeviceRec::telemetryEmitBacktraceInfo(uint64_t a1, const void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD block[5];
  int v10;
  _QWORD v11[5];

  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = ___ZN12GLDDeviceRec26telemetryEmitBacktraceInfoEPK25GLRTelemetryBacktraceInfo_block_invoke;
  v11[3] = &__block_descriptor_40_e5_v8__0l;
  v11[4] = a1;
  if (GLDDeviceRec::telemetryEmitBacktraceInfo(GLRTelemetryBacktraceInfo const*)::onceToken != -1)
    dispatch_once(&GLDDeviceRec::telemetryEmitBacktraceInfo(GLRTelemetryBacktraceInfo const*)::onceToken, v11);
  v5 = malloc_type_malloc(0x208uLL, 0x1080040751F5E6CuLL);
  if (v5)
  {
    v6 = v5;
    memcpy(v5, a2, 0x208uLL);
    v7 = *(_DWORD *)(a1 + 528);
    v8 = *(NSObject **)(a1 + 504);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = ___ZN12GLDDeviceRec26telemetryEmitBacktraceInfoEPK25GLRTelemetryBacktraceInfo_block_invoke_2;
    block[3] = &__block_descriptor_44_e5_v8__0l;
    block[4] = v6;
    v10 = v7;
    dispatch_async(v8, block);
  }
}

dispatch_queue_t ___ZN12GLDDeviceRec26telemetryEmitBacktraceInfoEPK25GLRTelemetryBacktraceInfo_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  dispatch_queue_t result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  result = dispatch_queue_create("glmtl.telemetry.backtrace", v2);
  *(_QWORD *)(v1 + 504) = result;
  return result;
}

void ___ZN12GLDDeviceRec26telemetryEmitBacktraceInfoEPK25GLRTelemetryBacktraceInfo_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  _DWORD *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  void *v12;
  const char *v13;
  char *v14;
  const char *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const __CFString *v20;
  unsigned int v21;
  const __CFString *v22;
  uint64_t v23;
  char v24[8];
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2348CF1D8]();
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = objc_msgSend(v4, "bundleIdentifier");
  v6 = objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
  if (v5)
  {
    v23 = v6;
    v7 = *(int **)(a1 + 32);
    v10 = *v7;
    v8 = v7 + 2;
    v9 = v10;
    v11 = getprogname();
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    if (v10 >= 1)
    {
      do
      {
        v13 = (const char *)dyld_image_path_containing_address();
        if (v13)
          v14 = basename_r(v13, v24);
        else
          v14 = "<Unknown>";
        if (v14)
          v15 = v14;
        else
          v15 = "<Unknown>";
        if (!strcmp(v11, v15))
          v16 = CFSTR("Direct");
        else
          v16 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
        if (isIgnoredFramework(NSString *)::onceToken != -1)
          dispatch_once(&isIgnoredFramework(NSString *)::onceToken, &__block_literal_global_1);
        if ((objc_msgSend((id)isIgnoredFramework(NSString *)::ignoredFrameworks, "containsObject:", v16) & 1) == 0
          && (objc_msgSend(v12, "containsObject:", v16) & 1) == 0)
        {
          objc_msgSend(v12, "addObject:", v16);
        }
        v8 += 2;
        --v9;
      }
      while (v9);
    }
    if (objc_msgSend(v12, "count"))
    {
      v17 = objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
      if (v17)
      {
        v18 = v17;
        v19 = *(_DWORD *)(a1 + 40) - 2;
        if (v19 > 2)
          v20 = &stru_24FFEDCC0;
        else
          v20 = off_24FFEB898[v19];
        GLDDeviceRec::setMeasure<int,0>(0, (uint64_t)CFSTR("Unused"), 1, 1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.opengl.%@.Backtrace{%@}.%@"), v20, v17, v5));
        objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("BundleIdentifier"));
        v21 = *(_DWORD *)(a1 + 40) - 2;
        if (v21 > 2)
          v22 = &stru_24FFEDCC0;
        else
          v22 = off_24FFEB898[v21];
        objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("API"));
        if (v23)
          objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("BundleVersion"));
        objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("Frameworks"));
        *(_QWORD *)v24 = MEMORY[0x24BDAC760];
        v25 = 3221225472;
        v26 = ___ZN12GLDDeviceRec9sendEventEP8NSStringP19NSMutableDictionaryIS1_P8NSObjectE_block_invoke;
        v27 = &unk_24FFEB818;
        v28 = v3;
        AnalyticsSendEventLazy();
      }
    }
  }
  free(*(void **)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

uint64_t GLDDeviceRec::setMeasure<int,0>(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  void *v8;

  v8 = (void *)result;
  if ((a4 & 1) == 0)
  {
    if ((a4 & 2) == 0)
      return result;
    return objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3), a2);
  }
  if (!a5)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.opengl.%@"), a2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3), "intValue");
  result = ADClientSetValueForScalarKey();
  if ((a4 & 2) != 0)
    return objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3), a2);
  return result;
}

uint64_t GLDDeviceRec::telemetryEmitGPUWorkSubmitted(id *this)
{
  return objc_msgSend(this[61], "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("GPUWorkSubmitted"));
}

uint64_t GLDDeviceRec::telemetryTexture(uint64_t this, GLDTextureRec *a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  v2 = *((_DWORD *)&glrTextureFormats + 10 * *((unsigned int *)a2 + 16) + 9);
  if ((v2 & 0x1000) != 0)
  {
    v4 = 45;
    goto LABEL_18;
  }
  if ((v2 & 0x2000) != 0)
  {
    v4 = 48;
    goto LABEL_18;
  }
  if ((v2 & 0x4000) != 0)
  {
    v4 = 44;
    goto LABEL_18;
  }
  if ((v2 & 0x8000) != 0)
  {
    v4 = 46;
    goto LABEL_18;
  }
  if ((v2 & 0x10000) != 0)
  {
    v4 = 47;
    goto LABEL_18;
  }
  if ((v2 & 0x20000) != 0)
  {
    v4 = 49;
    goto LABEL_18;
  }
  v3 = *(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192);
  v4 = 50;
  if (v3 <= 0x8813)
  {
    if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) > 0x81A5u)
    {
      switch(*(_WORD *)(*((_QWORD *)a2 + 6) + 192))
      {
        case 0x8229:
          goto LABEL_57;
        case 0x822A:
        case 0x822C:
          goto LABEL_18;
        case 0x822B:
          goto LABEL_44;
        case 0x822D:
LABEL_23:
          v4 = 11;
          goto LABEL_18;
        case 0x822E:
LABEL_50:
          v4 = 14;
          goto LABEL_18;
        case 0x822F:
LABEL_64:
          v4 = 12;
          goto LABEL_18;
        case 0x8230:
LABEL_65:
          v4 = 15;
          goto LABEL_18;
        case 0x8231:
          v4 = 34;
          goto LABEL_18;
        case 0x8232:
          v4 = 24;
          goto LABEL_18;
        case 0x8233:
          v4 = 38;
          goto LABEL_18;
        case 0x8234:
          v4 = 28;
          goto LABEL_18;
        case 0x8235:
          v4 = 41;
          goto LABEL_18;
        case 0x8236:
          v4 = 31;
          goto LABEL_18;
        case 0x8237:
          v4 = 35;
          goto LABEL_18;
        case 0x8238:
          v4 = 25;
          goto LABEL_18;
        case 0x8239:
          v4 = 39;
          goto LABEL_18;
        case 0x823A:
          v4 = 29;
          goto LABEL_18;
        case 0x823B:
          v4 = 42;
          goto LABEL_18;
        case 0x823C:
          v4 = 32;
          goto LABEL_18;
        default:
          if (v3 == 33190)
          {
            v4 = 20;
            goto LABEL_18;
          }
          if (v3 != 33191)
            goto LABEL_18;
          break;
      }
      goto LABEL_63;
    }
    if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) <= 0x804Fu)
    {
      if (v3 == 32828 || v3 == 32832)
        goto LABEL_57;
      if (v3 == 32837)
LABEL_44:
        v4 = 1;
    }
    else
    {
      switch(*(_WORD *)(*((_QWORD *)a2 + 6) + 192))
      {
        case 0x8050:
        case 0x8056:
        case 0x8057:
          goto LABEL_54;
        case 0x8051:
LABEL_33:
          v4 = 2;
          break;
        case 0x8052:
        case 0x8053:
        case 0x8054:
        case 0x8055:
          break;
        case 0x8058:
LABEL_45:
          v4 = 3;
          break;
        case 0x8059:
LABEL_72:
          v4 = 9;
          break;
        default:
          if (v3 == 33189)
            v4 = 19;
          break;
      }
    }
  }
  else
  {
    if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) <= 0x8CABu)
    {
      if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) <= 0x88EFu)
      {
        switch(*(_WORD *)(*((_QWORD *)a2 + 6) + 192))
        {
          case 0x8814:
            v4 = 16;
            break;
          case 0x8816:
          case 0x8818:
            goto LABEL_50;
          case 0x8819:
            goto LABEL_65;
          case 0x881A:
            v4 = 13;
            break;
          case 0x881C:
          case 0x881E:
            goto LABEL_23;
          case 0x881F:
            goto LABEL_64;
          default:
            goto LABEL_18;
        }
        goto LABEL_18;
      }
      switch(*(_WORD *)(*((_QWORD *)a2 + 6) + 192))
      {
        case 0x8C3A:
          v4 = 18;
          goto LABEL_18;
        case 0x8C3B:
        case 0x8C3C:
        case 0x8C3E:
        case 0x8C3F:
          goto LABEL_18;
        case 0x8C3D:
          v4 = 17;
          goto LABEL_18;
        case 0x8C40:
        case 0x8C41:
          goto LABEL_33;
        case 0x8C42:
        case 0x8C43:
          goto LABEL_45;
        default:
          if (v3 == 35056)
          {
            v4 = 21;
            goto LABEL_18;
          }
          if (v3 != 35448)
            goto LABEL_18;
          break;
      }
LABEL_57:
      v4 = 0;
      goto LABEL_18;
    }
    if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) > 0x8D87u)
    {
      if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) <= 0x8F93u)
      {
        switch(v3)
        {
          case 0x8D88u:
            v4 = 40;
            break;
          case 0x8D8Eu:
            v4 = 37;
            break;
          case 0x8D8Fu:
            v4 = 36;
            break;
        }
      }
      else
      {
        switch(*(_WORD *)(*((_QWORD *)a2 + 6) + 192))
        {
          case 0x8F94:
            v4 = 4;
            break;
          case 0x8F95:
            v4 = 5;
            break;
          case 0x8F96:
            v4 = 6;
            break;
          case 0x8F97:
            v4 = 7;
            break;
          default:
            if (v3 == 36975)
              goto LABEL_72;
            break;
        }
      }
    }
    else if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) > 0x8D75u)
    {
      if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) > 0x8D7Cu)
      {
        if (v3 == 36221)
        {
          v4 = 26;
        }
        else if (v3 == 36226)
        {
          v4 = 43;
        }
      }
      else if (v3 == 36214)
      {
        v4 = 30;
      }
      else if (v3 == 36220)
      {
        v4 = 27;
      }
    }
    else
    {
      if (*(unsigned __int16 *)(*((_QWORD *)a2 + 6) + 192) <= 0x8D61u)
      {
        if (v3 != 36012)
        {
          if (v3 == 36168)
            v4 = 23;
          goto LABEL_18;
        }
LABEL_63:
        v4 = 22;
        goto LABEL_18;
      }
      if (v3 == 36194)
      {
LABEL_54:
        v4 = 8;
      }
      else if (v3 == 36208)
      {
        v4 = 33;
      }
    }
  }
LABEL_18:
  v5 = (unint64_t *)(this + 8 * v4 + 552);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 + 1, v5));
  return this;
}

uint64_t GLDDeviceRec::telemetryEmitUsage(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  const __CFString *v5;

  v1 = this;
  v2 = *(_QWORD *)(this + 536);
  for (i = *(_QWORD *)(this + 544) ^ v2; i; i ^= v4)
  {
    v4 = i & -i;
    if (v4 >= 0x2000)
    {
      if (v4 < 0x80000)
      {
        if (v4 >= 0x10000)
        {
          switch(v4)
          {
            case 0x10000:
              v5 = CFSTR("PCF");
              break;
            case 0x20000:
              v5 = CFSTR("Aniso");
              break;
            case 0x40000:
              v5 = CFSTR("MSAA");
              break;
            default:
              goto LABEL_58;
          }
        }
        else
        {
          switch(v4)
          {
            case 0x2000:
              v5 = CFSTR("TF");
              break;
            case 0x4000:
              v5 = CFSTR("Readback");
              break;
            case 0x8000:
              v5 = CFSTR("Blit");
              break;
            default:
              goto LABEL_58;
          }
        }
      }
      else if (v4 <= 0xFFFFFF)
      {
        switch(v4)
        {
          case 0x80000:
            v5 = CFSTR("ColorConversion");
            break;
          case 0x100000:
            v5 = CFSTR("MipmapGen");
            break;
          case 0x800000:
            v5 = CFSTR("VertexSpill");
            break;
          default:
            goto LABEL_58;
        }
      }
      else if (v4 > 0x3FFFFFF)
      {
        if (v4 == 0x4000000)
        {
          v5 = CFSTR("MSAACombinedResolve");
        }
        else
        {
          if (v4 != 0x40000000)
          {
LABEL_58:
            v5 = &stru_24FFEDCC0;
            goto LABEL_59;
          }
          v5 = CFSTR("MRTSpill");
        }
      }
      else if (v4 == 0x1000000)
      {
        v5 = CFSTR("FragmentSpill");
      }
      else
      {
        if (v4 != 0x2000000)
          goto LABEL_58;
        v5 = CFSTR("SWRender");
      }
    }
    else if (v4 > 127)
    {
      if (v4 > 1023)
      {
        switch(v4)
        {
          case 1024:
            v5 = CFSTR("Scissor");
            break;
          case 2048:
            v5 = CFSTR("StencilTest");
            break;
          case 4096:
            v5 = CFSTR("OQ");
            break;
          default:
            goto LABEL_58;
        }
      }
      else
      {
        switch(v4)
        {
          case 128:
            v5 = CFSTR("AlphaToOne");
            break;
          case 256:
            v5 = CFSTR("AlphaToCoverage");
            break;
          case 512:
            v5 = CFSTR("SampleCoverage");
            break;
          default:
            goto LABEL_58;
        }
      }
    }
    else
    {
      if (v4 <= 15)
      {
        v5 = CFSTR("AlphaTest");
        switch(v4)
        {
          case 1:
            goto LABEL_59;
          case 2:
            v5 = CFSTR("Blending");
            break;
          case 4:
            v5 = CFSTR("Cull");
            break;
          case 8:
            v5 = CFSTR("DepthTest");
            break;
          default:
            goto LABEL_58;
        }
        goto LABEL_59;
      }
      switch(v4)
      {
        case 16:
          v5 = CFSTR("Dither");
          break;
        case 32:
          v5 = CFSTR("PolygonOffset");
          break;
        case 64:
          v5 = CFSTR("RasterDiscard");
          break;
        default:
          goto LABEL_58;
      }
    }
LABEL_59:
    this = objc_msgSend(*(id *)(v1 + 496), "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1), v5);
  }
  *(_QWORD *)(v1 + 544) = v2;
  return this;
}

uint64_t GLDDeviceRec::telemetryEmitTexture(uint64_t this)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  const __CFString *v5;
  void *v6;
  unint64_t *v7;
  unint64_t v8;

  v1 = this;
  v2 = 0;
  v3 = this + 552;
  do
  {
    if (atomic_load((unint64_t *)(v3 + 8 * v2)))
    {
      v5 = &stru_24FFEDCC0;
      if (v2 <= 0x31)
        v5 = *(&off_24FFEB8B0 + v2);
      v6 = *(void **)(v1 + 496);
      v7 = (unint64_t *)(v3 + 8 * v2);
      v8 = atomic_load(v7);
      this = objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v8), v5);
      atomic_store(0, v7);
    }
    ++v2;
  }
  while (v2 != 50);
  return this;
}

uint64_t GLDDeviceRec::emitTelemetry(id *this)
{
  uint64_t result;

  GLDDeviceRec::telemetryEmitAPI((GLDDeviceRec *)this);
  GLDDeviceRec::telemetryEmitUsage((uint64_t)this);
  GLDDeviceRec::telemetryEmitTexture((uint64_t)this);
  result = objc_msgSend(this[62], "count");
  if (result)
  {
    objc_msgSend(this[62], "addEntriesFromDictionary:", this[61]);
    AnalyticsSendEventLazy();
    return objc_msgSend(this[62], "removeAllObjects");
  }
  return result;
}

NSObject *GLDDeviceRec::telemetryCreateTimerWithInterval(int a1, dispatch_queue_t queue, double a3, void *a4)
{
  NSObject *v6;
  double v7;
  dispatch_time_t v8;

  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, queue);
  if (v6)
  {
    v7 = a3 * 1000000000.0;
    v8 = dispatch_time(0, (uint64_t)v7);
    dispatch_source_set_timer(v6, v8, (unint64_t)v7, 0x5F5E100uLL);
    dispatch_source_set_event_handler(v6, a4);
    dispatch_resume(v6);
  }
  return v6;
}

void GLDDeviceRec::telemetryStartTimer(GLDDeviceRec *this, double a2)
{
  NSObject *v2;
  _QWORD v3[6];
  _QWORD v4[4];

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  *(double *)&v4[3] = a2;
  v2 = *((_QWORD *)this + 64);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = ___ZN12GLDDeviceRec19telemetryStartTimerEd_block_invoke;
  v3[3] = &unk_24FFEB7F0;
  v3[4] = v4;
  v3[5] = this;
  *((_QWORD *)this + 65) = GLDDeviceRec::telemetryCreateTimerWithInterval((int)this, v2, a2, v3);
  _Block_object_dispose(v4, 8);
}

uint64_t ___ZN12GLDDeviceRec19telemetryStartTimerEd_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;

  v2 = *(_QWORD *)(a1 + 40);
  GLDDeviceRec::emitTelemetry((id *)v2);
  dispatch_source_cancel(*(dispatch_source_t *)(v2 + 520));
  dispatch_release(*(dispatch_object_t *)(v2 + 520));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(double *)(v3 + 24);
  if (v4 <= 3840.0)
  {
    *(double *)(v3 + 24) = v4 + v4;
    v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  return GLDDeviceRec::telemetryStartTimer((GLDDeviceRec *)v2, v4);
}

uint64_t ___ZN12GLDDeviceRec9sendEventEP8NSStringP19NSMutableDictionaryIS1_P8NSObjectE_block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t ___ZL18isIgnoredFrameworkP8NSString_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24FFEF4D0);
  isIgnoredFramework(NSString *)::ignoredFrameworks = result;
  return result;
}

BOOL _depthStencilKeyEqual(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t _depthStencilKeyHash(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = __ROR8__((0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *a1) | ((0xC2B2AE3D27D4EB4FLL * *a1) >> 33))) ^ 0x27D4EB2F165667CDLL, 37);
  v2 = 0xC2B2AE3D27D4EB4FLL
     * ((0x9E3779B185EBCA87 * v1 - 0x7A1435883D4D519DLL) ^ ((0x9E3779B185EBCA87 * v1 - 0x7A1435883D4D519DLL) >> 33));
  return (0x165667B19E3779F9 * (v2 ^ (v2 >> 29))) ^ ((0x165667B19E3779F9 * (v2 ^ (v2 >> 29))) >> 32);
}

void GLDTextureRec::chooseTextureFormat(GLDTextureRec *this, unsigned int a2, unsigned int a3, int a4)
{
  int v4;
  GLDContextRec *v5;

  if (a4 > 36207)
  {
    if (a4 <= 37807)
    {
      if (a4 <= 36755)
      {
        switch(a4)
        {
          case 36208:
          case 36209:
          case 36214:
          case 36215:
          case 36220:
          case 36221:
          case 36226:
          case 36227:
            return;
          case 36210:
          case 36211:
          case 36212:
          case 36213:
          case 36216:
          case 36217:
          case 36218:
          case 36219:
          case 36222:
          case 36223:
          case 36224:
          case 36225:
            goto LABEL_40;
          default:
            switch(a4)
            {
              case 36232:
              case 36233:
              case 36238:
              case 36239:
                return;
              default:
                goto LABEL_40;
            }
        }
      }
      else
      {
        switch(a4)
        {
          case 37488:
          case 37489:
          case 37490:
          case 37491:
          case 37492:
          case 37493:
          case 37494:
          case 37495:
          case 37496:
          case 37497:
            return;
          default:
            switch(a4)
            {
              case 36756:
              case 36757:
              case 36758:
              case 36759:
                return;
              default:
                if (a4 != 36975)
                  goto LABEL_40;
                break;
            }
            break;
        }
      }
    }
    else
    {
      switch(a4)
      {
        case 37808:
        case 37809:
        case 37810:
        case 37811:
        case 37812:
        case 37813:
        case 37814:
        case 37815:
        case 37816:
        case 37817:
        case 37818:
        case 37819:
        case 37820:
        case 37821:
        case 37840:
        case 37841:
        case 37842:
        case 37843:
        case 37844:
        case 37845:
        case 37846:
        case 37847:
        case 37848:
        case 37849:
        case 37850:
        case 37851:
        case 37852:
        case 37853:
        case 37874:
        case 37875:
        case 37876:
        case 37877:
        case 37878:
        case 37879:
        case 37880:
        case 37881:
        case 37883:
        case 37884:
        case 37885:
        case 37886:
        case 37887:
        case 37888:
        case 37889:
        case 37890:
        case 37891:
        case 37892:
        case 37893:
        case 37894:
        case 37895:
        case 37896:
        case 37897:
        case 37898:
        case 37899:
        case 37900:
        case 37901:
        case 37902:
        case 37903:
          return;
        default:
          goto LABEL_40;
      }
    }
    return;
  }
  if (a4 > 35408)
  {
    if (a4 > 35839)
    {
      if (a4 > 36011)
      {
        if (a4 > 36167)
        {
          if (a4 == 36168 || a4 == 36194)
            return;
          goto LABEL_40;
        }
        if (a4 != 36012)
        {
          v4 = 36013;
LABEL_39:
          if (a4 != v4)
            goto LABEL_40;
        }
      }
      else
      {
        switch(a4)
        {
          case 35840:
          case 35841:
          case 35842:
          case 35843:
            return;
          default:
            switch(a4)
            {
              case 35898:
              case 35901:
              case 35905:
              case 35907:
                return;
              default:
                goto LABEL_40;
            }
        }
      }
    }
    else
    {
      switch(a4)
      {
        case 35409:
        case 35412:
        case 35413:
        case 35414:
        case 35415:
        case 35420:
        case 35421:
        case 35422:
        case 35423:
        case 35429:
        case 35430:
        case 35431:
        case 35432:
        case 35433:
        case 35434:
        case 35435:
        case 35436:
        case 35437:
        case 35438:
        case 35439:
        case 35440:
        case 35441:
        case 35442:
        case 35443:
        case 35444:
        case 35446:
        case 35447:
        case 35448:
          return;
        default:
          goto LABEL_40;
      }
    }
  }
  else
  {
    if (a4 <= 33320)
    {
      if (a4 > 32848)
      {
        switch(a4)
        {
          case 32849:
          case 32854:
          case 32855:
          case 32856:
          case 32857:
            return;
          case 32850:
          case 32851:
          case 32852:
          case 32853:
            goto LABEL_40;
          default:
            if ((a4 - 33189) >= 3)
              goto LABEL_40;
            break;
        }
        return;
      }
      if (a4 == 32828 || a4 == 32832 || a4 == 32837)
        return;
LABEL_40:
      v5 = (GLDContextRec *)MTLReleaseAssertionFailure();
      GLDContextRec::getCommandBuffer(v5);
      return;
    }
    switch(a4)
    {
      case 33321:
      case 33323:
      case 33325:
      case 33326:
      case 33327:
      case 33328:
      case 33329:
      case 33330:
      case 33331:
      case 33332:
      case 33333:
      case 33334:
      case 33335:
      case 33336:
      case 33337:
      case 33338:
      case 33339:
      case 33340:
        return;
      case 33322:
      case 33324:
        goto LABEL_40;
      default:
        switch(a4)
        {
          case 34836:
          case 34837:
          case 34838:
          case 34840:
          case 34841:
          case 34842:
          case 34843:
          case 34844:
          case 34846:
          case 34847:
            return;
          case 34839:
          case 34845:
            goto LABEL_40;
          default:
            v4 = 35056;
            goto LABEL_39;
        }
    }
  }
}

void GLDContextRec::getCommandBuffer(GLDContextRec *this)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x2348CF1D8]();
  v3 = (id)objc_msgSend(*((id *)this + 10), "commandBufferWithUnretainedReferences");
  *((_QWORD *)this + 5) = v3;
  objc_msgSend(v3, "setLabel:", *MEMORY[0x24BDDD9C0]);
  *((_QWORD *)this + 8) = GLDDeviceRec::newResourceList(*((GLRResourceListPool ***)this + 12));
  objc_autoreleasePoolPop(v2);
}

void GLDContextRec::endRenderPass(GLDContextRec *this)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t i;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  unsigned __int8 *v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int v32;

  v2 = *((_QWORD *)this + 423);
  v3 = *((_QWORD *)this + 424) - v2;
  if (v3)
  {
    v4 = v3 >> 3;
    if (v4 <= 1)
      v4 = 1;
    v5 = (uint64_t *)*((_QWORD *)this + 423);
    do
    {
      v6 = *v5++;
      *(_BYTE *)(v6 + 32) = 0;
      --v4;
    }
    while (v4);
  }
  *((_QWORD *)this + 424) = v2;
  v7 = (*((unsigned __int8 *)this + 5040) | *((unsigned __int8 *)this + 5032)) == 0;
  for (i = 562; i != 566; ++i)
  {
    v9 = 1 << (i - 50);
    if ((*((_DWORD *)this + 1187) & v9) != 0)
    {
      v10 = *((_DWORD *)this + 1258);
      if (v7)
      {
        v10 |= v9;
        *((_DWORD *)this + 1258) = v10;
      }
      v11 = *((_QWORD *)this + i);
      if ((v10 & v9) != 0)
      {
        if ((v11 | 2) == 3)
        {
          if (*((_DWORD *)this + 1150) <= 1u)
            v12 = *((_DWORD *)this + 1263);
          else
            v12 = *((_DWORD *)this + 1263) | 0x2000;
          *((_DWORD *)this + 1263) = v12 | 0x400;
        }
      }
      else if (v11 == 3)
      {
        *((_DWORD *)this + 1263) |= 0x4000400u;
        *((_QWORD *)this + 53) |= 0x4000000uLL;
        *((_QWORD *)this + i) = 2;
        v11 = 2;
      }
      else if (v11 == 1)
      {
        v11 = 0;
        *((_QWORD *)this + i) = 0;
      }
      objc_msgSend(*((id *)this + 2), "setColorStoreAction:atIndex:", v11);
      v7 = 0;
    }
  }
  v13 = *((_DWORD *)this + 1187);
  if ((v13 & 0x100) != 0)
  {
    v14 = *((_QWORD *)this + 570);
    if ((*((_BYTE *)this + 5033) & 1) != 0)
    {
      if ((v14 | 2) == 3)
      {
        if (*((_DWORD *)this + 1150) <= 1u)
          v15 = *((_DWORD *)this + 1263);
        else
          v15 = *((_DWORD *)this + 1263) | 0x2000;
        *((_DWORD *)this + 1263) = v15 | 0x800;
      }
    }
    else if (v14 == 3)
    {
      *((_DWORD *)this + 1263) |= 0x4000800u;
      *((_QWORD *)this + 53) |= 0x4000000uLL;
      v14 = 2;
      *((_QWORD *)this + 570) = 2;
    }
    else if (v14 == 1)
    {
      v14 = 0;
      *((_QWORD *)this + 570) = 0;
    }
    objc_msgSend(*((id *)this + 2), "setDepthStoreAction:", v14);
    v13 = *((_DWORD *)this + 1187);
  }
  if ((v13 & 0x200) != 0)
  {
    v16 = *((_QWORD *)this + 571);
    if ((*((_BYTE *)this + 5033) & 2) != 0)
    {
      if ((v16 | 2) == 3)
      {
        if (*((_DWORD *)this + 1150) <= 1u)
          v17 = *((_DWORD *)this + 1263);
        else
          v17 = *((_DWORD *)this + 1263) | 0x2000;
        *((_DWORD *)this + 1263) = v17 | 0x1000;
      }
    }
    else if (v16 == 3)
    {
      *((_DWORD *)this + 1263) |= 0x4001000u;
      *((_QWORD *)this + 53) |= 0x4000000uLL;
      v16 = 2;
      *((_QWORD *)this + 571) = 2;
    }
    else if (v16 == 1)
    {
      v16 = 0;
      *((_QWORD *)this + 571) = 0;
    }
    objc_msgSend(*((id *)this + 2), "setStencilStoreAction:", v16);
  }
  GLDQueryStagingBuffer::deferProcessResults(*((_DWORD **)this + 595), this, *((GLRQueryResultBuffer **)this + 594), *((_QWORD *)this + 596));
  objc_msgSend(*((id *)this + 2), "endEncoding");
  if (!*((_BYTE *)this + 2232))
    goto LABEL_61;
  v18 = *((_QWORD *)this + 282);
  v19 = *((_QWORD *)this + 288);
  if (!v19)
  {
    v24 = 0;
    goto LABEL_60;
  }
  v20 = 0;
  *(_QWORD *)&v21 = -1;
  *((_QWORD *)&v21 + 1) = -1;
  while (1)
  {
    v22 = (unsigned __int8 *)(*((_QWORD *)this + 287) + 24 * v20);
    v23 = *v22;
    if (v23 == 1)
    {
      v25 = *((_QWORD *)this + 280);
      v26 = v25 + 40 * v18;
      *(_QWORD *)(v26 + 32) = -1;
      *(_OWORD *)v26 = v21;
      *(_OWORD *)(v26 + 16) = v21;
      v27 = (*((_QWORD *)v22 + 2) - *((_QWORD *)v22 + 1) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      *(_DWORD *)v26 = *(_DWORD *)v22 >> 8;
      *(_DWORD *)(v26 + 4) = *(_DWORD *)(*((_QWORD *)this + 284) + 4 * *((unsigned int *)v22 + 1));
      *(_QWORD *)(v26 + 8) = *((_QWORD *)v22 + 1);
      *(_QWORD *)(v26 + 16) = *((_QWORD *)v22 + 1) + v27;
      v24 = v20 + 1;
      v19 = *((_QWORD *)this + 288);
      if (v20 + 1 < v19)
      {
        v28 = *((_QWORD *)this + 287) + 24 * v24;
        if (*(_BYTE *)v28 == 2)
        {
          v29 = *(_QWORD *)(v28 + 8);
          v30 = (*(_QWORD *)(v28 + 16) - v29 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          v31 = v25 + 40 * v18;
          *(_QWORD *)(v31 + 24) = v29;
          *(_QWORD *)(v31 + 32) = *(_QWORD *)(v28 + 8) + v30;
          v24 = v20 + 2;
        }
      }
      v18 = (v18 + 1) % *((_QWORD *)this + 281);
      goto LABEL_56;
    }
    if (v23 == 255)
      break;
    v24 = v20 + 1;
LABEL_56:
    v20 = v24;
    if (v24 >= v19)
      goto LABEL_60;
  }
  v24 = v20;
LABEL_60:
  *((_QWORD *)this + 282) = v18;
  memset(*((void **)this + 287), 255, 24 * v24);
  *((_QWORD *)this + 285) = *((_QWORD *)this + 284);
LABEL_61:
  v32 = *((_DWORD *)this + 1259);
  if ((v32 & 0x100) != 0)
    *((_DWORD *)this + 1263) |= 0x40u;
  if ((v32 & 0x200) != 0)
    *((_DWORD *)this + 1263) |= 0x80u;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 629) = 0;
  *((_DWORD *)this + 1260) = 0;
  *((_DWORD *)this + 1263) |= 0x200u;
  if (*((_BYTE *)this + 5087) || *((_DWORD *)this + 1257) >= 0x10u)
    GLDContextRec::flushContext(this);
}

unint64_t GLDContextRec::buildPipelineStateDescriptor(GLDContextRec *this)
{
  uint64_t v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t i;
  BOOL v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  pthread_rwlock_t *v24;
  unint64_t result;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v2 = *((_QWORD *)this + 13);
  v3 = (_BYTE *)(v2 + 15712);
  if ((*((_BYTE *)this + 2484) & 2) != 0)
  {
    for (i = 0; i != 4; ++i)
      *((_WORD *)this + i + 1084) = *((_QWORD *)this + i + 552);
    v4 = *((_QWORD *)this + 272) & 0xFFF0B1FFFFFFFFFFLL | ((unint64_t)(*((_QWORD *)this + 560) == 252) << 41) & 0xFFF0FFFFFFFFFFFFLL | ((unint64_t)(*((_QWORD *)this + 561) == 253) << 46) & 0xFFF0FFFFFFFFFFFFLL | ((*((_DWORD *)this + 1149) & 0xFLL) << 48);
    *((_QWORD *)this + 272) = v4;
  }
  else
  {
    v4 = *((_QWORD *)this + 272);
  }
  if (*(_BYTE *)(v2 + 13104))
    v6 = *(_BYTE *)(v2 + 13105) == 0;
  else
    v6 = 0;
  v7 = v6;
  v8 = *((_DWORD *)this + 94) & 1;
  v6 = (*((_BYTE *)this + 376) & 1 & v7) == 0;
  v9 = 0x2000000000000000;
  if (v6)
    v9 = 0;
  v10 = v9 | v4 & 0xDFFFFFFFFFFFFFFFLL;
  *((_QWORD *)this + 272) = v10;
  v11 = *((unsigned __int8 *)this + 2652);
  if (*((_BYTE *)this + 2652))
    v12 = v10 & 0xFFFF7FFFFFFFFFFFLL;
  else
    v12 = v10 & 0xFFFF7FFFFFFFFFFFLL | ((unint64_t)(*v3 == 0) << 47);
  v13 = (unint64_t *)((char *)this + 2136);
  *((_QWORD *)this + 272) = v12;
  if ((v12 & 0xE000000000000) == 0)
  {
    *((_QWORD *)this + 268) |= 0xFFFFFFFFuLL;
    v17 = v12 & 0x3FFFDFFF00000000 | 0x3F800000;
LABEL_28:
    *((_QWORD *)this + 272) = v17;
    goto LABEL_29;
  }
  v14 = v12 & 0xBFFFFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v2 + 15410) != 0) << 62);
  *((_QWORD *)this + 272) = v14;
  v15 = v14 & 0x7FFFFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v2 + 15409) != 0) << 63);
  *((_QWORD *)this + 272) = v15;
  if (*(_BYTE *)(v2 + 15411))
    v16 = *(unsigned int *)(v2 + 15400);
  else
    v16 = 1065353216;
  v18 = v16 | v15 & 0xFFFFFFFF00000000;
  *((_QWORD *)this + 272) = v18;
  *((_DWORD *)this + 536) = *(_DWORD *)(v2 + 15404);
  v19 = v18 & 0xFFFFDFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v2 + 15412) != 0) << 45);
  *((_QWORD *)this + 272) = v19;
  if ((v12 & 0x2000000000000000) == 0)
  {
    if (*(_BYTE *)(v2 + 13105))
      v20 = 0;
    else
      v20 = v8 << 61;
    v17 = v20 | v19 & 0xDFFFFFFFFFFFFFFFLL;
    goto LABEL_28;
  }
LABEL_29:
  if ((*((_BYTE *)this + 2484) & 1) != 0)
  {
    if (*((_QWORD *)this + 49) && *((_BYTE *)this + 5082))
    {
      v21 = (char *)this + 1856;
    }
    else
    {
      *((_BYTE *)this + 5082) = 0;
      v21 = (char *)this + 1984;
    }
    v22 = *((_OWORD *)v21 + 3);
    *((_OWORD *)this + 131) = *((_OWORD *)v21 + 2);
    *((_OWORD *)this + 132) = v22;
    *((_QWORD *)this + 266) = *((_QWORD *)v21 + 8);
    v23 = *((_OWORD *)v21 + 1);
    *((_OWORD *)this + 129) = *(_OWORD *)v21;
    *((_OWORD *)this + 130) = v23;
  }
  v24 = (pthread_rwlock_t *)(*((_QWORD *)this + 12) + 216);
  if (v11)
  {
    result = GLRFunctionCache::getKey(v24, *((void **)this + 516));
    v26 = *((_QWORD *)this + 268);
    v27 = result & 0xFFFFFF | ((unint64_t)*((unsigned __int16 *)this + 1071) << 48);
  }
  else
  {
    result = GLRFunctionCache::getKey(v24, *((void **)this + 511));
    v26 = *((_QWORD *)this + 268);
    v28 = *v13 & 0xFFFFFFFFFF000000 | result & 0xFFFFFF;
    *v13 = v28;
    if (*v3)
    {
      v27 = v28 & 0xFFFF000000FFFFFFLL;
    }
    else
    {
      result = GLRFunctionCache::getKey((pthread_rwlock_t *)(*((_QWORD *)this + 12) + 216), *((void **)this + 515));
      v26 = *((_QWORD *)this + 268);
      v27 = *v13 & 0xFFFF000000FFFFFFLL | ((result & 0xFFFFFF) << 24);
    }
  }
  *v13 = v27;
  *((_QWORD *)this + 268) = v26;
  *((_DWORD *)this + 621) = 0;
  return result;
}

BOOL GLDContextRec::setRenderTexturesAndSamplersInternal(GLDContextRec *this, unsigned int a2, int *a3, _QWORD *a4, _QWORD *a5, float a6)
{
  uint64_t v10;
  unsigned int *v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t i;
  int v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  float v33;
  float v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v41;
  uint64_t v42;

  v41 = *a3;
  v10 = *((_QWORD *)this + a2 + 188);
  if (v10)
  {
    v11 = *(unsigned int **)(*(_QWORD *)(*((_QWORD *)this + a2 + 183) + 24) + 72);
    if (v11)
    {
      v14 = *v11;
      v12 = v11 + 1;
      v13 = v14;
      if (v14)
      {
        v15 = 0;
        v42 = *(_QWORD *)(*(_QWORD *)(v10 + 24) + 48);
        do
        {
          v16 = *(unsigned int *)(v42 + 4 * v12[v15]);
          if ((*((_DWORD *)this + 661) & (1 << v16)) != 0)
          {
            v17 = *((_QWORD *)this + v16 + 151);
            if (v17)
            {
              v18 = *(_QWORD *)(v17 + 24);
              LOBYTE(a6) = *((_BYTE *)this + v16 + 1816);
              v19 = (float)LODWORD(a6);
              if (*(float *)(v18 + 20) >= v19)
                v20 = v19;
              else
                v20 = *(float *)(v18 + 20);
              if (*(float *)(v18 + 24) >= v19)
                v21 = v19;
              else
                v21 = *(float *)(v18 + 24);
              v22 = *(_QWORD *)(v17 + 40);
              GLRResourceList::addResource(*((_QWORD *)this + 8), v22);
              ((void (*)(_QWORD, _QWORD, _QWORD, uint64_t, float, float))a4[1])(*((_QWORD *)this + 2), *a4, *(_QWORD *)(v22 + 32), v15, v20, v21);
            }
          }
          if ((*((_DWORD *)this + 660) & (1 << v16)) != 0)
          {
            v23 = (char *)this + 8 * v16;
            v24 = *((_QWORD *)v23 + 447);
            *a3 &= ~(1 << v15);
            if (v24)
            {
              v25 = *((_QWORD *)v23 + 119);
              if (*(_QWORD *)(v25 + 136))
              {
                v26 = (uint64_t *)(v23 + 952);
                GLDContextRec::dispatchImageQueueEvent(this, (GLDTextureRec *)v25);
                v25 = *v26;
              }
              if (*(_BYTE *)(v25 + 74))
                *a3 |= 1 << v15;
              v27 = *(_QWORD *)(v24 + 40);
              GLRResourceList::addResource(*((_QWORD *)this + 8), v24);
              GLRResourceList::addResource(*((_QWORD *)this + 8), v27);
              ((void (*)(_QWORD, _QWORD, _QWORD, uint64_t))a5[1])(*((_QWORD *)this + 2), *a5, *(_QWORD *)(v27 + 32), v15);
            }
          }
          ++v15;
        }
        while (v13 != v15);
      }
    }
  }
  else
  {
    for (i = 0; i != 16; ++i)
    {
      v29 = 1 << i;
      if ((*((_DWORD *)this + 661) & (1 << i)) != 0)
      {
        v30 = *((_QWORD *)this + i + 151);
        if (v30)
        {
          v31 = *(_QWORD *)(v30 + 24);
          LOBYTE(a6) = *((_BYTE *)this + i + 1816);
          v32 = (float)LODWORD(a6);
          if (*(float *)(v31 + 20) >= v32)
            v33 = v32;
          else
            v33 = *(float *)(v31 + 20);
          if (*(float *)(v31 + 24) >= v32)
            v34 = v32;
          else
            v34 = *(float *)(v31 + 24);
          v35 = *(_QWORD *)(v30 + 40);
          GLRResourceList::addResource(*((_QWORD *)this + 8), v35);
          ((void (*)(_QWORD, _QWORD, _QWORD, uint64_t, float, float))a4[1])(*((_QWORD *)this + 2), *a4, *(_QWORD *)(v35 + 32), i, v33, v34);
        }
      }
      if ((*((_DWORD *)this + 660) & v29) != 0)
      {
        v36 = (char *)this + 8 * i;
        v37 = *((_QWORD *)v36 + 447);
        *a3 &= ~v29;
        if (v37)
        {
          v38 = *((_QWORD *)v36 + 119);
          if (*(_QWORD *)(v38 + 136))
          {
            GLDContextRec::dispatchImageQueueEvent(this, (GLDTextureRec *)v38);
            v38 = *((_QWORD *)v36 + 119);
          }
          if (*(_BYTE *)(v38 + 74))
            *a3 |= v29;
          v39 = *(_QWORD *)(v37 + 40);
          GLRResourceList::addResource(*((_QWORD *)this + 8), v37);
          GLRResourceList::addResource(*((_QWORD *)this + 8), v39);
          ((void (*)(_QWORD, _QWORD, _QWORD, uint64_t))a5[1])(*((_QWORD *)this + 2), *a5, *(_QWORD *)(v39 + 32), i);
        }
      }
    }
  }
  return v41 != *a3;
}

BOOL GLDContextRec::setRenderSamplersAndTextures(GLDContextRec *this, float a2)
{
  float v3;
  _BOOL8 result;

  if (GLDContextRec::setRenderTexturesAndSamplersInternal(this, 0, (int *)this + 664, (_QWORD *)this + 439, (_QWORD *)this + 435, a2))
  {
    *((_DWORD *)this + 546) = *((_DWORD *)this + 664);
    *((_DWORD *)this + 618) |= 8u;
  }
  result = GLDContextRec::setRenderTexturesAndSamplersInternal(this, 4u, (int *)this + 665, (_QWORD *)this + 441, (_QWORD *)this + 437, v3);
  if (result)
  {
    *((_DWORD *)this + 547) = *((_DWORD *)this + 665);
    *((_DWORD *)this + 618) |= 8u;
  }
  return result;
}

uint64_t GLDContextRec::setRenderVertexBuffers(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = this;
  v2 = *(unsigned int *)(this + 316);
  if ((_DWORD)v2)
  {
    for (i = 0; i != v2; ++i)
    {
      v4 = *(unsigned __int8 *)(v1 + *(unsigned __int8 *)(v1 + 320 + i) + 336);
      v5 = *(_DWORD *)(v1 + 2668);
      if (((1 << v4) & v5) != 0)
      {
        *(_DWORD *)(v1 + 2668) = (1 << v4) ^ v5;
        v6 = *(_QWORD *)(v1 + 8 * v4 + 2672);
        v7 = *(unsigned int *)(v1 + 4 * v4 + 2800);
        v8 = *(_QWORD *)(v6 + 40);
        GLRResourceList::addResource(*(_QWORD *)(v1 + 64), v6);
        this = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(v1 + 3456))(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 3448), v8, v7, i + 15);
      }
      else
      {
        this = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(v1 + 3552))(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 3544), *(unsigned int *)(v1 + 4 * v4 + 2800), i + 15);
      }
    }
  }
  v9 = *(_QWORD *)(v1 + 2864);
  if (v9)
    return GLRResourceList::addResource(*(_QWORD *)(v1 + 64), v9);
  return this;
}

uint64_t GLDContextRec::setRenderVertexCurrents(GLDContextRec *this)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  _OWORD *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  _OWORD *v8;
  _BYTE v10[256];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *((unsigned int *)this + 69);
  if ((_DWORD)v1)
  {
    v2 = *((_QWORD *)this + 13);
    v3 = (unsigned __int8 *)this + 280;
    v4 = v10;
    v5 = *((unsigned int *)this + 69);
    do
    {
      v6 = *v3++;
      v7 = v2 + 32 * (v6 - 16) + 6416;
      v8 = (_OWORD *)(v2 + 6160 + 16 * v6);
      if (v6 >= 0x10)
        v8 = (_OWORD *)v7;
      *v4++ = *v8;
      --v5;
    }
    while (v5);
  }
  return (*((uint64_t (**)(_QWORD, _QWORD, _BYTE *, uint64_t, uint64_t))this + 428))(*((_QWORD *)this + 2), *((_QWORD *)this + 427), v10, 16 * v1, 14);
}

uint64_t GLDContextRec::setRenderPrimitiveCurrents(GLDContextRec *this)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  _OWORD *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  _OWORD *v8;
  _BYTE v10[256];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *((unsigned int *)this + 74);
  if ((_DWORD)v1)
  {
    v2 = *((_QWORD *)this + 13);
    v3 = (unsigned __int8 *)this + 300;
    v4 = v10;
    v5 = *((unsigned int *)this + 74);
    do
    {
      v6 = *v3++;
      v7 = v2 + 32 * (v6 - 16) + 6416;
      v8 = (_OWORD *)(v2 + 6160 + 16 * v6);
      if (v6 >= 0x10)
        v8 = (_OWORD *)v7;
      *v4++ = *v8;
      --v5;
    }
    while (v5);
  }
  return (*((uint64_t (**)(_QWORD, _QWORD, _BYTE *, uint64_t, uint64_t))this + 428))(*((_QWORD *)this + 2), *((_QWORD *)this + 427), v10, 16 * v1, 14);
}

uint64_t GLDContextRec::setRenderUniformBuffersInternal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t i;
  uint64_t v11;

  if (a4)
  {
    v9 = result;
    for (i = 0; i != a4; ++i)
    {
      v11 = *(_QWORD *)(a2 + 8 * i);
      if (v11)
      {
        GLRResourceList::addResource(*(_QWORD *)(v9 + 64), *(_QWORD *)(a2 + 8 * i));
        result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a5 + 8))(*(_QWORD *)(v9 + 16), *(_QWORD *)a5, *(_QWORD *)(v11 + 40), *(_QWORD *)(a3 + 8 * i), i);
      }
    }
  }
  return result;
}

uint64_t GLDContextRec::setRenderProgramUniformsInternal(uint64_t this, unsigned int a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *VertexBuffer;
  uint64_t v11;
  uint64_t v12;
  void *__dst;
  unint64_t v14;

  v4 = this;
  v5 = *(_QWORD *)(this + 8 * a2 + 1504);
  if (v5)
  {
    v6 = *(_QWORD *)(v5 + 24);
    v7 = *(unsigned int *)(v6 + 40);
    if ((_DWORD)v7)
    {
      v8 = 16 * v7;
      if (v7 < 0x101)
      {
        return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, size_t, uint64_t))a3[1])(*(_QWORD *)(this + 16), *a3, *(_QWORD *)(v6 + 32), v8, 12);
      }
      else
      {
        __dst = 0;
        v14 = 0;
        VertexBuffer = GLDContextRec::getVertexBuffer((void **)this, 16 * v7, &__dst, &v14);
        memcpy(__dst, *(const void **)(v6 + 32), v8);
        return (*(uint64_t (**)(_QWORD, _QWORD, void *, unint64_t, uint64_t))(a4 + 8))(*(_QWORD *)(v4 + 16), *(_QWORD *)a4, VertexBuffer, v14, 12);
      }
    }
  }
  else if (*(_QWORD *)(this + 8 * a2 + 1464))
  {
    v11 = *(_QWORD *)(this + 104) + 16 * a2;
    v12 = *(unsigned int *)(v11 + 15636);
    if ((_DWORD)v12)
      return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))a3[1])(*(_QWORD *)(this + 16), *a3, *(_QWORD *)(v11 + 15640), 16 * v12, 12);
  }
  return this;
}

uint64_t GLDContextRec::setRenderProgramUniforms(GLDContextRec *this)
{
  GLDContextRec::setRenderProgramUniformsInternal((uint64_t)this, 0, (_QWORD *)this + 427, (uint64_t)this + 3448);
  return GLDContextRec::setRenderProgramUniformsInternal((uint64_t)this, 4u, (_QWORD *)this + 429, (uint64_t)this + 3464);
}

uint64_t getMTLBlendFactor(uint64_t result)
{
  unsigned __int16 v1;

  result = result;
  if ((int)result > 0x8000)
  {
    switch((int)result)
    {
      case 32769:
        result = 11;
        break;
      case 32770:
        result = 12;
        break;
      case 32771:
        result = 13;
        break;
      case 32772:
        result = 14;
        break;
      default:
LABEL_21:
        v1 = MTLReleaseAssertionFailure();
        result = getMTLBlendOperation(v1);
        break;
    }
  }
  else
  {
    switch((int)result)
    {
      case 768:
        result = 2;
        break;
      case 769:
        result = 3;
        break;
      case 770:
        result = 4;
        break;
      case 771:
        result = 5;
        break;
      case 772:
        result = 8;
        break;
      case 773:
        result = 9;
        break;
      case 774:
        result = 6;
        break;
      case 775:
        result = 7;
        break;
      case 776:
        result = 10;
        break;
      default:
        if ((_DWORD)result)
        {
          if ((_DWORD)result != 1)
            goto LABEL_21;
          result = 1;
        }
        break;
    }
  }
  return result;
}

uint64_t getMTLBlendOperation(__int16 a1)
{
  uint64_t v2;

  if ((unsigned __int16)(a1 + 32762) < 6u && ((0x37u >> (a1 - 6)) & 1) != 0)
    return qword_23106B3E8[(__int16)(a1 + 32762)];
  v2 = MTLReleaseAssertionFailure();
  return GLDContextRec::updateRenderColorMaskMode(v2);
}

uint64_t GLDContextRec::updateRenderColorMaskMode(uint64_t this)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;

  v1 = 0;
  v2 = (unsigned __int8 *)(*(_QWORD *)(this + 104) + 13064);
  do
  {
    v3 = *(_QWORD *)(this + 4416 + 8 * v1);
    if (v3)
    {
      v4 = 1 << v1;
      if (((1 << v1) & v2[1]) != 0)
        v5 = (8 * (((1 << v1) & *v2) != 0)) | 4;
      else
        v5 = 8 * (((1 << v1) & *v2) != 0);
      if ((v4 & v2[2]) != 0)
        v5 |= 2uLL;
      v3 = v5 | ((v4 & v2[3]) != 0);
    }
    if (v3 != *(unsigned __int8 *)(this + v1 + 2608))
    {
      *(_BYTE *)(this + v1 + 2608) = v3;
      *(_DWORD *)(this + 4 * v1 + 2152) = *(_DWORD *)(this + 4 * v1 + 2152) & 0xF87FFFFF | ((v3 & 0xF) << 23);
      *(_DWORD *)(this + 2472) |= 8u;
      v6 = 1 << v1;
      if (v3)
        v7 = *(_DWORD *)(this + 5044) | v6;
      else
        v7 = *(_DWORD *)(this + 5044) & ~v6;
      *(_DWORD *)(this + 5044) = v7;
    }
    ++v1;
  }
  while (v1 != 4);
  return this;
}

uint64_t GLDContextRec::updateRenderClipPlanes(uint64_t this)
{
  *(_BYTE *)(this + 2180) = *(_DWORD *)(*(_QWORD *)(this + 104) + 15300);
  *(_DWORD *)(this + 2472) |= 8u;
  return this;
}

uint64_t GLDContextRec::updateRenderLineMode(uint64_t this)
{
  float v1;
  float v2;
  float v3;

  if (*(float *)(*(_QWORD *)(this + 104) + 13032) >= 1.0)
    v1 = *(float *)(*(_QWORD *)(this + 104) + 13032);
  else
    v1 = 1.0;
  v2 = roundf(v1);
  if (*(_DWORD *)(this + 4596) > 1u)
    v2 = *(float *)(*(_QWORD *)(this + 104) + 13032);
  *(float *)(this + 5208) = v2;
  v3 = 16.0;
  if (v2 > 16.0 || (v3 = 1.0, v2 < 1.0))
    *(float *)(this + 5208) = v3;
  *(_DWORD *)(this + 2472) |= 0x2000u;
  return this;
}

uint64_t GLDContextRec::setRenderLineMode(GLDContextRec *this, double a2)
{
  LODWORD(a2) = *((_DWORD *)this + 1302);
  return objc_msgSend(*((id *)this + 2), "setLineWidth:", a2);
}

uint64_t GLDContextRec::setRenderPolygonMode(id *this)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(this[2], "setFrontFacingWinding:", this[637]);
  objc_msgSend(this[2], "setCullMode:", this[638]);
  LODWORD(v2) = *((_DWORD *)this + 1300);
  LODWORD(v3) = *((_DWORD *)this + 1301);
  LODWORD(v4) = 0;
  objc_msgSend(this[2], "setDepthBias:slopeScale:clamp:", v2, v3, v4);
  return objc_msgSend(this[2], "setTriangleFillMode:", this[639]);
}

uint64_t GLDContextRec::updateRenderPrimitiveRestart(uint64_t this)
{
  *(_BYTE *)(this + 5084) = *(_BYTE *)(*(_QWORD *)(this + 104) + 15444) != 0;
  *(_DWORD *)(this + 2472) |= 0x8000u;
  return this;
}

uint64_t GLDContextRec::setRenderPrimitiveRestart(id *this)
{
  return objc_msgSend(this[2], "setPrimitiveRestartEnabled:", *((unsigned __int8 *)this + 5084));
}

uint64_t GLDContextRec::updateRenderDepthStencil(uint64_t this)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  __int16 v9;
  uint64_t MTLStencilOperation;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  void *DepthStencilStateFromKey;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;

  v1 = this;
  v2 = 0x700700700000000;
  v24 = 0x700700700000000;
  v3 = *(_QWORD *)(this + 104);
  v4 = v3 + 13068;
  if ((*(_BYTE *)(v3 + 13372) & 1) != 0 && *(_QWORD *)(this + 4488))
  {
    *(_QWORD *)(this + 424) |= 0x800uLL;
    v5 = *(_DWORD *)(v3 + 13328);
    if (*(_DWORD *)(this + 5212) == v5)
    {
      v6 = *(_DWORD *)(v3 + 13360);
      if (*(_DWORD *)(this + 5216) == v6)
        goto LABEL_8;
    }
    else
    {
      v6 = *(_DWORD *)(v3 + 13360);
    }
    *(_DWORD *)(this + 5212) = v5;
    *(_DWORD *)(this + 5216) = v6;
    *(_DWORD *)(this + 2472) |= 0x80u;
LABEL_8:
    v7 = *(unsigned __int8 *)(v3 + 13324);
    v8 = *(_DWORD *)(v3 + 13052);
    v9 = *(_WORD *)(v3 + 13332);
    MTLStencilOperation = getMTLStencilOperation(*(unsigned __int16 *)(v3 + 13334));
    v11 = getMTLStencilOperation(*(unsigned __int16 *)(v3 + 13336));
    v12 = getMTLStencilOperation(*(unsigned __int16 *)(v3 + 13338));
    v13 = v7 & 0xFFFF00FF | (v8 << 8) | ((unint64_t)(v9 & 7) << 32) | (MTLStencilOperation << 35) | (v11 << 38);
    v14 = *(_DWORD *)(v3 + 13356);
    v15 = *(_DWORD *)(v3 + 13060);
    v16 = *(_WORD *)(v4 + 296);
    v17 = getMTLStencilOperation(*(unsigned __int16 *)(v4 + 298));
    v18 = getMTLStencilOperation(*(unsigned __int16 *)(v4 + 300));
    this = getMTLStencilOperation(*(unsigned __int16 *)(v4 + 302));
    v2 = ((v14 << 16) | (v15 << 24) | ((unint64_t)(v16 & 7) << 44) | (v17 << 47) | (v18 << 50) | (this << 53))
       + (v13 | (v12 << 41) | 0x700000000000000);
    v24 = v2;
    v3 = *(_QWORD *)(v1 + 104);
  }
  if (*(_BYTE *)(v3 + 12932) && *(_QWORD *)(v1 + 4480))
  {
    v2 = v2 & 0xF0FFFFFFFFFFFFFFLL | ((unint64_t)(*(_WORD *)(v3 + 12928) & 7) << 56) | ((unint64_t)(*(_BYTE *)v4 != 0) << 59);
    v24 = v2;
  }
  if (v2 != *(_QWORD *)(v1 + 2312))
  {
    *(_QWORD *)(v1 + 2312) = v2;
    DepthStencilStateFromKey = (void *)GLDDeviceRec::getDepthStencilStateFromKey(*(GLDDeviceRec **)(v1 + 96), (const GLRDepthStencilKey *)&v24);
    *(_QWORD *)(v1 + 2464) = DepthStencilStateFromKey;
    *(_DWORD *)(v1 + 2472) |= 0x40u;
    if (objc_msgSend(DepthStencilStateFromKey, "writesStencil"))
      v20 = 512;
    else
      v20 = 0;
    *(_DWORD *)(v1 + 5044) = *(_DWORD *)(v1 + 5044) & 0xFFFFFDFF | v20;
    if (objc_msgSend(*(id *)(v1 + 2464), "readsStencil"))
      v21 = 512;
    else
      v21 = 0;
    *(_DWORD *)(v1 + 5048) = *(_DWORD *)(v1 + 5048) & 0xFFFFFDFF | v21;
    if (objc_msgSend(*(id *)(v1 + 2464), "writesDepth"))
      v22 = 256;
    else
      v22 = 0;
    *(_DWORD *)(v1 + 5044) = *(_DWORD *)(v1 + 5044) & 0xFFFFFEFF | v22;
    this = objc_msgSend(*(id *)(v1 + 2464), "readsDepth");
    if ((_DWORD)this)
      v23 = 256;
    else
      v23 = 0;
    *(_DWORD *)(v1 + 5048) = *(_DWORD *)(v1 + 5048) & 0xFFFFFEFF | v23;
  }
  return this;
}

uint64_t getMTLStencilOperation(int a1)
{
  int v1;
  uint64_t result;
  id *v3;

  if (a1 <= 7679)
  {
    if (a1)
    {
      if (a1 == 5386)
      {
        return 5;
      }
      else
      {
LABEL_10:
        v3 = (id *)MTLReleaseAssertionFailure();
        return GLDContextRec::setRenderDepthStencilState(v3);
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v1 = a1 - 7680;
    result = 0;
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        result = 2;
        break;
      case 2:
        result = 3;
        break;
      case 3:
        result = 4;
        break;
      default:
        goto LABEL_10;
    }
  }
  return result;
}

uint64_t GLDContextRec::setRenderDepthStencilState(id *this)
{
  return objc_msgSend(this[2], "setDepthStencilState:", this[308]);
}

uint64_t GLDContextRec::setRenderDepthStencilRef(id *this)
{
  return objc_msgSend(this[2], "setStencilFrontReferenceValue:backReferenceValue:", *((unsigned int *)this + 1303), *((unsigned int *)this + 1304));
}

uint64_t GLDContextRec::setRenderState(uint64_t this, int a2)
{
  unsigned int v2;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);
  uint64_t v8;
  _QWORD *v9;
  int v10;

  v2 = *(_DWORD *)(this + 2472) & a2;
  *(_DWORD *)(this + 2476) = v2;
  if (v2)
  {
    v4 = this;
    do
    {
      v5 = __clz(__rbit32(v2));
      v6 = *(_QWORD *)(v4 + 2488) + 16 * v5;
      v7 = *(uint64_t (**)(_QWORD *))v6;
      v8 = *(_QWORD *)(v6 + 8);
      v9 = (_QWORD *)(v4 + (v8 >> 1));
      if ((v8 & 1) != 0)
        v7 = *(uint64_t (**)(_QWORD *))(*v9 + v7);
      this = v7(v9);
      v10 = *(_DWORD *)(v4 + 2472) ^ (1 << v5);
      *(_DWORD *)(v4 + 2472) = v10;
      v2 = v10 & a2;
    }
    while (v2);
  }
  return this;
}

__n128 GLDContextRec::setRenderVertexArrayState(GLDContextRec *this)
{
  GLDVertexArrayRec *v2;
  __n128 result;
  uint32x2_t v4;
  __int128 v5;

  v2 = (GLDVertexArrayRec *)*((_QWORD *)this + 49);
  if (v2)
    GLDContextRec::buildVertexArrayDescriptor((uint64_t)this, *((GLDPipelineProgramRec **)this + 183), v2);
  v4 = (uint32x2_t)veor_s8(*(int8x8_t *)((char *)this + 1920), *(int8x8_t *)((char *)this + 2128));
  result.n128_u64[0] = (unint64_t)vpmax_u32(v4, v4);
  if (vmaxvq_u32((uint32x4_t)vorrq_s8(vorrq_s8(veorq_s8(*((int8x16_t *)this + 117), *((int8x16_t *)this + 130)), veorq_s8(*((int8x16_t *)this + 116), *((int8x16_t *)this + 129))), vorrq_s8(veorq_s8(*((int8x16_t *)this + 118), *((int8x16_t *)this + 131)), veorq_s8(*((int8x16_t *)this + 119), *((int8x16_t *)this + 132)))))+ result.n128_u32[0])
  {
    v5 = *((_OWORD *)this + 119);
    *((_OWORD *)this + 131) = *((_OWORD *)this + 118);
    *((_OWORD *)this + 132) = v5;
    *((_QWORD *)this + 266) = *((_QWORD *)this + 240);
    result = *((__n128 *)this + 117);
    *((_OWORD *)this + 129) = *((_OWORD *)this + 116);
    *((__n128 *)this + 130) = result;
    *((_DWORD *)this + 618) |= 8u;
    *((_DWORD *)this + 621) |= 1u;
  }
  return result;
}

__n128 GLDContextRec::setRenderPrimitiveBufferState(GLDContextRec *this)
{
  uint32x2_t v1;
  __n128 result;
  __int128 v3;

  v1 = (uint32x2_t)veor_s8(*(int8x8_t *)((char *)this + 2048), *(int8x8_t *)((char *)this + 2128));
  result.n128_u64[0] = (unint64_t)vpmax_u32(v1, v1);
  if (vmaxvq_u32((uint32x4_t)vorrq_s8(vorrq_s8(veorq_s8(*((int8x16_t *)this + 125), *((int8x16_t *)this + 130)), veorq_s8(*((int8x16_t *)this + 124), *((int8x16_t *)this + 129))), vorrq_s8(veorq_s8(*((int8x16_t *)this + 126), *((int8x16_t *)this + 131)), veorq_s8(*((int8x16_t *)this + 127), *((int8x16_t *)this + 132)))))+ result.n128_u32[0])
  {
    v3 = *((_OWORD *)this + 127);
    *((_OWORD *)this + 131) = *((_OWORD *)this + 126);
    *((_OWORD *)this + 132) = v3;
    *((_QWORD *)this + 266) = *((_QWORD *)this + 256);
    result = *((__n128 *)this + 125);
    *((_OWORD *)this + 129) = *((_OWORD *)this + 124);
    *((__n128 *)this + 130) = result;
    *((_DWORD *)this + 618) |= 8u;
    *((_DWORD *)this + 621) |= 1u;
  }
  return result;
}

double GLDContextRec::updateRenderViewport(GLDContextRec *this, double a2, double a3, double a4, double a5, float a6)
{
  float *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double result;

  v6 = (float *)*((_QWORD *)this + 13);
  v7 = v6[1736];
  v8 = v6[1742];
  if (*((_BYTE *)this + 5080))
  {
    LOWORD(a6) = *(_WORD *)(*(_QWORD *)(*((_QWORD *)this + 50) + 32) + 180);
    v9 = (float)LODWORD(a6);
    v10 = v6[1737];
    v11 = v9 - (float)(v6[1741] + v10);
    v12 = 2.0;
  }
  else
  {
    v10 = v6[1737];
    v11 = v6[1741] + v10;
    v12 = -2.0;
  }
  v13 = (float)(v8 + v6[1738]);
  result = (float)(v6[1740] - v7);
  *((double *)this + 640) = result;
  *((double *)this + 641) = v11;
  *((double *)this + 642) = v7 + v7;
  *((double *)this + 643) = v12 * v10;
  *((double *)this + 644) = v8;
  *((double *)this + 645) = v13;
  *((_DWORD *)this + 618) |= 0x10u;
  return result;
}

uint64_t GLDContextRec::updateRenderScissor(uint64_t this)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;
  char v17;

  v1 = *(_QWORD *)(*(_QWORD *)(this + 400) + 32);
  v2 = *(unsigned __int16 *)(v1 + 178);
  v3 = *(unsigned __int16 *)(v1 + 180);
  v4 = *(_QWORD *)(this + 104);
  v5 = *(unsigned __int8 *)(v4 + 13284);
  if (*(_BYTE *)(v4 + 13284))
  {
    *(_QWORD *)(this + 424) |= 0x400uLL;
    v6 = *(_DWORD *)(v4 + 13268);
    v7 = *(_DWORD *)(v4 + 13272);
    v8 = *(_DWORD *)(v4 + 13276);
    v9 = *(_DWORD *)(v4 + 13280);
    v10 = v6 & ~(v6 >> 31);
    v11 = v8 + (v6 & (v6 >> 31));
    if ((int)(v11 + v10) <= v2)
      v2 = v11;
    else
      v2 -= v10;
    v5 = v7 & ~(v7 >> 31);
    v12 = v9 + (v7 & (v7 >> 31));
    v13 = v3 - v5;
    v16 = v12 + v5 <= v3;
    v14 = v3 - v5;
    if (!v16)
      v12 = v13;
    v15 = v14 - v12;
    if (*(_BYTE *)(this + 5080))
      v5 = v15;
    v3 = v12;
  }
  else
  {
    v10 = 0;
  }
  v16 = v2 < 1 || v3 < 1;
  if (v16)
  {
    v10 = 0;
    v5 = 0;
    v17 = 1;
    v2 = 1;
    v3 = 1;
  }
  else
  {
    v17 = 0;
  }
  *(_BYTE *)(this + 5083) = v17;
  *(_QWORD *)(this + 5168) = v10;
  *(_QWORD *)(this + 5176) = v5;
  *(_QWORD *)(this + 5184) = v2;
  *(_QWORD *)(this + 5192) = v3;
  *(_DWORD *)(this + 2472) |= 0x20u;
  return this;
}

uint64_t GLDContextRec::setRenderScissor(GLDContextRec *this)
{
  void *v1;
  __int128 v2;
  _OWORD v4[2];

  v1 = (void *)*((_QWORD *)this + 2);
  v2 = *((_OWORD *)this + 324);
  v4[0] = *((_OWORD *)this + 323);
  v4[1] = v2;
  return objc_msgSend(v1, "setScissorRect:", v4);
}

uint64_t GLDContextRec::setRenderBlendColors(GLDContextRec *this, double a2, double a3, double a4, double a5)
{
  _DWORD *v5;

  v5 = (_DWORD *)*((_QWORD *)this + 13);
  LODWORD(a2) = v5[3208];
  LODWORD(a3) = v5[3209];
  LODWORD(a4) = v5[3210];
  LODWORD(a5) = v5[3211];
  return objc_msgSend(*((id *)this + 2), "setBlendColorRed:green:blue:alpha:", a2, a3, a4, a5);
}

uint64_t GLDContextRec::updateRenderAlphaTestState(uint64_t this)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  float v5;

  v1 = *(_QWORD *)(this + 104);
  v2 = *(unsigned __int16 *)(v1 + 12732);
  v3 = *(unsigned __int8 *)(v1 + 12734);
  if (v2 != *(unsigned __int16 *)(this + 5220) || v3 != *(unsigned __int8 *)(this + 5222))
  {
    *(_WORD *)(this + 5220) = v2;
    v4 = v3 != 0;
    *(_BYTE *)(this + 5222) = v4;
    *(_QWORD *)(this + 2176) = ((unint64_t)(v2 & 7) << 57) | (v4 << 60) | *(_QWORD *)(this + 2176) & 0xE1FFFFFFFFFFFFFFLL;
    *(_DWORD *)(this + 2472) |= 8u;
    if (v3)
      *(_QWORD *)(this + 424) |= 1uLL;
  }
  v5 = *(float *)(v1 + 12728);
  if (v5 != *(float *)(this + 5224))
  {
    *(float *)(this + 5224) = v5;
    *(_DWORD *)(this + 2472) |= 0x4000u;
  }
  return this;
}

uint64_t GLDContextRec::updateRenderLogicOpState(uint64_t this)
{
  unsigned __int16 *v1;
  unint64_t v2;

  v1 = (unsigned __int16 *)(*(_QWORD *)(this + 104) + 13044);
  v2 = *(_QWORD *)(this + 2176) & 0xFEFFFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(*(_QWORD *)(this + 104) + 13047) != 0) << 56);
  *(_QWORD *)(this + 2176) = v2;
  *(_QWORD *)(this + 2176) = v2 & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(_glLogicOpTable[*v1 - 5376] & 0xF) << 52);
  *(_DWORD *)(this + 2472) |= 8u;
  return this;
}

uint64_t GLDContextRec::setRenderAlphaTestReferenceValue(GLDContextRec *this, double a2)
{
  LODWORD(a2) = *((_DWORD *)this + 1306);
  return objc_msgSend(*((id *)this + 2), "setAlphaTestReferenceValue:", a2);
}

void GLDVertexArrayRec::~GLDVertexArrayRec(GLDVertexArrayRec *this)
{
  void *v1;

  GLDObject::~GLDObject(this);
  GLDObject::operator delete(v1);
}

uint64_t GLDVertexArrayRec::dealloc(id *this)
{

  return GLDObject::dealloc((uint64_t)this);
}

BOOL GLDVertexArrayRec::updateBuffers(GLDVertexArrayRec *this, uint64_t a2)
{
  uint64_t v2;
  GLDBufferRec *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v2 = a2;
  if ((a2 & 4) != 0)
  {
    v4 = *(GLDBufferRec **)(*((_QWORD *)this + 7) + 256);
    if (v4)
      LOBYTE(v4) = GLDBufferRec::loadUnlocked(v4);
    *((_BYTE *)this + 64) = (_BYTE)v4;
  }
  v5 = *(_QWORD *)(*((_QWORD *)this + 6) + 768) & v2;
  if (v5)
  {
    do
    {
      v6 = __clz(__rbit64(v5));
      v5 ^= 1 << v6;
      if (GLDBufferRec::loadUnlocked(*(GLDBufferRec **)(*((_QWORD *)this + 7) + 8 * v6 - 128)))
      {
        v7 = v5 == 0;
      }
      else
      {
        v2 = 0;
        v7 = 1;
      }
    }
    while (!v7);
  }
  return v2 != 0;
}

uint64_t glrVertexFormatComponentAttribSizeTypeAlignment(MTLVertexFormat a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;

  v3 = (unsigned __int8 *)&glrSupportedVertexFormatTableData + 16 * a1;
  *a2 = v3[11];
  *a3 = v3[10];
  return v3[9];
}

uint64_t glrConvertVertexElementType(int a1, int a2)
{
  uint64_t result;
  unsigned int v3;

  if ((a1 & 0x2000) != 0)
  {
    v3 = a1 & 0xFFFF9FFF;
    switch(a1 & 0xFFFF9FFF)
    {
      case 0x1400u:
        if (a2 == 1)
        {
          result = 48;
        }
        else
        {
          if (a2 < 2)
            goto LABEL_52;
          result = a2 + 8;
        }
        break;
      case 0x1401u:
        if (a2 == 1)
        {
          result = 47;
        }
        else
        {
          if (a2 < 2)
            goto LABEL_52;
          result = a2 + 5;
        }
        break;
      case 0x1402u:
        if (a2 == 1)
        {
          result = 52;
        }
        else
        {
          if (a2 < 2)
            goto LABEL_52;
          result = a2 + 20;
        }
        break;
      case 0x1403u:
        if (a2 == 1)
        {
          result = 51;
        }
        else
        {
          if (a2 < 2)
            goto LABEL_52;
          result = a2 + 17;
        }
        break;
      default:
        if (v3 == 33640)
        {
          if (a2 == 4)
            return 41;
        }
        else if (v3 == 36255 && a2 == 4)
        {
          return 40;
        }
LABEL_52:
        result = 0;
        break;
    }
  }
  else
  {
    switch(a1 & 0xFFFFBFFF)
    {
      case 0x1400u:
        if (a2 == 1)
          return 46;
        if (a2 < 2)
          goto LABEL_52;
        return a2 + 2;
      case 0x1401u:
        if (a2 == 1)
          return 45;
        if (a2 < 2)
          goto LABEL_52;
        return a2 - 1;
      case 0x1402u:
        if (a2 == 1)
          return 50;
        if (a2 < 2)
          goto LABEL_52;
        return a2 + 14;
      case 0x1403u:
        if (a2 == 1)
          return 49;
        if (a2 < 2)
          goto LABEL_52;
        return a2 + 11;
      case 0x1404u:
        if (a2 < 1)
          goto LABEL_52;
        return a2 + 31;
      case 0x1405u:
        if (a2 < 1)
          goto LABEL_52;
        return a2 + 35;
      case 0x1406u:
        if (a2 < 1)
          goto LABEL_52;
        return a2 + 27;
      case 0x140Bu:
        if (a2 == 1)
          return 53;
        if (a2 < 2)
          goto LABEL_52;
        result = a2 + 23;
        break;
      default:
        goto LABEL_52;
    }
  }
  return result;
}

uint64_t GLDVertexArrayRec::updateVertexArrayBuffers(GLDVertexArrayRec *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;
  unsigned __int8 *v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = *((_QWORD *)this + 6);
  v4 = a2 & 0xFFFFFFFF0000;
  if (!a3)
  {
    if (v4)
    {
      v13 = *(_QWORD *)(v3 + 768);
      while (1)
      {
        v14 = __clz(__rbit64(v4));
        v15 = v14 - 16;
        v16 = 0x10000 << (v14 - 16);
        if ((v13 & v16) != 0)
        {
          v17 = glrConvertVertexElementType(*(unsigned __int16 *)(v3 + 24 * v15 + 20), *(char *)(v3 + 24 * v15 + 22));
          v18 = v17 ? glrSupportedVertexFormatTableData[16 * v17 + 10] : 4;
          if (((v18 - 1) & *(_QWORD *)(v3 + 24 * v15)) != 0)
            break;
        }
        v4 ^= v16;
        if (!v4)
          return 1;
      }
      return 0;
    }
    return 1;
  }
  if (!v4)
    return 1;
  v5 = *(_QWORD *)(v3 + 768);
  while (1)
  {
    v6 = __clz(__rbit64(v4));
    v7 = v6 - 16;
    v8 = 0x10000 << (v6 - 16);
    if ((v5 & v8) != 0)
    {
      result = glrConvertVertexElementType(*(unsigned __int16 *)(v3 + 24 * v7 + 20), *(char *)(v3 + 24 * v7 + 22));
      if (!result)
        return result;
      v10 = &glrSupportedVertexFormatTableData[16 * result];
      if (((v10[10] - 1) & *(_QWORD *)(v3 + 24 * v7)) != 0)
        break;
      v11 = *(int *)(v3 + 24 * v7 + 16);
      v12 = (int)v11 <= 4095 && (*(_DWORD *)(v3 + 24 * v7 + 16) & 3) == 0;
      if (!v12
        || *(_DWORD *)(v3 + 24 * v7 + 8) > 0x3FFu
        || (*(_QWORD *)(v3 + 24 * v7) & 3) + (unint64_t)v10[9] > v11)
      {
        break;
      }
    }
    v4 ^= v8;
    if (!v4)
      return 1;
  }
  return 0;
}

uint64_t gldCreateVertexArray(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject *v8;
  GLDLibrary *v9;

  GLDObject::operator new((GLDObject *)0x68);
  v9 = v8;
  GLDObject::GLDObject(v8);
  *(_QWORD *)v9 = off_24FFED468;
  GLDLibrary::getAllDisplayMask(v9);
  *((_QWORD *)v9 + 5) = a1;
  *((_QWORD *)v9 + 6) = a3;
  *((_QWORD *)v9 + 7) = a4;
  *((_QWORD *)v9 + 9) = objc_alloc_init(MEMORY[0x24BDDD770]);
  *a2 = v9;
  return 0;
}

void sub_231062588(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldModifyVertexArray()
{
  return 0;
}

uint64_t gldFlushVertexArray()
{
  return 0;
}

BOOL gldBufferSubData(int a1, GLDBufferRec *this, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL8 result;

  result = GLDBufferRec::load(this);
  if (result)
  {
    if (**((_QWORD **)this + 3) + a3 == a5)
    {
      return 1;
    }
    else
    {
      GLDBufferRec::finishCPUAccess(this);
      return 0;
    }
  }
  return result;
}

uint64_t gldCopyBufferSubData()
{
  return 0;
}

NSObject *gldFinishBufferCPUAccess(int a1, GLDBufferRec *this)
{
  return GLDBufferRec::finishCPUAccess(this);
}

id *gldFlushMemoryPlugin(id *this, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 24);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 12))
      return (id *)GLDContextRec::flushContext(this);
  }
  return this;
}

uint64_t GLDContextRec::getClearPipelineState(GLDContextRec *this, int a2)
{
  uint64_t v3;
  const GLRRenderPipelineKey *v4;
  _BYTE *v5;
  char *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;

  v3 = 0;
  v4 = (GLDContextRec *)((char *)this + 2336);
  v5 = (_BYTE *)(*((_QWORD *)this + 13) + 13064);
  v6 = (char *)this + 2424;
  do
  {
    *((_WORD *)this + v3 + 1220) = *(_QWORD *)&v6[8 * v3 + 1992];
    v7 = 1 << v3;
    if (((1 << v3) & a2) != 0)
    {
      if ((v7 & v5[1]) != 0)
        v8 = (8 * ((v7 & *v5) != 0)) | 4;
      else
        v8 = 8 * ((v7 & *v5) != 0);
      if ((v7 & v5[2]) != 0)
        v8 |= 2u;
      v9 = *(_DWORD *)&v6[4 * v3] & 0xF87FFFFF | ((v8 & 0xE | (v5[3] >> v3) & 1) << 23);
    }
    else
    {
      v9 = *(_DWORD *)&v6[4 * v3] & 0xF87FFFFF;
    }
    *(_DWORD *)&v6[4 * v3++] = v9;
  }
  while (v3 != 4);
  *((_QWORD *)this + 306) = *((_QWORD *)this + 306) & 0xFFFFB1FFFFFFFFFFLL | ((unint64_t)(*((_QWORD *)this + 560) == 252) << 41) | ((unint64_t)(*((_QWORD *)this + 561) == 253) << 46);
  *((_QWORD *)this + 301) = *((_QWORD *)this + 301) & 0xFFFF000000FFFFFFLL | ((GLDDeviceRec::getClearShaderFragmentFunction(*((GLDDeviceRec **)this + 12), *((unsigned int *)this + 657)) & 0xFFFFFF) << 24);
  v10 = *((_QWORD *)this + 50);
  if (v10 && (v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 + 32) + 182), v11 >= 2))
  {
    v12 = (glrConvertMultisampleCount(v11) & 0xF) << 48;
    v13 = *((_QWORD *)this + 306) & 0xFFF0FFFFFFFFFFFFLL;
  }
  else
  {
    v12 = *((_QWORD *)this + 306) & 0xFFF0FFFFFFFFFFFFLL;
    v13 = 0x1000000000000;
  }
  *((_QWORD *)this + 306) = v12 | v13;
  return *(_QWORD *)(GLDDeviceRec::getRenderPipelineStateFromKey(*((GLDDeviceRec **)this + 12), v4) + 8);
}

void *GLDContextRec::getClearDepthStencilState(GLDContextRec *this, unsigned int a2)
{
  MTLDepthStencilDescriptor *v4;
  MTLStencilDescriptor *v5;
  uint64_t v6;

  v4 = (MTLDepthStencilDescriptor *)*((_QWORD *)this + 290);
  v5 = -[MTLDepthStencilDescriptor frontFaceStencil](v4, "frontFaceStencil");
  -[MTLStencilDescriptor setStencilCompareFunction:](v5, "setStencilCompareFunction:", 7);
  if ((a2 & 0x200) != 0)
  {
    -[MTLStencilDescriptor setDepthStencilPassOperation:](v5, "setDepthStencilPassOperation:", 2);
    -[MTLStencilDescriptor setDepthFailureOperation:](v5, "setDepthFailureOperation:", 2);
    -[MTLStencilDescriptor setStencilFailureOperation:](v5, "setStencilFailureOperation:", 2);
    v6 = *(unsigned int *)(*((_QWORD *)this + 13) + 13052);
  }
  else
  {
    -[MTLStencilDescriptor setDepthStencilPassOperation:](v5, "setDepthStencilPassOperation:", 0);
    -[MTLStencilDescriptor setDepthFailureOperation:](v5, "setDepthFailureOperation:", 0);
    -[MTLStencilDescriptor setStencilFailureOperation:](v5, "setStencilFailureOperation:", 0);
    v6 = 0;
  }
  -[MTLStencilDescriptor setWriteMask:](v5, "setWriteMask:", v6);
  -[MTLStencilDescriptor setStencilCompareFunction:](v5, "setStencilCompareFunction:", 7);
  -[MTLDepthStencilDescriptor setDepthCompareFunction:](v4, "setDepthCompareFunction:", 7);
  -[MTLDepthStencilDescriptor setDepthWriteEnabled:](v4, "setDepthWriteEnabled:", (a2 >> 8) & 1);
  return GLDDeviceRec::getDepthStencilStateFromDescriptor(*((id **)this + 12), v4);
}

uint64_t GLDContextRec::clearBuffers(int8x8_t *this, unsigned int a2, uint32x4_t *a3, double a4, double a5, double a6)
{
  int8x8_t v9;
  uint64_t v10;
  _BOOL4 v11;
  double v17;
  unint64_t v19;
  unint64_t v20;
  __int32 v21;
  uint64_t v22;
  void *v23;
  uint64_t result;
  __int32 v25;
  unsigned int v26;
  int v27;
  uint64_t ClearPipelineState;
  float32x4_t v29;
  char *v30;
  unint64_t v31;
  _DWORD *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  int v41;
  __int32 v42;
  int v43;
  uint64_t v44;
  int32x4_t v45;
  char *v46;
  unint64_t v47;
  _DWORD *v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  int v57;
  int v58;
  unsigned int v59;
  uint64_t v60;
  uint32x4_t v61;
  char *v62;
  unint64_t v63;
  _DWORD *v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  int v73;
  _OWORD v74[3];
  _QWORD v75[4];
  __int128 v76;
  uint64_t v77;
  int v78;
  double v79;
  int v80;
  int v81;
  unint64_t v82;
  int v83;
  int v84;
  double v85;
  int v86;
  int v87;
  int v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)&this[2]
    || this[310].i32[0] && (GLDContextRec::endRenderPass((GLDContextRec *)this), !*(_QWORD *)&this[2]))
  {
    GLDContextRec::beginRenderPass((GLDContextRec *)this);
  }
  v9 = this[13];
  if (*(_BYTE *)(*(_QWORD *)&v9 + 13284))
    v11 = !*(_DWORD *)(*(_QWORD *)&v9 + 13268)
       && !*(_DWORD *)(*(_QWORD *)&v9 + 13272)
       && (v10 = *(_QWORD *)(*(_QWORD *)&this[50] + 32),
           *(_DWORD *)(*(_QWORD *)&v9 + 13276) == *(unsigned __int16 *)(v10 + 178))
       && *(_DWORD *)(*(_QWORD *)&v9 + 13280) == *(unsigned __int16 *)(v10 + 180);
  else
    v11 = 1;
  __asm { FMOV            V0.2S, #-1.0 }
  v77 = _D0;
  __asm { FMOV            V0.2S, #1.0 }
  v79 = _D0;
  HIDWORD(v17) = -1082130432;
  v82 = 0xBF8000003F800000;
  v80 = -1082130432;
  v83 = 1065353216;
  v85 = _D0;
  v86 = 1065353216;
  v88 = 1065353216;
  LODWORD(_D0) = 0;
  if ((a2 & 0x100) != 0)
  {
    if (v11)
      objc_msgSend(*(id *)&this[2], "setDepthCleared", _D0);
    if (a3[1].i32[2])
      *(float *)&_D0 = (float)a3[1].u32[0];
    else
      LODWORD(_D0) = a3[1].i32[0];
  }
  v78 = LODWORD(_D0);
  v81 = LODWORD(_D0);
  v84 = LODWORD(_D0);
  v87 = LODWORD(_D0);
  if ((v11 & (a2 >> 9)) == 1 && *(unsigned __int8 *)(*(_QWORD *)&this[13] + 13052) == 0xFF)
    objc_msgSend(*(id *)&this[2], "setStencilCleared");
  LODWORD(_D0) = 0;
  LODWORD(v17) = 0;
  LODWORD(a6) = 0;
  objc_msgSend(*(id *)&this[2], "setDepthBias:slopeScale:clamp:", _D0, v17, a6);
  objc_msgSend(*(id *)&this[2], "setTriangleFillMode:", 0);
  objc_msgSend(*(id *)&this[2], "setFrontFacingWinding:", 1);
  v21 = this[309].i32[0];
  if ((v21 & 0x20) != 0)
  {
    GLDContextRec::setRenderScissor((GLDContextRec *)this);
    v21 = this[309].i32[0];
  }
  this[309].i32[0] = v21 & 0xFFFFFFDF;
  v75[0] = 0;
  v75[1] = 0;
  v22 = *(_QWORD *)(*(_QWORD *)&this[50] + 32);
  LOWORD(v19) = *(_WORD *)(v22 + 178);
  LOWORD(v20) = *(_WORD *)(v22 + 180);
  v23 = (void *)this[2];
  *(double *)&v75[2] = (double)v19;
  *(double *)&v75[3] = (double)v20;
  v76 = xmmword_23106B7B0;
  result = objc_msgSend(v23, "setViewport:", v75);
  v25 = this[327].i32[0];
  v26 = a2 & 0x300;
  v27 = v25 & a2;
  if ((v25 & a2) != 0)
  {
    ClearPipelineState = GLDContextRec::getClearPipelineState((GLDContextRec *)this, v25 & a2);
    objc_msgSend(*(id *)&this[2], "setDepthStencilState:", GLDContextRec::getClearDepthStencilState((GLDContextRec *)this, a2 & 0x300));
    objc_msgSend(*(id *)&this[2], "setStencilReferenceValue:", a3[1].u32[1]);
    objc_msgSend(*(id *)&this[2], "setRenderPipelineState:", ClearPipelineState);
    objc_msgSend(*(id *)&this[2], "setCullMode:", 0);
    if (a3[1].i32[2])
      v29 = vcvtq_f32_u32(*a3);
    else
      v29 = *(float32x4_t *)a3;
    objc_msgSend(*(id *)&this[2], "setVertexBytes:length:atIndex:", &v77, 64, 14, *(_OWORD *)&v29);
    objc_msgSend(*(id *)&this[2], "setFragmentBytes:length:atIndex:", v74, 48, 14);
    if (this[279].i8[0])
    {
      v30 = (char *)this[285];
      v31 = (unint64_t)this[286];
      if ((unint64_t)v30 >= v31)
      {
        v33 = (char *)this[284];
        v34 = (v30 - v33) >> 2;
        v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) >> 62)
          abort();
        v36 = v31 - (_QWORD)v33;
        if (v36 >> 1 > v35)
          v35 = v36 >> 1;
        if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
          v37 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v37 = v35;
        if (v37)
        {
          v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&this[286], v37);
          v30 = (char *)this[285];
          v33 = (char *)this[284];
        }
        else
        {
          v38 = 0;
        }
        v39 = &v38[4 * v34];
        v40 = &v38[4 * v37];
        *(_DWORD *)v39 = -1;
        v32 = v39 + 4;
        while (v30 != v33)
        {
          v41 = *((_DWORD *)v30 - 1);
          v30 -= 4;
          *((_DWORD *)v39 - 1) = v41;
          v39 -= 4;
        }
        this[284] = (int8x8_t)v39;
        this[285] = (int8x8_t)v32;
        this[286] = (int8x8_t)v40;
        if (v33)
          operator delete(v33);
      }
      else
      {
        *(_DWORD *)v30 = -1;
        v32 = v30 + 4;
      }
      this[285] = (int8x8_t)v32;
    }
    result = objc_msgSend(*(id *)&this[2], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    this[629] = vorr_s8(this[629], (int8x8_t)vdup_n_s32(v27 | v26));
    a2 ^= v27 | v26;
    v26 = 0;
  }
  v42 = this[327].i32[1];
  v43 = v42 & a2;
  if ((v42 & a2) != 0)
  {
    v44 = GLDContextRec::getClearPipelineState((GLDContextRec *)this, v42 & a2);
    objc_msgSend(*(id *)&this[2], "setDepthStencilState:", GLDContextRec::getClearDepthStencilState((GLDContextRec *)this, v26));
    objc_msgSend(*(id *)&this[2], "setStencilReferenceValue:", a3[1].u32[1]);
    objc_msgSend(*(id *)&this[2], "setRenderPipelineState:", v44);
    objc_msgSend(*(id *)&this[2], "setCullMode:", 0);
    if (a3[1].i32[2])
      v45 = *(int32x4_t *)a3;
    else
      v45 = vcvtq_s32_f32(*(float32x4_t *)a3);
    v74[1] = v45;
    objc_msgSend(*(id *)&this[2], "setVertexBytes:length:atIndex:", &v77, 64, 14);
    objc_msgSend(*(id *)&this[2], "setFragmentBytes:length:atIndex:", v74, 48, 14);
    if (this[279].i8[0])
    {
      v46 = (char *)this[285];
      v47 = (unint64_t)this[286];
      if ((unint64_t)v46 >= v47)
      {
        v49 = (char *)this[284];
        v50 = (v46 - v49) >> 2;
        v51 = v50 + 1;
        if ((unint64_t)(v50 + 1) >> 62)
          abort();
        v52 = v47 - (_QWORD)v49;
        if (v52 >> 1 > v51)
          v51 = v52 >> 1;
        if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFFCLL)
          v53 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v53 = v51;
        if (v53)
        {
          v54 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&this[286], v53);
          v46 = (char *)this[285];
          v49 = (char *)this[284];
        }
        else
        {
          v54 = 0;
        }
        v55 = &v54[4 * v50];
        v56 = &v54[4 * v53];
        *(_DWORD *)v55 = -1;
        v48 = v55 + 4;
        while (v46 != v49)
        {
          v57 = *((_DWORD *)v46 - 1);
          v46 -= 4;
          *((_DWORD *)v55 - 1) = v57;
          v55 -= 4;
        }
        this[284] = (int8x8_t)v55;
        this[285] = (int8x8_t)v48;
        this[286] = (int8x8_t)v56;
        if (v49)
          operator delete(v49);
      }
      else
      {
        *(_DWORD *)v46 = -1;
        v48 = v46 + 4;
      }
      this[285] = (int8x8_t)v48;
    }
    result = objc_msgSend(*(id *)&this[2], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    this[629] = vorr_s8(this[629], (int8x8_t)vdup_n_s32(v43 | v26));
    a2 &= ~(v43 | v26);
    v26 = 0;
  }
  v58 = this[328].i32[0] & a2;
  v59 = v58 | v26;
  if (v58 | v26)
  {
    v60 = GLDContextRec::getClearPipelineState((GLDContextRec *)this, v58);
    objc_msgSend(*(id *)&this[2], "setDepthStencilState:", GLDContextRec::getClearDepthStencilState((GLDContextRec *)this, v26));
    objc_msgSend(*(id *)&this[2], "setStencilReferenceValue:", a3[1].u32[1]);
    objc_msgSend(*(id *)&this[2], "setRenderPipelineState:", v60);
    objc_msgSend(*(id *)&this[2], "setCullMode:", 0);
    if (a3[1].i32[2])
      v61 = *a3;
    else
      v61 = vcvtq_u32_f32(*(float32x4_t *)a3);
    v74[2] = v61;
    objc_msgSend(*(id *)&this[2], "setVertexBytes:length:atIndex:", &v77, 64, 14);
    objc_msgSend(*(id *)&this[2], "setFragmentBytes:length:atIndex:", v74, 48, 14);
    if (this[279].i8[0])
    {
      v62 = (char *)this[285];
      v63 = (unint64_t)this[286];
      if ((unint64_t)v62 >= v63)
      {
        v65 = (char *)this[284];
        v66 = (v62 - v65) >> 2;
        v67 = v66 + 1;
        if ((unint64_t)(v66 + 1) >> 62)
          abort();
        v68 = v63 - (_QWORD)v65;
        if (v68 >> 1 > v67)
          v67 = v68 >> 1;
        if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFFCLL)
          v69 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v69 = v67;
        if (v69)
        {
          v70 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&this[286], v69);
          v62 = (char *)this[285];
          v65 = (char *)this[284];
        }
        else
        {
          v70 = 0;
        }
        v71 = &v70[4 * v66];
        v72 = &v70[4 * v69];
        *(_DWORD *)v71 = -1;
        v64 = v71 + 4;
        while (v62 != v65)
        {
          v73 = *((_DWORD *)v62 - 1);
          v62 -= 4;
          *((_DWORD *)v71 - 1) = v73;
          v71 -= 4;
        }
        this[284] = (int8x8_t)v71;
        this[285] = (int8x8_t)v64;
        this[286] = (int8x8_t)v72;
        if (v65)
          operator delete(v65);
      }
      else
      {
        *(_DWORD *)v62 = -1;
        v64 = v62 + 4;
      }
      this[285] = (int8x8_t)v64;
    }
    result = objc_msgSend(*(id *)&this[2], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    this[629] = vorr_s8(this[629], (int8x8_t)vdup_n_s32(v59));
  }
  this[309].i32[0] |= 0x1D8u;
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void GLDContextRec::GLDContextRec(GLDContextRec *this)
{
  _QWORD *v2;

  GLDObject::GLDObject(this);
  *v2 = off_24FFED4B8;
  v2[284] = 0;
  v2[286] = 0;
  v2[285] = 0;
  GLDTransformFeedbackMachine::GLDTransformFeedbackMachine((GLDTransformFeedbackMachine *)(v2 + 419));
  *((_QWORD *)this + 425) = 0;
  *(_OWORD *)((char *)this + 3384) = 0u;
}

void sub_231063004(_Unwind_Exception *a1)
{
  GLDObject *v1;
  void **v2;
  void **v3;
  void *v5;

  v3 = v2;
  v5 = *v3;
  if (*v3)
  {
    *((_QWORD *)v1 + 285) = v5;
    operator delete(v5);
  }
  GLDObject::~GLDObject(v1);
  _Unwind_Resume(a1);
}

BOOL GLDContextRec::initWithShareGroup(uint64_t a1, pthread_mutex_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  id v13;
  GLRResource *v14;
  GLDLibrary *v15;
  uint64_t v16;
  uint64_t v17;
  GLRQueryResultBuffer *v18;
  uint64_t v19;
  GLDQueryStagingBuffer *StagingBuffer;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  GLDLibrary::getAllDisplayMask((GLDLibrary *)a1);
  *(_QWORD *)(a1 + 88) = a2;
  GLDShareGroupRec::contextRetain(a2);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 224);
  *(_QWORD *)(a1 + 96) = v12;
  GLDObject::retain(v12);
  *(_QWORD *)(a1 + 104) = a3;
  *(_QWORD *)(a1 + 112) = a4;
  *(_QWORD *)(a1 + 120) = a5;
  *(_QWORD *)(a1 + 128) = a6;
  *(_QWORD *)(a1 + 4768) = 1;
  *(_DWORD *)(a1 + 6256) = 0;
  *(_QWORD *)(a1 + 5016) = 0;
  v13 = objc_alloc_init(MEMORY[0x24BDDD510]);
  objc_msgSend(v13, "setIsOpenGLQueue:", 1);
  objc_msgSend(v13, "setMaxCommandBufferCount:", 8);
  GLDObject::operator new((GLDObject *)0x20);
  v15 = v14;
  GLRResource::GLRResource(v14);
  *(_QWORD *)(a1 + 72) = v15;
  GLDLibrary::getAllDisplayMask(v15);
  *(_OWORD *)(a1 + 1856) = 0u;
  *(_OWORD *)(a1 + 1872) = 0u;
  *(_OWORD *)(a1 + 1888) = 0u;
  *(_OWORD *)(a1 + 1904) = 0u;
  *(_QWORD *)(a1 + 1920) = 0;
  *(_OWORD *)(a1 + 1984) = 0u;
  *(_OWORD *)(a1 + 2000) = 0u;
  *(_OWORD *)(a1 + 2016) = 0u;
  *(_OWORD *)(a1 + 2032) = 0u;
  *(_QWORD *)(a1 + 2048) = 0;
  GLRRenderPipelineKey::init((GLRRenderPipelineKey *)(a1 + 2064));
  GLRRenderPipelineKey::init((GLRRenderPipelineKey *)(a1 + 2336));
  GLRRenderPipelineCache::init((GLRRenderPipelineCache *)(a1 + 2192));
  *(_QWORD *)(a1 + 4888) = 850045863;
  *(_OWORD *)(a1 + 4896) = 0u;
  *(_OWORD *)(a1 + 4912) = 0u;
  *(_OWORD *)(a1 + 4928) = 0u;
  *(_QWORD *)(a1 + 4944) = 0;
  *(_QWORD *)(a1 + 4952) = 1018212795;
  *(_OWORD *)(a1 + 4960) = 0u;
  *(_OWORD *)(a1 + 4976) = 0u;
  *(_QWORD *)(a1 + 4992) = 0;
  *(_QWORD *)(a1 + 5264) = dispatch_group_create();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 96) + 480))
    v16 = 0x100000;
  else
    v16 = 0x4000;
  GLRDataBufferManager::init(a1 + 5272, (GLDContextRec *)a1, v16, 0x100000, 1);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 96) + 480))
    v17 = 0x100000;
  else
    v17 = 0x4000;
  GLRDataBufferManager::init(a1 + 5632, (GLDContextRec *)a1, v17, 0x100000, 1);
  mach_timebase_info((mach_timebase_info_t)(a1 + 5072));
  *(_QWORD *)(a1 + 2312) = *(_QWORD *)(a1 + 2312) & 0xF000000000000000 | 0x700700700000000;
  *(_QWORD *)(a1 + 2464) = GLDDeviceRec::getDepthStencilStateFromKey(*(GLDDeviceRec **)(a1 + 96), (const GLRDepthStencilKey *)(a1 + 2312));
  *(_QWORD *)(a1 + 2320) = objc_alloc_init(MEMORY[0x24BDDD590]);
  *(_QWORD *)(a1 + 2408) = *(_QWORD *)(a1 + 2408) & 0xFFFFFFFFFF000000 | *(_DWORD *)(*(_QWORD *)(a1 + 96) + 104) & 0xFFFFFF;
  *(_QWORD *)(a1 + 5232) = glgCreateProcessor();
  GLDObject::operator new((GLDObject *)0x38);
  v19 = (uint64_t)v18;
  GLRQueryResultBuffer::GLRQueryResultBuffer(v18);
  *(_QWORD *)(a1 + 4752) = v19;
  GLRQueryResultBuffer::initWithShareGroup(v19, *(GLDObject **)(a1 + 88));
  StagingBuffer = GLDContextRec::allocQueryStagingBuffer((GLDContextRec *)a1);
  v21 = 0;
  *(_QWORD *)(a1 + 4760) = StagingBuffer;
  *(_BYTE *)(a1 + 2652) = 0;
  *(_QWORD *)(a1 + 2488) = &GLDContextRec::initWithShareGroup(GLDShareGroupRec *,GLDStateRec const*,GLDPluginStateRec const*,GLRPixelFormat const*,GLDContextConfigRec *)::setRenderDispatch;
  do
  {
    v22 = a1 + v21;
    *(_BYTE *)(v22 + 2508) = 0;
    *(_QWORD *)(v22 + 2496) = 65537;
    *(_DWORD *)(v22 + 2504) = -2147057658;
    v21 += 14;
  }
  while (v21 != 112);
  *(_QWORD *)(a1 + 80) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 24), "newCommandQueueWithDescriptor:", v13, COERCE_DOUBLE(65537));

  v23 = *(_QWORD *)(a1 + 80);
  if (v23)
  {
    GLDContextRec::populateConfigData(a1, a6);
    *(_DWORD *)(a1 + 432) = backtrace((void **)(a1 + 440), 64);
  }
  return v23 != 0;
}

void sub_2310632D8(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDContextRec::populateConfigData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  char v8;
  char v9;
  int v10;
  int v11;
  int v12;
  char *v13;
  char v14;
  char v15;
  char v16;
  int v17;
  int v18;
  uint64_t result;
  int v20;
  uint64_t v26;
  int v27;
  int v28;

  v4 = *(_QWORD *)(a1 + 120);
  v5 = *(_DWORD *)(v4 + 28);
  v27 = *(_DWORD *)(v4 + 24);
  v28 = *(_DWORD *)(v4 + 20);
  v7 = *(_DWORD *)(v4 + 32);
  v6 = *(_DWORD *)(v4 + 36);
  v8 = *(_BYTE *)(v4 + 44);
  v9 = *(_BYTE *)(v4 + 45);
  v10 = *(_DWORD *)(v4 + 52);
  v11 = *(_DWORD *)(v4 + 56);
  v12 = *(_DWORD *)(v4 + 60);
  *(_DWORD *)a2 = 0;
  v13 = getenv("AGX_GL_VIEWPORT_INVERT_CONFIG");
  if (v13 && !strncmp(v13, "UPPER_LEFT", 0xAuLL))
    *(_DWORD *)a2 = 32;
  else
    *(_BYTE *)(a2 + 616) = 1;
  *(_BYTE *)(a2 + 24) = 64;
  *(_WORD *)(a2 + 26) = 15553;
  *(_BYTE *)(a2 + 25) = *(_BYTE *)(a2 + 25) & 0x80 | 2;
  *(_WORD *)(a2 + 100) = 257;
  v14 = 1;
  *(_BYTE *)(a2 + 110) = 1;
  *(_DWORD *)(a2 + 104) = 16843009;
  *(_QWORD *)(a2 + 32) = 0x6000000010000;
  *(_BYTE *)(a2 + 174) = 1;
  *(_QWORD *)(a2 + 124) = 0x8000000080;
  *(_BYTE *)(a2 + 40) = v8;
  *(_BYTE *)(a2 + 41) = v9;
  *(_BYTE *)(a2 + 42) = 0;
  *(_BYTE *)(a2 + 44) = 0;
  *(_BYTE *)(a2 + 43) = v6 == 5126;
  if (v6 == 5126)
  {
    if (v7 == 6408)
    {
      v14 = 0;
      v16 = 32;
      v15 = 32;
      goto LABEL_12;
    }
LABEL_16:
    v26 = MTLReleaseAssertionFailure();
    return gldDestroyContext(v26);
  }
  if (v6 == 33639)
  {
    v16 = 8;
    v15 = 8;
    goto LABEL_12;
  }
  if (v6 != 33638)
  {
    MTLReleaseAssertionFailure();
    goto LABEL_16;
  }
  v14 = 0;
  v15 = 1;
  v16 = 5;
LABEL_12:
  *(_BYTE *)(a2 + 48) = v16;
  *(_BYTE *)(a2 + 49) = v16;
  *(_BYTE *)(a2 + 50) = v16;
  *(_BYTE *)(a2 + 51) = v15;
  *(_BYTE *)(a2 + 46) = 0;
  *(_BYTE *)(a2 + 45) = v14;
  *(_BYTE *)(a2 + 56) = v28;
  *(_BYTE *)(a2 + 57) = v27;
  *(_BYTE *)(a2 + 47) = v5;
  *(_BYTE *)(a2 + 58) = v10;
  *(_BYTE *)(a2 + 59) = v11 * v10 * v12 * v12;
  *(_QWORD *)(a2 + 112) = 0x400000000;
  v17 = *(_DWORD *)(a2 + 576);
  v18 = *(_DWORD *)(a2 + 580);
  *(int8x16_t *)(a2 + 560) = vorrq_s8(*(int8x16_t *)(a2 + 560), (int8x16_t)xmmword_23106B810);
  *(_DWORD *)(a2 + 576) = v17 | 0xDF3F7FFF;
  *(_DWORD *)(a2 + 580) = v18 | 0x1A;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 24), "supportsFamily:", 1004);
  v20 = *(_DWORD *)(a2 + 576);
  if ((_DWORD)result)
    v20 |= 0x20000000u;
  *(_DWORD *)(a2 + 576) = v20 | 0x8000;
  *(_DWORD *)(a2 + 580) |= 1u;
  *(_QWORD *)(a2 + 584) = 0x800FC010800FFF0;
  *(_DWORD *)(a2 + 592) = 134282254;
  *(_QWORD *)(a2 + 4) = 0x400000004000;
  *(_BYTE *)(a2 + 20) = 4;
  *(_OWORD *)(a2 + 60) = xmmword_23106B820;
  *(_OWORD *)(a2 + 76) = xmmword_23106B830;
  *(_QWORD *)(a2 + 92) = 0x3F80000041800000;
  *(_QWORD *)(a2 + 176) = 4096;
  *(_BYTE *)(a2 + 175) = 16;
  __asm { FMOV            V0.2S, #16.0 }
  *(_QWORD *)(a2 + 144) = _D0;
  *(_WORD *)(a2 + 168) = 0x4000;
  *(_OWORD *)(a2 + 152) = xmmword_23106B840;
  *(_DWORD *)(a2 + 170) = 4;
  *(_WORD *)(a2 + 352) = 12;
  *(_QWORD *)(a2 + 344) = 0x4000000800;
  *(_DWORD *)(a2 + 332) = 787328;
  *(_WORD *)(a2 + 446) = 24;
  *(_QWORD *)(a2 + 448) = 0x40000000003CLL;
  *(_QWORD *)(a2 + 428) = 0x7FFFFFFF8;
  *(_WORD *)(a2 + 504) = 64;
  *(_BYTE *)(a2 + 506) = 24;
  *(_QWORD *)(a2 + 464) = 0xF001F000F000FLL;
  *(_BYTE *)(a2 + 476) = 10;
  *(_DWORD *)(a2 + 472) = 8323087;
  *(_WORD *)(a2 + 477) = 5898;
  *(_OWORD *)(a2 + 480) = xmmword_23106B850;
  *(_QWORD *)(a2 + 496) = 0x100000020;
  *(_WORD *)(a2 + 21) = 1028;
  *(_QWORD *)(a2 + 536) = a1 + 208;
  *(_QWORD *)(a2 + 544) = a1 + 140;
  *(_DWORD *)(a1 + 208) = 196609;
  *(_DWORD *)(a1 + 140) = 196609;
  *(_BYTE *)(a2 + 110) = 1;
  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 528) = *(_DWORD *)(a2 + 620);
  return result;
}

uint64_t gldDestroyContext(unsigned int *a1)
{
  if (a1)
  {
    GLDObject::release(a1);
    free(a1);
  }
  return 0;
}

uint64_t gldGetInteger(uint64_t a1, int a2, unint64_t *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  size_t v14;
  void *v15;
  void *v16;
  void *v17;
  size_t v18;
  void *v19;
  void *v20;

  if (a2 > 666)
  {
    switch(a2)
    {
      case 1400:
        goto LABEL_12;
      case 1401:
        result = 0;
        v6 = *(_QWORD *)(a1 + 88);
        v7 = *(_QWORD *)(a1 + 96);
        *(_DWORD *)a3 = *(_DWORD *)(v6 + 32) | *(_DWORD *)(a1 + 5052) | *(_DWORD *)(v7 + 12);
        *(_DWORD *)(a1 + 5052) = 0;
        *(_DWORD *)(v6 + 32) = 0;
        *(_DWORD *)(v7 + 12) = 0;
        return result;
      case 1402:
        result = 0;
        v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 88) + 440);
        goto LABEL_37;
      case 1403:
        v10 = *(_QWORD *)(a1 + 400);
        if (v10)
        {
          v11 = **(_QWORD **)(v10 + 40);
          if (v11)
          {
            result = 0;
            v12 = *(_QWORD *)(v11 + 144);
            *(_QWORD *)(v11 + 144) = 0;
            v9 = (*(unsigned int *)(a1 + 5076) + v12 * (unint64_t)*(unsigned int *)(a1 + 5072) - 1)
               / *(unsigned int *)(a1 + 5076);
            goto LABEL_28;
          }
        }
        result = 0;
        *a3 = 0;
        return result;
      case 1404:
        result = 0;
        *a3 = (*(unsigned int *)(a1 + 5076) + *(_QWORD *)(a1 + 5056) * (unint64_t)*(unsigned int *)(a1 + 5072) - 1)
            / *(unsigned int *)(a1 + 5076);
        *(_QWORD *)(a1 + 5056) = 0;
        return result;
      case 1405:
      case 1406:
        goto LABEL_23;
      case 1407:
        result = *(_QWORD *)(a1 + 2200);
        if (result)
        {
          v13 = (void *)objc_msgSend((id)result, "newVertexShaderDebugInfo");
          v14 = objc_msgSend(v13, "length");
          v15 = *(void **)(a1 + 2216);
          if (v15)
            free(v15);
          v16 = malloc_type_malloc(v14, 0xF026FC8EuLL);
          *(_QWORD *)(a1 + 2216) = v16;
          objc_msgSend(v13, "getBytes:length:", v16, v14);

          *a3 = *(_QWORD *)(a1 + 2216);
          a3[1] = v14;
          v17 = (void *)objc_msgSend(*(id *)(a1 + 2200), "newFragmentShaderDebugInfo");
          v18 = objc_msgSend(v17, "length");
          v19 = *(void **)(a1 + 2224);
          if (v19)
            free(v19);
          v20 = malloc_type_malloc(v18, 0x693C5948uLL);
          *(_QWORD *)(a1 + 2224) = v20;
          objc_msgSend(v17, "getBytes:length:", v20, v18);

          result = 0;
          a3[8] = *(_QWORD *)(a1 + 2224);
          a3[9] = v18;
        }
        return result;
      default:
        if (a2 == 667)
        {
          result = 0;
          v8 = ((*(_DWORD *)(a1 + 380) >> 21) & 1) == 0;
          goto LABEL_37;
        }
        if (a2 != 680)
          goto LABEL_23;
        v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 24), "getShaderCacheKeys");
        result = 0;
        break;
    }
    goto LABEL_28;
  }
  if (a2 > 602)
  {
    if (a2 <= 605)
    {
      if (a2 != 603)
      {
        if (a2 == 604)
        {
          result = 0;
          *(_DWORD *)a3 = 0;
          return result;
        }
        goto LABEL_23;
      }
      goto LABEL_16;
    }
    if (a2 == 606)
    {
LABEL_16:
      result = 0;
      v9 = (unint64_t)"";
LABEL_28:
      *a3 = v9;
      return result;
    }
    if (a2 == 666)
    {
      result = 0;
      v8 = ((*(_DWORD *)(a1 + 380) >> 9) & 1) == 0;
      goto LABEL_37;
    }
    goto LABEL_23;
  }
  if (a2 != 317)
  {
    if (a2 == 318)
    {
      result = 0;
      v8 = *(_BYTE *)(a1 + 6277) == 0;
      goto LABEL_37;
    }
    if (a2 == 319)
    {
LABEL_12:
      result = 0;
      v8 = 1;
LABEL_37:
      *(_DWORD *)a3 = v8;
      return result;
    }
LABEL_23:
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s: Unimplemented - pname 0x%04X, params %p", "enum32_t GLDContextRec::getInteger(enum32_t, int32_t *)", a2, a3);
    return 10010;
  }
  *(_DWORD *)a3 = *(_DWORD *)(a1 + 6272);
  if (*(_DWORD *)(a1 + 6272) != 1)
    return 0;
  result = 0;
  *(_DWORD *)(a1 + 6272) = 0;
  return result;
}

uint64_t gldGetError(uint64_t a1)
{
  uint64_t v1;

  v1 = *(unsigned int *)(a1 + 136);
  *(_DWORD *)(a1 + 136) = 0;
  return v1;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void ___ZN13GLDContextRec10setIntegerEjPKi_block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  _Block_release(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

uint64_t gldCreateComputeContext()
{
  return 0;
}

uint64_t gldDestroyComputeContext()
{
  return 0;
}

uint64_t gldCreateQueue()
{
  return 0;
}

uint64_t gldDestroyQueue()
{
  return 0;
}

uint64_t gldCreateComputeModule()
{
  return 0;
}

uint64_t gldDestroyComputeModule()
{
  return 0;
}

uint64_t gldCompileComputeModule()
{
  return 0;
}

uint64_t gldLinkComputeModules()
{
  return 0;
}

uint64_t gldWriteComputeModuleBinary()
{
  return 0;
}

uint64_t gldCreateComputeProgram()
{
  return 0;
}

uint64_t gldDestroyComputeProgram()
{
  return 0;
}

uint64_t gldLinkComputeProgram()
{
  return 0;
}

uint64_t gldBuildComputeProgram()
{
  return 0;
}

uint64_t gldWriteComputeProgramBinary()
{
  return 0;
}

uint64_t gldCreateKernel()
{
  return 0;
}

uint64_t gldDestroyKernel()
{
  return 0;
}

uint64_t gldExecuteKernel()
{
  return 0;
}

uint64_t gldExecuteNativeKernel()
{
  return 0;
}

uint64_t gldCopyBufferDataWithQueue()
{
  return 0;
}

uint64_t gldCopyTextureDataWithQueue()
{
  return 0;
}

uint64_t gldCopyBufferDataToTextureWithQueue()
{
  return 0;
}

uint64_t gldCopyTextureDataToBufferWithQueue()
{
  return 0;
}

uint64_t gldFinishFenceOnQueue()
{
  return 0;
}

uint64_t gldFinishQueue()
{
  return 0;
}

uint64_t gldCreateDevicePartitionGroup()
{
  return 0;
}

uint64_t gldDestroyDevicePartitionGroup()
{
  return 0;
}

uint64_t gldCreateDevicePartition()
{
  return 0;
}

uint64_t gldDestroyDevicePartition()
{
  return 0;
}

uint64_t gldGetDevicePartitionInfo()
{
  return 0;
}

BOOL GLDContextRec::drawableInvertFramebuffer(GLDContextRec *this, GLDFramebufferRec *a2)
{
  int v2;

  if (*(_DWORD *)(*((_QWORD *)a2 + 4) + 192))
    v2 = 16;
  else
    v2 = 32;
  return (**((_DWORD **)this + 16) & v2) != 0;
}

uint64_t GLDContextRec::drawablePBEInvert(GLDContextRec *this, GLDFramebufferRec *a2, unsigned int a3)
{
  if (**((_DWORD **)this + 16))
    return 0;
  else
    return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a2 + 5) + 8 * a3) + 48) + 24) & 1;
}

uint64_t gldAttachDrawable()
{
  return 0;
}

uint64_t GLDContextRec::bindDrawFramebuffer(GLDContextRec *this, GLDFramebufferRec *a2)
{
  int v4;
  uint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  char *v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;
  unsigned int *v21;
  char v22;
  char *v23;
  char *v24;
  unint64_t v25;
  unsigned int v26;
  int v27;
  int v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  char *v36;
  unsigned int v37;
  uint64_t result;
  uint64_t v39;
  int v40;
  GLDFramebufferRec *v41;
  int v42;
  uint64_t v43;

  if (*((_DWORD *)this + 1151))
    GLDContextRec::beginRenderPass(this);
  if (a2)
    v4 = *(_DWORD *)(*((_QWORD *)a2 + 4) + 200);
  else
    v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)((char *)this + 4588) = 0;
  *(_OWORD *)((char *)this + 2616) = 0u;
  v9 = (char *)this + 4576;
  v10 = 4136;
  v41 = a2;
  do
  {
    if (a2)
    {
      if (*(_WORD *)(*((_QWORD *)a2 + 4) + 2 * v7 + 160))
        v11 = 1;
      else
        v11 = v7 >= 8;
      v12 = 1 << v7;
      if (v11)
        v13 = -1;
      else
        v13 = ~v12;
      v4 &= v13;
    }
    else
    {
      v12 = 1 << v7;
    }
    if ((v4 & v12) != 0)
    {
      if (v7 <= 7)
      {
        ++*((_DWORD *)this + 1147);
        *((_DWORD *)this + 1148) = v7;
      }
      v14 = *((_QWORD *)a2 + 5);
      v15 = *(_QWORD *)(v14 + 8 * v7);
      if (v15)
        GLDContextRec::dispatchImageQueueEvent(this, *(GLDTextureRec **)(v14 + 8 * v7));
      v43 = *(_QWORD *)(v15 + 88);
      v16 = *(unsigned int **)((char *)this + v10);
      if (v16)
      {
        GLDObject::release(v16);
        *(_QWORD *)((char *)this + v10) = 0;
      }
      v17 = (char *)this + v10;
      v18 = *(_QWORD *)((char *)this + v10 + 80);
      if (v18)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v18 + 24))(v18);
        *((_QWORD *)v17 + 10) = 0;
      }
      if (v7 == 9 && *(_DWORD *)(v15 + 76) == 2)
      {
        *((_QWORD *)v17 + 10) = GLDTextureRec::getTextureResource((GLDTextureRec *)v15, 1u);
        v19 = (unsigned int *)(v15 + 68);
      }
      else
      {
        if (*(_BYTE *)(v15 + 73))
        {
          *(_QWORD *)((char *)this + v10) = v15;
          *((_QWORD *)v17 + 10) = 0;
          GLDObject::retain(v15);
        }
        else
        {
          *(_QWORD *)((char *)this + v10) = 0;
          *((_QWORD *)v17 + 10) = GLDTextureRec::getTextureResource((GLDTextureRec *)v15, 0);
        }
        v19 = (unsigned int *)(v15 + 64);
      }
      v26 = *v19;
      v27 = *((_DWORD *)&glrTextureFormats + 10 * v26 + 9);
      v42 = v4;
      if ((v27 & 8) != 0)
      {
        *((_DWORD *)this + 657) |= 2 << v6;
        *((_DWORD *)this + 655) |= v12;
      }
      else
      {
        v28 = *((_DWORD *)this + 657);
        if ((v27 & 0x10) != 0)
        {
          *((_DWORD *)this + 657) = v28 | (3 << v6);
          *((_DWORD *)this + 656) |= v12;
        }
        else
        {
          *((_DWORD *)this + 657) = v28 | (1 << v6);
          *((_DWORD *)this + 654) |= v12;
        }
      }
      v29 = (char *)this + 8 * v7 + 4576;
      v30 = *((_QWORD *)v29 - 20);
      v31 = (unint64_t)(&glrTextureFormats)[5 * v26 + 3];
      *((_QWORD *)v29 - 20) = v31;
      v32 = *((_QWORD *)v17 + 10);
      if (v32)
        (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
      a2 = v41;
      v33 = *((_QWORD *)v41 + 4);
      switch(v43)
      {
        case 0:
        case 2:
        case 4:
          v34 = 0;
          *(_DWORD *)((char *)this + v5 + 4296) = 0;
          goto LABEL_49;
        case 1:
        case 3:
          v34 = 0;
          v35 = *(_DWORD *)(v33 + 4 * v5 + 12);
          goto LABEL_48;
        case 5:
        case 6:
          v34 = 0;
          v35 = *(_DWORD *)(v33 + 4 * v5 + 4);
LABEL_48:
          *(_DWORD *)((char *)this + v5 + 4296) = v35;
          goto LABEL_49;
        case 7:
          *(_DWORD *)((char *)this + v5 + 4296) = 0;
          v34 = *(_DWORD *)(v33 + 4 * v5 + 12);
LABEL_49:
          v25 = v31 ^ v30;
          v36 = (char *)this + v5;
          *((_DWORD *)v36 + 1094) = v34;
          *((_DWORD *)v36 + 1084) = *(_DWORD *)(v33 + 4 * v5 + 8);
          v22 = *(_BYTE *)(*(_QWORD *)(v15 + 48) + 24) & 1;
          v4 = v42;
          v9 = (char *)this + 4576;
          goto LABEL_50;
        default:
          v39 = MTLReleaseAssertionFailure();
          return gldUpdateReadFramebuffer(v39, v40);
      }
    }
    v20 = *(_QWORD *)((char *)this + v10 + 80);
    if (v20)
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
    v21 = *(unsigned int **)((char *)this + v10);
    if (v21)
      GLDObject::release(v21);
    v22 = 0;
    *(_QWORD *)((char *)this + v10) = 0;
    *(_QWORD *)((char *)this + v10 + 80) = 0;
    v23 = (char *)this + v5;
    *((_DWORD *)v23 + 1074) = 0;
    *((_DWORD *)v23 + 1094) = 0;
    v24 = &v9[8 * v7];
    v25 = *((_QWORD *)v24 - 20);
    *((_QWORD *)v24 - 20) = 0;
    a2 = v41;
LABEL_50:
    v9[v7] = v22;
    v8 |= v25;
    ++v7;
    v6 += 2;
    v10 += 8;
    v5 += 4;
  }
  while (v7 != 10);
  if (a2 && (v37 = *(unsigned __int8 *)(*((_QWORD *)a2 + 4) + 182), v37 >= 2))
    result = glrConvertMultisampleCount(v37);
  else
    result = 1;
  if ((_DWORD)result != *((_DWORD *)this + 1149))
  {
    *((_DWORD *)this + 1149) = result;
    *((_DWORD *)this + 621) |= 2u;
  }
  *((_DWORD *)this + 657) = *((unsigned __int8 *)this + 2628);
  *((_DWORD *)this + 452) |= 0x40040000u;
  *((_DWORD *)this + 620) |= 1u;
  if (v8)
    *((_DWORD *)this + 621) |= 2u;
  return result;
}

uint64_t gldUpdateReadFramebuffer(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (a2 < 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 424);
    if (v2)
    {
      v3 = *(_DWORD *)(v2 + 24);
      if (*(_DWORD *)(a1 + 1804) == v3)
        goto LABEL_7;
    }
    else
    {
      v3 = 0;
    }
    *(_DWORD *)(a1 + 1804) = v3;
LABEL_7:
    *(_QWORD *)(a1 + 408) = v2;
  }
  return 1;
}

void gldDiscardFramebuffer(int8x8_t *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v8;
  uint64_t v9;
  int v10;
  GLDTextureRec *v11;
  uint64_t TextureResource;
  uint64_t v13;
  GLDTextureRec *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  GLDTextureRec *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  GLDContextRec *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;

  if (this[575].i32[1])
    GLDContextRec::beginRenderPass((GLDContextRec *)this);
  if (this[2])
    v8 = a3 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = 0;
    while (1)
    {
      v10 = *(_DWORD *)(a4 + 4 * v9);
      if ((v10 - 36064) < 8)
      {
        v11 = *(GLDTextureRec **)(*(_QWORD *)(a2 + 40) + 8 * (v10 - 36064));
        if (v11)
        {
          TextureResource = GLDTextureRec::getTextureResource(v11, 0);
          if (TextureResource)
            v13 = *(_QWORD *)(TextureResource + 32);
          else
            v13 = 0;
          for (i = 0; i != 4; ++i)
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)&this[231], "colorAttachments"), "objectAtIndexedSubscript:", i), "texture") == v13)this[629] = vand_s8(this[629], (int8x8_t)vdup_n_s32(~(1 << i)));
          }
        }
        goto LABEL_23;
      }
      if (v10 == 36096)
        break;
      if (v10 != 36128)
      {
        v22 = (GLDContextRec *)MTLReleaseAssertionFailure();
        gldBlitFramebufferData(v22, v23, v24, v25, v26, v27, v28);
        return;
      }
      v14 = *(GLDTextureRec **)(*(_QWORD *)(a2 + 40) + 72);
      if (v14)
      {
        v15 = GLDTextureRec::getTextureResource(v14, *((_DWORD *)v14 + 19) == 2);
        v16 = v15 ? *(_QWORD *)(v15 + 32) : 0;
        if (objc_msgSend((id)objc_msgSend(*(id *)&this[231], "stencilAttachment"), "texture") == v16)
        {
          v21 = -513;
LABEL_34:
          this[629] = vand_s8(this[629], (int8x8_t)vdup_n_s32(v21));
        }
      }
LABEL_23:
      if (++v9 == a3)
        return;
    }
    v18 = *(GLDTextureRec **)(*(_QWORD *)(a2 + 40) + 64);
    if (!v18)
      goto LABEL_23;
    v19 = GLDTextureRec::getTextureResource(v18, 0);
    v20 = v19 ? *(_QWORD *)(v19 + 32) : 0;
    if (objc_msgSend((id)objc_msgSend(*(id *)&this[231], "depthAttachment"), "texture") != v20)
      goto LABEL_23;
    v21 = -257;
    goto LABEL_34;
  }
}

uint64_t gldBlitFramebufferData(GLDContextRec *this, int a2, int a3, int a4, int a5, int a6, int a7, float a8, float a9, float a10, float a11)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  _DWORD *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t TextureResource;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char *v40;
  GLDTextureRec *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  uint64_t v57;
  float v58;
  float v59;
  unint64_t v60;
  float v61;
  unint64_t v62;
  float v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  BOOL v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  BOOL v71;
  unint64_t v72;
  float v73;
  uint64_t v74;
  int v75;
  int v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  GLRTextureResource *v89;
  uint64_t v90;
  unsigned int v91;
  float v92;
  float v93;
  float v94;
  unsigned int v95;
  float v96;
  uint64_t v97;
  uint64_t v98;
  unsigned int v99;
  MTLRenderPipelineDescriptor *v100;
  uint64_t i;
  MTLDepthStencilDescriptor *v102;
  void *DepthStencilStateFromDescriptor;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  GLRTextureResource *v113;
  GLDLibrary *v114;
  void *v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  void *v124;
  void *v125;
  __int128 v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t *v135;
  void *v136;
  GLDTextureRec *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  __int128 v145;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  uint64_t v152;
  GLRResource *v153;
  unsigned __int8 *v154;
  uint64_t BlitFramebufferSampler;
  _OWORD *v156;
  const char *BlitPipelineStateFromDescriptor;
  uint64_t v158;
  int v159;
  char *context;
  void *contexta;
  uint64_t v163;
  GLRTextureResource *v164;
  GLDLibrary *v165;
  int v166;
  void *v167;
  char *v168;
  _OWORD v169[2];
  _QWORD v170[3];
  _QWORD v171[3];
  _QWORD v172[3];
  _OWORD v173[2];
  _QWORD v174[3];
  _QWORD v175[3];
  _QWORD v176[3];
  __int128 v177;
  __int128 v178;
  __int128 v179;
  uint64_t v180;
  float v181;
  float v182;
  float v183;
  float v184;
  float v185;
  float v186;
  float v187;
  float v188;
  float v189;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float v195;
  float v196;
  float v197;
  float v198;
  _DWORD v199[2];
  uint64_t v200;
  float v201;
  float v202;
  uint64_t v203;
  float v204;
  float v205;
  uint64_t v206;
  float v207;
  float v208;
  uint64_t v209;
  float v210;
  float v211;
  uint64_t v212;
  float v213;
  float v214;
  uint64_t v215;
  uint64_t v216;

  v216 = *MEMORY[0x24BDAC8D0];
  v154 = (unsigned __int8 *)this + 4584;
  v21 = *(_QWORD *)(*((_QWORD *)this + 51) + 32);
  v22 = *(_QWORD *)(*((_QWORD *)this + 50) + 32);
  *((_QWORD *)this + 53) |= 0x8000uLL;
  v163 = v21;
  v152 = v22;
  if (!*((_QWORD *)this + 2)
    || *(unsigned __int8 *)(v21 + 182) < 2u
    || a3 | a2
    || *((_DWORD *)this + 1149) != 1
    || *(unsigned __int16 *)(v21 + 178) != a4
    || *(unsigned __int16 *)(v21 + 180) != a5
    || *(unsigned __int16 *)(v22 + 178) != a4
    || *(unsigned __int16 *)(v22 + 180) != a5)
  {
    goto LABEL_66;
  }
  v23 = *((_QWORD *)this + 13);
  if (*(_BYTE *)(v23 + 13284))
  {
    if (*(_DWORD *)(v23 + 13268)
      || *(_DWORD *)(v23 + 13272)
      || *(_DWORD *)(v23 + 13276) != a4
      || a9 != 0.0
      || a8 != 0.0
      || a11 != 1.0
      || a10 != 1.0
      || *(_DWORD *)(v23 + 13280) != a5)
    {
      goto LABEL_66;
    }
    goto LABEL_23;
  }
  if (a9 != 0.0 || a8 != 0.0 || a10 != 1.0 || a11 != 1.0)
  {
LABEL_66:
    if (a6)
      goto LABEL_67;
    return 1;
  }
LABEL_23:
  context = (char *)this + 4496;
  while (1)
  {
    if (!a6)
      return 1;
    if ((a6 & 0x4000) != 0)
    {
      v24 = *(unsigned __int16 *)(v163 + 176) - 36064;
      goto LABEL_30;
    }
    if ((a6 & 0x100) != 0)
      goto LABEL_67;
    if ((a6 & 0x400) == 0)
      break;
    v24 = 9;
LABEL_30:
    v25 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 51) + 40) + 8 * v24);
    v26 = v24 == 9 && *(_DWORD *)(v25 + 76) == 2;
    v27 = (_DWORD *)(v163 + 16 * v24);
    v28 = v27[1];
    v29 = v27[3];
    v164 = (GLRTextureResource *)v27[2];
    v30 = *(_QWORD *)(v25 + 48);
    TextureResource = GLDTextureRec::getTextureResource((GLDTextureRec *)v25, v26);
    if (TextureResource)
      v167 = *(void **)(TextureResource + 32);
    else
      v167 = 0;
    if ((a6 & 0x4000) == 0)
      goto LABEL_67;
    v32 = !v28 && v29 == 0;
    if (!v32 || *((_DWORD *)this + 1147) != 1)
      goto LABEL_67;
    v33 = objc_msgSend(v167, "pixelFormat");
    v34 = *((unsigned int *)this + 1148);
    v35 = *((_QWORD *)this + v34 + 552);
    if (v33 != v35 && (v33 != 80 || v35 != 70) && (v33 != 70 || v35 != 80))
      goto LABEL_67;
    if (!v154[502] && *((_BYTE *)this + v34 + 4576) != (*(_BYTE *)(v30 + 24) & 1))
      goto LABEL_67;
    v36 = (void *)objc_msgSend(*((id *)this + 231), "colorAttachments");
    v37 = 0;
    v166 = 0x4000;
    do
    {
      v38 = (void *)objc_msgSend(v36, "objectAtIndexedSubscript:", v37);
      if ((*((_DWORD *)this + 1187) & (1 << v37)) != 0)
      {
        v39 = v38;
        if ((void *)objc_msgSend(v38, "texture") == v167 && (GLRTextureResource *)objc_msgSend(v39, "level") == v164)
        {
          *((_DWORD *)this + 1260) |= 1 << v37;
          v40 = (char *)this + 8 * *((unsigned int *)this + 1148);
          v41 = (GLDTextureRec *)*((_QWORD *)v40 + 517);
          if (v41)
            v42 = GLDTextureRec::getTextureResource(v41, 0);
          else
            v42 = *((_QWORD *)v40 + 527);
          GLRResourceList::addResource(*((_QWORD *)this + 8), v42);
          *(_QWORD *)&context[8 * v37] = 3;
          v43 = (void *)*((_QWORD *)this + 2);
          v44 = *(_QWORD *)(v42 + 32);
          v45 = *((unsigned int *)this + 1148);
          v46 = (unsigned int *)((char *)this + 4 * v45);
          v47 = v46[1074];
          v48 = v46[1094];
          v49 = v46[1084];
          if (v154[502])
            objc_msgSend(v43, "setColorResolveTexture:slice:depthPlane:level:yInvert:atIndex:", v44, v47, v48, v49, *((unsigned __int8 *)this + v45 + 4576), v37);
          else
            objc_msgSend(v43, "setColorResolveTexture:slice:depthPlane:level:atIndex:", v44, v47, v48, v49, v37);
          *((_DWORD *)this + 620) |= 4u;
          v50 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 50) + 40) + 8 * *((int *)this + 1148));
          v51 = *(_QWORD *)(v50 + 184);
          if (v51)
            (*(void (**)(uint64_t))(*(_QWORD *)v51 + 24))(v51);
          a6 &= ~v166;
          *(_QWORD *)(v50 + 184) = 0;
          v166 = 0;
        }
      }
      ++v37;
    }
    while (v37 != 4);
    if (v166)
      goto LABEL_66;
  }
  NSLog(CFSTR("bad bits in blit_mask"));
LABEL_67:
  if (*((_DWORD *)this + 1151))
    GLDContextRec::beginRenderPass(this);
  if (*((_QWORD *)this + 2))
    GLDContextRec::endRenderPass(this);
  if (!*((_QWORD *)this + 5))
    GLDContextRec::getCommandBuffer(this);
  v52 = a8 + (float)((float)a4 * a10);
  v53 = a9 + (float)((float)a5 * a11);
  *(float *)v199 = a8;
  *(float *)&v199[1] = v53;
  v200 = 0x3F80000000000000;
  v201 = a8;
  v202 = a9;
  v203 = 0x3F80000000000000;
  v204 = v52;
  v205 = a9;
  v206 = 0x3F80000000000000;
  v207 = v52;
  v208 = v53;
  v209 = 0x3F80000000000000;
  v210 = a8;
  v211 = v53;
  v212 = 0x3F80000000000000;
  v213 = v52;
  v214 = a9;
  v215 = 0x3F80000000000000;
  BlitFramebufferSampler = GLDDeviceRec::getBlitFramebufferSampler(*((id **)this + 12), a7);
  v54 = (float)a2;
  v55 = (float)a3;
  v56 = (float)(a4 + a2);
  v57 = 2;
  if (a7 == 9729)
    v57 = 3;
  v147 = v57;
  v58 = 0.0;
  if (a8 > 0.0)
    v59 = a8;
  else
    v59 = 0.0;
  v60 = (unint64_t)v59;
  if (a9 > 0.0)
    v61 = a9;
  else
    v61 = 0.0;
  v62 = (unint64_t)v61;
  if (v52 > 0.0)
    v63 = v52;
  else
    v63 = 0.0;
  v64 = (unint64_t)v63;
  if (v53 > 0.0)
    v58 = v53;
  v65 = (unint64_t)v58;
  v66 = v64 - v60;
  v68 = v60 - v64;
  v67 = v60 > v64;
  if (v60 >= v64)
    v60 = (unint64_t)v63;
  v151 = v60;
  if (v67)
    v69 = v68;
  else
    v69 = v66;
  v150 = v69;
  v70 = v65 - v62;
  v72 = v62 - v65;
  v71 = v62 > v65;
  if (v62 >= v65)
    v62 = (unint64_t)v58;
  if (v71)
    v70 = v72;
  v148 = v70;
  v149 = v62;
  v156 = (_OWORD *)((char *)this + 5168);
  v168 = (char *)this + 4576;
  v73 = (float)(a5 + a3);
  while (2)
  {
    contexta = (void *)MEMORY[0x2348CF1D8]();
    if ((a6 & 0x4000) != 0)
    {
      v74 = v163;
      v75 = *(unsigned __int16 *)(v163 + 176) - 36064;
      v76 = -16385;
      goto LABEL_102;
    }
    v74 = v163;
    if ((a6 & 0x100) != 0)
    {
      v75 = 8;
      v76 = -257;
      goto LABEL_102;
    }
    if ((a6 & 0x400) != 0)
    {
      v75 = 9;
      v76 = -1025;
LABEL_102:
      v159 = v76;
      v77 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 51) + 40) + 8 * v75);
      v78 = v75 == 9 && *(_DWORD *)(v77 + 76) == 2;
      v79 = v74 + 16 * v75;
      v81 = *(unsigned int *)(v79 + 4);
      v80 = *(unsigned int *)(v79 + 8);
      v82 = *(_QWORD *)(v77 + 48);
      v83 = GLDTextureRec::getTextureResource(*(GLDTextureRec **)(*(_QWORD *)(*((_QWORD *)this + 51) + 40) + 8 * v75), v78);
      if (v83)
        v84 = *(void **)(v83 + 32);
      else
        v84 = 0;
      v85 = objc_msgSend(v84, "textureType");
      if ((v85 & 0xFFFFFFFFFFFFFFFDLL) == 1)
        v86 = 2;
      else
        v86 = v85;
      if (v75 == 9)
      {
        v87 = objc_alloc_init(MEMORY[0x24BDDD740]);
        objc_msgSend(v87, "setWidth:", *(unsigned __int16 *)(v163 + 178));
        objc_msgSend(v87, "setHeight:", *(unsigned __int16 *)(v163 + 180));
        objc_msgSend(v87, "setPixelFormat:", 13);
        objc_msgSend(v87, "setTextureType:", v86);
        objc_msgSend(v87, "setSampleCount:", objc_msgSend(v84, "sampleCount"));
        objc_msgSend(v87, "setUsage:", 5);
        v88 = (void *)objc_msgSend(*(id *)(*((_QWORD *)this + 12) + 24), "newTextureWithDescriptor:", v87);

      }
      else
      {
        v88 = (void *)objc_msgSend(v84, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v84, "pixelFormat"), v86, v80, 1, v81, 1);
      }
      objc_msgSend(v88, "setLabel:", *MEMORY[0x24BDDD9C0]);
      GLDObject::operator new((GLDObject *)0x40);
      v165 = v89;
      GLRTextureResource::GLRTextureResource(v89);
      v90 = GLDTextureRec::getTextureResource((GLDTextureRec *)v77, v78);
      GLRTextureResource::initWithMetalTexture(v165, v88, *(_QWORD *)(v90 + 24));

      v92 = v55;
      v93 = v73;
      if ((*(_BYTE *)(v82 + 24) & 1) != 0)
      {
        LOWORD(v91) = *(_WORD *)(v163 + 180);
        v94 = (float)v91;
        v92 = v94 - v55;
        v93 = v94 - v73;
      }
      if ((*(_WORD *)(v82 + 214) & 0x1800) != 0)
      {
        v95 = *(_DWORD *)(v163 + 16 * v75 + 12);
        v96 = (float)(unint64_t)objc_msgSend(v88, "depth");
        v181 = v54;
        v182 = v93;
        v183 = (float)v95 / v96;
        v184 = v54;
        v185 = v92;
        v186 = v183;
        v187 = v56;
        v188 = v92;
        v189 = v183;
        v190 = v56;
        v191 = v93;
        v192 = v183;
        v193 = v54;
        v194 = v93;
        v195 = v183;
        v196 = v56;
        v197 = v92;
        v198 = v183;
        v158 = 72;
      }
      else
      {
        v181 = v54;
        v182 = v93;
        v183 = v54;
        v184 = v92;
        v185 = v56;
        v186 = v92;
        v187 = v56;
        v188 = v93;
        v189 = v54;
        v190 = v93;
        v158 = 48;
        v191 = v56;
        v192 = v92;
      }
      v180 = 0;
      v178 = 0u;
      v179 = 0u;
      v177 = 0u;
      objc_msgSend(v84, "pixelFormat");
      MTLPixelFormatGetInfo();
      if ((*(_WORD *)(v82 + 214) & 0x1800) != 0)
      {
        if (v75 == 8)
        {
          v97 = 12;
          v98 = 16;
        }
        else if ((DWORD2(v177) & 0x10000) != 0)
        {
          v97 = 12;
          v98 = 13;
        }
        else if ((DWORD2(v177) & 0x40000) != 0)
        {
          v97 = 12;
          v98 = 14;
        }
        else
        {
          if ((DWORD2(v177) & 0x80000) != 0)
            v98 = 15;
          else
            v98 = 13;
          v97 = 12;
        }
      }
      else
      {
        v99 = v75 & 0xFFFFFFFE;
        if (*(unsigned __int8 *)(v163 + 182) < 2u)
        {
          if (v75 == 8)
            v98 = 8;
          else
            v98 = 10;
          if (v99 != 8)
          {
            if ((DWORD2(v177) & 0x10000) != 0)
            {
              v97 = 0;
              v98 = 1;
            }
            else
            {
              v97 = 0;
              if ((DWORD2(v177) & 0x40000) != 0)
              {
                v98 = 4;
              }
              else if ((DWORD2(v177) & 0x80000) != 0)
              {
                v98 = 6;
              }
              else
              {
                v98 = 1;
              }
            }
            goto LABEL_153;
          }
        }
        else
        {
          if (v75 == 8)
            v98 = 9;
          else
            v98 = 11;
          if (v99 != 8)
          {
            if ((DWORD2(v177) & 0x40000) != 0)
            {
              v97 = 0;
              v98 = 5;
            }
            else
            {
              v97 = 0;
              if ((DWORD2(v177) & 0x80000) != 0)
                v98 = 7;
              else
                v98 = v147;
            }
            goto LABEL_153;
          }
        }
        v97 = 0;
      }
LABEL_153:
      v100 = (MTLRenderPipelineDescriptor *)objc_alloc_init(MEMORY[0x24BDDD6B8]);
      -[MTLRenderPipelineDescriptor setLabel:](v100, "setLabel:", CFSTR("blitFramebuffer Pipeline"));
      -[MTLRenderPipelineDescriptor setVertexFunction:](v100, "setVertexFunction:", GLRFunctionCache::getFunction((GLRFunctionCache *)(*((_QWORD *)this + 12) + 216), *(_DWORD *)(*((_QWORD *)this + 12) + 4 * v97 + 120)));
      -[MTLRenderPipelineDescriptor setFragmentFunction:](v100, "setFragmentFunction:", GLRFunctionCache::getFunction((GLRFunctionCache *)(*((_QWORD *)this + 12) + 216), *(_DWORD *)(*((_QWORD *)this + 12) + 4 * v98 + 120)));
      if (v75 == 8)
      {
        -[MTLRenderPipelineDescriptor setDepthAttachmentPixelFormat:](v100, "setDepthAttachmentPixelFormat:", *((_QWORD *)this + 560));
      }
      else if (v75 == 9)
      {
        -[MTLRenderPipelineColorAttachmentDescriptor setPixelFormat:](-[MTLRenderPipelineColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPipelineDescriptor colorAttachments](v100, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setPixelFormat:", 13);
      }
      else
      {
        for (i = 0; i != 8; ++i)
          -[MTLRenderPipelineColorAttachmentDescriptor setPixelFormat:](-[MTLRenderPipelineColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPipelineDescriptor colorAttachments](v100, "colorAttachments"), "objectAtIndexedSubscript:", i), "setPixelFormat:", *((_QWORD *)this + i + 552));
      }
      -[MTLRenderPipelineDescriptor setOpenGLModeEnabled:](v100, "setOpenGLModeEnabled:", 1);
      BlitPipelineStateFromDescriptor = GLDDeviceRec::getBlitPipelineStateFromDescriptor(*((id **)this + 12), v100);

      if (v75 == 8)
      {
        v102 = (MTLDepthStencilDescriptor *)objc_alloc_init(MEMORY[0x24BDDD590]);
        -[MTLDepthStencilDescriptor setDepthCompareFunction:](v102, "setDepthCompareFunction:", 7);
        -[MTLDepthStencilDescriptor setDepthWriteEnabled:](v102, "setDepthWriteEnabled:", 1);
        DepthStencilStateFromDescriptor = GLDDeviceRec::getDepthStencilStateFromDescriptor(*((id **)this + 12), v102);

        v104 = (void *)objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
        v105 = (void *)objc_msgSend(v104, "depthAttachment");
        v106 = v105;
        v107 = *((_QWORD *)this + 535);
        if (v107)
        {
          GLRResourceList::addResource(*((_QWORD *)this + 8), *((_QWORD *)this + 535));
          objc_msgSend(v106, "setTexture:", *(_QWORD *)(v107 + 32));
          objc_msgSend(v106, "setLevel:", *((unsigned int *)this + 1092));
          objc_msgSend(v106, "setSlice:", *((unsigned int *)this + 1082));
          objc_msgSend(v106, "setDepthPlane:", *((unsigned int *)this + 1102));
          objc_msgSend(v106, "setLoadAction:", 1);
          objc_msgSend(v106, "setStoreAction:", 1);
          objc_msgSend(v106, "setYInvert:", *v154);
        }
        else
        {
          objc_msgSend(v105, "setTexture:", 0);
        }
LABEL_193:
        GLRResourceList::addResource(*((_QWORD *)this + 8), (uint64_t)v165);
        v143 = (void *)objc_msgSend(*((id *)this + 5), "renderCommandEncoderWithDescriptor:", v104);
        *((_QWORD *)this + 3) = v143;
        objc_msgSend(v143, "setLabel:", *MEMORY[0x24BDDD9C0]);
        objc_msgSend(*((id *)this + 3), "setRenderPipelineState:", BlitPipelineStateFromDescriptor);
        objc_msgSend(*((id *)this + 3), "setFragmentTexture:atIndex:", v88, 0);
        objc_msgSend(*((id *)this + 3), "setFragmentSamplerState:atIndex:", BlitFramebufferSampler, 0);
        v144 = (void *)*((_QWORD *)this + 3);
        v145 = *((_OWORD *)this + 324);
        v169[0] = *v156;
        v169[1] = v145;
        objc_msgSend(v144, "setScissorRect:", v169);
        if (v75 == 8)
          objc_msgSend(*((id *)this + 3), "setDepthStencilState:", DepthStencilStateFromDescriptor);
        objc_msgSend(*((id *)this + 3), "setViewportTransformEnabled:", 0);
        objc_msgSend(*((id *)this + 3), "setVertexBytes:length:atIndex:", v199, 96, 0);
        objc_msgSend(*((id *)this + 3), "setVertexBytes:length:atIndex:", &v181, v158, 1);
        objc_msgSend(*((id *)this + 3), "drawPrimitives:vertexStart:vertexCount:", 3, 0, 6);
        objc_msgSend(*((id *)this + 3), "endEncoding");
LABEL_196:
        (*(void (**)(GLDLibrary *))(*(_QWORD *)v165 + 24))(v165);
        objc_autoreleasePoolPop(contexta);
        a6 &= v159;
        if (!a6)
          return 1;
        continue;
      }
      v104 = (void *)objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
      if (v75 == 9)
      {
        v108 = (void *)objc_msgSend(*((id *)this + 5), "blitCommandEncoder");
        objc_msgSend(v108, "setLabel:", *MEMORY[0x24BDDD9C0]);
        memset(v176, 0, sizeof(v176));
        v109 = *(unsigned __int16 *)(v163 + 180);
        v175[0] = *(unsigned __int16 *)(v163 + 178);
        v175[1] = v109;
        v175[2] = 1;
        memset(v174, 0, sizeof(v174));
        objc_msgSend(v108, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v84, v81, v80, v176, v175, v88, 0, 0, v174, 0x20000000);
        objc_msgSend(v108, "endEncoding");
        v153 = (GLRResource *)*((_QWORD *)this + 536);
        if (v153)
        {
          v110 = (void *)objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 13, *(unsigned __int16 *)(v152 + 178), *(unsigned __int16 *)(v152 + 180), 0);
          objc_msgSend(v110, "setUsage:", 5);
          v111 = (void *)objc_msgSend(*(id *)(*((_QWORD *)this + 11) + 232), "newTextureWithDescriptor:", v110);
          v112 = v111;
          if (v111
            && (objc_msgSend(v111, "setLabel:", *MEMORY[0x24BDDD9C0]),
                GLDObject::operator new((GLDObject *)0x40),
                v114 = v113,
                GLRTextureResource::GLRTextureResource(v113),
                v114))
          {
            GLRTextureResource::initWithMetalTexture(v114, v112, *((_QWORD *)v153 + 3));

            GLRResourceList::addResource(*((_QWORD *)this + 8), (uint64_t)v165);
            GLRResourceList::addResource(*((_QWORD *)this + 8), (uint64_t)v114);
            v115 = (void *)objc_msgSend((id)objc_msgSend(v104, "colorAttachments"), "objectAtIndexedSubscript:", 0);
            objc_msgSend(v115, "setTexture:", *((_QWORD *)v114 + 4));
            objc_msgSend(v115, "setLevel:", 0);
            objc_msgSend(v115, "setSlice:", 0);
            objc_msgSend(v115, "setDepthPlane:", 0);
            objc_msgSend(v115, "setLoadAction:", 0);
            objc_msgSend(v115, "setStoreAction:", 1);
            objc_msgSend(v115, "setYInvert:", v154[1]);
            v116 = *((_QWORD *)this + 646);
            if (v151 <= v116)
              v117 = *((_QWORD *)this + 646);
            else
              v117 = v151;
            v118 = *((_QWORD *)this + 648) + v116;
            if (v117 + v150 <= v118)
              v119 = v150;
            else
              v119 = v118 - v117;
            v120 = *((_QWORD *)this + 647);
            if (v149 <= v120)
              v121 = *((_QWORD *)this + 647);
            else
              v121 = v149;
            v122 = *((_QWORD *)this + 649) + v120;
            if (v121 + v148 <= v122)
              v123 = v148;
            else
              v123 = v122 - v121;
            v124 = (void *)objc_msgSend(*((id *)this + 5), "renderCommandEncoderWithDescriptor:", v104);
            *((_QWORD *)this + 3) = v124;
            objc_msgSend(v124, "setLabel:", *MEMORY[0x24BDDD9C0]);
            objc_msgSend(*((id *)this + 3), "setRenderPipelineState:", BlitPipelineStateFromDescriptor);
            objc_msgSend(*((id *)this + 3), "setFragmentTexture:atIndex:", v88, 0);
            if ((unint64_t)objc_msgSend(v84, "sampleCount") <= 1)
              objc_msgSend(*((id *)this + 3), "setFragmentSamplerState:atIndex:", BlitFramebufferSampler, 0);
            v125 = (void *)*((_QWORD *)this + 3);
            v126 = *((_OWORD *)this + 324);
            v173[0] = *v156;
            v173[1] = v126;
            objc_msgSend(v125, "setScissorRect:", v173);
            GLRResourceList::addResource(*((_QWORD *)this + 8), (uint64_t)v165);
            objc_msgSend(*((id *)this + 3), "setViewportTransformEnabled:", 0);
            objc_msgSend(*((id *)this + 3), "setVertexBytes:length:atIndex:", v199, 96, 0);
            objc_msgSend(*((id *)this + 3), "setVertexBytes:length:atIndex:", &v181, v158, 1);
            objc_msgSend(*((id *)this + 3), "drawPrimitives:vertexStart:vertexCount:", 3, 0, 6);
            objc_msgSend(*((id *)this + 3), "endEncoding");
            GLRResourceList::addResource(*((_QWORD *)this + 8), (uint64_t)v114);
            GLRResourceList::addResource(*((_QWORD *)this + 8), (uint64_t)v153);
            v127 = *(unsigned int *)(v152 + 148);
            v128 = *(unsigned int *)(v152 + 152);
            v129 = (void *)objc_msgSend(*((id *)this + 5), "blitCommandEncoder");
            objc_msgSend(v129, "setLabel:", *MEMORY[0x24BDDD9C0]);
            v130 = *((_QWORD *)v114 + 4);
            v172[0] = v117;
            v172[1] = v121;
            v172[2] = 0;
            v171[0] = v119;
            v171[1] = v123;
            v171[2] = 1;
            v131 = *((_QWORD *)v153 + 4);
            v132 = *((unsigned int *)this + 1103);
            v170[0] = v117;
            v170[1] = v121;
            v170[2] = v132;
            objc_msgSend(v129, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v130, 0, 0, v172, v171, v131, v127, v128, v170, 0x20000000);
            objc_msgSend(v129, "endEncoding");
            (*(void (**)(GLDLibrary *))(*(_QWORD *)v114 + 24))(v114);
          }
          else
          {

          }
        }
        goto LABEL_196;
      }
      v133 = 0;
      v134 = -32;
      v135 = (uint64_t *)((char *)this + 4216);
      while (2)
      {
        v136 = (void *)objc_msgSend((id)objc_msgSend(v104, "colorAttachments"), "objectAtIndexedSubscript:", v133);
        v137 = (GLDTextureRec *)*(v135 - 10);
        if (v137)
        {
          v138 = GLDTextureRec::getTextureResource(v137, 0);
          if (v138)
            goto LABEL_184;
LABEL_186:
          v139 = objc_msgSend(v136, "setTexture:", 0);
        }
        else
        {
          v138 = *v135;
          if (!*v135)
            goto LABEL_186;
LABEL_184:
          GLRResourceList::addResource(*((_QWORD *)this + 8), v138);
          objc_msgSend(v136, "setTexture:", *(_QWORD *)(v138 + 32));
          objc_msgSend(v136, "setLevel:", *(unsigned int *)&v168[v134 - 208]);
          objc_msgSend(v136, "setSlice:", *(unsigned int *)&v168[v134 - 248]);
          objc_msgSend(v136, "setDepthPlane:", *(unsigned int *)&v168[v134 - 168]);
          objc_msgSend(v136, "setLoadAction:", 1);
          objc_msgSend(v136, "setStoreAction:", 1);
          v139 = objc_msgSend(v136, "setYInvert:", v168[v133]);
        }
        v140 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 50) + 40) + 8 * v133);
        if (v140 && *(_QWORD *)(v140 + 184))
        {
          v141 = (void *)MEMORY[0x2348CF1D8](v139);
          v142 = (id)objc_msgSend(*((id *)this + 5), "blitCommandEncoder");
          objc_autoreleasePoolPop(v141);
          objc_msgSend(v142, "setLabel:", *MEMORY[0x24BDDD9C0]);
          GLDTextureRec::blitAccum(v140, v142, *((_QWORD *)this + 8));
          objc_msgSend(v142, "endEncoding");

        }
        ++v133;
        ++v135;
        v134 += 4;
        if (v133 == 8)
        {
          DepthStencilStateFromDescriptor = 0;
          goto LABEL_193;
        }
        continue;
      }
    }
    break;
  }
  NSLog(CFSTR("bad bits in blit_mask"));
  objc_autoreleasePoolPop(contexta);
  return 1;
}

void sub_2310652D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  void *v30;

  GLDObject::operator delete(v30);
  _Unwind_Resume(a1);
}

uint64_t gldReadFramebufferData(GLDContextRec *this, int a2, int a3, unsigned int a4, unsigned int a5, int a6, int a7, uint64_t a8, int a9, GLDBufferRec *a10)
{
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  uint64_t result;
  GLDFramebufferRec *v26;
  GLDTextureRec *v27;
  unint64_t v28;
  _DWORD *v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  int v38;
  int v39;
  void *v40;
  id v41;
  int v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  signed int v46;
  uint64_t v47;
  signed int v48;
  uint64_t v49;
  GLRResource *TextureResource;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  uint64_t v68;
  int v69;
  int v70;
  _QWORD v71[7];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  int v80;
  _QWORD v81[3];

  *((_QWORD *)this + 53) |= 0x4000uLL;
  if (!a10)
  {
    v70 = a3;
    v64 = a8;
    v67 = 0;
    v81[0] = 0;
    v80 = 0;
    v21 = *((_QWORD *)this + 13);
    v22 = 8;
    if (a6 > 34040)
    {
      if (a6 == 34041)
        goto LABEL_25;
      v23 = 35056;
    }
    else
    {
      if (a6 == 6401)
      {
        v22 = 9;
        v67 = 1;
LABEL_25:
        v69 = a6;
        v26 = (GLDFramebufferRec *)*((_QWORD *)this + 51);
        v27 = *(GLDTextureRec **)(*((_QWORD *)v26 + 5) + 8 * v22);
        v28 = *((_QWORD *)v27 + 11);
        if (v28 <= 7)
        {
          v29 = (_DWORD *)(*((_QWORD *)v26 + 4) + 16 * v22);
          v30 = v29[1];
          v68 = v29[2];
          v31 = v29[3];
          v32 = 1 << v28;
          v33 = 1 << v28;
          v34 = (v33 & 0x4A) == 0;
          if ((v33 & 0x4A) != 0)
            LODWORD(v35) = 0;
          else
            LODWORD(v35) = v31;
          if (v34)
            v36 = v30;
          else
            v36 = v31;
          if ((v32 & 0x95) != 0)
            v35 = v31;
          else
            v35 = v35;
          v62 = v35;
          if ((v32 & 0x95) != 0)
            v37 = 0;
          else
            v37 = v36;
          v63 = v37;
          if (*((_QWORD *)v27 + 23))
          {
            v61 = v21;
            if (*((_DWORD *)this + 1151))
              GLDContextRec::beginRenderPass(this);
            v38 = a7;
            if (*((_QWORD *)this + 2))
              GLDContextRec::endRenderPass(this);
            v39 = a2;
            if (!*((_QWORD *)this + 5))
              GLDContextRec::getCommandBuffer(this);
            v40 = (void *)MEMORY[0x2348CF1D8]();
            v41 = (id)objc_msgSend(*((id *)this + 5), "blitCommandEncoder");
            objc_autoreleasePoolPop(v40);
            objc_msgSend(v41, "setLabel:", *MEMORY[0x24BDDD9C0]);
            GLDTextureRec::blitAccum((uint64_t)v27, v41, *((_QWORD *)this + 8));
            objc_msgSend(v41, "endEncoding");

            v26 = (GLDFramebufferRec *)*((_QWORD *)this + 51);
            a2 = v39;
            a7 = v38;
            v21 = v61;
          }
          if (GLDContextRec::drawableInvertFramebuffer(this, v26))
            v42 = 1;
          else
            v42 = GLDContextRec::drawablePBEInvert(this, *((GLDFramebufferRec **)this + 51), v22);
          v43 = *((_QWORD *)v27 + 6);
          if (a9 == 2)
            v44 = 0;
          else
            v44 = (int *)(v21 + 16176);
          glrPixelSettings(v69, a7, a4, a5, (int *)v81 + 1, v81, &v80, v44, 3);
          v45 = v43 + 480 * v30 + 32 * v68;
          v46 = *(unsigned __int16 *)(v45 + 270);
          if ((int)(a5 + v70) <= v46)
            v47 = a5;
          else
            v47 = (v46 - v70);
          v48 = *(unsigned __int16 *)(v45 + 268);
          v66 = a2;
          if ((int)(a4 + a2) <= v48)
            v49 = a4;
          else
            v49 = (v48 - a2);
          if ((int)v49 < 1 || (int)v47 < 1)
            return 1;
          v60 = v42;
          v59 = v80;
          GLDContextRec::flushContext((id *)this);
          TextureResource = (GLRResource *)GLDTextureRec::getTextureResource(v27, v67);
          GLDContextRec::finishResource((id *)this, TextureResource);
          v52 = *((_DWORD *)v27 + v67 + 16);
          v79 = 0;
          v77 = 0u;
          v78 = 0u;
          v76 = 0u;
          MTLPixelFormatGetInfo();
          v53 = malloc_type_malloc(0, 0xC9E9578uLL);
          if (v53)
          {
            v54 = v53;
            v65 = v64 + v59;
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            HIDWORD(v74) = v49;
            LODWORD(v75) = v47;
            v55 = v53;
            if (!v60)
              v55 = v53;
            v71[6] = v55;
            DWORD2(v72) = 0;
            glgConvertType();
            DWORD1(v74) = (&glrTextureFormats)[5 * v52 + 2];
            DWORD2(v74) = -1;
            *(_QWORD *)&v72 = v65;
            DWORD1(v73) = HIDWORD(v81[0]);
            glgConvertType();
            if (v60)
              v56 = *(unsigned __int16 *)(v45 + 270) - v70 - v47;
            else
              v56 = v70;
            v57 = v56;
            v58 = *(void **)(GLDTextureRec::getTextureResource(v27, v67) + 32);
            v71[0] = v66;
            v71[1] = v57;
            v71[2] = v62;
            v71[3] = v49;
            v71[4] = v47;
            v71[5] = 1;
            objc_msgSend(v58, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v54, 0, 0, v71, v68, v63);
            glgProcessPixelsWithProcessor();
            free(v54);
            return 0;
          }
          GLDTextureRec::getTextureResource(v27, v67);
          MTLReleaseAssertionFailure();
        }
        MTLReleaseAssertionFailure();
        JUMPOUT(0x231065888);
      }
      v23 = 6402;
    }
    if (a6 == v23)
      goto LABEL_25;
LABEL_23:
    v67 = 0;
    v22 = *(unsigned __int16 *)(*(_QWORD *)(*((_QWORD *)this + 51) + 32) + 176) - 36064;
    goto LABEL_25;
  }
  v18 = **((_DWORD **)a10 + 4);
  if (v18)
  {
    v19 = *((_QWORD *)this + 11);
    if (!*(_DWORD *)(v19 + 248)
      || (pthread_mutex_lock((pthread_mutex_t *)(v19 + 256)), (v18 = **((_DWORD **)a10 + 4)) != 0))
    {
      if (!GLDBufferRec::update(a10, v18))
      {
        v20 = 0;
LABEL_16:
        v24 = *((_QWORD *)this + 11);
        if (*(_DWORD *)(v24 + 248))
          pthread_mutex_unlock((pthread_mutex_t *)(v24 + 256));
        if (!v20)
          return 0;
        goto LABEL_19;
      }
      **((_DWORD **)a10 + 4) = 0;
    }
    v20 = 1;
    goto LABEL_16;
  }
LABEL_19:
  v81[0] = 0;
  result = 0;
  v80 = 0;
  if ((a6 - 6401) >= 2 && a6 != 34041 && a6 != 35056)
  {
    v70 = a3;
    v64 = a8;
    v21 = *((_QWORD *)this + 13);
    goto LABEL_23;
  }
  return result;
}

uint64_t GLRPixelFormat::create(GLRPixelFormat *this, unsigned int *a2, const int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8[3];
  uint64_t v9;

  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v4 = GLRPixelFormat::preflight((uint64_t)v8, (int *)a2);
  v5 = 0;
  *(_DWORD *)this = v4;
  if (!v4)
  {
    GLDObject::operator new((GLDObject *)0x78);
    v5 = v6;
    GLRPixelFormat::GLRPixelFormat(v6, v8);
  }
  return v5;
}

void sub_2310658F0(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLRPixelFormat::preflight(uint64_t a1, int *a2)
{
  _WORD *v4;
  unsigned int AllDisplayMask;
  unsigned int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int *v12;
  int v13;
  uint64_t v14;
  int *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  __int16 v23;
  unsigned int v24;

  *(_QWORD *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_23106B8F0;
  *(_QWORD *)(a1 + 24) = 0x180000000;
  *(_DWORD *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 38) = 0;
  v4 = (_WORD *)(a1 + 38);
  *(_DWORD *)(a1 + 45) = 0;
  AllDisplayMask = GLDLibrary::getAllDisplayMask((GLDLibrary *)g_Library);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  *(_DWORD *)(a1 + 52) = AllDisplayMask;
  v12 = a2;
  while (2)
  {
    v13 = *v12;
    if (*v12)
    {
      v14 = 0;
      v15 = v12 + 1;
      switch(v13)
      {
        case '3':
        case 'L':
        case 'M':
        case 'P':
        case 'Z':
          goto LABEL_38;
        case '4':
          v11 = 1;
          goto LABEL_38;
        case '5':
          v9 = 1;
          goto LABEL_38;
        case '6':
        case '9':
          return v14;
        case '7':
          v16 = *v15;
          if (*v15 < 0)
            return 10008;
          v15 = v12 + 2;
          *(_WORD *)(a1 + 40) = v16;
          goto LABEL_38;
        case '8':
          v17 = *v15;
          if (*v15 < 0)
            return 10008;
          v15 = v12 + 2;
          *(_WORD *)(a1 + 42) = v17;
LABEL_38:
          v12 = v15;
          if ((char *)v15 - (char *)a2 <= 192)
            continue;
          v14 = 10000;
          break;
        case ':':
          v7 = 1;
          goto LABEL_38;
        case ';':
          *(_DWORD *)(a1 + 44) = 2;
          goto LABEL_38;
        case '<':
          *(_DWORD *)(a1 + 44) = 1;
          goto LABEL_38;
        case '=':
          *(_BYTE *)(a1 + 48) = 1;
          goto LABEL_38;
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'Q':
        case 'R':
        case 'S':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
LABEL_17:
          v15 = v12 + 49;
          goto LABEL_38;
        case 'T':
          v15 = v12 + 2;
          AllDisplayMask &= v12[1];
          *(_DWORD *)(a1 + 52) = AllDisplayMask;
          goto LABEL_38;
        default:
          switch(v13)
          {
            case 3:
            case 5:
              *(_DWORD *)(a1 + 16) |= 8u;
              goto LABEL_38;
            case 4:
              v10 = 1;
              goto LABEL_38;
            case 6:
              return v14;
            case 7:
              v18 = v12[1];
              if (v18 < 0)
                return 10008;
              if (v18)
                return 0;
              v15 = v12 + 2;
              *v4 = 0;
              goto LABEL_38;
            case 8:
              v6 = *v15;
              if (*v15 < 0)
                return 10008;
              if (v6 > 0x80)
                return 0;
              goto LABEL_37;
            case 11:
              if (*v15 < 0)
                return 10008;
              if (*v15 > 0x20)
                return 0;
              goto LABEL_37;
            case 12:
              v19 = v12[1];
              if (v19 < 0)
                return 10008;
              v15 = v12 + 2;
              if (v19)
                *(_DWORD *)(a1 + 28) = 4096;
              goto LABEL_38;
            case 13:
              v20 = v12[1];
              if ((v20 & 0x80000000) != 0)
                return 10008;
              if (v20 > 8)
                return 0;
              v15 = v12 + 2;
              if (v20)
                *(_DWORD *)(a1 + 32) = 128;
              goto LABEL_38;
            case 14:
              v8 = *v15;
              if (*v15 < 0)
                return 10008;
              if (v8 > 0x100)
                return 0;
LABEL_37:
              v15 = v12 + 2;
              break;
            default:
              goto LABEL_17;
          }
          goto LABEL_38;
      }
    }
    else
    {
      if (v9)
      {
        if (!v10)
          return 0;
      }
      else
      {
        v14 = 0;
        if (!AllDisplayMask || !v10)
          return v14;
      }
      do
      {
        v21 = AllDisplayMask;
        AllDisplayMask >>= 1;
      }
      while ((v21 & 1) == 0);
      if (v21 != 1)
        *(_DWORD *)(a1 + 12) |= 0x200u;
      *(_QWORD *)a1 = 0;
      if (*(_WORD *)(a1 + 40))
      {
        v22 = *(__int16 *)(a1 + 42);
        if (v22 < 10)
        {
          if (v22 < 5)
            v23 = 4;
          else
            v23 = 9;
        }
        else
        {
          v23 = 16;
        }
        *(_WORD *)(a1 + 42) = v23;
      }
      else
      {
        *(_WORD *)(a1 + 42) = 0;
        *(_DWORD *)(a1 + 44) = 0;
        *(_BYTE *)(a1 + 48) = 0;
      }
      if (v8)
        v24 = 0x8000000;
      else
        v24 = 0x80000000;
      *(_DWORD *)(a1 + 24) = v24;
      if (v7)
      {
        v14 = 0;
        *(_DWORD *)(a1 + 20) = 0x8000000;
      }
      else if (v6 == 16 && v9 && !v11)
      {
        v14 = 0;
        *(_DWORD *)(a1 + 20) = 1024;
        *(_DWORD *)(a1 + 12) &= 0xFFFFDFFE;
      }
      else
      {
        v14 = 0;
        *(_DWORD *)(a1 + 20) = 0x8000;
      }
    }
    return v14;
  }
}

BOOL GLRPixelFormat::validate(GLRPixelFormat *this)
{
  int v1;

  v1 = *((_DWORD *)this + 21);
  return (v1 == 0x8000000 || v1 == 0x8000 || v1 == 1024 && (*((_BYTE *)this + 76) & 4) != 0)
      && (*((_DWORD *)this + 20) & 0xFFFFFFF2) == 0
      && (*((_DWORD *)this + 24) & 0xFFFFFF7E) == 0
      && *((_WORD *)this + 51) == 0;
}

BOOL GLDContextRec::updateUniformBuffers(GLDContextRec *this)
{
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  GLDBufferRec *v8;
  int v9;

  v2 = 0;
  v3 = 0;
  do
  {
    v4 = *(_QWORD *)(*((_QWORD *)this + 14) + 8 * v2 + 328);
    if (v4)
    {
      v5 = *(unsigned int *)(*(_QWORD *)(v4 + 24) + 60);
      if ((_DWORD)v5)
      {
        v6 = 0;
        v7 = 4 * v5;
        do
        {
          v8 = *(GLDBufferRec **)(*((_QWORD *)this + 14) + 8 * *(unsigned int *)(*(_QWORD *)(v4 + 24) + v6 + 64) + 528);
          if (v8)
          {
            v9 = **((_DWORD **)v8 + 4);
            if (v9)
            {
              if (!GLDBufferRec::update(v8, v9))
                return v3;
              **((_DWORD **)v8 + 4) = 0;
            }
          }
          v6 += 4;
        }
        while (v7 != v6);
      }
    }
    v3 = v2++ > 3;
  }
  while (v2 != 5);
  return 1;
}

GLRBufferResource *GLDContextRec::updateUniformBindingsInternal(GLRBufferResource *this, unsigned int a2, unsigned int *a3, GLRBufferResource **a4, unint64_t *a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  unint64_t v11;
  _DWORD *v12;
  unsigned int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v6 = *((_QWORD *)this + a2 + 188);
  if (v6)
  {
    v7 = (uint64_t)this;
    v8 = *(unsigned int **)(*(_QWORD *)(*((_QWORD *)this + a2 + 183) + 24) + 64);
    if (v8)
    {
      v13 = *v8;
      v12 = v8 + 1;
      v11 = v13;
      if (v13)
      {
        v15 = 0;
        v20 = *((_QWORD *)this + 13) + 15784;
        v21 = *((_QWORD *)this + 14) + 528;
        do
        {
          v16 = *(unsigned int *)(*(_QWORD *)(v6 + 24) + 4 * v12[v15] + 64);
          v17 = *(_QWORD *)(v21 + 8 * v16);
          this = a4[v15];
          if (this)
          {
            this = (GLRBufferResource *)(*(uint64_t (**)(GLRBufferResource *))(*(_QWORD *)this + 24))(this);
            a4[v15] = 0;
            a5[v15] = 0;
          }
          if (v17)
          {
            v18 = *(_QWORD *)(v17 + 40);
            if (v18)
              this = *(GLRBufferResource **)(v18 + 24);
            else
              this = 0;
            a4[v15] = this;
            if (!*((_BYTE *)this + 32))
              goto LABEL_17;
            if (*(_DWORD *)(v7 + 4604))
              GLDContextRec::beginRenderPass((GLDContextRec *)v7);
            if (*(_QWORD *)(v7 + 16))
              GLDContextRec::endRenderPass((GLDContextRec *)v7);
            this = a4[v15];
            if (this)
LABEL_17:
              this = (GLRBufferResource *)(*(uint64_t (**)(GLRBufferResource *))(*(_QWORD *)this + 16))(this);
            *a3 |= 1 << v15;
            a5[v15] = *(_QWORD *)(v20 + 16 * v16);
          }
          ++v15;
        }
        while (v11 != v15);
      }
      for (; v11 < a6; v11 = (v11 + 1))
      {
        this = a4[v11];
        if (this)
        {
          this = (GLRBufferResource *)(*(uint64_t (**)(GLRBufferResource *))(*(_QWORD *)this + 24))(this);
          a4[v11] = 0;
        }
        *a3 |= 1 << v11;
      }
    }
  }
  return this;
}

GLRBufferResource *GLDContextRec::updateUniformBindings(GLDContextRec *this)
{
  GLRBufferResource *result;

  GLDContextRec::updateUniformBindingsInternal(this, 0, (unsigned int *)this + 852, (GLRBufferResource **)this + 359, (unint64_t *)this + 387, 0xCuLL);
  result = GLDContextRec::updateUniformBindingsInternal(this, 4u, (unsigned int *)this + 853, (GLRBufferResource **)this + 371, (unint64_t *)this + 399, 0xCuLL);
  *((_DWORD *)this + 618) |= 0x200u;
  return result;
}

uint64_t gldObjectPurgeable()
{
  return 35353;
}

uint64_t gldObjectUnpurgeable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  *a5 = 1;
  return 35353;
}

uint64_t GLRDataBufferManager::init(uint64_t this, GLDContextRec *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_QWORD *)(this + 272) = a3;
  *(_QWORD *)(this + 280) = a3;
  *(_QWORD *)(this + 288) = a4;
  *(_DWORD *)(this + 304) = 0;
  *(_QWORD *)(this + 344) = a2;
  *(_QWORD *)(this + 352) = a5;
  return this;
}

void *GLRDataBufferManager::getDataBufferSpace(GLRDataBufferManager *this, void *a2, unint64_t a3, _QWORD *a4, uint64_t *a5)
{
  uint64_t v9;
  void *result;
  unint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  unint64_t v14;

  v9 = *((_QWORD *)this + 41);
  v14 = *((_QWORD *)this + 42) - v9;
  result = (void *)*((_QWORD *)this + 39);
  if (v14 >= a3)
  {
    if (result)
    {
LABEL_8:
      *a5 = v9;
      v12 = *((_QWORD *)this + 41);
      *a4 = v12 - *((_QWORD *)this + 40);
      *((_QWORD *)this + 41) = v12 + a3;
      *((_QWORD *)this + 37) += a3;
      return result;
    }
  }
  else if (result)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN20GLRDataBufferManager18getDataBufferSpaceEPU27objcproto16MTLCommandBuffer11objc_objectmPmPPv_block_invoke;
    v13[3] = &unk_24FFED688;
    v13[4] = result;
    v13[5] = this;
    objc_msgSend(a2, "addCompletedHandler:", v13);
    *(_OWORD *)((char *)this + 312) = 0u;
    *(_OWORD *)((char *)this + 328) = 0u;
    v11 = *((_QWORD *)this + 34);
    if (v11 < *((_QWORD *)this + 36))
      *((_QWORD *)this + 34) = 2 * v11;
  }
  result = GLRDataBufferManager::allocDataBuffer(this, a3, &v14);
  *((_QWORD *)this + 39) = result;
  if (result)
  {
    v9 = objc_msgSend(result, "contents");
    *((_QWORD *)this + 40) = v9;
    *((_QWORD *)this + 41) = v9;
    *((_QWORD *)this + 42) = v14 + v9;
    result = (void *)*((_QWORD *)this + 39);
    if (result)
      goto LABEL_8;
  }
  return result;
}

void ___ZN20GLRDataBufferManager18getDataBufferSpaceEPU27objcproto16MTLCommandBuffer11objc_objectmPmPPv_block_invoke(uint64_t a1)
{
  GLRDataBufferManager::releaseDataBuffer(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

void *GLDContextRec::getIndexBuffer(void **this, int a2, unsigned int a3, unsigned __int8 *a4, unint64_t *a5, MTLIndexType *a6)
{
  MTLIndexType v10;
  unsigned int v11;
  size_t v12;
  void *DataBufferSpace;
  uint64_t v14;
  __int16 *v15;
  __int16 v16;
  int v17;
  _WORD *v19;
  __int16 v20;
  GLDContextRec *v21;
  unint64_t v22;
  void **v23;
  unint64_t *v24;
  void *__dst;

  v10 = MTLIndexTypeUInt16;
  v11 = 2;
  if (a2 != 5121 && a2 != 5123)
  {
    if (a2 != 5125)
    {
      MTLReleaseAssertionFailure();
      goto LABEL_23;
    }
    v11 = 4;
    v10 = MTLIndexTypeUInt32;
  }
  *a6 = v10;
  __dst = 0;
  v12 = v11 * (unint64_t)a3;
  DataBufferSpace = GLRDataBufferManager::getDataBufferSpace((GLRDataBufferManager *)(this + 659), this[5], (v12 + 15) & 0xFFFFFFFF0, a5, (uint64_t *)&__dst);
  if (!DataBufferSpace)
    return DataBufferSpace;
  if (a2 == 5125 || a2 == 5123)
  {
    memcpy(__dst, a4, v12);
    return DataBufferSpace;
  }
  if (a2 == 5121)
  {
    v14 = (int)a3;
    if (*((_BYTE *)this[13] + 15444))
    {
      if (a3)
      {
        v15 = (__int16 *)__dst;
        do
        {
          v17 = *a4++;
          v16 = v17;
          if (v17 == 255)
            v16 = -1;
          *v15++ = v16;
          --v14;
        }
        while (v14);
      }
    }
    else if (a3)
    {
      v19 = __dst;
      do
      {
        v20 = *a4++;
        *v19++ = v20;
        --v14;
      }
      while (v14);
    }
    return DataBufferSpace;
  }
LABEL_23:
  v21 = (GLDContextRec *)MTLReleaseAssertionFailure();
  return (void *)GLDContextRec::getVertexBuffer(v21, v22, v23, v24);
}

void *GLDContextRec::getVertexBuffer(void **this, uint64_t a2, void **a3, unint64_t *a4)
{
  return GLRDataBufferManager::getDataBufferSpace((GLRDataBufferManager *)(this + 659), this[5], (a2 + 15) & 0xFFFFFFFFFFFFFFF0, a4, (uint64_t *)a3);
}

void GLDContextRec::tfDirtyBuffers(GLDContextRec *this)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v2 = 0;
  v3 = (char *)this + 3400;
  do
  {
    v4 = *((_QWORD *)this + v2 + 383);
    if (v4 && !*(_BYTE *)(v4 + 32))
    {
      *(_BYTE *)(v4 + 32) = 1;
      v5 = (_QWORD *)*((_QWORD *)this + 424);
      v6 = *((_QWORD *)this + 425);
      if ((unint64_t)v5 >= v6)
      {
        v8 = *((_QWORD *)this + 423);
        v9 = ((uint64_t)v5 - v8) >> 3;
        if ((unint64_t)(v9 + 1) >> 61)
          abort();
        v10 = v6 - v8;
        v11 = v10 >> 2;
        if (v10 >> 2 <= (unint64_t)(v9 + 1))
          v11 = v9 + 1;
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
          v12 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v12 = v11;
        if (v12)
          v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<GLRBufferResource *>>((uint64_t)v3, v12);
        else
          v13 = 0;
        v14 = &v13[8 * v9];
        *(_QWORD *)v14 = v4;
        v7 = v14 + 8;
        v15 = (char *)*((_QWORD *)this + 424);
        v16 = (char *)*((_QWORD *)this + 423);
        if (v15 != v16)
        {
          do
          {
            v17 = *((_QWORD *)v15 - 1);
            v15 -= 8;
            *((_QWORD *)v14 - 1) = v17;
            v14 -= 8;
          }
          while (v15 != v16);
          v15 = (char *)*((_QWORD *)this + 423);
        }
        *((_QWORD *)this + 423) = v14;
        *((_QWORD *)this + 424) = v7;
        *((_QWORD *)this + 425) = &v13[8 * v12];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *v5 = v4;
        v7 = v5 + 1;
      }
      *((_QWORD *)this + 424) = v7;
    }
    ++v2;
  }
  while (v2 != 4);
}

uint64_t gldDrawPixels()
{
  return 1;
}

uint64_t gldBeginPrimitiveBuffer(GLDContextRec *this, unsigned int a2, int *a3)
{
  int v4;
  unint64_t v5;
  unsigned int v6;
  signed int v7;
  uint64_t v8;

  v4 = 12 * ((*a3 + 11) / 12);
  if (v4 <= 12)
    v4 = 12;
  v5 = *((_QWORD *)this + 257);
  v6 = 0x4000 / v5 - (unsigned __int16)(0x4000 / v5 - 12 * ((unsigned __int16)((10923 * (0x4000 / v5)) >> 16) >> 1));
  v7 = 12 * ((*((_QWORD *)this + 701) - *((_QWORD *)this + 700)) / v5 / 0xC);
  if (v7 > (int)v6)
    v6 = v7;
  if (v6 >= v4)
    v8 = v4;
  else
    v8 = v6;
  *a3 = v8;
  if (!*((_QWORD *)this + 2) || *((_DWORD *)this + 620) && (GLDContextRec::endRenderPass(this), !*((_QWORD *)this + 2)))
    GLDContextRec::beginRenderPass(this);
  if (*((_BYTE *)this + 5082))
  {
    *((_BYTE *)this + 5082) = 0;
    *((_DWORD *)this + 618) |= 8u;
  }
  GLDContextRec::setRenderState((uint64_t)this, 129022);
  *((_BYTE *)this + 3376) = GLDContextRec::isTransformFeedbackActive(this);
  *((_QWORD *)this + 625) = GLRDataBufferManager::getDataBufferSpace((GLDContextRec *)((char *)this + 5272), *((void **)this + 5), (*((_QWORD *)this + 257) * v8 + 15) & 0xFFFFFFFFFFFFFFF0, (_QWORD *)this + 626, (uint64_t *)this + 627);
  return *((_QWORD *)this + 627);
}

uint64_t gldEndPrimitiveBuffer(uint64_t result, unsigned int a2, int a3, signed int a4)
{
  int8x8_t *v6;
  int8x8_t *v7;
  char v8;
  __int32 v9;
  char *v10;
  unint64_t v11;
  _DWORD *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  __int32 *v19;
  char *v20;
  __int32 v21;
  unsigned int v22;
  __int32 v23;
  char *v24;
  unint64_t v25;
  _DWORD *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  __int32 *v33;
  char *v34;
  __int32 v35;
  _DWORD v36[3];

  v6 = (int8x8_t *)result;
  v7 = (int8x8_t *)(result + 5044);
  if (*(_BYTE *)(result + 5083)
    || !*(_QWORD *)(result + 2200)
    || (*(_BYTE *)(result + 376) & 0x70) != 0 && *(_BYTE *)(result + 5081))
  {
    if (!*(_BYTE *)(result + 3376))
    {
      ++*(_DWORD *)(result + 2264);
      return result;
    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  result = objc_msgSend(*(id *)(result + 16), "setVertexBuffer:offset:atIndex:", *(_QWORD *)(result + 5000), *(_QWORD *)(result + 5008), 15);
  v6[309].i32[0] |= 0x800u;
  v6[333].i32[1] = -1;
  v6[625] = 0;
  if ((v8 & 1) == 0 && ((v6[47].i8[0] & 1) == 0 || v6[276].i8[0] < 0))
  {
    if (v6[279].i8[0])
    {
      v9 = v6[283].i32[0];
      v10 = (char *)v6[285];
      v11 = (unint64_t)v6[286];
      if ((unint64_t)v10 >= v11)
      {
        v13 = (char *)v6[284];
        v14 = (v10 - v13) >> 2;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 62)
          goto LABEL_63;
        v16 = v11 - (_QWORD)v13;
        if (v16 >> 1 > v15)
          v15 = v16 >> 1;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
          v17 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
        {
          v18 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v6[286], v17);
          v10 = (char *)v6[285];
          v13 = (char *)v6[284];
        }
        else
        {
          v18 = 0;
        }
        v19 = (__int32 *)&v18[4 * v14];
        v20 = &v18[4 * v17];
        *v19 = v9;
        v12 = v19 + 1;
        while (v10 != v13)
        {
          v21 = *((_DWORD *)v10 - 1);
          v10 -= 4;
          *--v19 = v21;
        }
        v6[284] = (int8x8_t)v19;
        v6[285] = (int8x8_t)v12;
        v6[286] = (int8x8_t)v20;
        if (v13)
          operator delete(v13);
      }
      else
      {
        *(_DWORD *)v10 = v9;
        v12 = v10 + 4;
      }
      v6[285] = (int8x8_t)v12;
    }
    if (v6[37].i32[0])
      GLDContextRec::setRenderPrimitiveCurrents((GLDContextRec *)v6);
    result = objc_msgSend(*(id *)&v6[2], "drawPrimitives:vertexStart:vertexCount:", sPrimType[a3], 0, a4);
    v6[629] = vorr_s8(v6[629], *v7);
  }
  if (v6[422].i8[0])
  {
    v6[331].i8[4] = 1;
    v6[309].i32[0] |= 8u;
    GLDContextRec::setRenderState((uint64_t)v6, 129022);
    if (v6[37].i32[0])
      GLDContextRec::setRenderPrimitiveCurrents((GLDContextRec *)v6);
    v22 = vertexCountPerPrimitive(a3);
    v36[0] = 0;
    v36[1] = a4 / v22 * v22;
    v36[2] = v22 * *(_DWORD *)(*(_QWORD *)&v6[420] + 24);
    objc_msgSend(*(id *)&v6[2], "setVertexBytes:length:atIndex:", v36, 12, 31);
    if (!v6[279].i8[0])
      goto LABEL_54;
    v23 = v6[283].i32[0];
    v24 = (char *)v6[285];
    v25 = (unint64_t)v6[286];
    if ((unint64_t)v24 < v25)
    {
      *(_DWORD *)v24 = v23;
      v26 = v24 + 4;
LABEL_53:
      v6[285] = (int8x8_t)v26;
LABEL_54:
      if (v6[275])
        objc_msgSend(*(id *)&v6[2], "drawPrimitives:vertexStart:vertexCount:", sPrimType[a3], 0, a4);
      GLDContextRec::tfDirtyBuffers((GLDContextRec *)v6);
      result = GLDTransformFeedbackMachine::incrementPrimitiveCount((uint64_t)&v6[419], (GLDContextRec *)v6, a4, a3, 1);
      v6[331].i8[4] = 0;
      v6[309].i32[0] |= 8u;
      goto LABEL_57;
    }
    v27 = (char *)v6[284];
    v28 = (v24 - v27) >> 2;
    v29 = v28 + 1;
    if (!((unint64_t)(v28 + 1) >> 62))
    {
      v30 = v25 - (_QWORD)v27;
      if (v30 >> 1 > v29)
        v29 = v30 >> 1;
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL)
        v31 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v31 = v29;
      if (v31)
      {
        v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v6[286], v31);
        v24 = (char *)v6[285];
        v27 = (char *)v6[284];
      }
      else
      {
        v32 = 0;
      }
      v33 = (__int32 *)&v32[4 * v28];
      v34 = &v32[4 * v31];
      *v33 = v23;
      v26 = v33 + 1;
      while (v24 != v27)
      {
        v35 = *((_DWORD *)v24 - 1);
        v24 -= 4;
        *--v33 = v35;
      }
      v6[284] = (int8x8_t)v33;
      v6[285] = (int8x8_t)v26;
      v6[286] = (int8x8_t)v34;
      if (v27)
        operator delete(v27);
      goto LABEL_53;
    }
LABEL_63:
    abort();
  }
LABEL_57:
  if (v6[628].i32[0] > 0x7FFu
    || *(_QWORD *)(*(_QWORD *)&v6[8] + 152) >> 27 > 2uLL
    || *(_QWORD *)&v6[696] >= 0x400000uLL)
  {
    result = GLDContextRec::flushContext((id *)v6);
  }
  ++v6[283].i32[0];
  v6[631].i32[1] |= 0x2000000u;
  return result;
}

uint64_t gldBeginElementBuffer(GLDContextRec *a1)
{
  return 0;
}

void gldRenderVertexArray(int8x8_t *this, int a2, unsigned int a3, int a4, signed int a5, int a6, unsigned __int8 *a7, int a8, const void *a9)
{
  int8x8_t v9;
  int8x8_t *v11;
  __int128 v18;
  __int128 v19;
  unsigned int *v20;
  unint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  unsigned int *v32;
  unint64_t v33;
  uint64_t v34;
  _DWORD *v35;
  BOOL v36;
  int v37;
  unsigned int v38;
  __int32 v39;
  char *v40;
  unint64_t v41;
  _DWORD *v42;
  void *IndexBuffer;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  __int32 *v52;
  char *v53;
  __int32 v54;
  GLDContextRec *v55;
  int v56;
  unint64_t v57;
  MTLIndexType v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  int8x8_t v64;

  v9 = this[49];
  if (!*(_QWORD *)&v9)
    return;
  v11 = (int8x8_t *)((char *)this + 5044);
  if (this[635].i8[3] || (this[47].i8[0] & 0x70) != 0 && this[635].i8[1])
    return;
  if (!a2)
  {
    if (!*(_QWORD *)&this[2]
      || this[310].i32[0] && (GLDContextRec::endRenderPass((GLDContextRec *)this), !*(_QWORD *)&this[2]))
    {
      GLDContextRec::beginRenderPass((GLDContextRec *)this);
    }
    if (!v11[4].i8[6])
    {
      v11[4].i8[6] = 1;
      this[309].i32[0] |= 8u;
    }
    v30 = *(_OWORD *)this[234].i8;
    v31 = *(_OWORD *)this[238].i8;
    v62 = *(_OWORD *)this[236].i8;
    v63 = v31;
    v64 = this[240];
    v60 = *(_OWORD *)this[232].i8;
    v61 = v30;
    v32 = *(unsigned int **)(*(_QWORD *)(*(_QWORD *)&this[183] + 24) + 56);
    v33 = *v32;
    if ((_DWORD)v33)
    {
      v34 = 0;
      v35 = v32 + 3;
      v36 = 1;
      while (1)
      {
        v37 = (*(v35 - 1) >> 8) & 0x1F;
        if ((v37 - 17) >= 2)
        {
          if (v37 != 28)
          {
LABEL_105:
            MTLReleaseAssertionFailure();
LABEL_106:
            abort();
          }
          if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)&this[49] + 48) + 24 * (*v35 & 0x3F)) & 3) != *((_DWORD *)&v60 + v34) >> 30)
            goto LABEL_34;
        }
        v36 = ++v34 < v33;
        v35 += 2;
        if (v33 == v34)
        {
LABEL_34:
          if (v36)
            this[309].i32[0] |= 1u;
          break;
        }
      }
    }
    if (GLDContextRec::isTransformFeedbackActive((GLDContextRec *)this))
    {
      this[331].i8[4] = 1;
      this[309].i32[0] |= 8u;
      GLDContextRec::setRenderState((uint64_t)this, 131069);
      if (this[34].i32[1])
        GLDContextRec::setRenderVertexCurrents((GLDContextRec *)this);
      v38 = vertexCountPerPrimitive(a3);
      LODWORD(v58) = a4;
      HIDWORD(v58) = a5 / v38 * v38;
      v59 = v38 * *(_DWORD *)(*(_QWORD *)&this[420] + 24);
      objc_msgSend(*(id *)&this[2], "setVertexBytes:length:atIndex:", &v58, 12, 31);
      if (this[279].i8[0])
      {
        v39 = this[283].i32[0];
        v40 = (char *)this[285];
        v41 = (unint64_t)this[286];
        if ((unint64_t)v40 >= v41)
        {
          v46 = (char *)this[284];
          v47 = (v40 - v46) >> 2;
          v48 = v47 + 1;
          if ((unint64_t)(v47 + 1) >> 62)
            goto LABEL_106;
          v49 = v41 - (_QWORD)v46;
          if (v49 >> 1 > v48)
            v48 = v49 >> 1;
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL)
            v50 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v50 = v48;
          if (v50)
          {
            v51 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&this[286], v50);
            v40 = (char *)this[285];
            v46 = (char *)this[284];
          }
          else
          {
            v51 = 0;
          }
          v52 = (__int32 *)&v51[4 * v47];
          v53 = &v51[4 * v50];
          *v52 = v39;
          v42 = v52 + 1;
          while (v40 != v46)
          {
            v54 = *((_DWORD *)v40 - 1);
            v40 -= 4;
            *--v52 = v54;
          }
          this[284] = (int8x8_t)v52;
          this[285] = (int8x8_t)v42;
          this[286] = (int8x8_t)v53;
          if (v46)
            operator delete(v46);
        }
        else
        {
          *(_DWORD *)v40 = v39;
          v42 = v40 + 4;
        }
        this[285] = (int8x8_t)v42;
      }
      if (this[275])
        objc_msgSend(*(id *)&this[2], "drawPrimitives:vertexStart:vertexCount:instanceCount:", sPrimType[a3], a4, a5, a8);
      ++this[628].i32[0];
      GLDContextRec::tfDirtyBuffers((GLDContextRec *)this);
      GLDTransformFeedbackMachine::incrementPrimitiveCount((uint64_t)&this[419], (GLDContextRec *)this, a5, a3, a8);
      this[331].i8[4] = 0;
      this[309].i32[0] |= 8u;
    }
    if (*(_BYTE *)(*(_QWORD *)&this[13] + 15712))
      goto LABEL_100;
    GLDContextRec::setRenderState((uint64_t)this, 131069);
    if (this[34].i32[1])
      GLDContextRec::setRenderVertexCurrents((GLDContextRec *)this);
    if (!*(_QWORD *)&this[275] || (this[47].i8[0] & 1) != 0 && (this[276].i8[0] & 0x80) == 0)
      goto LABEL_100;
    GLDContextRec::recordGLDrawCallIndexForMetalDrawCall((GLDContextRec *)this, this[283].i32[0]);
    objc_msgSend(*(id *)&this[2], "drawPrimitives:vertexStart:vertexCount:instanceCount:", sPrimType[a3], a4, a5, a8);
    goto LABEL_99;
  }
  if ((a2 & 0xFFFFFFFD) != 1)
    return;
  v18 = *(_OWORD *)this[234].i8;
  v19 = *(_OWORD *)this[238].i8;
  v62 = *(_OWORD *)this[236].i8;
  v63 = v19;
  v64 = this[240];
  v60 = *(_OWORD *)this[232].i8;
  v61 = v18;
  v20 = *(unsigned int **)(*(_QWORD *)(*(_QWORD *)&this[183] + 24) + 56);
  v21 = *v20;
  if ((_DWORD)v21)
  {
    v22 = 0;
    v23 = v20 + 3;
    v24 = 1;
    do
    {
      v25 = (*(v23 - 1) >> 8) & 0x1F;
      if ((v25 - 17) >= 2)
      {
        if (v25 != 28)
          goto LABEL_105;
        if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)&v9 + 48) + 24 * (*v23 & 0x3F)) & 3) != *((_DWORD *)&v60 + v22) >> 30)
          break;
      }
      v24 = ++v22 < v21;
      v23 += 2;
    }
    while (v21 != v22);
    if (v24)
      this[309].i32[0] |= 1u;
  }
  if (a6 != 5121 && *(_BYTE *)(*(_QWORD *)&v9 + 64))
  {
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v9 + 56) + 256);
    v27 = *(_QWORD *)(v26 + 40);
    if (v27 && (v28 = *(_QWORD *)(v27 + 24)) != 0)
      v29 = *(_QWORD *)(v28 + 40);
    else
      v29 = 0;
    if (!*(_QWORD *)&this[2]
      || this[310].i32[0] && (GLDContextRec::endRenderPass((GLDContextRec *)this), !*(_QWORD *)&this[2]))
    {
      GLDContextRec::beginRenderPass((GLDContextRec *)this);
    }
    if (!v11[4].i8[6])
    {
      v11[4].i8[6] = 1;
      this[309].i32[0] |= 8u;
    }
    GLDContextRec::setRenderState((uint64_t)this, 131069);
    if (this[34].i32[1])
      GLDContextRec::setRenderVertexCurrents((GLDContextRec *)this);
    if (!*(_QWORD *)&this[275])
      goto LABEL_100;
    v44 = **(_QWORD **)(v26 + 24);
    if ((this[47].i8[0] & 1) != 0 && (this[276].i8[0] & 0x80) == 0)
      goto LABEL_100;
    GLDContextRec::recordGLDrawCallIndexForMetalDrawCall((GLDContextRec *)this, this[283].i32[0]);
    if (a6 == 5123)
    {
      v45 = 0;
    }
    else
    {
      if (a6 != 5125)
      {
        v55 = (GLDContextRec *)MTLReleaseAssertionFailure();
        GLDContextRec::recordGLDrawCallIndexForMetalDrawCall(v55, v56);
        return;
      }
      v45 = 1;
    }
    ((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, unsigned __int8 *, _QWORD))this[446])(*(_QWORD *)&this[2], *(_QWORD *)&this[445], sPrimType[a3], a5, v45, v29, &a7[-v44], a8);
LABEL_99:
    this[629] = vorr_s8(this[629], *v11);
    ++this[628].i32[0];
LABEL_100:
    if (this[628].i32[0] > 0x7FFu
      || *(_QWORD *)(*(_QWORD *)&this[8] + 152) >> 27 > 2uLL
      || *(_QWORD *)&this[696] >= 0x400000uLL)
    {
      GLDContextRec::flushContext((id *)this);
    }
    ++this[283].i32[0];
    return;
  }
  v57 = 0;
  v58 = MTLIndexTypeUInt16;
  if (!*(_QWORD *)&this[2]
    || this[310].i32[0] && (GLDContextRec::endRenderPass((GLDContextRec *)this), !*(_QWORD *)&this[2]))
  {
    GLDContextRec::beginRenderPass((GLDContextRec *)this);
  }
  IndexBuffer = GLDContextRec::getIndexBuffer((void **)this, a6, a5, a7, &v57, &v58);
  if (IndexBuffer)
  {
    if (!v11[4].i8[6])
    {
      v11[4].i8[6] = 1;
      this[309].i32[0] |= 8u;
    }
    GLDContextRec::setRenderState((uint64_t)this, 131069);
    if (this[34].i32[1])
      GLDContextRec::setRenderVertexCurrents((GLDContextRec *)this);
    if (*(_QWORD *)&this[275] && ((this[47].i8[0] & 1) == 0 || this[276].i8[0] < 0))
    {
      GLDContextRec::recordGLDrawCallIndexForMetalDrawCall((GLDContextRec *)this, this[283].i32[0]);
      ((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, MTLIndexType, void *, unint64_t, _QWORD))this[446])(*(_QWORD *)&this[2], *(_QWORD *)&this[445], sPrimType[a3], a5, v58, IndexBuffer, v57, a8);
      this[629] = vorr_s8(this[629], *v11);
      ++this[628].i32[0];
    }
    GLDContextRec::flushContextIfNeeded((intptr_t)this);
    ++this[283].i32[0];
  }
}

void GLDContextRec::recordGLDrawCallIndexForMetalDrawCall(GLDContextRec *this, int a2)
{
  char *v4;
  unint64_t v5;
  _DWORD *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;

  if (*((_BYTE *)this + 2232))
  {
    v4 = (char *)*((_QWORD *)this + 285);
    v5 = *((_QWORD *)this + 286);
    if ((unint64_t)v4 >= v5)
    {
      v7 = (char *)*((_QWORD *)this + 284);
      v8 = (v4 - v7) >> 2;
      v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 62)
        abort();
      v10 = v5 - (_QWORD)v7;
      if (v10 >> 1 > v9)
        v9 = v10 >> 1;
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
        v11 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v11 = v9;
      if (v11)
      {
        v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)this + 2288, v11);
        v4 = (char *)*((_QWORD *)this + 285);
        v7 = (char *)*((_QWORD *)this + 284);
      }
      else
      {
        v12 = 0;
      }
      v13 = &v12[4 * v8];
      v14 = &v12[4 * v11];
      *(_DWORD *)v13 = a2;
      v6 = v13 + 4;
      while (v4 != v7)
      {
        v15 = *((_DWORD *)v4 - 1);
        v4 -= 4;
        *((_DWORD *)v13 - 1) = v15;
        v13 -= 4;
      }
      *((_QWORD *)this + 284) = v13;
      *((_QWORD *)this + 285) = v6;
      *((_QWORD *)this + 286) = v14;
      if (v7)
        operator delete(v7);
    }
    else
    {
      *(_DWORD *)v4 = a2;
      v6 = v4 + 4;
    }
    *((_QWORD *)this + 285) = v6;
  }
}

uint64_t vertexCountPerPrimitive(int a1)
{
  GLDContextRec *v2;

  switch(a1)
  {
    case 0:
      return 1;
    case 4:
      return 3;
    case 1:
      return 2;
  }
  v2 = (GLDContextRec *)MTLReleaseAssertionFailure();
  return GLDContextRec::flushContextIfNeeded(v2);
}

intptr_t GLDContextRec::flushContextIfNeeded(intptr_t this)
{
  if (*(_DWORD *)(this + 5024) > 0x7FFu
    || *(_QWORD *)(*(_QWORD *)(this + 64) + 152) >> 27 > 2uLL
    || *(_QWORD *)(this + 5568) >= 0x400000uLL)
  {
    return GLDContextRec::flushContext((id *)this);
  }
  return this;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<GLRBufferResource *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a2);
}

uint64_t GLDContextRec::loadCurrentSamplers(uint64_t this, unsigned __int16 a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;

  v2 = *(_QWORD *)(this + 104);
  if (!*(_BYTE *)(v2 + 12724))
    return this;
  v3 = this;
  v4 = 0;
  v5 = a2;
  v14 = a2;
  do
  {
    if (!v5)
      goto LABEL_20;
    do
    {
      v6 = __clz(__rbit32(v5));
      v7 = v6 + 16 * v4;
      v8 = *(_QWORD *)(*(_QWORD *)(v3 + 112) + 8 * v7 + 720);
      if (!v8)
      {
        if (!*(_QWORD *)(v3 + 8 * v7 + 1208))
        {
          v8 = 0;
          goto LABEL_17;
        }
        v8 = 0;
        *(_DWORD *)(v3 + 4 * v7 + 1672) = 0;
        goto LABEL_16;
      }
      v9 = (_DWORD *)(v3 + 4 * v7 + 1672);
      v10 = *(_DWORD *)(v8 + 12);
      if (*v9 == v10)
        v11 = **(unsigned __int8 **)(v8 + 32);
      else
        v11 = 1;
      if (**(_BYTE **)(v8 + 32))
      {
        v12 = *(_QWORD *)(v3 + 88);
        v13 = *(_DWORD *)(v12 + 28) + 1;
        *(_DWORD *)(v12 + 28) = v13;
        *(_DWORD *)(v8 + 12) = v13;
        this = GLDSamplerRec::update((GLDSamplerRec *)v8);
        if ((_DWORD)this)
        {
          **(_BYTE **)(v8 + 32) = 0;
          v10 = *(_DWORD *)(v8 + 12);
          goto LABEL_11;
        }
        v8 = 0;
        *v9 = 0;
        if (!*(_QWORD *)(v3 + 8 * v7 + 1208))
          goto LABEL_17;
LABEL_16:
        *(_DWORD *)(v3 + 2472) |= 4u;
        *(_DWORD *)(v3 + 2644) |= 1 << (v6 + 16 * v4);
        goto LABEL_17;
      }
LABEL_11:
      *v9 = v10;
      if (v11)
        goto LABEL_16;
LABEL_17:
      *(_QWORD *)(v3 + 8 * v7 + 1208) = v8;
      v5 ^= 1 << v6;
    }
    while (v5);
    v2 = *(_QWORD *)(v3 + 104);
    v5 = v14;
LABEL_20:
    ++v4;
  }
  while (v4 < *(unsigned __int8 *)(v2 + 12724));
  return this;
}

void GLRRenderPipelineKey::init(GLRRenderPipelineKey *this)
{
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  memset_pattern16((char *)this + 88, &unk_23106B9B0, 0x10uLL);
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0xFFFFFFFFLL;
  *((_QWORD *)this + 14) = 0x180FF3F800000;
}

const void *GLRFunctionCache::getFunction(GLRFunctionCache *this, int a2)
{
  const void *ValueAtIndex;

  if (!a2)
    return 0;
  pthread_rwlock_rdlock((pthread_rwlock_t *)this);
  ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 27), (a2 - 1));
  pthread_rwlock_unlock((pthread_rwlock_t *)this);
  return ValueAtIndex;
}

uint64_t GLRFunctionCache::destroy(pthread_rwlock_t *this)
{
  const void *sig;
  const void *v3;
  const void *v4;

  sig = (const void *)this[1].__sig;
  if (sig)
    CFRelease(sig);
  v3 = *(const void **)this[1].__opaque;
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)&this[1].__opaque[8];
  if (v4)
    CFRelease(v4);
  return pthread_rwlock_destroy(this);
}

unint64_t GLRFunctionCache::getKey(pthread_rwlock_t *a1, void *a2)
{
  unint64_t v2;
  uint64_t v4;
  const __CFDictionary **opaque;
  const __CFDictionary *v6;
  void *value;

  v2 = (unint64_t)a2;
  if (!a2)
    return v2;
  v4 = objc_msgSend(a2, "functionType");
  if (v4 == 2)
  {
    opaque = (const __CFDictionary **)a1[1].__opaque;
  }
  else
  {
    if (v4 != 1)
      return 0;
    opaque = (const __CFDictionary **)&a1[1];
  }
  v6 = *opaque;
  if (!*opaque)
    return 0;
  pthread_rwlock_rdlock(a1);
  value = 0;
  if (CFDictionaryGetValueIfPresent(v6, (const void *)v2, (const void **)&value))
    v2 = value;
  else
    v2 = 0;
  pthread_rwlock_unlock(a1);
  return v2;
}

uint64_t _cachedFunctionHash(void *a1)
{
  return *(_QWORD *)objc_msgSend(a1, "bitCodeHash");
}

BOOL _renderPipelineKeyEqual(int8x16_t *a1, int8x16_t *a2)
{
  return vmaxvq_u32((uint32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(veorq_s8(a2[1], a1[1]), veorq_s8(*a2, *a1)), vorrq_s8(veorq_s8(a2[2], a1[2]), veorq_s8(a2[3], a1[3]))), vorrq_s8(vorrq_s8(veorq_s8(a2[4], a1[4]), veorq_s8(a2[5], a1[5])), veorq_s8(a2[6], a1[6]))), veorq_s8(a2[7], a1[7]))) == 0;
}

BOOL GLDContextRec::handleProcessingModeChange(GLDContextRec *this)
{
  int v1;
  int v2;
  int v3;

  v1 = *((_DWORD *)this + 95);
  v2 = v1 | 0x100100;
  if (*(_WORD *)(*((_QWORD *)this + 13) + 4) == 1)
    v2 = v1 | 0x100;
  if (*(_WORD *)(*((_QWORD *)this + 13) + 4))
    v1 = v2;
  v3 = *((_DWORD *)this + 96);
  if (v1 != (v3 & 0x300300))
    *((_DWORD *)this + 96) = v3 & 0xFFCFFCFF | v1;
  return v1 != (v3 & 0x300300);
}

uint64_t gldUpdateDispatch(GLDContextRec *this, int a2, unsigned int *a3, double a4, double a5, double a6, double a7, float a8, unsigned int *a9)
{
  uint64_t v11;
  int v12;
  unsigned __int16 v13;
  uint64_t v14;
  uint64_t i;
  unsigned int v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v11 = *((_QWORD *)this + 11);
  if (*(_DWORD *)(v11 + 248))
    pthread_mutex_lock((pthread_mutex_t *)(v11 + 256));
  *a3 |= *((_DWORD *)this + 453);
  *((_DWORD *)this + 453) = 0;
  if ((a3[1] & 0x80000000) != 0)
  {
    v12 = *(_DWORD *)(*((_QWORD *)this + 13) + 8);
    if ((v12 & 0x3FF) == 0)
      v12 = *(_DWORD *)(*((_QWORD *)this + 16) + 584) & 0x3FF;
    *((_DWORD *)this + 94) = v12;
    *((_DWORD *)this + 618) |= 8u;
  }
  if (*((_WORD *)a3 + 8))
    GLDContextRec::loadCurrentSamplers((uint64_t)this, *((_WORD *)a3 + 8));
  v13 = *((_WORD *)a3 + 2);
  if (v13)
  {
    if (*(_BYTE *)(*((_QWORD *)this + 11) + 440))
    {
      v14 = mach_absolute_time();
      GLDContextRec::loadCurrentTextures((uint64_t)this, v13, (const unint64_t *)(*((_QWORD *)this + 13) + 12704));
      *((_QWORD *)this + 632) += mach_absolute_time() - v14;
    }
    else
    {
      GLDContextRec::loadCurrentTextures((uint64_t)this, *((_WORD *)a3 + 2), (const unint64_t *)(*((_QWORD *)this + 13) + 12704));
    }
  }
  if (((*((_DWORD *)this + 660) | *((_DWORD *)this + 661)) & *((_DWORD *)this + 662)) != 0)
  {
    for (i = 0; i != 32; ++i)
    {
      if (((*((_DWORD *)this + 662) >> i) & 1) != 0)
        GLDTextureRec::setForceASTC_LP(*((GLDTextureRec **)this + i + 119), **(unsigned __int16 **)(*((_QWORD *)this + i + 151) + 24) != 9728);
    }
  }
  v16 = a3[3];
  if ((v16 & 0x80000000) != 0)
  {
    v17 = GLDContextRec::handleProcessingModeChange(this);
    v16 = a3[3];
    if (v17)
    {
      a3[3] = v16 | 0x8C40000;
      *((_DWORD *)this + 618) |= 0x10u;
      v16 = a3[3];
    }
  }
  if ((v16 & 0x1000) != 0)
  {
    GLDContextRec::loadCurrentVertexArray((uint64_t)this, a3);
    v16 = a3[3];
  }
  if ((v16 & 0x30440000) != 0)
  {
    GLDContextRec::loadCurrentPipelinePrograms((uint64_t)this, a3, (uint64_t)a3, a9);
    v16 = a3[3];
  }
  if ((v16 & 0x8800000) != 0)
  {
    a4 = NAN;
    *((_QWORD *)this + 330) = -1;
    *((_DWORD *)this + 618) |= 0x400u;
    v16 = a3[3];
  }
  if ((*((_BYTE *)this + 385) & 1) != 0)
    v18 = 4;
  else
    v18 = 5;
  if ((v16 & 0x10000000) != 0)
  {
    *((_DWORD *)this + 618) |= 0x400u;
    v16 = a3[3];
  }
  if ((v16 & 0x20000000) != 0)
    GLDContextRec::updateUniformBindings(this);
  v19 = *a3;
  if ((*a3 & 2) != 0)
  {
    GLDContextRec::updateRenderBlendState((uint64_t)this);
    v19 = *a3;
  }
  if ((v19 & 0x20400000) != 0)
  {
    *((_DWORD *)this + 618) |= 8u;
    *((_DWORD *)this + 621) |= 2u;
  }
  if (*((_BYTE *)a3 + 11))
    GLDContextRec::updateRenderClipPlanes((uint64_t)this);
  v20 = *a3;
  if ((*a3 & 4) != 0)
  {
    *((_DWORD *)this + 618) |= 0x1000u;
    v20 = *a3;
    if ((*a3 & 1) == 0)
    {
LABEL_42:
      if ((v20 & 0x20000) == 0)
        goto LABEL_43;
      goto LABEL_61;
    }
  }
  else if ((v20 & 1) == 0)
  {
    goto LABEL_42;
  }
  GLDContextRec::updateRenderAlphaTestState((uint64_t)this);
  v20 = *a3;
  if ((*a3 & 0x20000) == 0)
  {
LABEL_43:
    if ((v20 & 0x4000) == 0)
      goto LABEL_44;
    goto LABEL_62;
  }
LABEL_61:
  GLDContextRec::updateRenderLogicOpState((uint64_t)this);
  v20 = *a3;
  if ((*a3 & 0x4000) == 0)
  {
LABEL_44:
    if ((v20 & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_62:
  GLDContextRec::updateRenderLineMode((uint64_t)this);
  v20 = *a3;
  if ((*a3 & 0x800000) != 0)
  {
LABEL_45:
    GLDContextRec::updateRenderPolygonMode((uint64_t)this);
    v20 = *a3;
  }
LABEL_46:
  if ((v20 & 0x10800200) != 0)
    GLDContextRec::updateRenderDepthStencil((uint64_t)this);
  if ((a3[2] & 1) != 0)
    GLDContextRec::updateRenderViewport(this, a4, a5, a6, a7, a8);
  v21 = a3[1];
  if ((v21 & 0x80000) != 0)
  {
    GLDContextRec::updateRenderPrimitiveRestart((uint64_t)this);
    v21 = a3[1];
  }
  if ((v21 & 0x800000) != 0)
    GLDContextRec::loadCurrentQueries(this);
  v22 = *((_DWORD *)this + 618);
  if ((v22 & 0x40) != 0 || (*((_BYTE *)a3 + 6) & 0x80) != 0)
  {
    if ((*((_BYTE *)this + 5045) & 3) != 0)
    {
      v23 = *((_QWORD *)this + 272);
      if ((v23 & 0x10000000000) != 0)
      {
        v24 = 0;
LABEL_66:
        *((_QWORD *)this + 272) = v23 & 0xFFFFFEFFFFFFFFFFLL | v24;
        v22 |= 8u;
        *((_DWORD *)this + 618) = v22;
      }
    }
    else
    {
      v25 = *((_QWORD *)this + 599);
      v23 = *((_QWORD *)this + 272);
      if ((v25 == 0) != ((v23 >> 40) & 1))
      {
        v24 = (unint64_t)(v25 == 0) << 40;
        goto LABEL_66;
      }
    }
  }
  if (a3[3] & 0x40000 | v22 & 1 || (a3[1] & 0x80000000) != 0)
  {
    GLDContextRec::buildPrimitiveBufferVertexArrayDescriptor(this);
    *((_DWORD *)this + 618) |= 0x803u;
    v18 = v18 | 2;
  }
  v26 = *((_QWORD *)this + 11);
  if (*(_DWORD *)(v26 + 248))
    pthread_mutex_unlock((pthread_mutex_t *)(v26 + 256));
  return v18;
}

uint64_t GLDContextRec::flushResource(id *this, GLRResource *a2)
{
  if (*((_DWORD *)a2 + 3))
    GLDContextRec::flushContext(this);
  return 0;
}

uint64_t GLDContextRec::finishResource(id *this, GLRResource *a2)
{
  if (*((_DWORD *)a2 + 3))
    GLDContextRec::flushContext(this);
  (*(void (**)(GLRResource *, id))(*(_QWORD *)a2 + 40))(a2, this[11]);
  return 0;
}

uint64_t GLDContextRec::testResource(id *this, GLRResource *a2, unsigned int a3, int a4)
{
  if (a4 && *((_DWORD *)a2 + 3))
    GLDContextRec::flushContext(this);
  if (*((_DWORD *)a2 + 3))
    return 0;
  else
    return (*(uint64_t (**)(GLRResource *))(*(_QWORD *)a2 + 48))(a2);
}

BOOL GLDContextRec::testFence(id *this, GLDFenceRec *a2, int a3)
{
  if (GLDFenceRec::getStatus(a2) == 3)
    return 1;
  if (a3)
  {
    if (*((_DWORD *)a2 + 3))
      GLDContextRec::flushContext(this);
  }
  return GLDFenceRec::getStatus(a2) == 3;
}

uint64_t ___ZN13GLDContextRec20flushContextInternalEv_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  GLDDeviceRec::telemetryEmitBacktraceInfo(*(_QWORD *)(v1 + 96), (const void *)(v1 + 432));
  return GLDDeviceRec::telemetryEmitGPUWorkSubmitted(*(id **)(v1 + 96));
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

uint64_t ___ZN13GLDContextRec20flushContextInternalEv_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t *v10;

  v4 = *(_QWORD *)(a1 + 64);
  v5 = objc_msgSend(a2, "error");
  if (v5)
  {
    v6 = (void *)v5;
    NSLog(CFSTR("GLDRendererMetal command buffer completion error: %@"), v5);
    v5 = objc_msgSend(v6, "code");
    *(_QWORD *)(v4 + 6264) = v5;
    if (*(_BYTE *)(v4 + 6276))
    {
      *(_BYTE *)(v4 + 6276) = 0;
      dispatch_group_leave(*(dispatch_group_t *)(v4 + 5264));
      v5 = *(_QWORD *)(v4 + 6264);
    }
    if (v5 == 4)
      v7 = 2;
    else
      v7 = 1;
    *(_DWORD *)(v4 + 6272) = v7;
  }
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v8)
    GLRDataBufferManager::releaseDataBuffer(v4 + 5272, v8);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v9)
    GLRDataBufferManager::releaseDataBuffer(v4 + 5632, v9);
  v10 = *(uint64_t **)(a1 + 72);
  if (v10)
    GLDContextRec::dispatchCompletedBlocks(v5, (uint64_t)a2, v10);
  if (*(_BYTE *)(a1 + 88))
    GLDContextRec::signalQueryStamp((GLDContextRec *)v4, *(_QWORD *)(a1 + 80));
  if (GLRResourceList::makeResourcesNotBusyAndReset(*(GLRResourceList **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                       + 24)))
    GLDShareGroupRec::signalUsage(*(GLDShareGroupRec **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  return GLRResourceList::releaseToPool(*(GLRResourceList **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

uint64_t GLDContextRec::dispatchCompletedBlocks(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t result;

  if (a3)
  {
    v3 = a3;
    do
    {
      (*(void (**)(void))(v3[1] + 16))();
      _Block_release((const void *)v3[1]);
      v4 = (uint64_t *)*v3;
      result = MEMORY[0x2348CEF20](v3, 0xA0C40AFF93C70);
      v3 = v4;
    }
    while (v4);
  }
  return result;
}

uint64_t GLDContextRec::waitContext(dispatch_group_t *this)
{
  dispatch_group_wait(this[658], 0xFFFFFFFFFFFFFFFFLL);
  return (*((uint64_t (**)(dispatch_group_t, dispatch_group_t))this[9]->isa + 5))(this[9], this[11]);
}

uint64_t GLDContextRec::setFence(GLRResourceList **this, GLDFenceRec *a2)
{
  if (!this[5])
    GLDContextRec::getCommandBuffer((GLDContextRec *)this);
  *((_DWORD *)a2 + 8) = 0;
  *((_BYTE *)this + 5087) = 1;
  return GLRResourceList::addFence(this[8], a2);
}

void *GLDContextRec::addCompletionBlock(uint64_t a1, const void *a2)
{
  _QWORD *v4;
  void *result;
  _QWORD *v6;

  v4 = (_QWORD *)operator new();
  result = _Block_copy(a2);
  *v4 = 0;
  v4[1] = result;
  if (!*(_QWORD *)(a1 + 48))
    *(_QWORD *)(a1 + 48) = v4;
  v6 = *(_QWORD **)(a1 + 56);
  if (v6)
    *v6 = v4;
  *(_QWORD *)(a1 + 56) = v4;
  return result;
}

uint64_t gldTestObject(id *this, int a2, int a3, int a4, GLDFenceRec *a5)
{
  uint64_t MemoryPlugin;
  unsigned int v9;
  GLRResource *v10;
  uint64_t TextureResource;

  switch(a2)
  {
    case 3:
      MemoryPlugin = GLDBufferRec::getMemoryPlugin(a5);
      if (MemoryPlugin)
      {
        v10 = *(GLRResource **)(MemoryPlugin + 24);
        if (v10)
          return GLDContextRec::testResource(this, v10, v9, a4);
      }
      break;
    case 1:
      TextureResource = GLDTextureRec::getTextureResource(a5, 0);
      if (TextureResource)
      {
        v10 = (GLRResource *)TextureResource;
        return GLDContextRec::testResource(this, v10, v9, a4);
      }
      break;
    case 0:
      return GLDContextRec::testFence(this, a5, a4);
    default:
      return 1;
  }
  return 1;
}

uint64_t gldFlushObject(id *this, int a2, int a3, GLDTextureRec *a4)
{
  uint64_t MemoryPlugin;
  uint64_t v7;
  uint64_t TextureResource;
  uint64_t v9;

  if (a2 == 3)
  {
    MemoryPlugin = GLDBufferRec::getMemoryPlugin(a4);
    if (MemoryPlugin)
    {
      v7 = *(_QWORD *)(MemoryPlugin + 24);
      if (v7)
      {
        if (*(_DWORD *)(v7 + 12))
          goto LABEL_15;
      }
    }
  }
  else
  {
    if (a2 != 1)
    {
      if (a2 || !*((_DWORD *)a4 + 3))
        return 0;
LABEL_15:
      GLDContextRec::flushContext(this);
      return 0;
    }
    TextureResource = GLDTextureRec::getTextureResource(a4, 0);
    if (TextureResource && *(_DWORD *)(TextureResource + 12))
      GLDContextRec::flushContext(this);
    v9 = GLDTextureRec::getTextureResource(a4, 1u);
    if (v9 && *(_DWORD *)(v9 + 12))
      goto LABEL_15;
  }
  return 0;
}

uint64_t gldFinishObject(id *this, int a2, int a3, GLDTextureRec *a4)
{
  GLDTextureRec *v4;
  uint64_t MemoryPlugin;
  uint64_t TextureResource;
  uint64_t v8;
  uint64_t v9;

  v4 = a4;
  if (a2 == 3)
  {
    MemoryPlugin = GLDBufferRec::getMemoryPlugin(a4);
    if (!MemoryPlugin)
      return 0;
    v4 = *(GLDTextureRec **)(MemoryPlugin + 24);
    if (!v4)
      return 0;
    goto LABEL_14;
  }
  if (a2 != 1)
  {
    if (a2)
      return 0;
    goto LABEL_14;
  }
  TextureResource = GLDTextureRec::getTextureResource(a4, 0);
  if (TextureResource)
  {
    v8 = TextureResource;
    if (*(_DWORD *)(TextureResource + 12))
      GLDContextRec::flushContext(this);
    (*(void (**)(uint64_t, id))(*(_QWORD *)v8 + 40))(v8, this[11]);
  }
  v9 = GLDTextureRec::getTextureResource(v4, 1u);
  if (v9)
  {
    v4 = (GLDTextureRec *)v9;
LABEL_14:
    if (*((_DWORD *)v4 + 3))
      GLDContextRec::flushContext(this);
    (*(void (**)(GLDTextureRec *, id))(*(_QWORD *)v4 + 40))(v4, this[11]);
  }
  return 0;
}

uint64_t gldFinishContext(uint64_t a1)
{
  GLDContextRec::flushContext((id *)a1);
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 5264), 0xFFFFFFFFFFFFFFFFLL);
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 72) + 40))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88));
}

uint64_t gldWaitForFenceOnContext(id *this, _DWORD *a2)
{
  if (a2[3])
    GLDContextRec::flushContext(this);
  return (*(uint64_t (**)(_DWORD *, id))(*(_QWORD *)a2 + 40))(a2, this[11]);
}

void GLDContextRec::dispatchImageQueueBlockAsync(id *a1, NSObject **this, uint64_t a3, dispatch_block_t block)
{
  unsigned int v8;
  GLRResource *TextureResource;
  NSObject *TextureImageQueue;

  if (*((_DWORD *)this + 19))
  {
    v8 = 0;
    do
    {
      TextureResource = (GLRResource *)GLDTextureRec::getTextureResource((GLDTextureRec *)this, v8);
      GLDContextRec::flushResource(a1, TextureResource);
      ++v8;
    }
    while (v8 < *((_DWORD *)this + 19));
  }
  TextureImageQueue = this[17];
  if (TextureImageQueue)
  {
    if (a3)
    {
LABEL_6:
      GLDBufferRec::dispatchGroupAsync(a3, TextureImageQueue, block);
      return;
    }
  }
  else
  {
    TextureImageQueue = GLDTextureRec::createTextureImageQueue((GLDTextureRec *)this);
    if (a3)
      goto LABEL_6;
  }
  dispatch_async(TextureImageQueue, block);
}

void GLDContextRec::dispatchImageQueueEvent(GLDContextRec *this, GLDTextureRec *a2)
{
  NSObject *v2;
  NSObject *v4;

  v2 = *((_QWORD *)a2 + 17);
  if (v2)
  {
    v4 = *((_QWORD *)this + 657);
    if (!v4)
    {
      v4 = dispatch_group_create();
      *((_QWORD *)this + 657) = v4;
    }
    dispatch_group_async(v4, v2, &__block_literal_global_2);
  }
}

uint64_t GLDContextRec::loadCurrentTextures(uint64_t this, unsigned __int16 a2, const unint64_t *a3)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  const unint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int *v18;
  int v19;
  char v20;
  int v21;
  uint64_t v22;
  int v23;
  _BOOL4 v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  GLDBufferRec *v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;

  v32 = *(_QWORD *)(this + 88);
  v3 = a2;
  *(_DWORD *)(this + 416) &= ~a2;
  v4 = *(_QWORD *)(this + 104);
  if (!*(_BYTE *)(v4 + 12724))
    return this;
  v6 = this;
  v7 = 0;
  v31 = a2;
  do
  {
    if (!v3)
      goto LABEL_41;
    v8 = 16 * v7;
    do
    {
      v9 = __clz(__rbit32(v3));
      v10 = 1 << v9;
      v11 = v9 + v8;
      v12 = a3[v7] >> (4 * v9);
      v13 = v12 & 0xF;
      if (v13 <= 0xA)
      {
        v14 = a3;
        v15 = *(_QWORD *)(*(_QWORD *)(v6 + 112) + 8 * v11);
        if (v15)
        {
          v16 = *(_QWORD *)(v15 + 56);
          v17 = *(unsigned __int8 *)(v16 + 20);
          v18 = (int *)(v6 + 4 * v11 + 1544);
          v19 = *v18;
          if (*v18 == *(_DWORD *)(v15 + 12))
            v20 = *(_BYTE *)(v16 + 20);
          else
            v20 = -113;
          if (v13 != 7)
          {
            v22 = *(_QWORD *)(v15 + 48);
            if (((unsigned __int16)v10 & *(_WORD *)(*(_QWORD *)(v6 + 104) + 2 * v7 + 12720)) == 0
              || *(_BYTE *)(v22 + 2))
            {
              v23 = *(unsigned __int16 *)(v22 + 4);
              v24 = v23 == 6402;
              this = *(_QWORD *)(v6 + 88);
              v25 = v12 & 0xF;
              v15 = *(_QWORD *)(this + 88 * (v23 == 6402) + 8 * v25 + 40);
              if (!v15)
              {
                this = (uint64_t)GLDShareGroupRec::createZeroTexture((GLDShareGroupRec *)this, v23 == 6402, v13);
                v18 = (int *)(v6 + 4 * v11 + 1544);
                v15 = this;
                *(_QWORD *)(*(_QWORD *)(v6 + 88) + 88 * v24 + 8 * v25 + 40) = this;
                v19 = *v18;
              }
              v16 = *(_QWORD *)(v15 + 56);
              v17 = *(unsigned __int8 *)(v16 + 20);
              if (v19 == *(_DWORD *)(v15 + 12))
                v20 = *(_BYTE *)(v16 + 20);
              else
                v20 = -113;
            }
            if (!v17)
            {
              a3 = v14;
              v8 = 16 * v7;
              goto LABEL_37;
            }
            v33 = (uint64_t)v18;
            v26 = *(_QWORD *)(v6 + 88);
            v27 = *(_DWORD *)(v26 + 24) + 1;
            *(_DWORD *)(v26 + 24) = v27;
            *(_DWORD *)(v15 + 12) = v27;
            this = GLDTextureRec::update((GLDTextureRec *)v15, v17, (unsigned __int16 *)(v16 + 8));
            if ((_DWORD)this)
              goto LABEL_27;
            goto LABEL_33;
          }
          v33 = v6 + 4 * v11 + 1544;
          if ((v17 & 8) == 0)
            goto LABEL_12;
          v29 = *(GLDBufferRec **)v16;
          if (*(_QWORD *)v16)
          {
            v30 = **((_DWORD **)v29 + 4);
            if (!v30)
              goto LABEL_12;
            this = GLDBufferRec::update(v29, v30);
            if ((_DWORD)this)
            {
              **((_DWORD **)v29 + 4) = 0;
LABEL_12:
              if (!v17)
                goto LABEL_28;
              v21 = *(_DWORD *)(v32 + 24) + 1;
              *(_DWORD *)(v32 + 24) = v21;
              *(_DWORD *)(v15 + 12) = v21;
              this = GLDTextureRec::update((GLDTextureRec *)v15, v17, (unsigned __int16 *)(*(_QWORD *)(v15 + 56) + 8));
              if ((this & 1) != 0)
              {
LABEL_27:
                v28 = *(_QWORD *)(v15 + 56);
                *(_QWORD *)(v28 + 13) = 0;
                *(_QWORD *)(v28 + 8) = 0;
LABEL_28:
                a3 = v14;
                v8 = 16 * v7;
                v18 = (int *)v33;
LABEL_37:
                *v18 = *(_DWORD *)(v15 + 12);
                if (!v20)
                  goto LABEL_39;
                goto LABEL_38;
              }
            }
          }
        }
LABEL_33:
        v15 = 0;
        *(_DWORD *)(v6 + 416) |= 1 << v11;
        *(_DWORD *)(v6 + 4 * v11 + 1544) = 0;
        if (!*(_QWORD *)(v6 + 8 * v11 + 952))
        {
          a3 = v14;
          v8 = 16 * v7;
          goto LABEL_39;
        }
        v20 = -113;
        a3 = v14;
        v8 = 16 * v7;
        goto LABEL_38;
      }
      if (!*(_QWORD *)(v6 + 8 * v11 + 952))
      {
        v15 = 0;
        goto LABEL_39;
      }
      v15 = 0;
      *(_DWORD *)(v6 + 4 * v11 + 1544) = 0;
      v20 = -113;
LABEL_38:
      this = (uint64_t)GLDContextRec::bindTexture((_DWORD *)v6, (GLDTextureRec *)v15, v11, v20);
LABEL_39:
      *(_QWORD *)(v6 + 8 * v11 + 952) = v15;
      v3 ^= v10;
    }
    while (v3);
    v4 = *(_QWORD *)(v6 + 104);
    v3 = v31;
LABEL_41:
    ++v7;
  }
  while (v7 < *(unsigned __int8 *)(v4 + 12724));
  return this;
}

void GLDContextRec::generateTexMipmapsWithBlit(GLDContextRec *this, GLDTextureRec *a2, int a3)
{
  void *v6;
  void *v7;
  void *v8;
  GLRTextureResource *v9;
  GLDLibrary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t TextureResource;
  id v14;

  if (*((_DWORD *)this + 1151))
    GLDContextRec::beginRenderPass(this);
  if (*((_QWORD *)this + 2))
    GLDContextRec::endRenderPass(this);
  if (!*((_QWORD *)this + 5))
    GLDContextRec::getCommandBuffer(this);
  v6 = (void *)MEMORY[0x2348CF1D8]();
  v14 = (id)objc_msgSend(*((id *)this + 5), "blitCommandEncoder");
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v14, "setLabel:", *MEMORY[0x24BDDD9C0]);
  v7 = *(void **)(*(_QWORD *)(GLDTextureRec::getTextureResource(a2, 0) + 40) + 32);
  if (*(_BYTE *)(*((_QWORD *)a2 + 6) + 211) != 6)
  {
    objc_msgSend(v14, "generateMipmapsForTexture:", v7);
    goto LABEL_11;
  }
  v8 = GLDTextureRec::newCubeView(a2, a3);
  objc_msgSend(v14, "generateMipmapsForTexture:", v8);
  if (v8 == v7)
  {
LABEL_11:
    v12 = *((_QWORD *)this + 8);
    TextureResource = GLDTextureRec::getTextureResource(a2, 0);
    GLRResourceList::addResource(v12, TextureResource);
    goto LABEL_12;
  }
  GLDObject::operator new((GLDObject *)0x40);
  v10 = v9;
  GLRTextureResource::GLRTextureResource(v9);
  v11 = GLDTextureRec::getTextureResource(a2, 0);
  GLRTextureResource::initWithMetalTexture(v10, v8, *(_QWORD *)(v11 + 24));
  GLDContextRec::dispatchImageQueueEvent(this, a2);
  GLRResourceList::addResource(*((_QWORD *)this + 8), (uint64_t)v10);
  (*(void (**)(GLDLibrary *))(*(_QWORD *)v10 + 24))(v10);

LABEL_12:
  objc_msgSend(v14, "endEncoding");

}

void sub_2310684D0(_Unwind_Exception *a1)
{
  void *v1;

  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void GLDContextRec::flushRenderPassIfNeeded(GLDContextRec *this)
{
  if (*((_DWORD *)this + 1151))
    GLDContextRec::beginRenderPass(this);
  if (*((_QWORD *)this + 2))
    GLDContextRec::endRenderPass(this);
}

void GLDContextRec::generateMipmapsWithCPUAsync(id *this, GLDTextureRec *a2, uint64_t a3)
{
  uint64_t v6;
  __int16 v7;
  int v8;
  int v9;
  _QWORD *TextureResource;
  uint64_t v11;
  _QWORD block[8];
  int v13;
  int v14;

  v6 = *((_QWORD *)a2 + 6);
  if ((*(_BYTE *)(v6 + 130) & 1) != 0)
  {
    v8 = *(unsigned __int8 *)(v6 + 210);
    v7 = *(_WORD *)(v6 + 214);
  }
  else
  {
    v7 = *(_WORD *)(v6 + 214);
    v8 = v7 >> 4;
  }
  v9 = (v7 & 0xF) + 1;
  TextureResource = (_QWORD *)GLDTextureRec::getTextureResource(a2, 0);
  (*(void (**)(_QWORD *))(*TextureResource + 16))(TextureResource);
  v11 = TextureResource[4];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN13GLDContextRec27generateMipmapsWithCPUAsyncEP13GLDTextureRecm_block_invoke;
  block[3] = &unk_24FFED848;
  block[4] = v11;
  block[5] = this;
  v13 = v9;
  v14 = v8;
  block[6] = TextureResource;
  block[7] = a3;
  GLDContextRec::dispatchImageQueueBlockAsync(this, (NSObject **)a2, 0, block);
}

uint64_t ___ZN13GLDContextRec27generateMipmapsWithCPUAsyncEP13GLDTextureRecm_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t i;

  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 48) + 40))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v2 = objc_msgSend(*(id *)(a1 + 32), "arrayLength");
  v4 = *(_DWORD *)(a1 + 64);
  v3 = *(_DWORD *)(a1 + 68);
  if (v4 <= v3)
  {
    v5 = v2;
    do
    {
      if (v5)
      {
        for (i = 0; i != v5; ++i)
          objc_msgSend(*(id *)(a1 + 32), "generateMipmapLevel:slice:", v4, i + *(_QWORD *)(a1 + 56) * v5);
        v3 = *(_DWORD *)(a1 + 68);
      }
      ++v4;
    }
    while (v4 <= v3);
  }
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 48) + 24))(*(_QWORD *)(a1 + 48));
}

void *GLDContextRec::getPixelBuffer(void **this, const void *a2, size_t a3, unint64_t *a4)
{
  void *DataBufferSpace;
  void *__dst;

  __dst = 0;
  DataBufferSpace = GLRDataBufferManager::getDataBufferSpace((GLRDataBufferManager *)(this + 704), this[5], (a3 + 63) & 0xFFFFFFFFFFFFFFC0, a4, (uint64_t *)&__dst);
  if (DataBufferSpace)
    memcpy(__dst, a2, a3);
  return DataBufferSpace;
}

unsigned int *gldUnbindTexture(unsigned int *this, unsigned int *a2)
{
  unsigned int *v3;
  uint64_t i;
  unsigned int *v5;

  v3 = this;
  for (i = 517; i != 527; ++i)
  {
    if (*(unsigned int **)&v3[2 * i] == a2)
    {
      v5 = a2;
      if (v3[1151])
      {
        GLDContextRec::beginRenderPass((GLDContextRec *)v3);
        v5 = *(unsigned int **)&v3[2 * i];
      }
      this = GLDObject::release(v5);
      *(_QWORD *)&v3[2 * i] = 0;
    }
  }
  return this;
}

uint64_t gldGetTextureLevelInfo(int a1, GLDTextureRec *this, uint64_t a3, uint64_t a4, int a5, int *a6)
{
  return GLDTextureRec::getLevelInfo(this, a3, a4, a5, a6);
}

uint64_t gldCopyTexSubImage()
{
  return 0;
}

uint64_t gldModifyTexSubImage(uint64_t a1, GLDTextureRec *this, int a3, unsigned int a4, int a5, int a6, int a7, int a8, unsigned int a9, int a10, int a11, int a12, uint64_t a13, int a14, GLDBufferRec *a15)
{
  uint64_t v17;
  uint64_t v23;
  unsigned int v24;
  int v25;
  int v26;
  uint64_t result;
  int v28;
  int *v29;
  char v30;
  GLDTextureRec *v31;
  uint64_t v32;
  _BOOL4 v33;
  GLRResource *TextureResource;
  int v35;
  BOOL v36;
  GLDContextRec *v37;
  GLDTextureRec *v38;
  unint64_t v39;
  uint64_t v40;
  GLDTextureRec *v41;
  GLDContextRec *v42;
  uint64_t MemoryPlugin;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *PixelBuffer;
  GLDTextureRec *v50;
  GLRResource *v51;
  uint64_t v52;
  GLRResource *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  unint64_t v61;
  void *v62;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  GLDTextureRec *v73;
  uint64_t v74;
  GLDContextRec *v75;
  GLDContextRec *v76;
  unsigned int v77;
  void *v78;
  char v79;
  int v80;
  BOOL v81;
  GLDTextureRec *v82;
  GLDTextureRec *v83;
  int v84;
  unint64_t v85;
  GLDBufferRec *v86;
  uint64_t v87;
  uint64_t v88;
  GLDTextureRec *v89;
  _QWORD v90[3];
  _QWORD v91[3];
  unint64_t v92;
  uint64_t block;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  GLDContextRec *v98;
  GLDTextureRec *v99;
  uint64_t v100;
  GLDContextRec *v101;
  GLDTextureRec *v102;
  uint64_t v103;
  GLDContextRec *v104;
  GLDTextureRec *v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unsigned int v112;
  int v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  int v118;
  int v119[6];

  if (*((int *)this + 19) < 2 && (LODWORD(v17) = a7, v23 = *((_QWORD *)this + 6), GLDTextureRec::load(this)))
  {
    v24 = *((_DWORD *)this + 16);
    v25 = (a4 == 0) & *(_BYTE *)(v23 + 130);
    if (v25 == 1
      && ((*(_WORD *)(*((_QWORD *)this + 6) + 214) & 0x1800) != 0
       || (*((_BYTE *)&glrTextureFormats + 40 * v24 + 36) & 0x40) == 0))
    {
      return 0;
    }
    v26 = (int)(&glrTextureFormats)[5 * v24 + 1];
    if (v26 > 36247)
    {
      if (v26 == 36249)
      {
        v26 = 6408;
      }
      else if (v26 == 36248)
      {
        v26 = 6407;
      }
    }
    else if (v26 == 33320)
    {
      v26 = 33319;
    }
    else if (v26 == 36244)
    {
      v26 = 6403;
    }
    result = 0;
    v28 = *((_DWORD *)&glrTextureFormats + 10 * v24 + 3);
    if (v28 == 36193)
      v28 = 5131;
    if (v26 == a11 && v28 == a12)
    {
      if (a11 == 6402 && a12 == 5126)
        return 0;
      v29 = 0;
      *(_QWORD *)v119 = 0;
      v118 = 0;
      if (a12 && !a14)
        v29 = (int *)(*(_QWORD *)(a1 + 104) + 16212);
      if ((*(_WORD *)(v23 + 214) & 0x1800) == 0x1000
        || (v30 = 3, (*(_WORD *)(v23 + 214) & 0x2000) != 0) && (*(_WORD *)(v23 + 214) & 0x600) != 0)
      {
        v30 = 4;
      }
      v79 = v25;
      v77 = a4;
      glrPixelSettings(a11, a12, a8, a9, &v119[1], v119, &v118, v29, v30);
      v86 = (GLDBufferRec *)v118;
      LODWORD(block) = 0;
      LODWORD(v114) = 0;
      glgConvertType();
      v85 = v119[1] * (unint64_t)a9;
      v80 = a3;
      if ((*(_WORD *)(v23 + 214) & 0x2000) != 0)
      {
        v31 = (GLDTextureRec *)(int)v17;
        v87 = a10;
        v84 = 1;
        LODWORD(v17) = 0;
      }
      else
      {
        v31 = (GLDTextureRec *)(a3 & ~(a3 >> 31));
        v87 = 1;
        v84 = a10;
      }
      v32 = a13;
      if ((*(_BYTE *)(v23 + 24) & 4) != 0)
      {
        TextureResource = (GLRResource *)GLDTextureRec::getTextureResource(this, 0);
        v35 = GLDContextRec::testResource((id *)a1, TextureResource, 0, 0);
        v32 = a13;
        v33 = v35 == 0;
      }
      else
      {
        v33 = 0;
      }
      if ((a11 == 36248 || a11 == 6407) && a12 != 33635 && a12 != 35902 && a12 != 35899
        || *((_DWORD *)this + 19) != 1
        || (*((_DWORD *)&glrTextureFormats + 10 * *((unsigned int *)this + 16) + 9) & 0x81) != 1
        || v119[1] % (unint64_t)v119[0]
        || (((unint64_t)v86 + v32) % v119[0]) | a8 & 1
        || v87 * v85 > 0x100000)
      {
        v33 = 0;
      }
      v76 = (GLDBufferRec *)((char *)v86 + v32);
      v117 = 0;
      v115 = 0u;
      v116 = 0u;
      v114 = 0u;
      MTLPixelFormatGetInfo();
      if (a15)
        v36 = v33;
      else
        v36 = 0;
      v81 = v36;
      v78 = *(void **)(GLDTextureRec::getTextureResource(this, 0) + 32);
      if (a15)
        GLDBufferRec::load(a15);
      v37 = (GLDContextRec *)a5;
      v38 = (GLDTextureRec *)a6;
      v17 = (int)v17;
      v39 = a8;
      v40 = (int)a9;
      if (v81)
      {
        v41 = v38;
        v42 = v37;
        GLDObject::retain((uint64_t)this);
        MemoryPlugin = GLDBufferRec::getMemoryPlugin(a15);
        (*(void (**)(uint64_t))(*(_QWORD *)MemoryPlugin + 16))(MemoryPlugin);
        block = MEMORY[0x24BDAC760];
        v94 = 3221225472;
        v95 = ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke;
        v96 = &unk_24FFED870;
        v99 = this;
        v100 = MemoryPlugin;
        v101 = v76;
        v102 = v31;
        v97 = v78;
        v98 = (GLDContextRec *)a1;
        v103 = v87;
        v104 = v42;
        v105 = v41;
        v106 = (int)v17;
        v107 = v39;
        v108 = (int)a9;
        v112 = v77;
        v113 = v119[1];
        v109 = v84;
        v110 = v85;
        v111 = v85;
        GLDContextRec::dispatchImageQueueBlockAsync((id *)a1, (NSObject **)this, (uint64_t)a15, &block);
        if ((v79 & 1) != 0)
          GLDContextRec::generateMipmapsWithCPUAsync((id *)a1, this, v80);
      }
      else
      {
        if (v33)
        {
          v74 = a5;
          v82 = v38;
          GLDContextRec::flushRenderPassIfNeeded((GLDContextRec *)a1);
          v44 = *(void **)(a1 + 40);
          if (!v44)
          {
            GLDContextRec::getCommandBuffer((GLDContextRec *)a1);
            v44 = *(void **)(a1 + 40);
          }
          v45 = (void *)objc_msgSend(v44, "blitCommandEncoder");
          objc_msgSend(v45, "setLabel:", *MEMORY[0x24BDDD9C0]);
          v92 = 0;
          if (a15)
          {
            v46 = *((_QWORD *)a15 + 5);
            if (v46 && (v47 = *(_QWORD *)(v46 + 24)) != 0)
            {
              v48 = a8;
              PixelBuffer = *(void **)(v47 + 40);
            }
            else
            {
              v48 = a8;
              PixelBuffer = 0;
            }
            v55 = v87;
          }
          else
          {
            v48 = a8;
            v55 = v87;
            PixelBuffer = GLDContextRec::getPixelBuffer((void **)a1, v76, v87 * v85 * v84, &v92);
            if (!PixelBuffer)
            {
              v56 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 24), "newBufferWithBytes:length:options:", v76, v87 * v85 * v84, 0);
              objc_msgSend(v56, "setLabel:", *MEMORY[0x24BDDD9C0]);
              v57 = *(void **)(a1 + 40);
              block = MEMORY[0x24BDAC760];
              v94 = 3221225472;
              v95 = ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_2;
              v96 = &unk_24FFED898;
              v97 = v56;
              objc_msgSend(v57, "addCompletedHandler:", &block);
              PixelBuffer = v56;
            }
          }
          v58 = v84;
          v59 = v85;
          v60 = v45;
          if (v31 < (GLDTextureRec *)((char *)v31 + v55))
          {
            v88 = v48;
            v61 = v92;
            do
            {
              v89 = v31;
              v90[0] = v74;
              v91[0] = v48;
              v91[1] = v40;
              v91[2] = v58;
              v90[1] = v82;
              v90[2] = v17;
              v73 = v31;
              v62 = v60;
              v63 = PixelBuffer;
              v64 = v59;
              v65 = v17;
              v66 = v58;
              objc_msgSend(v60, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", PixelBuffer, v61, v119[1], v59, v91, v78, v73, (int)v77, v90);
              v60 = v62;
              v58 = v66;
              v17 = v65;
              v59 = v64;
              v48 = v88;
              PixelBuffer = v63;
              v40 = (int)a9;
              v61 = v92 + v85;
              v92 += v85;
              v31 = (GLDTextureRec *)((char *)v89 + 1);
              --v55;
            }
            while (v55);
          }
          objc_msgSend(v60, "endEncoding");
          GLDContextRec::dispatchImageQueueEvent((GLDContextRec *)a1, this);
          v67 = *(_QWORD *)(a1 + 64);
          v68 = GLDTextureRec::getTextureResource(this, 0);
          GLRResourceList::addResource(v67, v68);
          v69 = v80;
          v70 = v79;
          if (a15)
          {
            v71 = *((_QWORD *)a15 + 5);
            if (v71)
              v72 = *(_QWORD *)(v71 + 24);
            else
              v72 = 0;
            GLRResourceList::addResource(*(_QWORD *)(a1 + 64), v72);
          }
        }
        else
        {
          if ((*(_BYTE *)(v23 + 24) & 4) != 0)
          {
            v50 = v38;
            v51 = (GLRResource *)GLDTextureRec::getTextureResource(this, 0);
            GLDContextRec::finishResource((id *)a1, v51);
            v37 = (GLDContextRec *)a5;
            v38 = v50;
          }
          if (a15)
          {
            v52 = *((_QWORD *)a15 + 5);
            if (v52)
            {
              v53 = *(GLRResource **)(v52 + 24);
              if (v53)
              {
                v83 = v38;
                v75 = v37;
                GLDContextRec::finishResource((id *)a1, v53);
                v37 = v75;
                v38 = v83;
              }
            }
          }
          block = MEMORY[0x24BDAC760];
          v94 = 3221225472;
          v95 = ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_3;
          v96 = &unk_24FFED8C0;
          v99 = v31;
          v100 = v87;
          v97 = v78;
          v98 = v76;
          v101 = v37;
          v102 = v38;
          v103 = (int)v17;
          v104 = (GLDContextRec *)a8;
          v105 = (GLDTextureRec *)(int)a9;
          v106 = v84;
          v109 = __PAIR64__(v119[1], v77);
          v107 = v85;
          v108 = v85;
          v54 = *((_QWORD *)this + 17);
          if (v54)
            dispatch_sync(v54, &block);
          else
            ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_3(&block);
          v69 = v80;
          v70 = v79;
        }
        if ((v70 & 1) != 0)
          GLDContextRec::generateTexMipmapsWithBlit((GLDContextRec *)a1, this, v69);
      }
      *(_DWORD *)(a1 + 5052) |= 4u;
      return 1;
    }
  }
  else
  {
    result = 0;
    *(_DWORD *)(a1 + 5052) |= 2u;
  }
  return result;
}

uint64_t gldCopyTextureData()
{
  return 0;
}

BOOL gldGenerateTexMipmaps(GLDContextRec *a1, GLDTextureRec *this, int a3)
{
  unsigned int v3;
  _BOOL8 result;
  int8x8_t v8;
  int v9;
  unsigned __int8 v10;
  unint64_t v11;
  _BYTE *v12;
  GLRResource *TextureResource;
  int v14;

  v3 = *(unsigned __int16 *)(*((_QWORD *)this + 6) + 214);
  if (((v3 ^ (v3 >> 4)) & 0xF) == 0)
    return 1;
  result = GLDTextureRec::load(this);
  if (result)
  {
    if ((*((_BYTE *)&glrTextureFormats + 40 * *((unsigned int *)this + 16) + 36) & 0x40) != 0)
    {
      v11 = 0x255EB3000uLL;
      if ((v10 & 1) == 0)
      {
        v11 = 0x255EB3000;
        if (v14)
        {
          GLDContextRec::generateTexMipmaps(GLDTextureRec *,int,unsigned int)::forceGpuMipmapGenEV = getenv("GLMTL_FORCE_GPU_MIPMAP_GEN");
          v11 = 0x255EB3000;
        }
      }
      v12 = *(_BYTE **)(v11 + 2752);
      if (v12 && *v12 == 49 || !GLDTextureRec::canGenerateMipmapsWithCPU(this, v8))
      {
        GLDContextRec::generateTexMipmapsWithBlit(a1, this, a3);
      }
      else
      {
        TextureResource = (GLRResource *)GLDTextureRec::getTextureResource(this, 0);
        if (GLDContextRec::testResource((id *)a1, TextureResource, 0, 0))
          GLDTextureRec::generateMipmapsWithCPU((uint64_t)this, a3);
        else
          GLDContextRec::generateMipmapsWithCPUAsync((id *)a1, this, a3);
      }
      result = 1;
      v9 = 0x10000000;
      goto LABEL_15;
    }
    result = 0;
  }
  v9 = 0x8000000;
LABEL_15:
  *(_DWORD *)(*((_QWORD *)a1 + 11) + 32) |= v9;
  *((_QWORD *)a1 + 53) |= 0x100000uLL;
  return result;
}

uint64_t gldIsTextureResident()
{
  return 1;
}

void ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_2(uint64_t a1)
{

}

_BYTE *GLDContextRec::bindVertexArray(GLDContextRec *this, GLDVertexArrayRec *a2)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  char *v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *result;
  uint64_t v15;
  char *v16;

  if (a2)
  {
    v3 = *((_QWORD *)a2 + 6);
    v4 = *(_QWORD *)(v3 + 768);
    v5 = *((_DWORD *)this + 667);
    v6 = 0;
    if (v4)
    {
      v7 = *((_QWORD *)a2 + 7);
      do
      {
        v8 = __clz(__rbit64(v4)) - 16;
        v9 = *(_BYTE **)(*(_QWORD *)(*(_QWORD *)(v7 + 8 * v8) + 40) + 24);
        if (v9[32])
        {
          if (*((_DWORD *)this + 1151))
            GLDContextRec::beginRenderPass(this);
          if (*((_QWORD *)this + 2))
            GLDContextRec::endRenderPass(this);
        }
        v10 = (char *)this + 8 * v6;
        v11 = (_BYTE *)*((_QWORD *)v10 + 334);
        if (v9 != v11)
        {
          if (v11)
            (*(void (**)(_BYTE *))(*(_QWORD *)v11 + 24))(v11);
          v5 |= 1 << v6;
          *((_QWORD *)v10 + 334) = v9;
          (*(void (**)(_BYTE *))(*(_QWORD *)v9 + 16))(v9);
        }
        *((_DWORD *)this + v6 + 700) = *(_DWORD *)(v3 + 24 * v8) & 0xFFFFFFFC;
        *((_BYTE *)this + v8 + 336) = v6++;
        v4 ^= 0x10000 << v8;
      }
      while (v4);
    }
    *((_DWORD *)this + 667) = v5;
    if (*((_BYTE *)a2 + 64))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a2 + 7) + 256) + 40);
      if (v12)
        v13 = *(_BYTE **)(v12 + 24);
      else
        v13 = 0;
      if (v13[32])
      {
        if (*((_DWORD *)this + 1151))
          GLDContextRec::beginRenderPass(this);
        if (*((_QWORD *)this + 2))
          GLDContextRec::endRenderPass(this);
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    v6 = 0;
  }
  result = (_BYTE *)*((_QWORD *)this + 358);
  if (v13 != result)
  {
    if (result)
      result = (_BYTE *)(*(uint64_t (**)(_BYTE *))(*(_QWORD *)result + 24))(result);
    *((_QWORD *)this + 358) = v13;
    if (v13)
      result = (_BYTE *)(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v13 + 16))(v13);
  }
  *((_DWORD *)this + 666) = v6;
  if (v6 <= 0xF)
  {
    v15 = v6;
    v16 = (char *)this + 2672;
    do
    {
      result = *(_BYTE **)&v16[8 * v15];
      if (result)
      {
        result = (_BYTE *)(*(uint64_t (**)(_BYTE *))(*(_QWORD *)result + 24))(result);
        *(_QWORD *)&v16[8 * v15] = 0;
      }
      ++v15;
    }
    while ((_DWORD)v15 != 16);
  }
  *((_DWORD *)this + 618) |= 0x800u;
  return result;
}

uint64_t GLDContextRec::loadCurrentVertexArray(uint64_t this, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = this;
  v3 = *(_QWORD *)(this + 112);
  v4 = *(_QWORD *)(v3 + 368);
  if ((a2[3] & 1) != 0 && (this = *(_QWORD *)(v3 + 976)) != 0)
  {
    this = GLDBufferRec::load((GLDBufferRec *)this);
    if ((_DWORD)this)
      v5 = v4 == 0;
    else
      v5 = 1;
    if (v5)
      goto LABEL_30;
  }
  else if (!v4)
  {
    goto LABEL_30;
  }
  v7 = *(_QWORD *)(v4 + 48);
  v6 = *(_QWORD *)(v4 + 56);
  v8 = *(_QWORD *)(v6 + 272);
  v9 = *(_DWORD *)(v2 + 368);
  v10 = *(_DWORD *)(v4 + 12);
  if (v8)
  {
    v11 = *(_QWORD *)(v2 + 88);
    v12 = *(_DWORD *)(v11 + 12) + 1;
    *(_DWORD *)(v11 + 12) = v12;
    *(_DWORD *)(v4 + 12) = v12;
    this = GLDVertexArrayRec::updateSharedState((GLDVertexArrayRec *)v4, v8);
  }
  *(_DWORD *)(v2 + 368) = *(_DWORD *)(v4 + 12);
  if (v9 != v10 || v8 != 0)
    *(_DWORD *)(v2 + 2472) |= 0x809u;
  v14 = *(_QWORD *)(v7 + 768);
  if (v14)
  {
    if ((v14 & ~*(_QWORD *)(v7 + 776)) == 0)
    {
      v15 = *(_QWORD *)(v6 + 264);
      if (v15 != 128)
      {
        v16 = *(_DWORD *)(v4 + 16);
        if (*(_DWORD *)(v2 + 372) == v16)
          v17 = *(_QWORD *)(v6 + 264);
        else
          v17 = -1;
        if (!v15)
          goto LABEL_28;
        v18 = (_QWORD *)(v6 + 264);
        v19 = *(_QWORD *)(v2 + 88);
        v20 = *(_DWORD *)(v19 + 16) + 1;
        *(_DWORD *)(v19 + 16) = v20;
        v21 = *(_QWORD *)(v4 + 24);
        *(_DWORD *)(v4 + 16) = v20;
        v22 = v21 | v15;
        v23 = *(_QWORD *)(v4 + 32) | v8;
        if (((v21 | v15) & 0x10) == 0
          || (this = GLDVertexArrayRec::updateBuffers((GLDVertexArrayRec *)v4, v22), (_DWORD)this))
        {
          this = GLDVertexArrayRec::updateVertexArrayBuffers((GLDVertexArrayRec *)v4, v22, v23);
          if ((_DWORD)this)
          {
            v17 |= v21;
            *(_QWORD *)(v4 + 24) = 0;
            *(_QWORD *)(v4 + 32) = 0;
            *v18 = 0;
            v18[1] = 0;
            v16 = *(_DWORD *)(v4 + 16);
LABEL_28:
            *(_DWORD *)(v2 + 372) = v16;
            goto LABEL_33;
          }
        }
        *(_QWORD *)(v4 + 24) = v22;
        *(_QWORD *)(v4 + 32) = v23;
        *(_OWORD *)v18 = xmmword_23106B9C0;
      }
    }
  }
LABEL_30:
  v4 = 0;
  *(_DWORD *)(v2 + 372) = 0;
  if (*(_QWORD *)(v2 + 392))
    v17 = -1;
  else
    v17 = 0;
LABEL_33:
  if (v17)
    this = (uint64_t)GLDContextRec::bindVertexArray((GLDContextRec *)v2, (GLDVertexArrayRec *)v4);
  *(_QWORD *)(v2 + 392) = v4;
  return this;
}

GLDContextRec *gldUnbindVertexArray(GLDContextRec *result, uint64_t a2)
{
  GLDContextRec *v2;

  if (*((_QWORD *)result + 49) == a2)
  {
    v2 = result;
    result = (GLDContextRec *)GLDContextRec::bindVertexArray(result, 0);
    *((_QWORD *)v2 + 49) = 0;
    *((_DWORD *)v2 + 93) = 0;
  }
  return result;
}

uint64_t GLDContextRec::buildVertexArrayDescriptor(uint64_t this, GLDPipelineProgramRec *a2, GLDVertexArrayRec *a3)
{
  unsigned int *v3;
  uint64_t v4;
  _BYTE *v5;
  char *v6;
  uint64_t v7;
  int v8;
  char v9;
  unsigned int v10;
  _DWORD *v11;
  unsigned __int8 *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  MTLVertexFormat v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  __int16 v22;
  int v23;
  int v24;
  int v25;
  GLDContextRec *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v31;
  unsigned __int8 v32[2];
  _BYTE v33[16];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned int **)(*((_QWORD *)a2 + 3) + 56);
  v4 = *v3;
  *(_QWORD *)(this + 1920) = 0;
  *(_OWORD *)(this + 1904) = 0u;
  *(_OWORD *)(this + 1888) = 0u;
  *(_OWORD *)(this + 1872) = 0u;
  *(_OWORD *)(this + 1856) = 0u;
  if ((_DWORD)v4)
  {
    v29 = this + 1856;
    v5 = v3 + 3;
    v6 = v33;
    v7 = v4;
    do
    {
      v8 = (*((_DWORD *)v5 - 1) >> 8) & 0x1F;
      if (v8 == 17)
      {
        v9 = 45;
      }
      else if (v8 == 18)
      {
        v9 = 47;
      }
      else
      {
        if (v8 != 28)
          MTLReleaseAssertionFailure();
        v9 = *v5 & 0x3F;
      }
      v5 += 8;
      *v6++ = v9;
      --v7;
    }
    while (v7);
    v10 = 0;
    v27 = this;
    v28 = 0;
    v11 = v3 + 2;
    v12 = v33;
    while (1)
    {
      v14 = *v12++;
      v13 = v14;
      if ((v14 | 2) != 0x2F)
      {
        v15 = *((_QWORD *)a3 + 6);
        if (((*(_QWORD *)(v15 + 768) >> v13) & 0x10000) != 0)
        {
          v31 = v7;
          v16 = v15 + 24 * v13;
          v17 = glrConvertVertexElementType(*(unsigned __int16 *)(v16 + 20), *(char *)(v16 + 22));
          v18 = *(_DWORD *)(v16 + 8);
          if (v18 <= 1)
            v19 = 1;
          else
            v19 = *(_DWORD *)(v16 + 8);
          v20 = *(_DWORD *)(v16 + 16);
          if (!v20)
          {
            *(_WORD *)v32 = 0;
            LOWORD(v20) = glrVertexFormatComponentAttribSizeTypeAlignment(v17, &v32[1], v32);
          }
          v21 = 4 - (v20 & 3);
          if ((v20 & 3) == 0)
            v21 = 0;
          v22 = v21 + v20;
          if (v18)
            v23 = 2;
          else
            v23 = 1;
          *(_DWORD *)(v29 + 4 * v10) = (4 * (v17 & 0x3F)) | v23 | ((v19 & 0x3FF) << 20) | (*(_DWORD *)(v15 + 24 * v13) << 30) | ((v22 & 0xFFF) << 8);
          this = v27;
          *(_BYTE *)(v27 + v31 + 320) = v13;
          LODWORD(v7) = v31 + 1;
        }
        else
        {
          v24 = (*v11 >> 3) & 7;
          if (v24)
          {
            if (v24 == 2)
            {
              v25 = 140;
            }
            else
            {
              if (v24 != 3)
              {
                v26 = (GLDContextRec *)MTLReleaseAssertionFailure();
                return GLDContextRec::buildPrimitiveBufferVertexArrayDescriptor(v26);
              }
              v25 = 156;
            }
          }
          else
          {
            v25 = 124;
          }
          *(_DWORD *)(v29 + 4 * v10) = v25 & 0xC00FFFFF | ((v28 & 0x3FF) << 20) | *(_DWORD *)(v29 + 4 * v10) & 0xC0000000 | 3;
          *(_BYTE *)(this + HIDWORD(v28) + 280) = v13;
          LODWORD(v28) = v28 + 16;
          ++HIDWORD(v28);
        }
        ++v10;
      }
      v11 += 2;
      if (!--v4)
        goto LABEL_35;
    }
  }
  HIDWORD(v28) = 0;
  LODWORD(v7) = 0;
LABEL_35:
  *(_DWORD *)(this + 316) = v7;
  *(_DWORD *)(this + 2472) |= 0x800u;
  *(_DWORD *)(this + 2484) |= 1u;
  *(_DWORD *)(this + 2668) = -1;
  *(_DWORD *)(this + 276) = HIDWORD(v28);
  return this;
}

void GLDContextRec::buildPrimitiveBufferVertexArrayDescriptor(GLDContextRec *this)
{
  unsigned int *v1;
  uint64_t v2;
  unsigned int v3;
  char v4;
  char v5;
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  int v9;
  char v10;
  int v11;
  unsigned int v12;
  unsigned int *v13;
  uint64_t v14;
  _DWORD *v15;
  char *v16;
  unsigned __int8 *v17;
  _QWORD *v18;
  _BYTE *v19;
  _QWORD *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned __int8 *v23;
  MTLVertexFormat v24;
  unsigned int v25;
  int v26;
  unsigned __int8 *v27;
  int v28;
  unsigned __int8 *v29;
  unsigned int v30;
  unsigned __int8 *v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  char v36;
  MTLVertexFormat v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  unsigned int v42;
  int v43;
  int v44;
  unsigned __int8 *v45;
  int *v46;
  int *v47;
  uint64_t v48;
  int v49;
  int v50;
  char v51;
  int v52;
  __int16 v53;
  int v54;
  int v55;
  int v56;
  unsigned int v57;
  uint64_t v58;
  unsigned __int8 v59;
  int *v60;
  char v61;
  int v62;
  GLDTransformFeedbackMachine *v63;
  __int16 v64;
  uint64_t v65;
  unsigned int v66;
  unsigned int v67;
  unsigned __int8 *v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  GLDContextRec *v72;
  unsigned __int8 v73;
  _BYTE v74[18];
  _DWORD v75[18];
  _BYTE v76[144];
  _BYTE v77[150];
  unsigned __int8 v78[18];
  _BYTE v79[18];
  _BYTE v80[18];
  _BYTE v81[18];
  _BYTE v82[18];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v71 = *(_QWORD *)(*((_QWORD *)this + 14) + 368);
  v1 = *(unsigned int **)(*(_QWORD *)(*((_QWORD *)this + 183) + 24) + 56);
  v2 = *v1;
  *((_OWORD *)this + 124) = 0u;
  *((_OWORD *)this + 125) = 0u;
  *((_OWORD *)this + 126) = 0u;
  *((_OWORD *)this + 127) = 0u;
  *((_QWORD *)this + 256) = 0;
  if ((_DWORD)v2)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = v1 + 3;
    do
    {
      v8 = *(v7 - 1);
      v9 = (v8 >> 8) & 0x1F;
      if (v9 == 17)
      {
        v5 = 1;
      }
      else if (v9 == 18)
      {
        v4 = 1;
      }
      else
      {
        if (v9 != 28)
          MTLReleaseAssertionFailure();
        v10 = *v7;
        v82[v3] = v10 & 0x3F;
        v81[v3] = v8 >> 6;
        v6 |= 1 << ((v10 & 0x3Fu) + 16);
        ++v3;
      }
      v7 += 2;
      --v2;
    }
    while (v2);
    if ((v5 & 1) != 0)
    {
      v82[v3] = 45;
      v81[v3] = 0;
      v6 |= 0x2000000000000000uLL;
      ++v3;
    }
    if ((v4 & 1) != 0)
    {
      v82[v3] = 47;
      v81[v3] = 0;
      v6 |= 0x8000000000000000;
      ++v3;
    }
  }
  else
  {
    v82[0] = 45;
    v81[0] = 0;
    v3 = 1;
    v6 = 0x2000000000000000;
  }
  if ((*((_DWORD *)this + 94) & 1) == 0)
    v6 &= ~0x400000uLL;
  v70 = v6;
  v73 = 0;
  if (!v3)
  {
    v57 = 0;
    goto LABEL_67;
  }
  v69 = 0;
  v11 = 0;
  v67 = 0;
  v12 = 0;
  v72 = this;
  v13 = (unsigned int *)((char *)this + 1984);
  v14 = v3;
  v15 = v1 + 2;
  v16 = v81;
  v17 = v82;
  v18 = v77;
  v19 = v74;
  v20 = v76;
  v65 = v3;
  do
  {
    v22 = *v17++;
    v21 = v22;
    if (v22 == 47)
    {
      *v18 = 44;
      *v19 = 0;
      v75[v11] = v12;
      *v20 = v12;
      v80[v11] = 47;
      v79[v11] = *v16;
      v23 = &v78[v11];
      v24 = MTLVertexFormatInt1010102Normalized|MTLVertexFormatChar2;
      goto LABEL_23;
    }
    if (v21 == 45)
    {
      *v18 = 43;
      *v19 = 0;
      v75[v11] = v12;
      *v20 = v12;
      v80[v11] = 45;
      v79[v11] = *v16;
      v23 = &v78[v11];
      v24 = MTLVertexFormatUChar4Normalized_BGRA|MTLVertexFormatUChar2;
LABEL_23:
      v25 = v12;
      v26 = v11;
      v27 = v17;
      v28 = glrVertexFormatComponentAttribSizeTypeAlignment(v24, v23, &v73);
      v17 = v27;
      v12 = v25 + v28;
LABEL_28:
      v11 = v26 + 1;
      goto LABEL_29;
    }
    if (*(_WORD *)(*((_QWORD *)v72 + 13) + 4))
    {
      *v18 = 31;
      *v19 = 0;
      v75[v11] = v12;
      *v20 = v12;
      v80[v11] = v21;
      v79[v11] = *v16;
      v29 = &v78[v11];
      v30 = v12;
      v26 = v11;
      v31 = v17;
      v32 = glrVertexFormatComponentAttribSizeTypeAlignment(MTLVertexFormatFloat4, v29, &v73);
      v17 = v31;
      v33 = 4 - (v32 & 3);
      if ((v32 & 3) == 0)
        v33 = 0;
      v12 = v30 + v32 + v33;
      goto LABEL_28;
    }
    v34 = *(_QWORD *)(v71 + 48);
    if (((0x10000 << v21) & v70 & *(_QWORD *)(v34 + 768)) != 0)
    {
      v68 = v17;
      v35 = *(unsigned __int8 *)(v34 + 24 * v21 + 22);
      if (v35 == 5)
      {
        v36 = *v16;
      }
      else
      {
        v66 = v12;
        v40 = *(unsigned __int16 *)(v34 + 24 * v21 + 20);
        if (v40 == 5132)
          v40 = 5126;
        if (v21 == 7)
          v41 = 5125;
        else
          v41 = v40;
        if ((v35 - 1) >= *v16)
          v36 = *v16;
        else
          v36 = v35 - 1;
        *v16 = v36;
        v64 = v41;
        v37 = glrConvertVertexElementType(v41, (char)(v36 + 1));
        if (v37)
        {
          v12 = v66;
          goto LABEL_57;
        }
        v36 = 3;
        *v16 = 3;
        v12 = v66;
        if ((v64 & 0x4000) != 0)
        {
          if ((unsigned __int16)((v64 & 0x9FFF) - 5120) >= 6u)
            goto LABEL_73;
          v37 = qword_23106B9D0[(__int16)((v64 & 0x9FFF) - 5120)];
          goto LABEL_57;
        }
      }
      v37 = MTLVertexFormatFloat4;
LABEL_57:
      v75[v11] = v12;
      *v18 = v37;
      *v19 = 0;
      *v20 = v12;
      v80[v11] = v21;
      v79[v11] = v36;
      v42 = v12;
      v43 = glrVertexFormatComponentAttribSizeTypeAlignment(v37, &v78[v11], &v73);
      v44 = 4 - (v43 & 3);
      if ((v43 & 3) == 0)
        v44 = 0;
      v12 = v42 + v43 + v44;
      ++v11;
      v17 = v68;
      goto LABEL_29;
    }
    v38 = (*v15 >> 3) & 7;
    if (v38)
    {
      if (v38 == 2)
      {
        v39 = 35;
      }
      else
      {
        if (v38 != 3)
        {
          MTLReleaseAssertionFailure();
LABEL_73:
          v63 = (GLDTransformFeedbackMachine *)MTLReleaseAssertionFailure();
          GLDTransformFeedbackMachine::GLDTransformFeedbackMachine(v63);
          return;
        }
        v39 = 39;
      }
    }
    else
    {
      v39 = 31;
    }
    if (v21 == 7)
      v39 = 39;
    *v18 = v39;
    *v20 = v67;
    *v19 = 1;
    *((_BYTE *)v72 + v69 + 300) = v21;
    v67 += 16;
    ++v69;
LABEL_29:
    ++v16;
    ++v18;
    ++v19;
    ++v20;
    v15 += 2;
    --v14;
  }
  while (v14);
  v45 = v74;
  v46 = (int *)v77;
  v47 = (int *)v76;
  v48 = v65;
  do
  {
    v50 = *v45++;
    v49 = v50;
    v52 = *v46;
    v46 += 2;
    v51 = v52;
    v54 = *v47;
    v47 += 2;
    v53 = v54;
    v55 = 4 * (v51 & 0x3F);
    if (v49)
      v56 = 0;
    else
      v56 = (v12 & 0xFFF) << 8;
    *v13 = v55 & 0xC00FFFFF | *v13 & 0xC0000000 | v56 & 0xC00FFFFF | ((v53 & 0x3FF) << 20) | 3;
    ++v13;
    --v48;
  }
  while (v48);
  this = v72;
  v57 = v69;
  if (!v11)
  {
LABEL_67:
    v80[0] = 16;
    v79[0] = 0;
    v78[0] = 0;
    v75[0] = 0;
    v11 = 1;
    v12 = 4;
  }
  v58 = 0;
  v59 = 0;
  v60 = (int *)((char *)this + 144);
  do
  {
    v61 = v79[v58];
    v62 = ((v78[v58] & 7) << 8) | (v75[v58] >> 2) | ((v80[v58] & 0x3F) << 14) | ((v61 & 7) << 11);
    v60[17] = ((v80[v58] & 0x3F) << 14) | ((v61 & 7) << 11) | v59;
    *v60++ = v62;
    v59 += v61 + 1;
    ++v58;
  }
  while (v11 != v58);
  *((_QWORD *)this + 257) = v12;
  *((_DWORD *)this + 74) = v57;
  *((_BYTE *)this + 208) = v11;
  *((_BYTE *)this + 210) = v59;
  *((_BYTE *)this + 140) = v11;
  *((_BYTE *)this + 142) = v12 >> 2;
}

void GLDTransformFeedbackMachine::GLDTransformFeedbackMachine(GLDTransformFeedbackMachine *this)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
}

uint64_t GLDTransformFeedbackMachine::beginQuery(GLDTransformFeedbackMachine *this, GLDQueryRec *a2)
{
  *((_QWORD *)this + 2) = a2;
  return GLDQueryRec::setCounter(a2, 0);
}

uint64_t GLDTransformFeedbackMachine::incrementPrimitiveCount(uint64_t this, GLDContextRec *a2, unsigned int a3, int a4, int a5)
{
  GLDQueryRec *v5;
  uint64_t v6;
  GLDContextRec *v7;

  if (a4)
  {
    if (a4 == 4)
    {
      a3 /= 3u;
    }
    else
    {
      if (a4 != 1)
      {
        v7 = (GLDContextRec *)MTLReleaseAssertionFailure();
        return GLDContextRec::setTranformFeedbackBuffers(v7);
      }
      a3 >>= 1;
    }
  }
  v5 = *(GLDQueryRec **)(this + 16);
  *(_QWORD *)(*(_QWORD *)(this + 8) + 24) = a3 * a5 + *(_DWORD *)(*(_QWORD *)(this + 8) + 24);
  if (v5)
  {
    v6 = GLDQueryRec::getCounter(v5) + a3 * a5;
    return GLDQueryRec::setCounter(v5, v6);
  }
  return this;
}

uint64_t GLDContextRec::setTranformFeedbackBuffers(uint64_t this)
{
  uint64_t v1;
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = this;
  for (i = 0; i != 4; ++i)
  {
    v3 = v1 + 8 * i;
    v4 = *(_QWORD *)(v3 + 3064);
    if (v4)
    {
      v5 = *(_QWORD *)(v3 + 3288);
      v6 = *(_QWORD *)(v4 + 40);
      GLRResourceList::addResource(*(_QWORD *)(v1 + 64), v4);
      this = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(v1 + 3456))(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 3448), v6, v5, i + 32);
    }
  }
  return this;
}

uint64_t GLDContextRec::updateTransfromFeedbackState(GLDContextRec *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  int v12;
  uint64_t v13;

  v3 = *((_QWORD *)this + 13);
  v2 = *((_QWORD *)this + 14);
  v4 = **(_QWORD **)(*(_QWORD *)(v2 + 408) + 24);
  *((_QWORD *)this + 420) = v4;
  if (*(__int16 *)(v3 + 15714) == -1)
  {
    if (*(_BYTE *)(v3 + 15713))
      *(_QWORD *)(v4 + 32) = 1;
  }
  else
  {
    if (!*(_QWORD *)(v4 + 32))
      *(_QWORD *)(v4 + 24) = 0;
    *(_QWORD *)(v4 + 32) = 0;
  }
  v5 = 0;
  v6 = v2 + 376;
  v7 = v3 + 15720;
  do
  {
    v8 = *(_QWORD *)(v7 + v5);
    if (*(_BYTE *)(*((_QWORD *)this + 13) + 15713))
      v9 = 0;
    else
      v9 = *(_QWORD *)(v6 + v5);
    v10 = (char *)this + v5;
    result = *(_QWORD *)((char *)this + v5 + 3064);
    if (result)
    {
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
      *((_QWORD *)v10 + 383) = 0;
      *((_QWORD *)v10 + 411) = 0;
    }
    if (!v9)
    {
      v8 = 0;
LABEL_21:
      *((_QWORD *)v10 + 383) = 0;
      goto LABEL_22;
    }
    v12 = **(_DWORD **)(v9 + 32);
    if (v12)
    {
      result = GLDBufferRec::update((GLDBufferRec *)v9, v12);
      if ((_DWORD)result)
        **(_DWORD **)(v9 + 32) = 0;
    }
    v13 = *(_QWORD *)(v9 + 40);
    if (!v13)
      goto LABEL_21;
    result = *(_QWORD *)(v13 + 24);
    *((_QWORD *)v10 + 383) = result;
    if (result)
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
LABEL_22:
    *(_QWORD *)((char *)this + v5 + 3288) = v8;
    v5 += 8;
  }
  while (v5 != 32);
  *((_DWORD *)this + 618) |= 0x10000u;
  return result;
}

uint64_t gldUpdateTransformFeedbackState(GLDContextRec *a1)
{
  GLDContextRec::updateTransfromFeedbackState(a1);
  return 0;
}

void GLDDeviceRec::getRenderPipelineStateFromKey(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_231053000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "GLDDevice failed to build pipeline state: %@", buf, 0xCu);
}

void GLDTextureRec::update(char a1, char a2)
{
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = "TEXTURE_GEOM_DIRTY_BIT";
  if ((a1 & 1) == 0)
    v2 = "";
  v3 = "TEXTURE_FORMAT_DIRTY_BIT";
  if ((a2 & 1) != 0)
    v3 = "";
  v4 = "TEXTURE_DATA_DIRTY_BIT";
  if ((a1 & 4) == 0)
    v4 = "";
  v6 = 136315906;
  v7 = v2;
  v5 = "TEXTURE_BUFFER_DIRTY_BIT";
  v8 = 2080;
  v9 = v3;
  v10 = 2080;
  v11 = v4;
  if ((a1 & 8) == 0)
    v5 = "";
  v12 = 2080;
  v13 = v5;
  _os_log_fault_impl(&dword_231053000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Dirty Bits          : %s %s %s %s\n", (uint8_t *)&v6, 0x2Au);
}

void GLDTextureRec::update(uint64_t a1)
{
  const char *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if ((**(_WORD **)(a1 + 48) & 0x800) != 0)
    v1 = "YES";
  else
    v1 = "NO";
  v2 = 136315138;
  v3 = v1;
  _os_log_fault_impl(&dword_231053000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "IOSurface           : %s\n", (uint8_t *)&v2, 0xCu);
}

{
  int v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 48) + 192);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl(&dword_231053000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Invalid Pixel Format: 0x%08x\n", (uint8_t *)v2, 8u);
}

void GLDContextRec::flushContextInternal()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_231053000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Terminating due to blacklisting by kernel driver", v0, 2u);
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x24BE02970]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDBBAE0](bundle, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BE0](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return MEMORY[0x24BDDD268]();
}

uint64_t MTLPixelFormatGetInfo()
{
  return MEMORY[0x24BDDD378]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

uint64_t MTLReleaseAssertionFailure()
{
  return MEMORY[0x24BDDD3E8]();
}

uint64_t MTLTextureSwizzleKeyToChannels()
{
  return MEMORY[0x24BDDD438]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t operator delete[]()
{
  return off_24FFEABB8();
}

void operator delete(void *__p)
{
  off_24FFEABC0(__p);
}

uint64_t operator delete()
{
  return off_24FFEABC8();
}

uint64_t operator new[]()
{
  return off_24FFEABD0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24FFEABD8(__sz);
}

uint64_t operator new()
{
  return off_24FFEABE0();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x24BDACBB8]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x24BDACBC8]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAD2B8](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x24BDAE108]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

uint64_t glgConvertType()
{
  return MEMORY[0x24BDE2DF0]();
}

uint64_t glgCreateProcessor()
{
  return MEMORY[0x24BDE2DF8]();
}

uint64_t glgDestroyProcessor()
{
  return MEMORY[0x24BDE2E00]();
}

uint64_t glgGetCompressedBlockHeight()
{
  return MEMORY[0x24BDE2E10]();
}

uint64_t glgProcessPixelsWithProcessor()
{
  return MEMORY[0x24BDE2E30]();
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

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

