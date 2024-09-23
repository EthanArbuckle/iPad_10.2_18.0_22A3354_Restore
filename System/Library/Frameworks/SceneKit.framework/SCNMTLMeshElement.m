@implementation SCNMTLMeshElement

- (_QWORD)setupWithElement:(_QWORD *)result
{
  _QWORD *v3;
  int Type;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t PrimitiveRange;
  uint64_t v21;
  int v22;

  if (result)
  {
    v3 = result;
    Type = C3DMeshElementGetType(a2);
    v3[1] = C3DMeshElementTypeToMTLPrimitiveType(Type);
    v3[2] = C3DMeshElementGetIndexCount(a2);
    v22 = 0;
    if ((C3DMeshElementGetIndexes(a2, &v22) || C3DMeshElementGetMTLBuffer(a2)) && (v22 - 1) >= 2)
    {
      if (v22 == 4)
      {
        v5 = 1;
LABEL_12:
        v3[7] = v5;
        v3[3] = C3DMeshElementGetInstanceCount(a2);
        PrimitiveRange = C3DMeshElementGetPrimitiveRange(a2);
        return -[SCNMTLMeshElement setPrimitiveRange:](v3, PrimitiveRange, v21);
      }
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SCNMTLMeshElement setupWithElement:].cold.2((uint64_t)&v22, v6, v7, v8, v9, v10, v11, v12);
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SCNMTLMeshElement setupWithElement:].cold.1((uint64_t)&v22, v13, v14, v15, v16, v17, v18, v19);
    }
    v5 = 0;
    goto LABEL_12;
  }
  return result;
}

- (_QWORD)setPrimitiveRange:(uint64_t)a3
{
  if (result)
  {
    if (a2 == -1)
    {
      result[8] = 0;
      a3 = result[2];
LABEL_10:
      result[9] = a3;
    }
    else
    {
      switch(result[1])
      {
        case 0:
          result[8] = a2;
          goto LABEL_10;
        case 1:
          result[8] = 2 * a2;
          a3 *= 2;
          goto LABEL_10;
        case 2:
          result[8] = a2;
          ++a3;
          goto LABEL_10;
        case 3:
          result[8] = 3 * a2;
          a3 *= 3;
          goto LABEL_10;
        case 4:
          result[8] = a2;
          a3 += 2;
          goto LABEL_10;
        default:
          return result;
      }
    }
  }
  return result;
}

- (uint64_t)setInstanceCount:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 24) = a2;
  return result;
}

- (void)setIndexBuffer:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 40);
}

- (uint64_t)indexBuffer
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)effectivePrimitiveCount
{
  if (result)
  {
    switch(*(_QWORD *)(result + 8))
    {
      case 0:
        result = *(_QWORD *)(result + 72);
        break;
      case 1:
        result = *(_QWORD *)(result + 72) / 2;
        break;
      case 2:
        result = *(_QWORD *)(result + 72) - 1;
        break;
      case 3:
        result = *(_QWORD *)(result + 72) / 3;
        break;
      case 4:
        result = *(_QWORD *)(result + 72) - 2;
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

- (uint64_t)effectiveIndexOffset
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;

  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&self->_primitiveType;
  *((_QWORD *)v4 + 3) = self->_instanceCount;
  *((_QWORD *)v4 + 4) = self->_sharedIndexBufferOffset;
  *((_QWORD *)v4 + 5) = self->_indexBuffer;
  *((_QWORD *)v4 + 6) = self->_drawIndexedPrimitivesIndirectBuffer;
  *(_OWORD *)(v4 + 56) = *(_OWORD *)&self->_indexType;
  *((_QWORD *)v4 + 9) = self->_effectiveIndexCount;
  return v4;
}

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 40);
    objc_setProperty_nonatomic(self, v3, 0, 48);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNMTLMeshElement;
  -[SCNMTLMeshElement dealloc](&v4, sel_dealloc);
}

- (void)setDrawIndexedPrimitivesIndirectBuffer:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 48);
}

- (id)description
{
  uint64_t primitiveType_low;
  SCNMTLBuffer *indexBuffer;
  MTLBuffer *drawIndexedPrimitivesIndirectBuffer;
  uint64_t indexCount_low;
  uint64_t effectiveIndexOffset_low;
  uint64_t v8;

  primitiveType_low = LODWORD(self->_primitiveType);
  indexBuffer = self->_indexBuffer;
  drawIndexedPrimitivesIndirectBuffer = self->_drawIndexedPrimitivesIndirectBuffer;
  indexCount_low = LODWORD(self->_indexCount);
  effectiveIndexOffset_low = LODWORD(self->_effectiveIndexOffset);
  if (drawIndexedPrimitivesIndirectBuffer)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SCNMTLMeshElement: %p | type: %d, index buffer: %@ (%d indices), indirect buffer: %@, effective count: %d, offset: %d>"), self, primitiveType_low, indexBuffer, indexCount_low, drawIndexedPrimitivesIndirectBuffer, LODWORD(self->_effectiveIndexCount), effectiveIndexOffset_low);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SCNMTLMeshElement: %p | type: %d, index buffer: %@ (%d indices), effective count: %d, offset: %d>"), self, primitiveType_low, indexBuffer, indexCount_low, LODWORD(self->_effectiveIndexCount), effectiveIndexOffset_low, v8);
}

- (uint64_t)primitiveCount
{
  if (result)
  {
    switch(*(_QWORD *)(result + 8))
    {
      case 0:
        result = *(_QWORD *)(result + 16);
        break;
      case 1:
        result = *(_QWORD *)(result + 16) / 2;
        break;
      case 2:
        result = *(_QWORD *)(result + 16) - 1;
        break;
      case 3:
        result = *(_QWORD *)(result + 16) / 3;
        break;
      case 4:
        result = *(_QWORD *)(result + 16) - 2;
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

- (uint64_t)setIndexCount:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 16) = a2;
  return result;
}

- (uint64_t)setSharedIndexBufferOffset:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 32) = a2;
  return result;
}

- (uint64_t)setIndexType:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 56) = a2;
  return result;
}

- (void)setupWithElement:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Unreachable code: Invalid index size (%d bytes per index)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)setupWithElement:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: Invalid index size (%d bytes per index)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
