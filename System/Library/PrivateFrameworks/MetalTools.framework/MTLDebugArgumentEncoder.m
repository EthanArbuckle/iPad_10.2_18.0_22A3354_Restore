@implementation MTLDebugArgumentEncoder

- (MTLDebugArgumentEncoder)initWithBaseObject:(id)a3 structType:(id)a4 parent:(id)a5
{
  MTLDebugArgumentEncoder *v6;
  MTLDebugArgumentEncoder *v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLDebugArgumentEncoder;
  v6 = -[MTLToolsObject initWithBaseObject:parent:](&v10, sel_initWithBaseObject_parent_, a3, a5);
  v7 = v6;
  if (a4 && v6)
  {
    v8 = (_QWORD *)operator new();
    v8[1] = 0;
    v8[2] = 0;
    *v8 = 0;
    v7->_reflectionParser = v8;
    StructType::initWithStructType((StructType *)v8, (MTLStructType *)a4);
  }
  return v7;
}

- (void)dealloc
{
  void *reflectionParser;
  objc_super v4;
  void **v5;

  reflectionParser = self->_reflectionParser;
  if (reflectionParser)
  {
    v5 = (void **)self->_reflectionParser;
    std::vector<MemberRef>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x22E309118](reflectionParser, 0x20C40960023A9);
    self->_reflectionParser = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugArgumentEncoder;
  -[MTLToolsObject dealloc](&v4, sel_dealloc);
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 elementIndex:(unint64_t)a5
{
  unint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  id v14;
  MTLBuffer *currentBuffer;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  -[MTLToolsArgumentEncoder device](self, "device");
  _MTLMessageContextBegin_();
  v9 = a4;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    v10 = objc_msgSend(a3, "storageMode");
    v11 = -[MTLToolsObject baseObject](self, "baseObject");
    if (v10)
    {
      v17 = MTLStorageModeString();
      _MTLMessageContextPush_();
    }
    v9 = a4;
    if (a5 != -1)
      v9 = a4 + objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodedLength") * a5;
    v12 = objc_msgSend(v11, "encodedLength", v17) + v9;
    if (v12 > objc_msgSend(a3, "length"))
    {
      v16 = objc_msgSend(v11, "encodedLength");
      v21 = objc_msgSend(a3, "length");
      _MTLMessageContextPush_();
      objc_msgSend(a3, "setIsContentExposedToCPU:", 1, v9, v16, v21);
    }
    else
    {
      objc_msgSend(a3, "setIsContentExposedToCPU:", 1, v18, v19, v20);
    }
  }
  _MTLMessageContextEnd();
  v13 = (void *)objc_msgSend(a3, "baseObject");
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  if (a5 == -1)
    objc_msgSend(v14, "setArgumentBuffer:offset:", v13, v9);
  else
    objc_msgSend(v14, "setArgumentBuffer:startOffset:arrayElement:", v13, a4, a5);
  self->_currentOffset = v9;
  currentBuffer = self->_currentBuffer;
  if (currentBuffer != a3)
  {

    self->_currentBuffer = (MTLBuffer *)v13;
  }
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  -[MTLDebugArgumentEncoder setArgumentBuffer:startOffset:elementIndex:](self, "setArgumentBuffer:startOffset:elementIndex:", a3, a4, -1);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLDevice *v9;
  StructType *reflectionParser;
  _MTLMessageContext v11;

  memset(&v11, 0, sizeof(v11));
  -[MTLToolsArgumentEncoder device](self, "device");
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
  {
    _MTLMessageContextPush_();
    if (a3)
      goto LABEL_3;
LABEL_10:
    if (a4)
      goto LABEL_8;
    goto LABEL_11;
  }
  if (!a3)
    goto LABEL_10;
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    _MTLMessageContextPush_();
    goto LABEL_11;
  }
  v9 = (MTLDevice *)objc_msgSend(a3, "device");
  if (v9 != -[MTLToolsArgumentEncoder device](self, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "length") <= a4)
  {
    objc_msgSend(a3, "length");
    goto LABEL_8;
  }
LABEL_11:
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a5, 3, &v11);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  unint64_t v11;
  MTLDevice *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  void *__p[3];
  _MTLMessageContext v21;
  _NSRange v22;

  length = a5.length;
  location = a5.location;
  v22 = a5;
  memset(&v21, 0, sizeof(v21));
  -[MTLToolsArgumentEncoder device](self, "device");
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v22.location, 3, &v21);
  std::vector<objc_object  {objcproto9MTLBuffer}*>::vector(__p, length);
  if (length)
  {
    v11 = 0;
    while (!a3[v11])
    {
      v15 = a4[v11];
      if (v15)
      {
        v14 = v11;
LABEL_15:
        v18 = v14;
        v19 = v15;
        _MTLMessageContextPush_();
      }
LABEL_17:
      v16 = objc_msgSend((id)a3[v11], "baseObject", v18, v19);
      *((_QWORD *)__p[0] + v11++) = v16;
      if (length == v11)
        goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = v11;
      _MTLMessageContextPush_();
      goto LABEL_17;
    }
    v12 = (MTLDevice *)objc_msgSend((id)a3[v11], "device");
    if (v12 != -[MTLToolsArgumentEncoder device](self, "device"))
    {
      v18 = v11;
      _MTLMessageContextPush_();
    }
    v13 = a4[v11];
    if (v13 < objc_msgSend((id)a3[v11], "length", v18))
      goto LABEL_17;
    v14 = a4[v11];
    v15 = objc_msgSend((id)a3[v11], "length");
    goto LABEL_15;
  }
LABEL_18:
  _MTLMessageContextEnd();
  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v17, "setBuffers:offsets:withRange:", __p[0], a4, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  StructType *reflectionParser;
  _MTLMessageContext v8;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a4, 1, &v8);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *__p[3];
  _MTLMessageContext v13;
  _NSRange v14;

  length = a4.length;
  location = a4.location;
  v14 = a4;
  memset(&v13, 0, sizeof(v13));
  -[MTLToolsArgumentEncoder device](self, "device");
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v14.location, 1, &v13);
  _MTLMessageContextEnd();
  std::vector<objc_object  {objcproto10MTLTexture}*>::vector(__p, length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v10 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v10;
    }
  }
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v11, "setTextures:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  StructType *reflectionParser;
  _MTLMessageContext v8;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a4, 2, &v8);
  if (a3 && (objc_msgSend((id)objc_msgSend(a3, "descriptor"), "supportArgumentBuffers") & 1) == 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  void *__p[3];
  _MTLMessageContext v14;
  _NSRange v15;

  length = a4.length;
  location = a4.location;
  v15 = a4;
  memset(&v14, 0, sizeof(v14));
  -[MTLToolsArgumentEncoder device](self, "device");
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v15.location, 2, &v14);
  std::vector<objc_object  {objcproto15MTLSamplerState}*>::vector(__p, length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v10 = (void *)a3[i];
      if (v10 && (objc_msgSend((id)objc_msgSend(v10, "descriptor"), "supportArgumentBuffers") & 1) == 0)
        _MTLMessageContextPush_();
      v11 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v11;
    }
  }
  _MTLMessageContextEnd();
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v12, "setSamplerStates:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  StructType *reflectionParser;
  _MTLMessageContext v7;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a3, 0, &v7);
  _MTLMessageContextEnd();
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "constantDataAtIndex:", a3);
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  StructType *reflectionParser;
  id v8;
  uint64_t v9;
  _MTLMessageContext v10;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a4, 5, &v10);
  if (a3)
  {
    if ((objc_msgSend((id)objc_msgSend(a3, "baseObject"), "supportIndirectCommandBuffers") & 1) == 0)
      _MTLMessageContextPush_();
    _MTLMessageContextEnd();
    v8 = -[MTLToolsObject baseObject](self, "baseObject");
    v9 = objc_msgSend(a3, "baseObject");
  }
  else
  {
    _MTLMessageContextEnd();
    v8 = -[MTLToolsObject baseObject](self, "baseObject");
    v9 = 0;
  }
  objc_msgSend(v8, "setRenderPipelineState:atIndex:", v9, a4);
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  NSUInteger v9;
  _QWORD *v10;
  void *v11;
  _MTLMessageContext v12;
  unint64_t v13;

  length = a4.length;
  location = a4.location;
  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0, a4.location, a4.length, *MEMORY[0x24BDAC8D0]);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v13, 5, &v12);
  if (length)
  {
    v9 = length;
    v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      if (*a3)
      {
        v11 = (void *)objc_msgSend((id)*a3, "baseObject");
        *v10 = v11;
        if ((objc_msgSend(v11, "supportIndirectCommandBuffers") & 1) == 0)
          _MTLMessageContextPush_();
      }
      else
      {
        *v10 = 0;
      }
      ++v10;
      ++a3;
      --v9;
    }
    while (v9);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineStates:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  StructType *reflectionParser;
  id v8;
  uint64_t v9;
  _MTLMessageContext v10;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a4, 6, &v10);
  if (a3)
  {
    if ((objc_msgSend((id)objc_msgSend(a3, "baseObject"), "supportIndirectCommandBuffers") & 1) == 0)
      _MTLMessageContextPush_();
    _MTLMessageContextEnd();
    v8 = -[MTLToolsObject baseObject](self, "baseObject");
    v9 = objc_msgSend(a3, "baseObject");
  }
  else
  {
    _MTLMessageContextEnd();
    v8 = -[MTLToolsObject baseObject](self, "baseObject");
    v9 = 0;
  }
  objc_msgSend(v8, "setComputePipelineState:atIndex:", v9, a4);
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  NSUInteger v9;
  _QWORD *v10;
  void *v11;
  _MTLMessageContext v12;
  unint64_t v13;

  length = a4.length;
  location = a4.location;
  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0, a4.location, a4.length, *MEMORY[0x24BDAC8D0]);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v13, 6, &v12);
  if (length)
  {
    v9 = length;
    v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      if (*a3)
      {
        v11 = (void *)objc_msgSend((id)*a3, "baseObject");
        *v10 = v11;
        if ((objc_msgSend(v11, "supportIndirectCommandBuffers") & 1) == 0)
          _MTLMessageContextPush_();
      }
      else
      {
        *v10 = 0;
      }
      ++v10;
      ++a3;
      --v9;
    }
    while (v9);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineStates:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  _MTLMessageContext v9;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  StructType::indexIsValueType((StructType *)self->_reflectionParser, a4, 7, &v9);
  _MTLMessageContextEnd();
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  if (a3)
    v8 = objc_msgSend(a3, "baseObject");
  else
    v8 = 0;
  objc_msgSend(v7, "setIndirectCommandBuffer:atIndex:", v8, a4);
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  NSUInteger v9;
  _QWORD *v10;
  void *v11;
  _MTLMessageContext v12;
  unint64_t v13;

  length = a4.length;
  location = a4.location;
  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0, a4.location, a4.length, *MEMORY[0x24BDAC8D0]);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v13, 7, &v12);
  _MTLMessageContextEnd();
  if (length)
  {
    v9 = length;
    v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v11 = (void *)*a3;
      if (*a3)
        v11 = (void *)objc_msgSend(v11, "baseObject");
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIndirectCommandBuffers:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  StructType *reflectionParser;
  _DWORD *MemberAtIndex;
  _DWORD *v7;
  uint64_t v8;
  void *v9;
  MTLDebugArgumentEncoder *v10;
  _MTLMessageContext v12;

  memset(&v12, 0, sizeof(v12));
  -[MTLToolsArgumentEncoder device](self, "device");
  _MTLMessageContextBegin_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
  {
    MemberAtIndex = StructType::findMemberAtIndex(reflectionParser, a3, 0, &v12);
    v7 = MemberAtIndex;
    if (!v12.var0 && !*((_QWORD *)MemberAtIndex + 3))
      _MTLMessageContextPush_();
  }
  else
  {
    v7 = 0;
  }
  _MTLMessageContextEnd();
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderForBufferAtIndex:", a3);
  if (!v8)
    return 0;
  v9 = (void *)v8;
  if (v7)
    v7 = (_DWORD *)*((_QWORD *)v7 + 3);
  v10 = -[MTLDebugArgumentEncoder initWithBaseObject:structType:parent:]([MTLDebugArgumentEncoder alloc], "initWithBaseObject:structType:parent:", v8, v7, self);

  return v10;
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  checkAccelerationStructure((uint64_t)self->super.super._device, a3, 1, (uint64_t)CFSTR("Acceleration structure"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setAccelerationStructure:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  StructType *reflectionParser;
  _MTLMessageContext v8;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a4, 8, &v8);
  _MTLMessageContextEnd();
  if (a3)
    a3 = (id)objc_msgSend(a3, "baseObject");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  NSUInteger v9;
  _QWORD *v10;
  void *v11;
  _MTLMessageContext v12;
  unint64_t v13;

  length = a4.length;
  location = a4.location;
  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0, a4.location, a4.length, *MEMORY[0x24BDAC8D0]);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v13, 8, &v12);
  _MTLMessageContextEnd();
  if (length)
  {
    v9 = length;
    v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v11 = (void *)*a3;
      if (*a3)
        v11 = (void *)objc_msgSend(v11, "baseObject");
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTables:withBufferRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  StructType *reflectionParser;
  _MTLMessageContext v8;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a4, 9, &v8);
  _MTLMessageContextEnd();
  if (a3)
    a3 = (id)objc_msgSend(a3, "baseObject");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  NSUInteger v9;
  _QWORD *v10;
  void *v11;
  _MTLMessageContext v12;
  unint64_t v13;

  length = a4.length;
  location = a4.location;
  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0, a4.location, a4.length, *MEMORY[0x24BDAC8D0]);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v13, 9, &v12);
  _MTLMessageContextEnd();
  if (length)
  {
    v9 = length;
    v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v11 = (void *)*a3;
      if (*a3)
        v11 = (void *)objc_msgSend(v11, "baseObject");
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTables:withBufferRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  StructType *reflectionParser;
  _MTLMessageContext v8;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a4, 8, &v8);
  _MTLMessageContextEnd();
  if (a3)
    a3 = (id)objc_msgSend(a3, "baseObject");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atIndex:", a3, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  NSUInteger v9;
  _QWORD *v10;
  void *v11;
  _MTLMessageContext v12;
  unint64_t v13;

  length = a4.length;
  location = a4.location;
  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0, a4.location, a4.length, *MEMORY[0x24BDAC8D0]);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v13, 8, &v12);
  _MTLMessageContextEnd();
  if (length)
  {
    v9 = length;
    v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v11 = (void *)*a3;
      if (*a3)
        v11 = (void *)objc_msgSend(v11, "baseObject");
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTables:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  StructType *reflectionParser;
  _MTLMessageContext v8;

  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexIsValueType(reflectionParser, a4, 9, &v8);
  _MTLMessageContextEnd();
  if (a3)
    a3 = (id)objc_msgSend(a3, "baseObject");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atIndex:", a3, a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  StructType *reflectionParser;
  NSUInteger v9;
  _QWORD *v10;
  void *v11;
  _MTLMessageContext v12;
  unint64_t v13;

  length = a4.length;
  location = a4.location;
  -[MTLToolsArgumentEncoder device](self, "device", 0, 0, 0, 0, 0, 0, 0, a4.location, a4.length, *MEMORY[0x24BDAC8D0]);
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
    _MTLMessageContextPush_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
    StructType::indexRangeIsValueType(reflectionParser, &v13, 9, &v12);
  _MTLMessageContextEnd();
  if (length)
  {
    v9 = length;
    v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v11 = (void *)*a3;
      if (*a3)
        v11 = (void *)objc_msgSend(v11, "baseObject");
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTables:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

@end
