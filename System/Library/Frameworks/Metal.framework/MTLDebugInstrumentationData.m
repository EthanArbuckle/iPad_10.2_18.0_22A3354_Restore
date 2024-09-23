@implementation MTLDebugInstrumentationData

- (MTLDebugInstrumentationData)initWithData:(id)a3
{
  return -[MTLDebugInstrumentationData initWithData:linkedDynamicLibraries:](self, "initWithData:linkedDynamicLibraries:", a3, 0);
}

- (MTLDebugInstrumentationData)initWithData:(id)a3 linkedDynamicLibraries:(id)a4
{
  MTLDebugInstrumentationData *v6;
  MTLDebugInstrumentationData *v7;
  const void **p_data;
  const char *data;
  uint64_t v10;
  unint64_t v11;
  const __CFAllocator *v12;
  const __CFAllocator *v13;
  _DWORD *v14;
  unint64_t v15;
  uint64_t v16;
  MTLDebugLocation *v17;
  unsigned int *v18;
  unint64_t v19;
  uint64_t v20;
  MTLDebugSubProgram *v21;
  size_t v22;
  size_t size_ptr;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MTLDebugInstrumentationData;
  v6 = -[MTLDebugInstrumentationData init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    size_ptr = 0;
    p_data = &v6->_data;
    v6->_dataMap = (OS_dispatch_data *)dispatch_data_create_map((dispatch_data_t)a3, &v6->_data, &size_ptr);
    std::vector<__CFString const*>::resize((uint64_t)&v7->_strings, *((unsigned int *)v7->_data + 2));
    data = (const char *)v7->_data;
    if (*((_DWORD *)data + 2))
    {
      v10 = 0;
      v11 = 0;
      v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
      do
      {
        v7->_strings.__begin_[v10] = (__CFString *)CFStringCreateWithCStringNoCopy(v12, &data[*((unsigned int *)data + 3)+ 8+ v10 * 8+ *(unsigned int *)&data[v10 * 8+ 12+ *((unsigned int *)data + 3)]], 0x8000100u, v13);
        ++v11;
        data = (const char *)*p_data;
        ++v10;
      }
      while (v11 < *((unsigned int *)*p_data + 2));
    }
    std::vector<__CFString const*>::resize((uint64_t)&v7->_debugLocations, *((unsigned int *)data + 4));
    v14 = v7->_data;
    if (v14[4])
    {
      v15 = 0;
      v16 = 16;
      do
      {
        v17 = objc_alloc_init(MTLDebugLocation);
        v17->_data = v7;
        v17->_debugLoc = (DebugLocation *)((char *)v7->_data + v16 + *((unsigned int *)v7->_data + 5));
        v7->_debugLocations.__begin_[v15++] = (__end_ *)v17;
        v14 = v7->_data;
        v16 += 16;
      }
      while (v15 < v14[4]);
    }
    std::vector<__CFString const*>::resize((uint64_t)&v7->_debugSubPrograms, v14[6]);
    v18 = (unsigned int *)v7->_data;
    if (v18[6])
    {
      v19 = 0;
      v20 = 24;
      do
      {
        v21 = objc_alloc_init(MTLDebugSubProgram);
        v21->_data = v7;
        v21->_debugSubProgram = (DebugSubProgram *)((char *)v7->_data + v20 + *((unsigned int *)v7->_data + 7));
        v7->_debugSubPrograms.__begin_[v19++] = (__end_ *)v21;
        v18 = (unsigned int *)v7->_data;
        v20 += 12;
      }
      while (v19 < v18[6]);
    }
    if (v18[10])
    {
      v7->_globalConstantsData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", (char *)v7->_data + *((unsigned int *)v7->_data + 11) + 40, *((unsigned int *)v7->_data + 10), 0);
      v18 = (unsigned int *)v7->_data;
    }
    v22 = v18[12];
    if ((_DWORD)v22)
      v7->_userReflectionData = (OS_dispatch_data *)dispatch_data_create((char *)v18 + v18[13] + 48, v22, 0, 0);
    v7->_linkedDynamicLibraries = (NSArray *)a4;
  }
  return v7;
}

- (id)stringForID:(unsigned int)a3
{
  __CFString **begin;

  begin = self->_strings.__begin_;
  if (a3 >= (unint64_t)(self->_strings.__end_ - begin))
    return 0;
  else
    return begin[a3];
}

- (id)debugLocationForID:(unsigned int)a3
{
  __end_ **begin;

  begin = self->_debugLocations.__begin_;
  if (a3 >= (unint64_t)(self->_debugLocations.var0 - begin))
    return 0;
  else
    return begin[a3];
}

- (id)debugSubProgramForID:(unsigned int)a3
{
  __end_ **begin;

  begin = self->_debugSubPrograms.__begin_;
  if (a3 >= (unint64_t)(self->_debugSubPrograms.var0 - begin))
    return 0;
  else
    return begin[a3];
}

- (id)globalConstantsData
{
  return self->_globalConstantsData;
}

- (id)userReflectionData
{
  return self->_userReflectionData;
}

- (id)linkedDynamicLibraries
{
  return self->_linkedDynamicLibraries;
}

- (void)releaseLinkedDynamicLibraries
{

  self->_linkedDynamicLibraries = 0;
}

- (BOOL)hasGlobalConstantsInstrumentationFailures
{
  return (*((unsigned __int8 *)self->_data + 72) >> 1) & 1;
}

- (BOOL)hasArgumentBufferInstrumentationFailures
{
  return (*((unsigned __int8 *)self->_data + 72) >> 2) & 1;
}

- (BOOL)hasArgumentLimitsInstrumentationFailures
{
  return *((_BYTE *)self->_data + 72) & 1;
}

- (unsigned)threadgroupArgumentOffset
{
  return *((_DWORD *)self->_data + 14);
}

- (unsigned)activeThreadgroupMask
{
  return *((_DWORD *)self->_data + 15);
}

- (unint64_t)bufferAccessMask
{
  return *((_QWORD *)self->_data + 8);
}

- (void)dealloc
{
  __CFString **begin;
  __CFString **end;
  const void *v5;
  __end_ **v6;
  __end_cap_ **var0;
  void *v8;
  __end_ **v9;
  __end_cap_ **v10;
  void *v11;
  NSObject *userReflectionData;
  NSObject *dataMap;
  objc_super v14;

  begin = self->_strings.__begin_;
  end = self->_strings.__end_;
  while (begin != end)
  {
    v5 = *begin++;
    CFRelease(v5);
  }
  v6 = self->_debugLocations.__begin_;
  var0 = self->_debugLocations.var0;
  while (v6 != var0)
  {
    v8 = *v6++;
    objc_msgSend(v8, "releaseInternal");
  }
  v9 = self->_debugSubPrograms.__begin_;
  v10 = self->_debugSubPrograms.var0;
  while (v9 != v10)
  {
    v11 = *v9++;
    objc_msgSend(v11, "releaseInternal");
  }

  userReflectionData = self->_userReflectionData;
  if (userReflectionData)
    dispatch_release(userReflectionData);
  dataMap = self->_dataMap;
  if (dataMap)
    dispatch_release(dataMap);

  v14.receiver = self;
  v14.super_class = (Class)MTLDebugInstrumentationData;
  -[MTLDebugInstrumentationData dealloc](&v14, sel_dealloc);
}

- (void).cxx_destruct
{
  __end_ **begin;
  __end_ **v4;
  __CFString **v5;

  begin = self->_debugSubPrograms.__begin_;
  if (begin)
  {
    self->_debugSubPrograms.var0 = begin;
    operator delete(begin);
  }
  v4 = self->_debugLocations.__begin_;
  if (v4)
  {
    self->_debugLocations.var0 = v4;
    operator delete(v4);
  }
  v5 = self->_strings.__begin_;
  if (v5)
  {
    self->_strings.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end
