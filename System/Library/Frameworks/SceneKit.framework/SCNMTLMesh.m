@implementation SCNMTLMesh

- (uint64_t)verticesCount
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (uint64_t)setVolatileStride:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 88) = a2;
  return result;
}

- (uint64_t)setVerticesCount:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 104) = a2;
  return result;
}

- (uint64_t)setVertexDescriptor:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 16);
    if (v4 != a2)
    {

      *(_QWORD *)(v3 + 16) = objc_msgSend(a2, "copy");
      result = objc_msgSend(a2, "hash");
      *(_QWORD *)(v3 + 32) = result;
    }
  }
  return result;
}

- (void)setElements:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
}

- (void)setBuffers:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
}

- (uint64_t)vertexDescriptorHash
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 16))
    {
      v2 = scn_default_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
        -[SCNMTLMesh vertexDescriptorHash].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return *(_QWORD *)(v1 + 32);
  }
  return result;
}

- (uint64_t)volatileBuffer
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)buffers
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)elements
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (void)buildTessellationVertexDescriptorIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!self->_tessellationVertexDescriptor)
  {
    if (!self->_vertexDescriptor)
    {
      v3 = scn_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        -[SCNMTLMesh vertexDescriptorHash].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    v11 = 0;
    self->_tessellationVertexDescriptor = (MTLVertexDescriptor *)-[MTLVertexDescriptor copy](self->_vertexDescriptor, "copy");
    do
      -[MTLVertexBufferLayoutDescriptor setStepFunction:](-[MTLVertexBufferLayoutDescriptorArray objectAtIndexedSubscript:](-[MTLVertexDescriptor layouts](self->_tessellationVertexDescriptor, "layouts"), "objectAtIndexedSubscript:", v11++), "setStepFunction:", 4);
    while (v11 != 31);
    self->_tessellationVertexDescriptorHash = -[MTLVertexDescriptor hash](self->_tessellationVertexDescriptor, "hash");
  }
}

- (_QWORD)tessellationVertexDescriptor
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "buildTessellationVertexDescriptorIfNeeded");
    return (_QWORD *)v1[3];
  }
  return result;
}

- (_QWORD)tessellationVertexDescriptorHash
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "buildTessellationVertexDescriptorIfNeeded");
    return (_QWORD *)v1[5];
  }
  return result;
}

- (id)description
{
  void *v3;
  NSArray *buffers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSArray *elements;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<SCNMTLMesh: %p\n"), self);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  buffers = self->_buffers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](buffers, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(buffers);
        objc_msgSend(v3, "appendFormat:", CFSTR("\tbuffer[%d] : %@\n"), v7 + i, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](buffers, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v7 = (v7 + i);
    }
    while (v6);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  elements = self->_elements;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(elements);
        objc_msgSend(v3, "appendFormat:", CFSTR("\telement[%d] : %@\n"), v13 + j, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      v13 = (v13 + j);
    }
    while (v12);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLMesh;
  -[SCNMTLMesh dealloc](&v3, sel_dealloc);
}

- (uint64_t)bufferForAttribute:(uint64_t)a1
{
  uint64_t v3;

  if (a1
    && (v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "attributes"), "objectAtIndexedSubscript:", a2), "bufferIndex"), v3 >= 18))
  {
    return objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v3 - 18);
  }
  else
  {
    return 0;
  }
}

- (void)setVolatileBuffer:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 72);
}

- (uint64_t)volatileOffset
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)setVolatileOffset:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 80) = a2;
  return result;
}

- (uint64_t)volatileStride
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)setVolatileSize:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 96) = a2;
  return result;
}

- (uint64_t)setMutabilityTimestamp:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

- (void)vertexDescriptorHash
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
