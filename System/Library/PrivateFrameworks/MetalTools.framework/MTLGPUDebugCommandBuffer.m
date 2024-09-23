@implementation MTLGPUDebugCommandBuffer

- (MTLGPUDebugCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5
{
  MTLGPUDebugCommandBuffer *v5;
  MTLGPUDebugCommandBuffer *v6;
  MTLDevice *v7;
  int v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugCommandBuffer;
  v5 = -[MTLToolsCommandBuffer initWithCommandBuffer:parent:descriptor:](&v11, sel_initWithCommandBuffer_parent_descriptor_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = -[MTLToolsObject device](v5, "device");
    *((_QWORD *)v6 + 19) = (char *)v7 + 264;
    *((_QWORD *)v6 + 20) = (char *)v7 + 292;
    v8 = -[MTLDevice areWritableHeapsEnabled](v7, "areWritableHeapsEnabled");
    v9 = 3;
    if (!v8)
      v9 = 1;
    *((_QWORD *)v6 + 63) = v9;
    *((_BYTE *)v6 + 404) = objc_msgSend(*((id *)v6 + 3), "supportsTileShaders");
    *((_BYTE *)v6 + 405) = objc_msgSend(*((id *)v6 + 3), "supportsMeshShaders");
    *((_DWORD *)v6 + 64) = 0;
    *((_DWORD *)v6 + 65) = 0;
    *((_DWORD *)v6 + 100) = 0;
  }
  return v6;
}

- (void)_lateInit
{
  uint64_t v3;
  _OWORD *v4;
  int v5;
  char **v6;
  _OWORD *v7;
  unint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t i;
  void *v22;
  _BYTE *v23;
  uint64_t j;
  uint64_t k;

  if (!*((_BYTE *)self + 149))
  {
    *((_BYTE *)self + 149) = 1;
    v3 = *(_QWORD *)(*((_QWORD *)self + 19) + 20);
    if ((v3 & 0x810000) == 0x10000)
    {
      *((_QWORD *)self + 21) = objc_msgSend(*((id *)self + 3), "newStageBufferArgumentEncoder");
      v3 = *(_QWORD *)(*((_QWORD *)self + 19) + 20);
    }
    if ((v3 & 2) != 0)
    {
      *((_QWORD *)self + 22) = -[MTLGPUDebugCommandBuffer _newReportBuffer](self, "_newReportBuffer");
      *((_QWORD *)self + 23) = 0;
      *((_QWORD *)self + 24) = -[MTLGPUDebugCommandBuffer _newReportBuffer](self, "_newReportBuffer");
      *((_QWORD *)self + 25) = 0;
    }
    v4 = (_OWORD *)((char *)self + 232);
    *((_QWORD *)self + 29) = MetalBufferHeap::allocBuffer((std::mutex *)(*((_QWORD *)self + 3) + 112));
    *((_DWORD *)self + 60) = v5;
    v6 = (char **)((char *)self + 208);
    v7 = (_OWORD *)*((_QWORD *)self + 27);
    v8 = *((_QWORD *)self + 28);
    if ((unint64_t)v7 >= v8)
    {
      v10 = ((char *)v7 - *v6) >> 4;
      v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v12 = v8 - (_QWORD)*v6;
      if (v12 >> 3 > v11)
        v11 = v12 >> 3;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
        v13 = 0xFFFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      if (v13)
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)self + 224, v13);
      else
        v14 = 0;
      v15 = &v14[16 * v10];
      v16 = &v14[16 * v13];
      *(_OWORD *)v15 = *v4;
      v9 = v15 + 16;
      v18 = *v6;
      v17 = (char *)*((_QWORD *)self + 27);
      if (v17 != *v6)
      {
        do
        {
          v19 = *((_QWORD *)v17 - 2);
          v17 -= 16;
          v20 = *((_DWORD *)v17 + 2);
          *((_QWORD *)v15 - 2) = v19;
          v15 -= 16;
          *((_DWORD *)v15 + 2) = v20;
        }
        while (v17 != v18);
        v17 = *v6;
      }
      *v6 = v15;
      *((_QWORD *)self + 27) = v9;
      *((_QWORD *)self + 28) = v16;
      if (v17)
        operator delete(v17);
    }
    else
    {
      *v7 = *v4;
      v9 = v7 + 1;
    }
    *((_QWORD *)self + 27) = v9;
    if ((*(_QWORD *)(*((_QWORD *)self + 19) + 20) & 0x200000001) != 0)
    {
      for (i = 0; i != 32; i += 8)
      {
        v22 = (void *)objc_msgSend(*((id *)self + 3), "newInternalBufferWithLength:options:", 0x40000, 0);
        *(_QWORD *)((char *)self + i + 408) = v22;
        v23 = (_BYTE *)objc_msgSend(v22, "contents");
        *v23 |= 3u;
      }
      for (j = 0; j != 32; j += 8)
        *(_QWORD *)((char *)self + j + 440) = objc_msgSend(*((id *)self + 3), "newInternalBufferWithLength:options:", (*(_DWORD *)(*((_QWORD *)self + 19) + 16) << 18), 0);
      for (k = 0; k != 32; k += 8)
        *(_QWORD *)((char *)self + k + 472) = objc_msgSend(*((id *)self + 3), "newInternalBufferWithLength:options:", (*(_DWORD *)(*((_QWORD *)self + 19) + 16) << 19), 0);
    }
  }
}

- (int)resourceUsageForBuffer:(id)a3 stage:(unint64_t)a4
{
  id *v5;
  uint64_t v6;
  unsigned int v7;

  switch(a4)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 2uLL:
    case 4uLL:
      v5 = (id *)((char *)self + 416);
      break;
    case 8uLL:
      v5 = (id *)((char *)self + 424);
      break;
    default:
      if (a4 == 16)
        v5 = (id *)((char *)self + 432);
      else
LABEL_5:
        v5 = (id *)((char *)self + 408);
      break;
  }
  v6 = objc_msgSend(*v5, "contents");
  v7 = objc_msgSend(a3, "bufferIndex");
  return (*(unsigned __int8 *)(v6 + (v7 >> 2)) >> (2 * (v7 & 3))) & 3;
}

- (int)resourceUsageForTexture:(id)a3 stage:(unint64_t)a4
{
  id *v5;
  uint64_t v6;
  unsigned int v7;

  switch(a4)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 2uLL:
    case 4uLL:
      v5 = (id *)((char *)self + 448);
      break;
    case 8uLL:
      v5 = (id *)((char *)self + 456);
      break;
    default:
      if (a4 == 16)
        v5 = (id *)((char *)self + 464);
      else
LABEL_5:
        v5 = (id *)((char *)self + 440);
      break;
  }
  v6 = objc_msgSend(*v5, "contents");
  v7 = objc_msgSend(a3, "gpuIdentifier");
  return (*(unsigned __int8 *)(v6 + (v7 >> 2)) >> (2 * (v7 & 3))) & 3;
}

- (unint64_t)resourceTypeForTexture:(id)a3 stage:(unint64_t)a4
{
  id *v5;
  uint64_t v6;
  unsigned int v7;

  switch(a4)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 2uLL:
    case 4uLL:
      v5 = (id *)((char *)self + 480);
      break;
    case 8uLL:
      v5 = (id *)((char *)self + 488);
      break;
    default:
      if (a4 == 16)
        v5 = (id *)((char *)self + 496);
      else
LABEL_5:
        v5 = (id *)((char *)self + 472);
      break;
  }
  v6 = objc_msgSend(*v5, "contents");
  v7 = objc_msgSend(a3, "gpuIdentifier");
  return (*(unsigned __int8 *)(v6 + (v7 >> 1)) >> (4 * (v7 & 1))) & 0xF;
}

- (pair<id<MTLBuffer>,)_temporaryBufferWithLength:(unint64_t)a3
{
  std::mutex *v5;
  std::mutex **v6;
  void *MTLBuffer;
  uint64_t v8;
  unint64_t v9;
  int v10;
  char **v11;
  _OWORD *v12;
  unint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  pair<id<MTLBuffer>, unsigned long> result;

  v5 = (std::mutex *)((char *)self + 336);
  std::mutex::lock((std::mutex *)((char *)self + 336));
  v6 = (std::mutex **)((char *)self + 232);
  MTLBuffer = (void *)MetalBuffer::getMTLBuffer((MetalBuffer *)((char *)self + 232));
  v8 = *((_QWORD *)self + 31);
  v9 = (a3 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v8 + v9 > objc_msgSend(MTLBuffer, "length"))
  {
    *v6 = MetalBufferHeap::allocBuffer((std::mutex *)(-[MTLToolsObject device](self, "device") + 112));
    *((_DWORD *)self + 60) = v10;
    *((_QWORD *)self + 31) = 0;
    MTLBuffer = (void *)MetalBuffer::getMTLBuffer((MetalBuffer *)((char *)self + 232));
    v11 = (char **)((char *)self + 208);
    v12 = (_OWORD *)*((_QWORD *)self + 27);
    v13 = *((_QWORD *)self + 28);
    if ((unint64_t)v12 >= v13)
    {
      v15 = ((char *)v12 - *v11) >> 4;
      v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 60)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v17 = v13 - (_QWORD)*v11;
      if (v17 >> 3 > v16)
        v16 = v17 >> 3;
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
        v18 = 0xFFFFFFFFFFFFFFFLL;
      else
        v18 = v16;
      if (v18)
        v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)self + 224, v18);
      else
        v19 = 0;
      v20 = &v19[16 * v15];
      v21 = &v19[16 * v18];
      *(_OWORD *)v20 = *(_OWORD *)v6;
      v14 = v20 + 16;
      v23 = *v11;
      v22 = (char *)*((_QWORD *)self + 27);
      if (v22 != *v11)
      {
        do
        {
          v24 = *((_QWORD *)v22 - 2);
          v22 -= 16;
          v25 = *((_DWORD *)v22 + 2);
          *((_QWORD *)v20 - 2) = v24;
          v20 -= 16;
          *((_DWORD *)v20 + 2) = v25;
        }
        while (v22 != v23);
        v22 = *v11;
      }
      *v11 = v20;
      *((_QWORD *)self + 27) = v14;
      *((_QWORD *)self + 28) = v21;
      if (v22)
        operator delete(v22);
    }
    else
    {
      *v12 = *(_OWORD *)v6;
      v14 = v12 + 1;
    }
    *((_QWORD *)self + 27) = v14;
  }
  v26 = *((_QWORD *)self + 31);
  *((_QWORD *)self + 31) = v26 + v9;
  std::mutex::unlock(v5);
  v27 = MTLBuffer;
  v28 = v26;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

- (id)temporaryBufferWithLength:(unint64_t)a3
{
  _BOOL4 v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  MTLGPUDebugBuffer *v9;

  v5 = -[MTLToolsCommandBuffer useRetainedObjectsLock](self, "useRetainedObjectsLock");
  if (v5)
    v6 = (os_unfair_lock_s *)((char *)self + 400);
  else
    v6 = 0;
  if (v5)
    os_unfair_lock_lock((os_unfair_lock_t)self + 100);
  v7 = -[MTLGPUDebugCommandBuffer _temporaryBufferWithLength:](self, "_temporaryBufferWithLength:", a3);
  v9 = -[MTLGPUDebugBuffer initWithBuffer:device:offset:length:]([MTLGPUDebugBuffer alloc], "initWithBuffer:device:offset:length:", v7, *((_QWORD *)self + 3), v8, a3);
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", v9);

  if (v6)
    os_unfair_lock_unlock(v6);
  return v9;
}

- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4
{
  id v6;

  v6 = -[MTLGPUDebugCommandBuffer temporaryBufferWithLength:](self, "temporaryBufferWithLength:", a4);
  memcpy((void *)objc_msgSend(v6, "contents"), a3, a4);
  return v6;
}

- (void)markBuffer:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  char v5;
  char v6;
  int v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  char v12;

  v5 = a5;
  v6 = a4;
  v9 = *((unsigned __int8 *)self + 44);
  v10 = (os_unfair_lock_s *)((char *)self + 40);
  if (v9)
    v11 = v10;
  else
    v11 = 0;
  if (v9)
    os_unfair_lock_lock(v10);
  v12 = v6 & 7;
  if ((v5 & 1) != 0)
  if ((v5 & 6) != 0)
  if ((v5 & 8) != 0)
  if ((v5 & 0x10) != 0)
  if (v11)
    os_unfair_lock_unlock(v11);
}

- (void)markTexture:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  char v5;
  char v6;
  int v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  char v12;

  v5 = a5;
  v6 = a4;
  v9 = *((unsigned __int8 *)self + 44);
  v10 = (os_unfair_lock_s *)((char *)self + 40);
  if (v9)
    v11 = v10;
  else
    v11 = 0;
  if (v9)
    os_unfair_lock_lock(v10);
  v12 = v6 & 7;
  if ((v5 & 1) != 0)
  {
  }
  if ((v5 & 6) != 0)
  {
  }
  if ((v5 & 8) != 0)
  {
  }
  if ((v5 & 0x10) != 0)
  {
  }
  if (v11)
    os_unfair_lock_unlock(v11);
}

- (void)markHeap:(id)a3 stages:(unint64_t)a4
{
  -[MTLGPUDebugCommandBuffer markHeap:usage:stages:](self, "markHeap:usage:stages:", a3, 1, a4);
}

- (void)markHeap:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  _QWORD *v7;
  char *v8;
  char *v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  id *v19;
  __int128 v20;

  v7 = (_QWORD *)((char *)self + 504);
  v8 = (char *)*((_QWORD *)self + 64);
  v9 = (char *)*((_QWORD *)self + 65);
  v10 = v8;
  if (v8 != v9)
  {
    v10 = (char *)*((_QWORD *)self + 64);
    while (*(id *)v10 != a3)
    {
      v10 += 24;
      if (v10 == v9)
        goto LABEL_8;
    }
  }
  if (v10 == v9)
  {
LABEL_8:
    v12 = *v7 | a4;
    v13 = *((_QWORD *)self + 66);
    if ((unint64_t)v9 >= v13)
    {
      v15 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3) + 1;
      if (v15 > 0xAAAAAAAAAAAAAAALL)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - (_QWORD)v8) >> 3);
      if (2 * v16 > v15)
        v15 = 2 * v16;
      if (v16 >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v15;
      if (v17)
      {
        if (v17 > 0xAAAAAAAAAAAAAAALL)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v18 = (char *)operator new(24 * v17);
      }
      else
      {
        v18 = 0;
      }
      v19 = (id *)&v18[8 * ((v9 - v8) >> 3)];
      *v19 = a3;
      v19[1] = (id)a5;
      v19[2] = (id)v12;
      v14 = v19 + 3;
      if (v8 != v9)
      {
        do
        {
          v20 = *(_OWORD *)(v9 - 24);
          *(v19 - 1) = (id)*((_QWORD *)v9 - 1);
          *(_OWORD *)(v19 - 3) = v20;
          v19 -= 3;
          v9 -= 24;
        }
        while (v9 != v8);
        v8 = (char *)v7[1];
      }
      v7[1] = v19;
      v7[2] = v14;
      v7[3] = &v18[24 * v17];
      if (v8)
        operator delete(v8);
    }
    else
    {
      *(_QWORD *)v9 = a3;
      *((_QWORD *)v9 + 1) = a5;
      v14 = v9 + 24;
      *((_QWORD *)v9 + 2) = v12;
    }
    v7[2] = v14;
  }
  else
  {
    v11 = *((_QWORD *)v10 + 2) | a4;
    *((_QWORD *)v10 + 1) |= a5;
    *((_QWORD *)v10 + 2) = v11;
  }
}

- (id)encoderIdentifierForEncoderIndex:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  id result;

  v3 = *(_QWORD *)&a3;
  v4 = *((_QWORD *)self + 39);
  if (a3 >= (unint64_t)((*((_QWORD *)self + 40) - v4) >> 3))
  {
    result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), *(_QWORD *)&a3);
    if (result)
      return result;
  }
  else
  {
    result = *(id *)(v4 + 8 * a3);
    if (result)
      return result;
  }
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v3);
}

- (void)_checkReportBuffers
{
  uint64_t v2;
  FILE **v4;
  void *v5;
  MTLLogContainer *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)self + 36);
  v14 = *((_QWORD *)self + 37);
  if (v2 != v14)
  {
    v4 = (FILE **)MEMORY[0x24BDAC8D8];
    do
    {
      v5 = (void *)MEMORY[0x22E309364]();
      MTLGPUDebugReadReportBuffer(self, (unsigned int *)(objc_msgSend(*(id *)(v2 + 8), "contents") + *(_QWORD *)(v2 + 16)), *(_QWORD *)v2);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = -[MTLToolsCommandBuffer logs](self, "logs");
      v7 = -[MTLLogContainer countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
      {
        v8 = v7;
        v15 = v5;
        v9 = 0;
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (!objc_msgSend(v12, "type"))
            {
              if ((**((_BYTE **)self + 20) & 8) != 0)
              {
                fputs((const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String"), *v4);
              }
              else
              {
                v13 = MTLGPUDebugLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                  -[MTLLegacySVCommandBuffer _checkReportBuffers].cold.1(v20, v12, &v21, v13);
              }
              v9 = 1;
            }
          }
          v8 = -[MTLLogContainer countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        }
        while (v8);
        v5 = v15;
        if ((*(_DWORD *)&v9 & ((**((_BYTE **)self + 20) & 4) >> 2)) == 1)
          abort();
      }
      objc_autoreleasePoolPop(v5);
      v2 += 24;
    }
    while (v2 != v14);
  }
}

- (void)beginingEncoder:(id)a3 type:(unint64_t)a4
{
  uint64_t v7;

  v7 = *(_QWORD *)(*((_QWORD *)self + 19) + 20);
  if ((v7 & 2) != 0)
  {
    std::mutex::lock((std::mutex *)((char *)self + 336));
    -[MTLGPUDebugCommandBuffer _encodeReportBuffer:type:](self, "_encodeReportBuffer:type:", a3, a4);
    std::mutex::unlock((std::mutex *)((char *)self + 336));
    v7 = *(_QWORD *)(*((_QWORD *)self + 19) + 20);
  }
  if ((v7 & 0x200000001) != 0)
    -[MTLGPUDebugCommandBuffer encodeResourceTableBuffers:type:](self, "encodeResourceTableBuffers:type:", a3, a4);
}

- (void)endingEncoder:(id)a3 type:(unint64_t)a4
{
  std::mutex *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v7 = (std::mutex *)((char *)self + 336);
  std::mutex::lock((std::mutex *)((char *)self + 336));
  if ((*(_BYTE *)(*((_QWORD *)self + 19) + 20) & 2) != 0)
  {
    v8 = objc_msgSend(a3, "encoderID");
    v9 = v8;
    if (v8 >= (unint64_t)((uint64_t)(*((_QWORD *)self + 40) - *((_QWORD *)self + 39)) >> 3))
      std::vector<objc_object  {objcproto9MTLBuffer}*>::resize((uint64_t)self + 312, (unint64_t)((float)(v8 + 1) * 1.5));
    v10 = (id)objc_msgSend(a3, "label");
    if (a4 == 3)
    {
      v11 = objc_msgSend(*((id *)a3 + 1), "label");
      if (v11)
      {

        v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@:%@"), v11, v10);
      }
    }
    *(_QWORD *)(*((_QWORD *)self + 39) + 8 * v9) = v10;
  }
  ++*((_DWORD *)self + 64);
  std::mutex::unlock(v7);
}

- (void)beginUseOfMeshShadersInEncoder:(id)a3
{
  std::mutex *v5;

  if ((*(_BYTE *)(*((_QWORD *)self + 19) + 20) & 2) != 0)
  {
    v5 = (std::mutex *)((char *)self + 336);
    std::mutex::lock((std::mutex *)((char *)self + 336));
    if (*((_BYTE *)self + 406))
    {
      *((_BYTE *)self + 406) = 0;
      -[MTLGPUDebugCommandBuffer _allocReportEntryStorageForType:](self, "_allocReportEntryStorageForType:", 8);
      -[MTLGPUDebugCommandBuffer _allocReportEntryStorageForType:](self, "_allocReportEntryStorageForType:", 7, 0);
      objc_msgSend(a3, "setObjectReportBuffer:offset:", 0, 0);
      objc_msgSend(a3, "setMeshReportBuffer:offset:", 0, 0);
    }
    std::mutex::unlock(v5);
  }
}

- (id)encodeBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5 resultOffset:(unint64_t *)a6
{
  NSUInteger length;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v19;

  length = a5.length;
  v10 = -[MTLGPUDebugCommandBuffer _temporaryBufferWithLength:](self, "_temporaryBufferWithLength:", objc_msgSend(*((id *)self + 21), "encodedLength", a3, a4, a5.location));
  v12 = v11;
  std::mutex::lock((std::mutex *)((char *)self + 336));
  v19 = (void *)v10;
  objc_msgSend(*((id *)self + 21), "setArgumentBuffer:offset:", v10, v12);
  if (length)
  {
    for (i = 0; length != i; ++i)
    {
      v14 = (void *)a3[i];
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (void *)*((_QWORD *)self + 21);
          v16 = objc_msgSend(v14, "baseObject");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*((id *)self + 21), "setVisibleFunctionTable:atIndex:", objc_msgSend(v14, "baseObject"), i);
            continue;
          }
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v15 = (void *)*((_QWORD *)self + 21);
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v15, "setIntersectionFunctionTable:atIndex:", objc_msgSend(v14, "baseObject"), i);
            continue;
          }
          v16 = objc_msgSend(v14, "baseObject");
        }
        objc_msgSend(v15, "setBuffer:offset:atIndex:", v16, a4[i], i);
      }
    }
  }
  *a6 = v12;
  std::mutex::unlock((std::mutex *)((char *)self + 336));
  return v19;
}

- (id)_newReportBuffer
{
  void *v3;
  MTLGPUDebugBuffer *v4;

  v3 = (void *)objc_msgSend(*((id *)self + 3), "newInternalBufferWithLength:options:", 7360, 0);
  v4 = -[MTLGPUDebugBuffer initWithBuffer:device:offset:length:track:]([MTLGPUDebugBuffer alloc], "initWithBuffer:device:offset:length:track:", v3, *((_QWORD *)self + 3), 0, objc_msgSend(v3, "length"), 0);

  return v4;
}

- (ReportBufferEntry)_allocReportEntryStorageForType:(SEL)a3
{
  int *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  unint64_t v11;
  ReportBufferEntry *result;
  void **v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  ReportBufferEntry **v28;
  unint64_t v29;
  ReportBufferEntry *v30;
  ReportBufferEntry *v31;
  ReportBufferEntry *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  ReportBufferEntry *v37;
  __int128 v38;

  v7 = &OBJC_IVAR___MTLGPUDebugCommandBuffer__vertexComputeReportBuffer;
  if (a4 == 2)
    v7 = &OBJC_IVAR___MTLGPUDebugCommandBuffer__fragmentReportBuffer;
  v8 = *v7;
  v9 = &OBJC_IVAR___MTLGPUDebugCommandBuffer__vertexComputeReportOffset;
  if (a4 == 2)
    v9 = &OBJC_IVAR___MTLGPUDebugCommandBuffer__fragmentReportOffset;
  v10 = *v9;
  v11 = *(_QWORD *)((char *)self + v10) + 736;
  result = (ReportBufferEntry *)objc_msgSend(*(id *)((char *)self + v8), "length");
  if (v11 <= (unint64_t)result)
  {
    v17 = *(_QWORD *)((char *)self + v10);
  }
  else
  {
    v13 = (void **)((char *)self + 264);
    v14 = (_QWORD *)*((_QWORD *)self + 34);
    v15 = *((_QWORD *)self + 35);
    if ((unint64_t)v14 >= v15)
    {
      v18 = ((char *)v14 - (_BYTE *)*v13) >> 3;
      if ((unint64_t)(v18 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v19 = v15 - (_QWORD)*v13;
      v20 = v19 >> 2;
      if (v19 >> 2 <= (unint64_t)(v18 + 1))
        v20 = v18 + 1;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
        v21 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v21 = v20;
      if (v21)
        v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)self + 280, v21);
      else
        v22 = 0;
      v23 = &v22[8 * v18];
      v24 = &v22[8 * v21];
      *(_QWORD *)v23 = *(_QWORD *)((char *)self + v8);
      v16 = v23 + 8;
      v26 = (char *)*v13;
      v25 = (char *)*((_QWORD *)self + 34);
      if (v25 != *v13)
      {
        do
        {
          v27 = *((_QWORD *)v25 - 1);
          v25 -= 8;
          *((_QWORD *)v23 - 1) = v27;
          v23 -= 8;
        }
        while (v25 != v26);
        v25 = (char *)*v13;
      }
      *v13 = v23;
      *((_QWORD *)self + 34) = v16;
      *((_QWORD *)self + 35) = v24;
      if (v25)
        operator delete(v25);
    }
    else
    {
      *v14 = *(_QWORD *)((char *)self + v8);
      v16 = v14 + 1;
    }
    *((_QWORD *)self + 34) = v16;
    result = -[MTLGPUDebugCommandBuffer _newReportBuffer](self, "_newReportBuffer");
    v17 = 0;
    *(_QWORD *)((char *)self + v8) = result;
    *(_QWORD *)((char *)self + v10) = 0;
  }
  retstr->var1 = *(id *)((char *)self + v8);
  retstr->var2 = v17;
  retstr->var0 = a4;
  *(_QWORD *)((char *)self + v10) = v17 + 736;
  v28 = (ReportBufferEntry **)((char *)self + 288);
  v30 = (ReportBufferEntry *)*((_QWORD *)self + 37);
  v29 = (unint64_t)v28[2];
  if ((unint64_t)v30 >= v29)
  {
    v32 = *v28;
    v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v30 - (char *)*v28) >> 3);
    v34 = v33 + 1;
    if (v33 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v35 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29 - (_QWORD)v32) >> 3);
    if (2 * v35 > v34)
      v34 = 2 * v35;
    if (v35 >= 0x555555555555555)
      v36 = 0xAAAAAAAAAAAAAAALL;
    else
      v36 = v34;
    if (v36)
    {
      if (v36 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      result = (ReportBufferEntry *)operator new(24 * v36);
    }
    else
    {
      result = 0;
    }
    v37 = result + v33;
    *(_OWORD *)&v37->var0 = *(_OWORD *)&retstr->var0;
    v37->var2 = retstr->var2;
    v31 = v37 + 1;
    if (v30 != v32)
    {
      do
      {
        v38 = *(_OWORD *)&v30[-1].var0;
        v37[-1].var2 = v30[-1].var2;
        *(_OWORD *)&v37[-1].var0 = v38;
        --v37;
        --v30;
      }
      while (v30 != v32);
      v30 = *v28;
    }
    *v28 = v37;
    v28[1] = v31;
    v28[2] = &result[v36];
    if (v30)
      operator delete(v30);
  }
  else
  {
    *(_OWORD *)&v30->var0 = *(_OWORD *)&retstr->var0;
    v30->var2 = retstr->var2;
    v31 = v30 + 1;
  }
  v28[1] = v31;
  return result;
}

- (void)encodeResourceTableBuffers:(id)a3 type:(unint64_t)a4
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  if (a4 == 3)
  {
LABEL_4:
    v5 = (_QWORD *)((char *)self + 408);
    v6 = (_QWORD *)((char *)self + 440);
    v7 = (_QWORD *)((char *)self + 472);
    objc_msgSend(a3, "setBufferUsageTable:textureUsageTable:textureTypeTable:forStage:", *((_QWORD *)self + 51), *((_QWORD *)self + 55), *((_QWORD *)self + 59), 1);
    objc_msgSend(a3, "setBufferUsageTable:textureUsageTable:textureTypeTable:forStage:", v5[1], v6[1], v7[1], 2);
    objc_msgSend(a3, "setBufferUsageTable:textureUsageTable:textureTypeTable:forStage:", v5[2], v6[2], v7[2], 8);
    objc_msgSend(a3, "setBufferUsageTable:textureUsageTable:textureTypeTable:forStage:", v5[3], v6[3], v7[3], 16);
    return;
  }
  if (a4 != 1)
  {
    if (a4)
      return;
    goto LABEL_4;
  }
  objc_msgSend(a3, "setBufferUsageTable:textureUsageTable:textureTypeTable:", *((_QWORD *)self + 51), *((_QWORD *)self + 55), *((_QWORD *)self + 59));
}

- (void)_encodeReportBuffer:(id)a3 type:(unint64_t)a4
{
  if (a4 == 3)
  {
LABEL_4:
    if (self)
    {
      -[MTLGPUDebugCommandBuffer _allocReportEntryStorageForType:](self, "_allocReportEntryStorageForType:", 1);
      -[MTLGPUDebugCommandBuffer _allocReportEntryStorageForType:](self, "_allocReportEntryStorageForType:", 2);
    }
    objc_msgSend(a3, "setVertexReportBuffer:offset:", 0, 0);
    objc_msgSend(a3, "setFragmentReportBuffer:offset:", 0, 0);
    if (*((_BYTE *)self + 404))
    {
      -[MTLGPUDebugCommandBuffer _allocReportEntryStorageForType:](self, "_allocReportEntryStorageForType:", 2);
      objc_msgSend(a3, "setTileReportBuffer:offset:", 0, 0);
    }
    if (*((_BYTE *)self + 405))
      *((_BYTE *)self + 406) = 1;
    return;
  }
  if (a4 != 1)
  {
    if (a4)
      return;
    goto LABEL_4;
  }
  if (self)
    -[MTLGPUDebugCommandBuffer _allocReportEntryStorageForType:](self, "_allocReportEntryStorageForType:", 3);
  objc_msgSend(a3, "setKernelReportBuffer:offset:", 0, 0);
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  MTLGPUDebugRenderCommandEncoder *v5;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  v5 = -[MTLGPUDebugRenderCommandEncoder initWithRenderCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "renderCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3)), self, a3, *((unsigned int *)self + 64));
  -[MTLGPUDebugCommandBuffer beginingEncoder:type:](self, "beginingEncoder:type:", v5, 0);
  return v5;
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  MTLGPUDebugRenderCommandEncoder *v9;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  v9 = -[MTLGPUDebugRenderCommandEncoder initWithRenderCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3), a4, a5), self, a3, *((unsigned int *)self + 64));
  -[MTLGPUDebugCommandBuffer beginingEncoder:type:](self, "beginingEncoder:type:", v9, 0);
  return v9;
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  return -[MTLGPUDebugParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:encoderID:]([MTLGPUDebugParallelRenderCommandEncoder alloc], "initWithParallelRenderCommandEncoder:parent:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "parallelRenderCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3)), self, a3, *((unsigned int *)self + 64));
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  MTLGPUDebugComputeCommandEncoder *v5;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  v5 = -[MTLGPUDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "computeCommandEncoderWithDispatchType:", a3), self, 0, *((unsigned int *)self + 64));
  -[MTLGPUDebugCommandBuffer beginingEncoder:type:](self, "beginingEncoder:type:", v5, 1);
  return v5;
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  MTLGPUDebugComputeCommandEncoder *v9;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  v9 = -[MTLGPUDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:", a3, a4, a5), self, 0, *((unsigned int *)self + 64));
  -[MTLGPUDebugCommandBuffer beginingEncoder:type:](self, "beginingEncoder:type:", v9, 1);
  return v9;
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  MTLGPUDebugComputeCommandEncoder *v5;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  v5 = -[MTLGPUDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "computeCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:", a3)), self, a3, *((unsigned int *)self + 64));
  -[MTLGPUDebugCommandBuffer beginingEncoder:type:](self, "beginingEncoder:type:", v5, 1);
  return v5;
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  MTLGPUDebugComputeCommandEncoder *v9;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  v9 = -[MTLGPUDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:", -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:", a3), a4, a5), self, a3, *((unsigned int *)self + 64));
  -[MTLGPUDebugCommandBuffer beginingEncoder:type:](self, "beginingEncoder:type:", v9, 1);
  return v9;
}

- (id)computeCommandEncoder
{
  return -[MTLGPUDebugCommandBuffer computeCommandEncoderWithDispatchType:](self, "computeCommandEncoderWithDispatchType:", 0);
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  return -[MTLGPUDebugCommandBuffer sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:](self, "sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:", 0, a3, a4);
}

- (id)blitCommandEncoder
{
  MTLGPUDebugBlitCommandEncoder *v3;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  v3 = -[MTLGPUDebugBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:encoderID:]([MTLGPUDebugBlitCommandEncoder alloc], "initWithBlitCommandEncoder:parent:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "blitCommandEncoder"), self, 0, *((unsigned int *)self + 64));
  -[MTLGPUDebugCommandBuffer beginingEncoder:type:](self, "beginingEncoder:type:", v3, 2);
  return v3;
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  MTLGPUDebugBlitCommandEncoder *v5;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  v5 = -[MTLGPUDebugBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:encoderID:]([MTLGPUDebugBlitCommandEncoder alloc], "initWithBlitCommandEncoder:parent:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "blitCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLBlitPassDescriptor:](self, "unwrapMTLBlitPassDescriptor:", a3)), self, a3, *((unsigned int *)self + 64));
  -[MTLGPUDebugCommandBuffer beginingEncoder:type:](self, "beginingEncoder:type:", v5, 2);
  return v5;
}

- (id)accelerationStructureCommandEncoder
{
  id result;

  result = (id)objc_msgSend(*((id *)self + 2), "accelerationStructureCommandEncoder");
  if (result)
    return -[MTLGPUDebugAccelerationStructureCommandEncoder initWithAccelerationStructureCommandEncoder:parent:accelerationStructurePassDescriptor:]([MTLGPUDebugAccelerationStructureCommandEncoder alloc], "initWithAccelerationStructureCommandEncoder:parent:accelerationStructurePassDescriptor:", result, self, 0);
  return result;
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  id result;

  -[MTLGPUDebugCommandBuffer _lateInit](self, "_lateInit");
  result = (id)objc_msgSend(*((id *)self + 2), "accelerationStructureCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLAccelerationStructurePassDescriptor:](self, "unwrapMTLAccelerationStructurePassDescriptor:", a3));
  if (result)
    return -[MTLGPUDebugAccelerationStructureCommandEncoder initWithAccelerationStructureCommandEncoder:parent:accelerationStructurePassDescriptor:]([MTLGPUDebugAccelerationStructureCommandEncoder alloc], "initWithAccelerationStructureCommandEncoder:parent:accelerationStructurePassDescriptor:", result, self, a3);
  return result;
}

- (void)addResidencySetGPUDebug:(id)a3 fromEncoder:(id)a4
{
  unint64_t v4;
  char *v6;
  unint64_t v7;
  int8x8_t v8;
  uint8x8_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *i;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  _QWORD *v18;
  _QWORD *j;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  float v23;
  float v24;
  _BOOL4 v25;
  unint64_t v26;
  unint64_t v27;
  int8x8_t prime;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  uint8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  int8x8_t v43;
  uint8x8_t v44;
  unint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  unint64_t v48;
  _QWORD *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  id v54;
  _QWORD v55[2];
  char v56;

  v54 = a3;
  v6 = (char *)self + 576;
  v7 = objc_msgSend(a4, "hash");
  v8 = *(int8x8_t *)(v6 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8(v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v10 = v7;
      if (v7 >= *(_QWORD *)&v8)
        v10 = v7 % *(_QWORD *)&v8;
    }
    else
    {
      v10 = (*(_QWORD *)&v8 - 1) & v7;
    }
    v11 = *(_QWORD **)(*(_QWORD *)v6 + 8 * v10);
    if (v11)
    {
      for (i = (_QWORD *)*v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v7 == v13)
        {
          if (i[2] == v7)
            goto LABEL_90;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= *(_QWORD *)&v8)
              v13 %= *(_QWORD *)&v8;
          }
          else
          {
            v13 &= *(_QWORD *)&v8 - 1;
          }
          if (v13 != v10)
            break;
        }
      }
    }
  }
  v14 = objc_msgSend(a4, "hash");
  v15 = v14;
  v51 = 0u;
  v52 = 0u;
  LODWORD(v53) = 1065353216;
  v16 = *((_QWORD *)v6 + 1);
  if (v16)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      v4 = v14;
      if (v14 >= v16)
        v4 = v14 % v16;
    }
    else
    {
      v4 = (v16 - 1) & v14;
    }
    v18 = *(_QWORD **)(*(_QWORD *)v6 + 8 * v4);
    if (v18)
    {
      for (j = (_QWORD *)*v18; j; j = (_QWORD *)*j)
      {
        v20 = j[1];
        if (v20 == v14)
        {
          if (j[2] == v14)
            goto LABEL_89;
        }
        else
        {
          if (v17.u32[0] > 1uLL)
          {
            if (v20 >= v16)
              v20 %= v16;
          }
          else
          {
            v20 &= v16 - 1;
          }
          if (v20 != v4)
            break;
        }
      }
    }
  }
  v21 = operator new(0x40uLL);
  v22 = v6 + 16;
  v55[0] = v21;
  v55[1] = v6 + 16;
  *v21 = 0;
  v21[1] = v15;
  v21[2] = v15;
  std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::__hash_table((uint64_t)(v21 + 3), (uint64_t *)&v51);
  v56 = 1;
  v23 = (float)(unint64_t)(*((_QWORD *)v6 + 3) + 1);
  v24 = *((float *)v6 + 8);
  if (v16 && (float)(v24 * (float)v16) >= v23)
    goto LABEL_80;
  v25 = (v16 & (v16 - 1)) == 0;
  if (v16 < 3)
    v25 = 0;
  v26 = (2 * v16) | !v25;
  v27 = vcvtps_u32_f32(v23 / v24);
  if (v26 <= v27)
    prime = (int8x8_t)v27;
  else
    prime = (int8x8_t)v26;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
  }
  v16 = *((_QWORD *)v6 + 1);
  if (*(_QWORD *)&prime > v16)
    goto LABEL_46;
  if (*(_QWORD *)&prime < v16)
  {
    v35 = vcvtps_u32_f32((float)*((unint64_t *)v6 + 3) / *((float *)v6 + 8));
    if (v16 < 3 || (v36 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
    {
      v35 = std::__next_prime(v35);
    }
    else
    {
      v37 = 1 << -(char)__clz(v35 - 1);
      if (v35 >= 2)
        v35 = v37;
    }
    if (*(_QWORD *)&prime <= v35)
      prime = (int8x8_t)v35;
    if (*(_QWORD *)&prime >= v16)
    {
      v16 = *((_QWORD *)v6 + 1);
    }
    else
    {
      if (prime)
      {
LABEL_46:
        if (*(_QWORD *)&prime >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v29 = operator new(8 * *(_QWORD *)&prime);
        v30 = *(void **)v6;
        *(_QWORD *)v6 = v29;
        if (v30)
          operator delete(v30);
        v31 = 0;
        *((int8x8_t *)v6 + 1) = prime;
        do
          *(_QWORD *)(*(_QWORD *)v6 + 8 * v31++) = 0;
        while (*(_QWORD *)&prime != v31);
        v32 = (_QWORD *)*v22;
        if (*v22)
        {
          v33 = v32[1];
          v34 = (uint8x8_t)vcnt_s8(prime);
          v34.i16[0] = vaddlv_u8(v34);
          if (v34.u32[0] > 1uLL)
          {
            if (v33 >= *(_QWORD *)&prime)
              v33 %= *(_QWORD *)&prime;
          }
          else
          {
            v33 &= *(_QWORD *)&prime - 1;
          }
          *(_QWORD *)(*(_QWORD *)v6 + 8 * v33) = v22;
          v38 = (_QWORD *)*v32;
          if (*v32)
          {
            do
            {
              v39 = v38[1];
              if (v34.u32[0] > 1uLL)
              {
                if (v39 >= *(_QWORD *)&prime)
                  v39 %= *(_QWORD *)&prime;
              }
              else
              {
                v39 &= *(_QWORD *)&prime - 1;
              }
              if (v39 != v33)
              {
                if (!*(_QWORD *)(*(_QWORD *)v6 + 8 * v39))
                {
                  *(_QWORD *)(*(_QWORD *)v6 + 8 * v39) = v32;
                  goto LABEL_71;
                }
                *v32 = *v38;
                *v38 = **(_QWORD **)(*(_QWORD *)v6 + 8 * v39);
                **(_QWORD **)(*(_QWORD *)v6 + 8 * v39) = v38;
                v38 = v32;
              }
              v39 = v33;
LABEL_71:
              v32 = v38;
              v38 = (_QWORD *)*v38;
              v33 = v39;
            }
            while (v38);
          }
        }
        v16 = (unint64_t)prime;
        goto LABEL_75;
      }
      v50 = *(void **)v6;
      *(_QWORD *)v6 = 0;
      if (v50)
        operator delete(v50);
      v16 = 0;
      *((_QWORD *)v6 + 1) = 0;
    }
  }
LABEL_75:
  if ((v16 & (v16 - 1)) != 0)
  {
    if (v15 >= v16)
      v4 = v15 % v16;
    else
      v4 = v15;
  }
  else
  {
    v4 = (v16 - 1) & v15;
  }
LABEL_80:
  v40 = *(_QWORD **)(*(_QWORD *)v6 + 8 * v4);
  if (v40)
  {
    *(_QWORD *)v55[0] = *v40;
    *v40 = v55[0];
  }
  else
  {
    *(_QWORD *)v55[0] = *((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v55[0];
    *(_QWORD *)(*(_QWORD *)v6 + 8 * v4) = v22;
    if (*(_QWORD *)v55[0])
    {
      v41 = *(_QWORD *)(*(_QWORD *)v55[0] + 8);
      if ((v16 & (v16 - 1)) != 0)
      {
        if (v41 >= v16)
          v41 %= v16;
      }
      else
      {
        v41 &= v16 - 1;
      }
      *(_QWORD *)(*(_QWORD *)v6 + 8 * v41) = v55[0];
    }
  }
  v55[0] = 0;
  ++*((_QWORD *)v6 + 3);
LABEL_89:
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v51);
LABEL_90:
  v42 = objc_msgSend(a4, "hash", v51, v52, v53);
  v43 = *(int8x8_t *)(v6 + 8);
  if (!*(_QWORD *)&v43)
    goto LABEL_106;
  v44 = (uint8x8_t)vcnt_s8(v43);
  v44.i16[0] = vaddlv_u8(v44);
  if (v44.u32[0] > 1uLL)
  {
    v45 = v42;
    if (v42 >= *(_QWORD *)&v43)
      v45 = v42 % *(_QWORD *)&v43;
  }
  else
  {
    v45 = (*(_QWORD *)&v43 - 1) & v42;
  }
  v46 = *(_QWORD **)(*(_QWORD *)v6 + 8 * v45);
  if (!v46 || (v47 = (_QWORD *)*v46) == 0)
LABEL_106:
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  while (1)
  {
    v48 = v47[1];
    if (v48 == v42)
      break;
    if (v44.u32[0] > 1uLL)
    {
      if (v48 >= *(_QWORD *)&v43)
        v48 %= *(_QWORD *)&v43;
    }
    else
    {
      v48 &= *(_QWORD *)&v43 - 1;
    }
    if (v48 != v45)
      goto LABEL_106;
LABEL_105:
    v47 = (_QWORD *)*v47;
    if (!v47)
      goto LABEL_106;
  }
  if (v47[2] != v42)
    goto LABEL_105;
  v49 = v47 + 3;
  *(_QWORD *)&v51 = objc_msgSend(v54, "hash");
  if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>(v49, (unint64_t *)&v51))
  {
    *(_QWORD *)&v51 = objc_msgSend(v54, "hash");
    std::__hash_table<std::__hash_value_type<unsigned long long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLGPUDebugResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLGPUDebugResidencySet *>>>::__emplace_unique_impl<unsigned long,MTLGPUDebugResidencySet *&>(v49, (uint64_t *)&v51, (uint64_t *)&v54);
  }
}

- (void)useResidencySet:(id)a3
{
  objc_super v5;
  id v6;
  uint64_t v7;

  if ((*(_QWORD *)(*((_QWORD *)self + 19) + 20) & 0x200000001) != 0)
  {
    v7 = objc_msgSend(a3, "hash");
    if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>((_QWORD *)self + 67, (unint64_t *)&v7))
    {
      v6 = a3;
      v7 = objc_msgSend(a3, "hash");
      std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *>((uint64_t)self + 536, (unint64_t *)&v7, &v7, (uint64_t *)&v6);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugCommandBuffer;
  -[MTLToolsCommandBuffer useResidencySet:](&v5, sel_useResidencySet_, a3);
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  const void **v8;
  unint64_t v9;
  objc_super v10;
  uint64_t v11;
  id v12;

  if ((*(_QWORD *)(*((_QWORD *)self + 19) + 20) & 0x200000001) != 0 && a4 != 0)
  {
    v8 = a3;
    v9 = a4;
    do
    {
      v12 = (id)*v8;
      v11 = objc_msgSend(v12, "hash");
      if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>((_QWORD *)self + 67, (unint64_t *)&v11))
      {
        v11 = objc_msgSend(v12, "hash");
        std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *&>((uint64_t)self + 536, (unint64_t *)&v11, &v11, (uint64_t *)&v12);
      }
      ++v8;
      --v9;
    }
    while (v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)MTLGPUDebugCommandBuffer;
  -[MTLToolsCommandBuffer useResidencySets:count:](&v10, sel_useResidencySets_count_, a3, a4);
}

- (void)preCommit
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _QWORD *j;
  _QWORD *k;
  _QWORD *m;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t n;
  uint64_t v16;
  _QWORD *ii;
  uint64_t v18;
  _QWORD *jj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  char *v37;
  objc_super v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[7];
  _QWORD v48[6];
  _QWORD v49[6];
  __int128 v50;
  __int128 v51;
  char *v52;
  uint64_t v53;
  char *v54;
  _QWORD v55[6];
  _QWORD v56[6];
  __int128 v57;
  __int128 v58;
  char *v59;
  uint64_t v60;
  char *v61;
  _QWORD v62[6];
  _QWORD v63[6];
  __int128 v64;
  __int128 v65;
  char *v66;
  uint64_t v67;
  char *v68;
  _QWORD v69[6];
  _QWORD v70[6];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  if ((*(_QWORD *)(*((_QWORD *)self + 19) + 20) & 0x200000001) != 0)
  {
    v64 = 0u;
    v65 = 0u;
    LODWORD(v66) = 1065353216;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v3 = (void *)-[MTLCommandQueue residencySetsArray](-[MTLToolsCommandBuffer commandQueue](self, "commandQueue"), "residencySetsArray");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v72, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v44 != v5)
            objc_enumerationMutation(v3);
          *(_QWORD *)&v57 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          *(_QWORD *)&v50 = objc_msgSend((id)v57, "hash");
          if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>(&v64, (unint64_t *)&v50))
          {
            *(_QWORD *)&v50 = objc_msgSend((id)v57, "hash");
            std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *&>((uint64_t)&v64, (unint64_t *)&v50, &v50, (uint64_t *)&v57);
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v72, 16);
      }
      while (v4);
    }
    for (j = (_QWORD *)*((_QWORD *)self + 69); j; j = (_QWORD *)*j)
    {
      *(_QWORD *)&v57 = j[3];
      *(_QWORD *)&v50 = objc_msgSend((id)v57, "hash");
      if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>(&v64, (unint64_t *)&v50))
      {
        *(_QWORD *)&v50 = objc_msgSend((id)v57, "hash");
        std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *&>((uint64_t)&v64, (unint64_t *)&v50, &v50, (uint64_t *)&v57);
      }
    }
    for (k = (_QWORD *)*((_QWORD *)self + 74); k; k = (_QWORD *)*k)
    {
      for (m = (_QWORD *)k[5]; m; m = (_QWORD *)*m)
      {
        *(_QWORD *)&v57 = m[3];
        *(_QWORD *)&v50 = objc_msgSend((id)v57, "hash");
        if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>(&v64, (unint64_t *)&v50))
        {
          *(_QWORD *)&v50 = objc_msgSend((id)v57, "hash");
          std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *&>((uint64_t)&v64, (unint64_t *)&v50, &v50, (uint64_t *)&v57);
        }
      }
    }
    v57 = 0u;
    v58 = 0u;
    LODWORD(v59) = 1065353216;
    v50 = 0u;
    v51 = 0u;
    LODWORD(v52) = 1065353216;
    v10 = (_QWORD *)v65;
    if ((_QWORD)v65)
    {
      do
      {
        v11 = (void *)v10[3];
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v12 = (void *)objc_msgSend(v11, "allCommittedAllocations");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v71, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v40;
          do
          {
            for (n = 0; n != v13; ++n)
            {
              if (*(_QWORD *)v40 != v14)
                objc_enumerationMutation(v12);
              v16 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * n);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v47[0] = v16;
                std::__hash_table<_MTLResource *,std::hash<_MTLResource *>,std::equal_to<_MTLResource *>,std::allocator<_MTLResource *>>::__emplace_unique_key_args<_MTLResource *,_MTLResource *>((uint64_t)&v57, v47, v47);
              }
              else
              {
                v47[0] = v16;
                std::__hash_table<_MTLHeap *,std::hash<_MTLHeap *>,std::equal_to<_MTLHeap *>,std::allocator<_MTLHeap *>>::__emplace_unique_key_args<_MTLHeap *,_MTLHeap *>((uint64_t)&v50, v47, v47);
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v71, 16);
          }
          while (v13);
        }
        v10 = (_QWORD *)*v10;
      }
      while (v10);
      for (ii = (_QWORD *)v58; ii; ii = (_QWORD *)*ii)
      {
        v18 = ii[2];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[MTLGPUDebugCommandBuffer markBuffer:usage:stages:](self, "markBuffer:usage:stages:", v18, 3, 31);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[MTLGPUDebugCommandBuffer markTexture:usage:stages:](self, "markTexture:usage:stages:", v18, 3, 31);
        }
      }
    }
    for (jj = (_QWORD *)v51; jj; jj = (_QWORD *)*jj)
      -[MTLGPUDebugCommandBuffer markHeap:usage:stages:](self, "markHeap:usage:stages:", jj[2], 3, 31);
    std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v50);
    std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v57);
    std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v64);
    if ((*(_QWORD *)(*((_QWORD *)self + 19) + 20) & 0x200000001) != 0)
    {
      v20 = *((_QWORD *)self + 64);
      v21 = *((_QWORD *)self + 65);
      if (v20 != v21)
      {
        v37 = (char *)self + 464;
        v36 = (char *)self + 496;
        v22 = MEMORY[0x24BDAC760];
        do
        {
          v23 = *(_QWORD *)(v20 + 8);
          if ((v23 & 1) != 0)
          {
            v24 = *(void **)v20;
            v70[0] = v22;
            v70[1] = 3221225472;
            v70[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke;
            v70[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v70[4] = (char *)self + 408;
            v70[5] = v20;
            objc_msgSend(v24, "enumerateBufferIndices:", v70);
            v25 = *(void **)v20;
            v69[0] = v22;
            v69[1] = 3221225472;
            v69[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_2;
            v69[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v69[4] = (char *)self + 408;
            v69[5] = v20;
            objc_msgSend(v25, "enumerateAccelerationStructureIndices:", v69);
            v26 = *(void **)v20;
            *(_QWORD *)&v64 = v22;
            *((_QWORD *)&v64 + 1) = 3221225472;
            *(_QWORD *)&v65 = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_3;
            *((_QWORD *)&v65 + 1) = &__block_descriptor_56_e12_v20__0_v8I16l;
            v66 = (char *)self + 440;
            v67 = v20;
            v68 = (char *)self + 472;
            objc_msgSend(v26, "enumerateTextureIndicesAndTypes:", &v64);
            v23 = *(_QWORD *)(v20 + 8);
          }
          if ((v23 & 6) != 0)
          {
            v27 = *(void **)v20;
            v63[0] = v22;
            v63[1] = 3221225472;
            v63[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_4;
            v63[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v63[4] = (char *)self + 416;
            v63[5] = v20;
            objc_msgSend(v27, "enumerateBufferIndices:", v63);
            v28 = *(void **)v20;
            v62[0] = v22;
            v62[1] = 3221225472;
            v62[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_5;
            v62[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v62[4] = (char *)self + 416;
            v62[5] = v20;
            objc_msgSend(v28, "enumerateAccelerationStructureIndices:", v62);
            v29 = *(void **)v20;
            *(_QWORD *)&v57 = v22;
            *((_QWORD *)&v57 + 1) = 3221225472;
            *(_QWORD *)&v58 = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_6;
            *((_QWORD *)&v58 + 1) = &__block_descriptor_56_e12_v20__0_v8I16l;
            v59 = (char *)self + 448;
            v60 = v20;
            v61 = (char *)self + 480;
            objc_msgSend(v29, "enumerateTextureIndicesAndTypes:", &v57);
            v23 = *(_QWORD *)(v20 + 8);
          }
          if ((v23 & 8) != 0)
          {
            v30 = *(void **)v20;
            v56[0] = v22;
            v56[1] = 3221225472;
            v56[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_7;
            v56[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v56[4] = (char *)self + 424;
            v56[5] = v20;
            objc_msgSend(v30, "enumerateBufferIndices:", v56);
            v31 = *(void **)v20;
            v55[0] = v22;
            v55[1] = 3221225472;
            v55[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_8;
            v55[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v55[4] = (char *)self + 424;
            v55[5] = v20;
            objc_msgSend(v31, "enumerateAccelerationStructureIndices:", v55);
            v32 = *(void **)v20;
            *(_QWORD *)&v50 = v22;
            *((_QWORD *)&v50 + 1) = 3221225472;
            *(_QWORD *)&v51 = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_9;
            *((_QWORD *)&v51 + 1) = &__block_descriptor_56_e12_v20__0_v8I16l;
            v52 = (char *)self + 456;
            v53 = v20;
            v54 = (char *)self + 488;
            objc_msgSend(v32, "enumerateTextureIndicesAndTypes:", &v50);
            v23 = *(_QWORD *)(v20 + 8);
          }
          if ((v23 & 0x10) != 0)
          {
            v33 = *(void **)v20;
            v49[0] = v22;
            v49[1] = 3221225472;
            v49[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_10;
            v49[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v49[4] = (char *)self + 432;
            v49[5] = v20;
            objc_msgSend(v33, "enumerateBufferIndices:", v49);
            v34 = *(void **)v20;
            v48[0] = v22;
            v48[1] = 3221225472;
            v48[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_11;
            v48[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v48[4] = (char *)self + 432;
            v48[5] = v20;
            objc_msgSend(v34, "enumerateAccelerationStructureIndices:", v48);
            v35 = *(void **)v20;
            v47[0] = v22;
            v47[1] = 3221225472;
            v47[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_12;
            v47[3] = &__block_descriptor_56_e12_v20__0_v8I16l;
            v47[4] = (char *)self + 464;
            v47[5] = v20;
            v47[6] = (char *)self + 496;
            objc_msgSend(v35, "enumerateTextureIndicesAndTypes:", v47);
          }
          v20 += 24;
        }
        while (v20 != v21);
      }
    }
  }
  v38.receiver = self;
  v38.super_class = (Class)MTLGPUDebugCommandBuffer;
  -[MTLToolsCommandBuffer preCommit](&v38, sel_preCommit, v36, v37);
}

- (void)preCompletionHandlers
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  MetalBuffer *v7;
  MetalBuffer *v8;
  objc_super v9;

  if ((*(_BYTE *)(*((_QWORD *)self + 19) + 20) & 2) != 0)
    -[MTLGPUDebugCommandBuffer _checkReportBuffers](self, "_checkReportBuffers");
  v3 = 0;
  v4 = (char *)self + 408;
  do
  {

    *(_QWORD *)&v4[v3] = 0;
    v3 += 8;
  }
  while (v3 != 32);
  v5 = 0;
  v6 = (char *)self + 440;
  do
  {

    *(_QWORD *)&v6[v5] = 0;
    v5 += 8;
  }
  while (v5 != 32);
  v7 = (MetalBuffer *)*((_QWORD *)self + 26);
  v8 = (MetalBuffer *)*((_QWORD *)self + 27);
  if (v7 != v8)
  {
    do
      MetalBuffer::free(v7++);
    while (v7 != v8);
    v7 = (MetalBuffer *)*((_QWORD *)self + 26);
  }
  *((_QWORD *)self + 27) = v7;
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugCommandBuffer;
  -[MTLToolsCommandBuffer preCompletionHandlers](&v9, sel_preCompletionHandlers);
}

- (void)dealloc
{
  void **v3;
  void **v4;
  void *v5;
  void **v6;
  void **v7;
  void *v8;
  MetalBuffer *v9;
  MetalBuffer *v10;
  objc_super v11;

  v3 = (void **)*((_QWORD *)self + 33);
  v4 = (void **)*((_QWORD *)self + 34);
  while (v3 != v4)
  {
    v5 = *v3++;

  }
  v6 = (void **)*((_QWORD *)self + 39);
  v7 = (void **)*((_QWORD *)self + 40);
  while (v6 != v7)
  {
    v8 = *v6++;

  }
  v9 = (MetalBuffer *)*((_QWORD *)self + 26);
  v10 = (MetalBuffer *)*((_QWORD *)self + 27);
  if (v9 != v10)
  {
    do
      MetalBuffer::free(v9++);
    while (v9 != v10);
    v9 = (MetalBuffer *)*((_QWORD *)self + 26);
  }
  *((_QWORD *)self + 27) = v9;
  *((_QWORD *)self + 37) = *((_QWORD *)self + 36);
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugCommandBuffer;
  -[MTLToolsCommandBuffer dealloc](&v11, sel_dealloc);
}

- (void).cxx_destruct
{
  void **v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void **)((char *)self + 576);
  v4 = (_QWORD *)*((_QWORD *)self + 74);
  if (v4)
  {
    do
    {
      v5 = (_QWORD *)*v4;
      std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)(v4 + 3));
      operator delete(v4);
      v4 = v5;
    }
    while (v5);
  }
  v6 = *v3;
  *v3 = 0;
  if (v6)
    operator delete(v6);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)self + 536);
  v7 = (void *)*((_QWORD *)self + 64);
  if (v7)
  {
    *((_QWORD *)self + 65) = v7;
    operator delete(v7);
  }
  for (i = 24; i != -8; i -= 8)
  for (j = 24; j != -8; j -= 8)
  for (k = 24; k != -8; k -= 8)
  std::mutex::~mutex((std::mutex *)((char *)self + 336));
  v11 = (void *)*((_QWORD *)self + 39);
  if (v11)
  {
    *((_QWORD *)self + 40) = v11;
    operator delete(v11);
  }
  v12 = (void *)*((_QWORD *)self + 36);
  if (v12)
  {
    *((_QWORD *)self + 37) = v12;
    operator delete(v12);
  }
  v13 = (void *)*((_QWORD *)self + 33);
  if (v13)
  {
    *((_QWORD *)self + 34) = v13;
    operator delete(v13);
  }
  v14 = (void *)*((_QWORD *)self + 26);
  if (v14)
  {
    *((_QWORD *)self + 27) = v14;
    operator delete(v14);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_DWORD *)self + 60) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 37) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 42) = 850045863;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((_QWORD *)self + 49) = 0;
  *((_QWORD *)self + 65) = 0;
  *((_QWORD *)self + 66) = 0;
  *((_QWORD *)self + 64) = 0;
  *(_OWORD *)((char *)self + 536) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *((_DWORD *)self + 142) = 1065353216;
  *((_OWORD *)self + 36) = 0u;
  *((_OWORD *)self + 37) = 0u;
  *((_DWORD *)self + 152) = 1065353216;
  return self;
}

@end
