@implementation AGXA10FamilyIndirectArgumentEncoder

- (AGXA10FamilyIndirectArgumentEncoder)initWithLayout:(id)a3 device:(id)a4
{
  AGXA10FamilyIndirectArgumentEncoder *result;
  IndirectArgumentLayout *v7;
  unint64_t *v8;
  unint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AGXA10FamilyIndirectArgumentEncoder;
  result = -[_MTLIndirectArgumentEncoder initWithLayout:device:](&v10, sel_initWithLayout_device_);
  if (result)
  {
    v7 = (IndirectArgumentLayout *)*((_QWORD *)a3 + 2);
    result->_impl.device = (AGXA10FamilyDevice *)a4;
    result->_impl.layout = v7;
    v8 = (unint64_t *)((char *)a4 + 824);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 | 0x800, v8));
  }
  return result;
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  IndirectArgumentEncoder *p_impl;
  id v7;
  unint64_t v8;

  p_impl = &self->_impl;
  if (self->_impl.current_argument_buffer != a3)
  {
    v7 = a3;

    p_impl->current_argument_buffer = (AGXA10FamilyBuffer *)a3;
  }
  if (a3)
    v8 = *(_QWORD *)((char *)a3 + *MEMORY[0x24BE51650] + 24) + a4;
  else
    v8 = 0;
  p_impl->arguments = (char *)v8;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  IndirectArgumentLayout *layout;
  uint64_t *v6;
  unsigned int v7;
  uint64_t v8;
  char *arguments;
  unint64_t v10;

  layout = self->_impl.layout;
  v6 = (uint64_t *)*((_QWORD *)layout + 6);
  if (!v6)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v7 = *((_DWORD *)v6 + 7);
      if (v7 <= a5)
        break;
      v6 = (uint64_t *)*v6;
      if (!v6)
        goto LABEL_7;
    }
    if (v7 >= a5)
      break;
    v6 = (uint64_t *)v6[1];
    if (!v6)
      goto LABEL_7;
  }
  v8 = *((unsigned int *)v6 + 8);
  arguments = self->_impl.arguments;
  if (a3)
  {
    v10 = *(_QWORD *)((char *)a3 + *MEMORY[0x24BE51650] + 8) + a4;
    *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)&arguments[v8] = v10;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  uint64_t v5;
  int *v6;
  IndirectArgumentLayout *layout;
  uint64_t *v8;
  char *v9;
  unsigned int v10;
  uint64_t v11;
  char *arguments;

  if (LODWORD(a5.length))
  {
    v5 = 0;
    v6 = (int *)MEMORY[0x24BE51650];
    do
    {
      layout = self->_impl.layout;
      v8 = (uint64_t *)*((_QWORD *)layout + 6);
      if (!v8)
LABEL_14:
        abort();
      v9 = (char *)a3[v5];
      while (1)
      {
        while (1)
        {
          v10 = *((_DWORD *)v8 + 7);
          if (v10 <= LODWORD(a5.location))
            break;
          v8 = (uint64_t *)*v8;
          if (!v8)
            goto LABEL_14;
        }
        if (v10 >= LODWORD(a5.location))
          break;
        v8 = (uint64_t *)v8[1];
        if (!v8)
          goto LABEL_14;
      }
      v11 = *((unsigned int *)v8 + 8);
      arguments = self->_impl.arguments;
      if (v9)
      {
        v9 = (char *)(*(_QWORD *)&v9[*v6 + 8] + a4[v5]);
        *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
      }
      *(_QWORD *)&arguments[v11] = v9;
      ++v5;
      ++LODWORD(a5.location);
    }
    while (v5 != LODWORD(a5.length));
  }
}

- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  IndirectArgumentLayout *layout;
  uint64_t *v5;
  unsigned int v6;
  uint64_t v7;
  char *arguments;
  uint64_t v9;

  layout = self->_impl.layout;
  v5 = (uint64_t *)*((_QWORD *)layout + 6);
  if (!v5)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v6 = *((_DWORD *)v5 + 7);
      if (v6 <= a4)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    if (v6 >= a4)
      break;
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_7;
  }
  v7 = *((unsigned int *)v5 + 8);
  arguments = self->_impl.arguments;
  if (a3)
  {
    v9 = *(_QWORD *)((char *)a3 + *MEMORY[0x24BE51650] + 8);
    *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)&arguments[v7] = v9;
}

- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  int *v5;
  IndirectArgumentLayout *layout;
  uint64_t *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  char *arguments;

  if (a4.length)
  {
    v4 = 0;
    v5 = (int *)MEMORY[0x24BE51650];
    do
    {
      layout = self->_impl.layout;
      v7 = (uint64_t *)*((_QWORD *)layout + 6);
      if (!v7)
LABEL_14:
        abort();
      v8 = (char *)a3[v4];
      v9 = v4 + LODWORD(a4.location);
      while (1)
      {
        while (1)
        {
          v10 = *((_DWORD *)v7 + 7);
          if (v10 <= v9)
            break;
          v7 = (uint64_t *)*v7;
          if (!v7)
            goto LABEL_14;
        }
        if (v10 >= v9)
          break;
        v7 = (uint64_t *)v7[1];
        if (!v7)
          goto LABEL_14;
      }
      v11 = *((unsigned int *)v7 + 8);
      arguments = self->_impl.arguments;
      if (v8)
      {
        v8 = *(char **)&v8[*v5 + 8];
        *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
      }
      *(_QWORD *)&arguments[v11] = v8;
      ++v4;
    }
    while (v4 != a4.length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  IndirectArgumentLayout *layout;
  uint64_t *v5;
  unsigned int v6;
  uint64_t v7;
  char *arguments;
  uint64_t v9;

  layout = self->_impl.layout;
  v5 = (uint64_t *)*((_QWORD *)layout + 6);
  if (!v5)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v6 = *((_DWORD *)v5 + 7);
      if (v6 <= a4)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    if (v6 >= a4)
      break;
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_7;
  }
  v7 = *((unsigned int *)v5 + 8);
  arguments = self->_impl.arguments;
  if (a3)
  {
    v9 = *(_QWORD *)((char *)a3 + *MEMORY[0x24BE51650] + 8);
    *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)&arguments[v7] = v9;
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  uint64_t v4;
  int *v5;
  IndirectArgumentLayout *layout;
  uint64_t *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  char *arguments;

  if (a4.length)
  {
    v4 = 0;
    v5 = (int *)MEMORY[0x24BE51650];
    do
    {
      layout = self->_impl.layout;
      v7 = (uint64_t *)*((_QWORD *)layout + 6);
      if (!v7)
LABEL_14:
        abort();
      v8 = (char *)a3[v4];
      v9 = v4 + LODWORD(a4.location);
      while (1)
      {
        while (1)
        {
          v10 = *((_DWORD *)v7 + 7);
          if (v10 <= v9)
            break;
          v7 = (uint64_t *)*v7;
          if (!v7)
            goto LABEL_14;
        }
        if (v10 >= v9)
          break;
        v7 = (uint64_t *)v7[1];
        if (!v7)
          goto LABEL_14;
      }
      v11 = *((unsigned int *)v7 + 8);
      arguments = self->_impl.arguments;
      if (v8)
      {
        v8 = *(char **)&v8[*v5 + 8];
        *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
      }
      *(_QWORD *)&arguments[v11] = v8;
      ++v4;
    }
    while (v4 != a4.length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLIndirectArgumentEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AGXA10FamilyIndirectArgumentEncoder;
    -[IOGPUMetalIndirectArgumentEncoder setIntersectionFunctionTable:atBufferIndex:](&v7, sel_setIntersectionFunctionTable_atBufferIndex_, a3, a4);
  }
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLIndirectArgumentEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXA10FamilyIndirectArgumentEncoder;
    -[IOGPUMetalIndirectArgumentEncoder setIntersectionFunctionTables:withBufferRange:](&v8, sel_setIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLDevice requiresRaytracingEmulation](-[_MTLIndirectArgumentEncoder device](self, "device", a3, a4), "requiresRaytracingEmulation");
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  AGX::IndirectArgumentEncoderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setTexture((uint64_t)&self->_impl, (uint64_t)a3, a4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t length_low;
  unsigned int location;
  IndirectArgumentEncoder *p_impl;
  uint64_t v8;

  length_low = LODWORD(a4.length);
  if (LODWORD(a4.length))
  {
    location = a4.location;
    p_impl = &self->_impl;
    do
    {
      v8 = (uint64_t)*a3++;
      AGX::IndirectArgumentEncoderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setTexture((uint64_t)p_impl, v8, location++);
      --length_low;
    }
    while (length_low);
  }
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  IndirectArgumentLayout *layout;
  uint64_t *v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  IndirectArgumentLayout *v9;
  uint64_t *v10;
  unsigned int v11;

  layout = self->_impl.layout;
  if (a3)
  {
    v5 = (uint64_t *)*((_QWORD *)layout + 6);
    if (v5)
    {
      while (1)
      {
        while (1)
        {
          v6 = *((_DWORD *)v5 + 7);
          if (v6 <= a4)
            break;
          v5 = (uint64_t *)*v5;
          if (!v5)
            goto LABEL_17;
        }
        if (v6 >= a4)
          break;
        v5 = (uint64_t *)v5[1];
        if (!v5)
          goto LABEL_17;
      }
      v7 = *((unsigned int *)v5 + 8);
      v8 = (char *)a3 + 48;
      *(_QWORD *)&self->_impl.arguments[v7] = *((_QWORD *)a3 + 15);
      v9 = self->_impl.layout;
      *(_DWORD *)&self->_impl.arguments[*((unsigned int *)v9 + 1)] = *(_DWORD *)v9;
      v10 = (uint64_t *)*((_QWORD *)v9 + 18);
      if (v10)
        goto LABEL_14;
    }
LABEL_17:
    abort();
  }
  v8 = 0;
  v10 = (uint64_t *)*((_QWORD *)layout + 18);
  if (!v10)
    goto LABEL_17;
  while (1)
  {
LABEL_14:
    while (1)
    {
      v11 = *((_DWORD *)v10 + 7);
      if (v11 <= a4)
        break;
      v10 = (uint64_t *)*v10;
      if (!v10)
        goto LABEL_17;
    }
    if (v11 >= a4)
      break;
    v10 = (uint64_t *)v10[1];
    if (!v10)
      goto LABEL_17;
  }
  *(_QWORD *)&self->_impl.arguments[*((unsigned int *)v10 + 8)] = v8;
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  IndirectArgumentLayout *layout;
  _QWORD *v6;
  uint64_t *v7;
  unsigned int v8;
  uint64_t *v9;
  unsigned int v10;

  if (LODWORD(a4.length))
  {
    v4 = 0;
    layout = self->_impl.layout;
    do
    {
      v6 = a3[v4];
      if (v6)
      {
        v7 = (uint64_t *)*((_QWORD *)layout + 6);
        if (!v7)
          goto LABEL_19;
        while (1)
        {
          while (1)
          {
            v8 = *((_DWORD *)v7 + 7);
            if (v8 <= LODWORD(a4.location))
              break;
            v7 = (uint64_t *)*v7;
            if (!v7)
              goto LABEL_19;
          }
          if (v8 >= LODWORD(a4.location))
            break;
          v7 = (uint64_t *)v7[1];
          if (!v7)
            goto LABEL_19;
        }
        v6 += 6;
        *(_QWORD *)&self->_impl.arguments[*((unsigned int *)v7 + 8)] = v6[9];
        layout = self->_impl.layout;
        *(_DWORD *)&self->_impl.arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
      }
      v9 = (uint64_t *)*((_QWORD *)layout + 18);
      if (!v9)
LABEL_19:
        abort();
      while (1)
      {
        while (1)
        {
          v10 = *((_DWORD *)v9 + 7);
          if (v10 <= LODWORD(a4.location))
            break;
          v9 = (uint64_t *)*v9;
          if (!v9)
            goto LABEL_19;
        }
        if (v10 >= LODWORD(a4.location))
          break;
        v9 = (uint64_t *)v9[1];
        if (!v9)
          goto LABEL_19;
      }
      *(_QWORD *)&self->_impl.arguments[*((unsigned int *)v9 + 8)] = v6;
      ++v4;
      ++LODWORD(a4.location);
    }
    while (v4 != LODWORD(a4.length));
  }
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  uint64_t *v3;
  unsigned int v4;

  v3 = (uint64_t *)*((_QWORD *)self->_impl.layout + 15);
  if (!v3)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v4 = *((_DWORD *)v3 + 7);
      if (v4 <= a3)
        break;
      v3 = (uint64_t *)*v3;
      if (!v3)
        goto LABEL_7;
    }
    if (v4 >= a3)
      return &self->_impl.arguments[*((unsigned int *)v3 + 8)];
    v3 = (uint64_t *)v3[1];
    if (!v3)
      goto LABEL_7;
  }
}

- (unint64_t)encodedLength
{
  return *((unsigned int *)self->_impl.layout + 40);
}

- (unint64_t)alignment
{
  return *((unsigned int *)self->_impl.layout + 41);
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  IndirectArgumentLayout *layout;
  uint64_t *v5;
  unsigned int v6;
  uint64_t v7;
  char *arguments;
  uint64_t v9;

  layout = self->_impl.layout;
  v5 = (uint64_t *)*((_QWORD *)layout + 6);
  if (!v5)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v6 = *((_DWORD *)v5 + 7);
      if (v6 <= a4)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    if (v6 >= a4)
      break;
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_7;
  }
  v7 = *((unsigned int *)v5 + 8);
  arguments = self->_impl.arguments;
  if (a3)
  {
    v9 = *((_QWORD *)a3 + 13);
    *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
  }
  else
  {
    v9 = 27984640;
  }
  *(_QWORD *)&arguments[v7] = v9;
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  char *arguments;
  _QWORD *v7;
  uint64_t v8;
  IndirectArgumentLayout *layout;
  uint64_t *v10;
  unsigned int v11;
  unsigned int v12;

  if (LODWORD(a4.length))
  {
    v4 = 0;
    do
    {
      layout = self->_impl.layout;
      v10 = (uint64_t *)*((_QWORD *)layout + 6);
      if (!v10)
LABEL_15:
        abort();
      v11 = v4 + LODWORD(a4.location);
      while (1)
      {
        while (1)
        {
          v12 = *((_DWORD *)v10 + 7);
          if (v12 <= v11)
            break;
          v10 = (uint64_t *)*v10;
          if (!v10)
            goto LABEL_15;
        }
        if (v12 >= v11)
          break;
        v10 = (uint64_t *)v10[1];
        if (!v10)
          goto LABEL_15;
      }
      v5 = *((unsigned int *)v10 + 8);
      arguments = self->_impl.arguments;
      v7 = a3[v4];
      if (v7)
      {
        v8 = v7[13];
        *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
      }
      else
      {
        v8 = 27984640;
      }
      *(_QWORD *)&arguments[v5] = v8;
      ++v4;
    }
    while (v4 != LODWORD(a4.length));
  }
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  IndirectArgumentLayout *layout;
  uint64_t *v5;
  unsigned int v6;
  uint64_t v7;
  char *arguments;
  uint64_t v9;

  layout = self->_impl.layout;
  v5 = (uint64_t *)*((_QWORD *)layout + 6);
  if (!v5)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v6 = *((_DWORD *)v5 + 7);
      if (v6 <= a4)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    if (v6 >= a4)
      break;
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_7;
  }
  v7 = *((unsigned int *)v5 + 8);
  arguments = self->_impl.arguments;
  if (a3)
  {
    v9 = *((_QWORD *)a3 + 143);
    *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
  }
  else
  {
    v9 = 27984640;
  }
  *(_QWORD *)&arguments[v7] = v9;
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  char *arguments;
  _QWORD *v7;
  uint64_t v8;
  IndirectArgumentLayout *layout;
  uint64_t *v10;
  unsigned int v11;
  unsigned int v12;

  if (LODWORD(a4.length))
  {
    v4 = 0;
    do
    {
      layout = self->_impl.layout;
      v10 = (uint64_t *)*((_QWORD *)layout + 6);
      if (!v10)
LABEL_15:
        abort();
      v11 = v4 + LODWORD(a4.location);
      while (1)
      {
        while (1)
        {
          v12 = *((_DWORD *)v10 + 7);
          if (v12 <= v11)
            break;
          v10 = (uint64_t *)*v10;
          if (!v10)
            goto LABEL_15;
        }
        if (v12 >= v11)
          break;
        v10 = (uint64_t *)v10[1];
        if (!v10)
          goto LABEL_15;
      }
      v5 = *((unsigned int *)v10 + 8);
      arguments = self->_impl.arguments;
      v7 = a3[v4];
      if (v7)
      {
        v8 = v7[143];
        *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
      }
      else
      {
        v8 = 27984640;
      }
      *(_QWORD *)&arguments[v5] = v8;
      ++v4;
    }
    while (v4 != LODWORD(a4.length));
  }
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  IndirectArgumentLayout *layout;
  uint64_t *v5;
  unsigned int v6;
  uint64_t v7;
  char *arguments;
  uint64_t v9;

  layout = self->_impl.layout;
  v5 = (uint64_t *)*((_QWORD *)layout + 6);
  if (!v5)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v6 = *((_DWORD *)v5 + 7);
      if (v6 <= a4)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    if (v6 >= a4)
      break;
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_7;
  }
  v7 = *((unsigned int *)v5 + 8);
  arguments = self->_impl.arguments;
  if (a3)
  {
    v9 = *(_QWORD *)((char *)a3 + *MEMORY[0x24BE51650] + 8);
    *(_DWORD *)&arguments[*((unsigned int *)layout + 1)] = *(_DWORD *)layout;
  }
  else
  {
    v9 = 27984896;
  }
  *(_QWORD *)&arguments[v7] = v9;
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[AGXA10FamilyIndirectArgumentEncoder setIndirectCommandBuffer:atIndex:](self, "setIndirectCommandBuffer:atIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

@end
