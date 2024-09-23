@implementation SCNGeometryElement

void __29__SCNGeometryElement_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

+ (SCNGeometryElement)geometryElementWithMDLSubmesh:(MDLSubmesh *)mdlSubMesh
{
  uint64_t v5;
  MDLGeometryType v6;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t j;
  char v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  id v26;

  v5 = -[MDLSubmesh faceIndexing](mdlSubMesh, "faceIndexing");
  v6 = -[MDLSubmesh geometryType](mdlSubMesh, "geometryType");
  if (v5)
  {
    if (v6 == MDLGeometryTypeVariableTopology)
      return _indexedGeometryElement(mdlSubMesh);
    else
      return 0;
  }
  else
  {
    switch(v6)
    {
      case MDLGeometryTypePoints:
        goto LABEL_9;
      case MDLGeometryTypeLines:
        v8 = -[MDLSubmesh indexCount](mdlSubMesh, "indexCount") >> 1;
        v9 = 2;
        break;
      case MDLGeometryTypeTriangles:
        v9 = 0;
        v8 = -[MDLSubmesh indexCount](mdlSubMesh, "indexCount") / 3;
        break;
      case MDLGeometryTypeTriangleStrips:
        v8 = -[MDLSubmesh indexCount](mdlSubMesh, "indexCount") - 2;
        v9 = 1;
        break;
      case MDLGeometryTypeQuads:
        v8 = -[MDLSubmesh indexCount](mdlSubMesh, "indexCount") >> 2;
        goto LABEL_14;
      case MDLGeometryTypeVariableTopology:
        v8 = -[MDLSubmeshTopology faceCount](-[MDLSubmesh topology](mdlSubMesh, "topology"), "faceCount");
LABEL_14:
        v9 = 4;
        break;
      default:
        v10 = scn_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          +[SCNGeometryElement(SCNModelIO) geometryElementWithMDLSubmesh:].cold.1(v10, v11, v12);
LABEL_9:
        v8 = -[MDLSubmesh indexCount](mdlSubMesh, "indexCount");
        v9 = 3;
        break;
    }
    v13 = (unint64_t)-[MDLSubmesh indexType](mdlSubMesh, "indexType") >> 3;
    v14 = objc_msgSend((id)objc_msgSend(-[MDLSubmesh indexBuffer](mdlSubMesh, "indexBuffer"), "map"), "bytes");
    v15 = objc_msgSend(-[MDLSubmesh indexBuffer](mdlSubMesh, "indexBuffer"), "length");
    if (-[MDLSubmesh geometryType](mdlSubMesh, "geometryType") == MDLGeometryTypeQuads)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v15 + v13 * v8);
      objc_msgSend(v16, "setLength:", v13 * v8);
      if (v8)
      {
        for (i = 0; i != v8; ++i)
        {
          switch(v13)
          {
            case 1uLL:
              *(_BYTE *)(objc_msgSend(v16, "mutableBytes") + i) = 4;
              break;
            case 2uLL:
              *(_WORD *)(objc_msgSend(v16, "mutableBytes") + 2 * i) = 4;
              break;
            case 4uLL:
              *(_DWORD *)(objc_msgSend(v16, "mutableBytes") + 4 * i) = 4;
              break;
            case 8uLL:
              *(_QWORD *)(objc_msgSend(v16, "mutableBytes") + 8 * i) = 4;
              break;
            default:
              continue;
          }
        }
      }
      objc_msgSend(v16, "appendBytes:length:", v14, v15);
      v18 = v16;
    }
    else if (-[MDLSubmesh geometryType](mdlSubMesh, "geometryType") == MDLGeometryTypeVariableTopology)
    {
      v26 = a1;
      v19 = objc_msgSend((id)objc_msgSend(-[MDLSubmeshTopology faceTopology](-[MDLSubmesh topology](mdlSubMesh, "topology"), "faceTopology"), "map"), "bytes");
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v15 + v13 * v8);
      objc_msgSend(v20, "setLength:", v13 * v8);
      if (v8)
      {
        for (j = 0; j != v8; ++j)
        {
          switch(v13)
          {
            case 1uLL:
              v22 = *(_BYTE *)(v19 + j);
              *(_BYTE *)(objc_msgSend(v20, "mutableBytes") + j) = v22;
              break;
            case 2uLL:
              v23 = *(unsigned __int8 *)(v19 + j);
              *(_WORD *)(objc_msgSend(v20, "mutableBytes") + 2 * j) = v23;
              break;
            case 4uLL:
              v24 = *(unsigned __int8 *)(v19 + j);
              *(_DWORD *)(objc_msgSend(v20, "mutableBytes") + 4 * j) = v24;
              break;
            case 8uLL:
              v25 = *(unsigned __int8 *)(v19 + j);
              *(_QWORD *)(objc_msgSend(v20, "mutableBytes") + 8 * j) = v25;
              break;
            default:
              continue;
          }
        }
      }
      objc_msgSend(v20, "appendBytes:length:", v14, v15);
      v18 = v20;
      a1 = v26;
    }
    else
    {
      v18 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, v15);
    }
    return (SCNGeometryElement *)objc_msgSend(a1, "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", v18, v9, v8, v13);
  }
}

+ (SCNGeometryElement)geometryElementWithData:(NSData *)data primitiveType:(SCNGeometryPrimitiveType)primitiveType primitiveCount:(NSInteger)primitiveCount bytesPerIndex:(NSInteger)bytesPerIndex
{
  return (SCNGeometryElement *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithData:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:", data, primitiveType, primitiveCount, 1, 1, bytesPerIndex);
}

- (SCNGeometryElement)initWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  SCNGeometryElement *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)SCNGeometryElement;
  v14 = -[SCNGeometryElement init](&v43, sel_init);
  if (!v14)
    return v14;
  if (a4 != 4)
    goto LABEL_23;
  if (objc_msgSend(a3, "length") < (unint64_t)(a8 * a5))
  {
    v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[SCNGeometryElement initWithData:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  if (a5 < 1)
  {
LABEL_22:
    a3 = (id)objc_msgSend(a3, "subdataWithRange:", a8 * a5, objc_msgSend(a3, "length") - a8 * a5);
    a4 = 0;
    goto LABEL_23;
  }
  v23 = 0;
  v24 = 0;
  v25 = 1;
  while (1)
  {
    v26 = objc_msgSend(a3, "bytes");
    switch(a8)
    {
      case 4:
        v27 = *(unsigned int *)(v26 + v23);
        break;
      case 2:
        v27 = *(unsigned __int16 *)(v26 + v23);
        break;
      case 1:
        v27 = *(unsigned __int8 *)(v26 + v23);
        break;
      default:
        v36 = scn_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[SCNGeometryElement initWithData:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:].cold.1(a8, v36, v37, v38, v39, v40, v41, v42);
        goto LABEL_27;
    }
    if (v27 <= 2)
    {
      v28 = scn_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SCNGeometryElement initWithData:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
LABEL_27:

      return 0;
    }
    if (v27 != 3)
      break;
    v25 = ++v24 < a5;
    v23 += a8;
    if (a5 == v24)
      goto LABEL_22;
  }
  if (!v25)
    goto LABEL_22;
  a4 = 4;
LABEL_23:
  v14->_elementData = (NSData *)objc_msgSend(a3, "copy");
  v14->_primitiveType = a4;
  v14->_primitiveCount = a5;
  v14->_indicesChannelCount = a6;
  v14->_interleavedIndicesChannels = a7;
  v14->_bytesPerIndex = a8;
  return v14;
}

- (void)dealloc
{
  __C3DMeshElement *meshElement;
  __C3DMeshElement *v4;
  objc_super v5;
  _QWORD v6[5];

  meshElement = self->_meshElement;
  if (meshElement)
  {
    C3DEntitySetObjCWrapper((uint64_t)meshElement, 0);
    v4 = self->_meshElement;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__SCNGeometryElement_dealloc__block_invoke;
    v6[3] = &__block_descriptor_40_e8_v16__0d8l;
    v6[4] = v4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v6);
  }

  v5.receiver = self;
  v5.super_class = (Class)SCNGeometryElement;
  -[SCNGeometryElement dealloc](&v5, sel_dealloc);
}

- (__C3DMeshElement)meshElement
{
  __C3DMeshElement *result;
  __C3DMeshElement *v4;
  MTLBuffer *mtlBuffer;
  char primitiveType;
  int64_t primitiveCount;
  char indicesChannelCount;
  char interleavedIndicesChannels;

  result = self->_meshElement;
  if (!result)
  {
    v4 = (__C3DMeshElement *)C3DMeshElementCreate();
    self->_meshElement = v4;
    mtlBuffer = self->_mtlBuffer;
    primitiveType = self->_primitiveType;
    primitiveCount = self->_primitiveCount;
    indicesChannelCount = self->_indicesChannelCount;
    interleavedIndicesChannels = self->_interleavedIndicesChannels;
    if (mtlBuffer)
      C3DMeshElementInitIndexedWithMTLBuffer((uint64_t)v4, primitiveType, primitiveCount, indicesChannelCount, interleavedIndicesChannels, mtlBuffer, self->_bytesPerIndex);
    else
      C3DMeshElementInitIndexed((uint64_t)v4, primitiveType, primitiveCount, indicesChannelCount, interleavedIndicesChannels, self->_elementData, self->_bytesPerIndex);
    __C3DMeshElementSetPrimitiveRanges((uint64_t)self->_meshElement, self->_primitiveRanges);
    result = self->_meshElement;
    if (result)
    {
      C3DEntitySetObjCWrapper((uint64_t)result, self);
      return self->_meshElement;
    }
  }
  return result;
}

- (int64_t)indicesChannelCount
{
  return self->_indicesChannelCount;
}

- (SCNGeometryElement)initWithMeshElement:(const void *)a3
{
  SCNGeometryElement *v4;
  uint64_t PrimitiveRanges;
  uint64_t v11;
  id v12;
  NSArray *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unsigned __int16 v18;
  unsigned int v19;
  objc_super v20;

  v20.receiver = a1;
  v20.super_class = (Class)SCNGeometryElement;
  v4 = -[SCNGeometryElement init](&v20, sel_init);
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&v4->_pointSize = _D0;
  v4->_maximumPointScreenSpaceRadius = 1.0;
  if (a3)
  {
    C3DEntitySetObjCWrapper((uint64_t)a3, v4);
    v19 = 0;
    v4->_meshElement = (__C3DMeshElement *)CFRetain(a3);
    v4->_elementData = (NSData *)(id)C3DMeshElementGetIndexes((uint64_t)a3, &v19);
    v4->_primitiveType = (int)C3DMeshElementGetType((uint64_t)a3);
    v4->_primitiveCount = C3DMeshElementGetPrimitiveCount((uint64_t)a3);
    v4->_indicesChannelCount = C3DMeshElementGetIndicesChannelCount((uint64_t)a3);
    v4->_interleavedIndicesChannels = C3DMeshElementGetUsesInterleavedIndicesChannels((uint64_t)a3);
    v18 = 0;
    PrimitiveRanges = C3DMeshElementGetPrimitiveRanges((uint64_t)a3, &v18);
    if (PrimitiveRanges)
    {
      v11 = PrimitiveRanges;
      v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v13 = (NSArray *)objc_msgSend(v12, "initWithCapacity:", v18);
      if (v18)
      {
        v14 = 0;
        v15 = (_QWORD *)(v11 + 8);
        do
        {
          if (*(v15 - 1) == -1)
            v16 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v16 = *(v15 - 1);
          -[NSArray addObject:](v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v16, *v15));
          ++v14;
          v15 += 2;
        }
        while (v14 < v18);
      }
      v4->_primitiveRanges = v13;
    }
    v4->_bytesPerIndex = v19;
    v4->_pointSize = C3DMeshElementGetPointSize((uint64_t)a3);
    v4->_minimumPointScreenSpaceRadius = C3DMeshElementGetMinimumPointScreenRadius((uint64_t)a3);
    v4->_maximumPointScreenSpaceRadius = C3DMeshElementGetMaximumPointScreenRadius((uint64_t)a3);
  }
  return v4;
}

- (SCNGeometryElement)init
{
  return -[SCNGeometryElement initWithMeshElement:](self, "initWithMeshElement:", 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  unint64_t primitiveType;
  int64_t primitiveCount;
  const __CFString *v8;
  int64_t indicesChannelCount;
  int v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  primitiveType = self->_primitiveType;
  primitiveCount = self->_primitiveCount;
  if (primitiveType > 4)
    v8 = CFSTR("unknown");
  else
    v8 = off_1EA5A3C00[primitiveType];
  indicesChannelCount = self->_indicesChannelCount;
  v10 = C3DBaseTypeFromDescription(self->_bytesPerIndex, 1, 0);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p | %u x %@, %u channels, %@ indices>"), v5, self, primitiveCount, v8, indicesChannelCount, C3DBaseTypeStringDescription(v10));
}

+ (SCNGeometryElement)geometryElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  return (SCNGeometryElement *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuffer:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:", a3, a4, a5, a6, a7, a8);
}

- (SCNGeometryElement)initWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  SCNGeometryElement *v14;
  NSObject *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SCNGeometryElement;
  v14 = -[SCNGeometryElement init](&v17, sel_init);
  if (v14)
  {
    if (a4 == 4)
    {
      v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SCNGeometryElement initWithBuffer:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:].cold.1();
    }
    v14->_mtlBuffer = (MTLBuffer *)a3;
    v14->_primitiveType = a4;
    v14->_primitiveCount = a5;
    v14->_indicesChannelCount = a6;
    v14->_interleavedIndicesChannels = a7;
    v14->_bytesPerIndex = a8;
  }
  return v14;
}

+ (id)geometryElementWithMeshElementRef:(id *)a3
{
  id *result;

  result = C3DEntityGetObjCWrapper(a3);
  if (!result)
    return (id *)(id)objc_msgSend([a1 alloc], "initWithMeshElement:", a3);
  return result;
}

+ (SCNGeometryElement)geometryElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  return (SCNGeometryElement *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithData:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:", a3, a4, a5, a6, a7, a8);
}

+ (SCNGeometryElement)geometryElementWithBuffer:(id)buffer primitiveType:(SCNGeometryPrimitiveType)primitiveType primitiveCount:(NSInteger)primitiveCount bytesPerIndex:(NSInteger)bytesPerIndex
{
  return (SCNGeometryElement *)objc_msgSend(a1, "geometryElementWithBuffer:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:", buffer, primitiveType, primitiveCount, 1, 1, bytesPerIndex);
}

- (NSData)data
{
  NSData *result;

  result = self->_elementData;
  if (!result)
  {
    result = (NSData *)self->_mtlBuffer;
    if (result)
      return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSData contents](result, "contents"), -[MTLBuffer length](self->_mtlBuffer, "length"), 0);
  }
  return result;
}

- (void)_printData
{
  C3DMeshElementPrintData((uint64_t)-[SCNGeometryElement meshElement](self, "meshElement"));
}

- (unint64_t)indexCount
{
  return C3DMeshElementGetIndexCount((uint64_t)-[SCNGeometryElement meshElement](self, "meshElement"));
}

- (SCNGeometryPrimitiveType)primitiveType
{
  return self->_primitiveType;
}

- (NSInteger)primitiveCount
{
  return self->_primitiveCount;
}

- (BOOL)hasInterleavedIndicesChannels
{
  return self->_interleavedIndicesChannels;
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNGeometryElement __CFObject](self, "__CFObject"));
}

- (id)scene
{
  id result;

  result = -[SCNGeometryElement sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (NSRange)primitiveRange
{
  NSUInteger v3;
  NSUInteger v4;
  NSRange result;

  if (-[NSArray count](self->_primitiveRanges, "count") == 1)
  {
    v3 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_primitiveRanges, "objectAtIndexedSubscript:", 0), "rangeValue");
  }
  else
  {
    v3 = 0x7FFFFFFFFFFFFFFFLL;
    v4 = 0;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setPrimitiveRange:(NSRange)primitiveRange
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", primitiveRange.location, primitiveRange.length);
  -[SCNGeometryElement setPrimitiveRanges:](self, "setPrimitiveRanges:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1));
}

- (id)primitiveRanges
{
  return self->_primitiveRanges;
}

- (void)setPrimitiveRanges:(id)a3
{
  NSArray *primitiveRanges;
  NSArray *v6;
  __C3DScene *v7;
  _QWORD v8[6];

  primitiveRanges = self->_primitiveRanges;
  if (primitiveRanges != a3)
  {

    v6 = (NSArray *)objc_msgSend(a3, "count");
    if (v6)
      v6 = (NSArray *)objc_msgSend(a3, "copy");
    self->_primitiveRanges = v6;
    v7 = -[SCNGeometryElement sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__SCNGeometryElement_setPrimitiveRanges___block_invoke;
    v8[3] = &unk_1EA59F740;
    v8[4] = self;
    v8[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, 0, v8);
  }
}

void __41__SCNGeometryElement_setPrimitiveRanges___block_invoke(uint64_t a1)
{
  __C3DMeshElementSetPrimitiveRanges(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 40));
}

- (CGFloat)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(CGFloat)pointSize
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_pointSize != pointSize)
  {
    v5 = pointSize;
    self->_pointSize = v5;
    v6 = -[SCNGeometryElement sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__SCNGeometryElement_setPointSize___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = pointSize;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, 0, v7);
  }
}

uint64_t __35__SCNGeometryElement_setPointSize___block_invoke(uint64_t a1)
{
  float v1;

  v1 = *(double *)(a1 + 40);
  return C3DMeshElementSetPointSize(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
}

- (CGFloat)minimumPointScreenSpaceRadius
{
  return self->_minimumPointScreenSpaceRadius;
}

- (void)setMinimumPointScreenSpaceRadius:(CGFloat)minimumPointScreenSpaceRadius
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_minimumPointScreenSpaceRadius != minimumPointScreenSpaceRadius)
  {
    v5 = minimumPointScreenSpaceRadius;
    self->_minimumPointScreenSpaceRadius = v5;
    v6 = -[SCNGeometryElement sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__SCNGeometryElement_setMinimumPointScreenSpaceRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = minimumPointScreenSpaceRadius;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, 0, v7);
  }
}

uint64_t __55__SCNGeometryElement_setMinimumPointScreenSpaceRadius___block_invoke(uint64_t a1)
{
  float v1;

  v1 = *(double *)(a1 + 40);
  return C3DMeshElementSetMinimumPointScreenRadius(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
}

- (CGFloat)maximumPointScreenSpaceRadius
{
  return self->_maximumPointScreenSpaceRadius;
}

- (void)setMaximumPointScreenSpaceRadius:(CGFloat)maximumPointScreenSpaceRadius
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_maximumPointScreenSpaceRadius != maximumPointScreenSpaceRadius)
  {
    v5 = maximumPointScreenSpaceRadius;
    self->_maximumPointScreenSpaceRadius = v5;
    v6 = -[SCNGeometryElement sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__SCNGeometryElement_setMaximumPointScreenSpaceRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = maximumPointScreenSpaceRadius;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, 0, v7);
  }
}

uint64_t __55__SCNGeometryElement_setMaximumPointScreenSpaceRadius___block_invoke(uint64_t a1)
{
  float v1;

  v1 = *(double *)(a1 + 40);
  return C3DMeshElementSetMaximumPointScreenRadius(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
}

- (NSInteger)bytesPerIndex
{
  return self->_bytesPerIndex;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *elementData;
  NSData *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  if (self->_elementData)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("SCNSceneExportCompressGeometryElements")), "BOOLValue"))
    {
      elementData = self->_elementData;
      if (!self->_primitiveType)
        elementData = -[NSData scn_indexedDataEncodingTrianglePairsWithBytesPerIndex:](elementData, "scn_indexedDataEncodingTrianglePairsWithBytesPerIndex:", self->_bytesPerIndex);
      v6 = (NSData *)objc_msgSend(-[NSData scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:](elementData, "scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:", self->_bytesPerIndex), "scn_compressedDataUsingCompressionAlgorithm:", 774);
      v7 = CFSTR("compressedElementData");
    }
    else
    {
      v6 = self->_elementData;
      v7 = CFSTR("elementData");
    }
    objc_msgSend(a3, "encodeObject:forKey:", v6, v7);
  }
  objc_msgSend(a3, "encodeInteger:forKey:", self->_primitiveType, CFSTR("primitiveType"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_primitiveCount, CFSTR("primitiveCount"));
  if (-[NSArray count](self->_primitiveRanges, "count") == 1)
  {
    v8 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_primitiveRanges, "objectAtIndexedSubscript:", 0), "rangeValue");
    v10 = v9;
    objc_msgSend(a3, "encodeInteger:forKey:", v8, CFSTR("primitiveRangeLocation"));
    objc_msgSend(a3, "encodeInteger:forKey:", v10, CFSTR("primitiveRangeLength"));
  }
  objc_msgSend(a3, "encodeInteger:forKey:", self->_indicesChannelCount, CFSTR("indicesChannelCount"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_interleavedIndicesChannels, CFSTR("interleavedIndicesChannels"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_bytesPerIndex, CFSTR("bytesPerIndex"));
  *(float *)&v11 = self->_pointSize;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("ptSize"), v11);
  *(float *)&v12 = self->_minimumPointScreenSpaceRadius;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("minimumPointScreenSpaceRadius"), v12);
  *(float *)&v13 = self->_maximumPointScreenSpaceRadius;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maximumPointScreenSpaceRadius"), v13);
}

- (SCNGeometryElement)initWithCoder:(id)a3
{
  SCNGeometryElement *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCNGeometryElement;
  v4 = -[SCNGeometryElement init](&v15, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->_primitiveType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("primitiveType"));
    v4->_primitiveCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("primitiveCount"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("primitiveRangeLocation"))
      && objc_msgSend(a3, "containsValueForKey:", CFSTR("primitiveRangeLength")))
    {
      v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("primitiveRangeLocation"));
      v7 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("primitiveRangeLength"));
      v14 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v6, v7);
      v4->_primitiveRanges = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v14, 1);
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("indicesChannelCount"))
      && objc_msgSend(a3, "containsValueForKey:", CFSTR("interleavedIndicesChannels")))
    {
      v4->_indicesChannelCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("indicesChannelCount"));
      v4->_interleavedIndicesChannels = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("interleavedIndicesChannels"));
    }
    else
    {
      v4->_indicesChannelCount = 1;
      v4->_interleavedIndicesChannels = 1;
    }
    v4->_bytesPerIndex = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("bytesPerIndex"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("ptSize")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("pointSize"));
      v4->_pointSize = v8;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("minimumPointScreenSpaceRadius"));
      v4->_minimumPointScreenSpaceRadius = v9;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maximumPointScreenSpaceRadius"));
      v4->_maximumPointScreenSpaceRadius = v10;
    }
    v11 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compressedElementData"));
    if (v11)
    {
      v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "scn_uncompressedDataUsingCompressionAlgorithm:", 774), "scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:", v4->_bytesPerIndex);
      if (!v4->_primitiveType)
        v12 = (void *)objc_msgSend(v12, "scn_indexedDataDecodingTrianglePairsWithBytesPerIndex:", v4->_bytesPerIndex);
    }
    else
    {
      v12 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elementData"));
    }
    v4->_elementData = (NSData *)v12;
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_optimizedGeometryElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6
{
  void *v10;
  id v11;
  int64_t v12;
  const __CFData *v13;

  if (a4)
  {
    v10 = (void *)objc_opt_class();
    v11 = a3;
    v12 = a4;
  }
  else
  {
    v13 = C3DDataCreateOptimizedIndices((const __CFData *)a3, a5, a6);
    v10 = (void *)objc_opt_class();
    v11 = v13;
    v12 = 0;
  }
  return (id)objc_msgSend(v10, "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", v11, v12, a5, a6);
}

- (void)_optimizeTriangleIndices
{
  unsigned int v3;

  if (!self->_primitiveType)
  {
    C3DMeshElementOptimizeIndices((uint64_t)self->_meshElement);
    v3 = 0;
    self->_elementData = (NSData *)(id)C3DMeshElementGetIndexes((uint64_t)self->_meshElement, &v3);
    self->_primitiveType = (int)C3DMeshElementGetType((uint64_t)self->_meshElement);
    self->_primitiveCount = C3DMeshElementGetPrimitiveCount((uint64_t)self->_meshElement);
    self->_bytesPerIndex = v3;
  }
}

- (double)_computeACMR
{
  return C3DMeshElementComputeACMR((uint64_t)self->_meshElement, 32);
}

- (void)initWithBuffer:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: SCNGeometryPrimitiveTypePolygon not supported with MTLBuffers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithData:(uint64_t)a3 primitiveType:(uint64_t)a4 primitiveCount:(uint64_t)a5 indicesChannelCount:(uint64_t)a6 interleavedIndicesChannels:(uint64_t)a7 bytesPerIndex:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: SCNGeometryElement initialization - Invalid index size (%ld bytes)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithData:(uint64_t)a3 primitiveType:(uint64_t)a4 primitiveCount:(uint64_t)a5 indicesChannelCount:(uint64_t)a6 interleavedIndicesChannels:(uint64_t)a7 bytesPerIndex:(uint64_t)a8 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: SCNGeometryElement initialization - Invalid polygon edge count (%ld)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithData:(uint64_t)a3 primitiveType:(uint64_t)a4 primitiveCount:(uint64_t)a5 indicesChannelCount:(uint64_t)a6 interleavedIndicesChannels:(uint64_t)a7 bytesPerIndex:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. SCNGeometryElement initialization - Invalid data length", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
