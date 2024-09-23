@implementation SCNGeometrySource

void __28__SCNGeometrySource_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

+ (SCNGeometrySource)geometrySourceWithMDLVertexAttribute:(id)a3 mesh:(id)a4
{
  void *v6;
  unsigned int v7;
  _BOOL8 v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  char v12;
  _QWORD *v13;
  const SCNGeometrySourceSemantic *v14;
  const __CFString *v15;
  SCNGeometrySourceSemantic v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float *v35;
  unint64_t v36;
  SCNGeometrySource *v37;
  float v38;
  _BYTE *v39;
  unint64_t v40;
  float *v41;
  _BYTE *v42;
  unsigned int v43;
  unsigned int v44;
  float v45;
  uint64_t v46;
  _BYTE *v47;
  float *v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  NSObject *v53;
  void *__p;
  _BYTE *v55;
  uint64_t v56;

  v6 = (void *)objc_msgSend(a4, "vertexDescriptor");
  v7 = (objc_msgSend(a3, "format") >> 16) & 0xF;
  if (v7 >= 5)
  {
    v8 = 0;
    v9 = 2;
    if (v7 >= 9)
    {
      v10 = v7 - 11;
      if (v10)
      {
        v8 = v10 < 0xFFFFFFFE;
        v9 = 4;
      }
    }
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }
  v11 = (void *)objc_msgSend(a3, "name");
  v12 = objc_msgSend(v11, "containsString:", *MEMORY[0x1E0CC7760]);
  v13 = (_QWORD *)MEMORY[0x1E0CC7730];
  if ((v12 & 1) != 0)
  {
    v14 = &SCNGeometrySourceSemanticVertex;
  }
  else
  {
    if ((objc_msgSend(v11, "containsString:", *MEMORY[0x1E0CC7750]) & 1) == 0)
    {
      if ((objc_msgSend(v11, "containsString:", *MEMORY[0x1E0CC7770]) & 1) != 0)
      {
        v14 = &SCNGeometrySourceSemanticTexcoord;
        goto LABEL_14;
      }
      if ((objc_msgSend(v11, "containsString:", *MEMORY[0x1E0CC7768]) & 1) != 0)
      {
        v14 = &SCNGeometrySourceSemanticTangent;
        goto LABEL_14;
      }
      v15 = CFSTR("aoCoord");
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("aoCoord")) & 1) != 0
        || (v15 = CFSTR("lightmapCoord"), (objc_msgSend(v11, "isEqualToString:", CFSTR("lightmapCoord")) & 1) != 0))
      {
        v14 = &SCNGeometrySourceSemanticTexcoord;
        goto LABEL_15;
      }
      if ((objc_msgSend(v11, "containsString:", *v13) & 1) != 0
        || (objc_msgSend(v11, "containsString:", *MEMORY[0x1E0CC7758]) & 1) != 0)
      {
        v14 = &SCNGeometrySourceSemanticColor;
        goto LABEL_14;
      }
      v53 = scn_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        +[SCNGeometrySource(SCNModelIO) geometrySourceWithMDLVertexAttribute:mesh:].cold.1((uint64_t)v11, v53);
    }
    v14 = &SCNGeometrySourceSemanticNormal;
  }
LABEL_14:
  v15 = CFSTR("unknown");
LABEL_15:
  v16 = *v14;
  v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "stride");
  v18 = objc_msgSend(a3, "format");
  v19 = objc_msgSend(a3, "offset");
  if (!objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", *v13)
    || objc_msgSend(a3, "format") != 65540)
  {
    v27 = v18 & 7;
    v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexBuffers"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "map"), "bytes");
    v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexBuffers"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "length");
    v30 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v28, v29);
    if (v30)
      goto LABEL_38;
    return 0;
  }
  v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexBuffers"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "map"), "bytes");
  v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexBuffers"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "length");
  if (objc_msgSend(a3, "format") == 786436)
  {
    __p = 0;
    v55 = 0;
    v56 = 0;
    if (v21 >= 0x10)
    {
      v22 = v21 >> 4;
      std::vector<unsigned char>::__append((unint64_t *)&__p, 4 * v22);
      v23 = 0;
      if (v22 <= 1)
        v24 = 1;
      else
        v24 = v22;
      v25 = 4 * v24;
      v26 = (float *)(v20 + 8);
      do
      {
        *((_BYTE *)__p + v23) = (int)(float)(*(v26 - 2) * 255.0);
        *((_BYTE *)__p + v23 + 1) = (int)(float)(*(v26 - 1) * 255.0);
        *((_BYTE *)__p + v23 + 2) = (int)(float)(*v26 * 255.0);
        *((_BYTE *)__p + v23 + 3) = (int)(float)(v26[1] * 255.0);
        v23 += 4;
        v26 += 4;
      }
      while (v25 != v23);
    }
LABEL_34:
    v30 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, v55 - (_BYTE *)__p);
    if (__p)
    {
      v55 = __p;
      operator delete(__p);
    }
    v19 = 0;
    v8 = 0;
    v17 = 4;
    v9 = 1;
    goto LABEL_37;
  }
  if (objc_msgSend(a3, "format") == 786435)
  {
    __p = 0;
    v55 = 0;
    v56 = 0;
    if (v21 >= 0xC)
    {
      v31 = v21 / 0xC;
      std::vector<unsigned char>::__append((unint64_t *)&__p, 4 * v31);
      v32 = 0;
      if (v31 <= 1)
        v33 = 1;
      else
        v33 = v31;
      v34 = 4 * v33;
      v35 = (float *)(v20 + 4);
      do
      {
        *((_BYTE *)__p + v32) = (int)(float)(*(v35 - 1) * 255.0);
        *((_BYTE *)__p + v32 + 1) = (int)(float)(*v35 * 255.0);
        *((_BYTE *)__p + v32 + 2) = (int)(float)(v35[1] * 255.0);
        *((_BYTE *)__p + v32 + 3) = -1;
        v32 += 4;
        v35 += 3;
      }
      while (v34 != v32);
    }
    goto LABEL_34;
  }
  if (objc_msgSend(a3, "format") == 65539)
  {
    __p = 0;
    v55 = 0;
    v56 = 0;
    std::vector<float>::resize((uint64_t)&__p, 4 * (v21 / 3));
    v39 = __p;
    if (v21 >= 3)
    {
      if (v21 / 3 <= 1)
        v40 = 1;
      else
        v40 = v21 / 3;
      v41 = (float *)((char *)__p + 8);
      v42 = (_BYTE *)(v20 + 2);
      do
      {
        LOBYTE(v38) = *(v42 - 2);
        *(float *)&v43 = (float)LODWORD(v38) / 255.0;
        *(v41 - 2) = *(float *)&v43;
        LOBYTE(v43) = *(v42 - 1);
        *(float *)&v44 = (float)v43 / 255.0;
        *(v41 - 1) = *(float *)&v44;
        LOBYTE(v44) = *v42;
        v38 = (float)v44 / 255.0;
        *v41 = v38;
        v41[1] = 1.0;
        v41 += 4;
        v42 += 3;
        --v40;
      }
      while (v40);
    }
  }
  else
  {
    if (objc_msgSend(a3, "format") != 65540)
      return 0;
    __p = 0;
    v55 = 0;
    v56 = 0;
    std::vector<float>::resize((uint64_t)&__p, v21 & 0xFFFFFFFFFFFFFFFCLL);
    v39 = __p;
    if (v21 >= 4)
    {
      v46 = v21 >> 2;
      if (v21 >> 2 <= 1)
        v46 = 1;
      v47 = (_BYTE *)(v20 + 3);
      v48 = (float *)((char *)__p + 8);
      do
      {
        LOBYTE(v45) = *(v47 - 3);
        *(float *)&v49 = (float)LODWORD(v45) / 255.0;
        *(v48 - 2) = *(float *)&v49;
        LOBYTE(v49) = *(v47 - 2);
        *(float *)&v50 = (float)v49 / 255.0;
        *(v48 - 1) = *(float *)&v50;
        LOBYTE(v50) = *(v47 - 1);
        *(float *)&v51 = (float)v50 / 255.0;
        *v48 = *(float *)&v51;
        LOBYTE(v51) = *v47;
        v45 = (float)v51 / 255.0;
        v48[1] = v45;
        v47 += 4;
        v48 += 4;
        --v46;
      }
      while (v46);
    }
  }
  v30 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v39, v55 - v39);
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  v19 = 0;
  v8 = 1;
  v17 = 16;
  v9 = 4;
LABEL_37:
  v27 = 4;
  if (!v30)
    return 0;
LABEL_38:
  v36 = objc_msgSend(v30, "length") / v17;
  if ((C3DWasLinkedBeforeMajorOSYear2018() & 1) == 0
    && -[NSString isEqualToString:](v16, "isEqualToString:", CFSTR("kGeometrySourceSemanticTexcoord")))
  {
    flip_UVs((MDLVertexFormat)objc_msgSend(a3, "format"), (char *)objc_msgSend(v30, "bytes"), v19, v17, v36);
  }
  v37 = +[SCNGeometrySource geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:](SCNGeometrySource, "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v30, v16, v36, v8, v27, v9, v19, v17);
  -[SCNGeometrySource setMkSemantic:](v37, "setMkSemantic:", v15);
  return v37;
}

- (void)setMkSemantic:(id)a3
{
  char v5;
  __C3DMeshSource *meshSource;

  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CC7720]) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CC7760]) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CC7770]) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CC7750]) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("aoCoord")) & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CC7730]) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CC7758]) & 1) != 0)
  {
    v5 = 6;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CC7768]) & 1) != 0)
  {
    v5 = 7;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CC7728]) & 1) != 0)
  {
    v5 = 8;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("lightmapCoord")))
  {
    v5 = 9;
  }
  else
  {
    v5 = 0;
  }
  self->_mkSemantic = v5;
  meshSource = self->_meshSource;
  if (meshSource)
    C3DMeshSourceSetModelKitSemantic((uint64_t)meshSource, v5);
}

+ (SCNGeometrySource)geometrySourceWithData:(NSData *)data semantic:(SCNGeometrySourceSemantic)semantic vectorCount:(NSInteger)vectorCount floatComponents:(BOOL)floatComponents componentsPerVector:(NSInteger)componentsPerVector bytesPerComponent:(NSInteger)bytesPerComponent dataOffset:(NSInteger)offset dataStride:(NSInteger)stride
{
  return (SCNGeometrySource *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", data, semantic, 0, vectorCount, floatComponents, componentsPerVector, bytesPerComponent, offset, stride);
}

- (SCNGeometrySource)initWithData:(id)a3 semantic:(id)a4 colorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 floatComponents:(BOOL)a7 componentsPerVector:(int64_t)a8 bytesPerComponent:(int64_t)a9 dataOffset:(int64_t)a10 dataStride:(int64_t)a11
{
  _BOOL4 v12;
  int64_t v17;
  int64_t v18;
  SCNGeometrySource *v19;
  int64_t v20;
  NSObject *v21;
  int64_t v22;
  objc_super v24;

  v12 = a7;
  v17 = a10;
  v18 = a11;
  v24.receiver = self;
  v24.super_class = (Class)SCNGeometrySource;
  v19 = -[SCNGeometrySource init](&v24, sel_init);
  if (!v19)
    return v19;
  v20 = a9;
  if (a9 == 8)
  {
    if (v17 || v18 && 8 * a8 != v18)
    {
      v21 = scn_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SCNGeometrySource initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:].cold.1();
      return 0;
    }
    a3 = (id)objc_msgSend((id)objc_opt_class(), "dataByConvertingDoublesToFloats:count:", objc_msgSend(a3, "bytes"), a8 * a6);
    v18 = 4 * a8;
    a11 = 4 * a8;
    v20 = 4;
  }
  if (a5 && objc_msgSend(a4, "isEqualToString:", CFSTR("kGeometrySourceSemanticColor")))
    a3 = -[SCNGeometrySource dataByConvertingColorData:colorSpace:newColorSpace:vectorCount:componentsPerVector:bytesPerComponent:dataOffset:dataStride:newDataOffset:newDataStride:](v19, "dataByConvertingColorData:colorSpace:newColorSpace:vectorCount:componentsPerVector:bytesPerComponent:dataOffset:dataStride:newDataOffset:newDataStride:", a3, a5, &v19->_colorSpace, a6, a8, v20, v17, v18, &a10, &a11);
  v19->_data = (NSData *)a3;
  v19->_semantic = (NSString *)objc_msgSend(a4, "copy");
  v19->_vectorCount = a6;
  v19->_componentType = C3DBaseTypeFromDescription(v20, 1, v12);
  v19->_componentCount = a8;
  v22 = a11;
  if (!a11)
    v22 = v20 * a8;
  v19->_dataOffset = a10;
  v19->_dataStride = v22;
  return v19;
}

- (__C3DMeshSource)meshSource
{
  MTLBuffer *mtlBuffer;
  __int16 v5;
  __C3DMeshSource *v6;
  NSObject *v7;
  __C3DMeshSource *meshSource;

  if (!self->_meshSource)
  {
    if (self->_componentType)
    {
      mtlBuffer = self->_mtlBuffer;
      v5 = SCNGeometrySourceSemanticToMeshSourceSemantic(self->_semantic);
      if (mtlBuffer)
        v6 = (__C3DMeshSource *)C3DMeshSourceCreateWithMTLBuffer(v5, self->_mtlBuffer, self->_mtlVertexFormat, self->_vectorCount, self->_dataStride, self->_dataOffset);
      else
        v6 = (__C3DMeshSource *)C3DMeshSourceCreateWithData(v5, self->_data, self->_componentType, self->_componentCount, self->_vectorCount, self->_dataStride, self->_dataOffset);
      self->_meshSource = v6;
      C3DMeshSourceSetModelKitSemantic((uint64_t)v6, self->_mkSemantic);
      meshSource = self->_meshSource;
      if (meshSource)
        C3DEntitySetObjCWrapper((uint64_t)meshSource, self);
    }
    else
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SCNGeometrySource meshSource].cold.1();
    }
  }
  return self->_meshSource;
}

- (void)dealloc
{
  __C3DMeshSource *meshSource;
  __C3DMeshSource *v4;
  CGColorSpace *colorSpace;
  objc_super v6;
  _QWORD v7[5];

  meshSource = self->_meshSource;
  if (meshSource)
  {
    C3DEntitySetObjCWrapper((uint64_t)meshSource, 0);
    v4 = self->_meshSource;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNGeometrySource_dealloc__block_invoke;
    v7[3] = &__block_descriptor_40_e8_v16__0d8l;
    v7[4] = v4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v7);
  }

  colorSpace = self->_colorSpace;
  if (colorSpace)
  {
    CFRelease(colorSpace);
    self->_colorSpace = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SCNGeometrySource;
  -[SCNGeometrySource dealloc](&v6, sel_dealloc);
}

- (void)_clearC3DCache
{
  __C3DMeshSource *meshSource;
  __C3DMeshSource *v4;
  __C3DMeshSource *v5;

  if (self->_data)
  {
    meshSource = self->_meshSource;
    if (meshSource)
    {
      if (!C3DMeshSourceOwnsItsData((uint64_t)meshSource))
      {
        v4 = self->_meshSource;
        if (v4)
        {
          C3DEntitySetObjCWrapper((uint64_t)v4, 0);
          v5 = self->_meshSource;
          if (v5)
          {
            CFRelease(v5);
            self->_meshSource = 0;
          }
        }
      }
    }
  }
}

+ (SCNGeometrySource)geometrySourceWithMeshSourceRef:(__C3DMeshSource *)a3
{
  SCNGeometrySource *result;

  result = (SCNGeometrySource *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNGeometrySource *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMeshSource:", a3);
  return result;
}

- (SCNGeometrySource)initWithMeshSource:(__C3DMeshSource *)a3
{
  SCNGeometrySource *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int Semantic;
  __CFString *v8;
  uint64_t Accessor;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNGeometrySource;
  v4 = -[SCNGeometrySource init](&v11, sel_init);
  if (a3)
  {
    v4->_meshSource = (__C3DMeshSource *)CFRetain(a3);
    v4->_data = (NSData *)(id)C3DMeshSourceGetData(a3);
    C3DMeshSourceGetContent((uint64_t)a3);
    v6 = v5;
    Semantic = C3DMeshSourceGetSemantic((uint64_t)a3);
    if (Semantic > 8)
      v8 = 0;
    else
      v8 = off_1EA5A3B68[Semantic];
    v4->_semantic = (NSString *)v8;
    v4->_vectorCount = v6;
    v4->_componentType = BYTE6(v6);
    v4->_componentCount = HIBYTE(v6);
    v4->_mkSemantic = C3DMeshSourceGetModelKitSemantic((uint64_t)a3);
    C3DEntitySetObjCWrapper((uint64_t)a3, v4);
    Accessor = C3DMeshSourceGetAccessor(a3);
    v4->_dataOffset = C3DSourceAccessorGetOffset(Accessor);
    v4->_dataStride = C3DSceneSourceGetLibrary(Accessor);
  }
  return v4;
}

- (SCNGeometrySource)init
{
  return -[SCNGeometrySource initWithMeshSource:](self, "initWithMeshSource:", 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p | semantic=%@ vectors=%d %@x%d>"), v5, self, -[SCNGeometrySource semantic](self, "semantic"), -[SCNGeometrySource vectorCount](self, "vectorCount"), C3DBaseTypeStringDescription(self->_componentType), -[SCNGeometrySource componentsPerVector](self, "componentsPerVector"));
}

+ (id)dataByConvertingDoublesToFloats:(const double *)a3 count:(int64_t)a4
{
  int64_t v4;
  int64_t v6;
  float *v7;
  float *v8;
  double v9;
  float v10;

  v4 = a4;
  v6 = 4 * a4;
  v7 = (float *)malloc_type_malloc(4 * a4, 0x151B042DuLL);
  if (v4 >= 1)
  {
    v8 = v7;
    do
    {
      v9 = *a3++;
      v10 = v9;
      *v8++ = v10;
      --v4;
    }
    while (v4);
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v6, 1);
}

+ (id)dataWithVector3Array:(const SCNVector3 *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5
{
  if (a5)
    *a5 = 4;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 12 * a4);
}

+ (id)dataWithPointArray:(const CGPoint *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5
{
  int64_t v5;
  int64_t v7;
  float32x2_t *v8;
  float32x2_t *v9;
  float64x2_t v10;

  v5 = a4;
  if (a5)
    *a5 = 4;
  v7 = 8 * a4;
  v8 = (float32x2_t *)malloc_type_malloc(8 * a4, 0xDB15EB48uLL);
  if (v5 >= 1)
  {
    v9 = v8;
    do
    {
      v10 = *(float64x2_t *)a3++;
      *v9++ = vcvt_f32_f64(v10);
      --v5;
    }
    while (v5);
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v7, 1);
}

- (SCNGeometrySource)initWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9
{
  unsigned __int16 v10;
  int v11;
  SCNGeometrySource *v15;
  int64_t v16;
  objc_super v18;

  v10 = a7;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SCNGeometrySource;
  v15 = -[SCNGeometrySource init](&v18, sel_init);
  if (v15)
  {
    v16 = a9;
    v15->_data = (NSData *)a3;
    v15->_semantic = (NSString *)objc_msgSend(a4, "copy");
    v15->_vectorCount = a5;
    v15->_componentType = v11;
    v15->_componentCount = v10;
    v15->_dataOffset = a8;
    if (!a9)
      v16 = C3DSizeOfBaseType(v11) * v15->_componentCount;
    v15->_dataStride = v16;
  }
  return v15;
}

- (SCNGeometrySource)initWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8
{
  SCNGeometrySource *v14;
  unsigned int v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SCNGeometrySource;
  v14 = -[SCNGeometrySource init](&v17, sel_init);
  if (v14)
  {
    v14->_mtlBuffer = (MTLBuffer *)a3;
    v14->_semantic = (NSString *)objc_msgSend(a5, "copy");
    v14->_vectorCount = a6;
    v14->_mtlVertexFormat = a4;
    v15 = SCNMTLVertexFormatToC3DBaseType(a4);
    v14->_componentType = C3DBaseTypeGetComponentType(v15);
    v14->_componentCount = C3DBaseTypeGetComponentCount(v15);
    v14->_dataOffset = a7;
    if (!a8)
      a8 = C3DSizeOfBaseType(v15);
    v14->_dataStride = a8;
  }
  return v14;
}

+ (id)_geometrySourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:", a3, a4, a5, a6, a7, a8, a9);
}

+ (SCNGeometrySource)geometrySourceWithVertices:(const SCNVector3 *)vertices count:(NSInteger)count
{
  uint64_t v6;
  uint64_t v8;

  v8 = 0;
  v6 = objc_msgSend(a1, "dataWithVector3Array:count:bytesPerComponent:", vertices, count, &v8);
  return (SCNGeometrySource *)objc_msgSend(a1, "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v6, CFSTR("kGeometrySourceSemanticVertex"), count, 1, 3, v8, 0, 0);
}

+ (SCNGeometrySource)geometrySourceWithNormals:(const SCNVector3 *)normals count:(NSInteger)count
{
  uint64_t v6;
  uint64_t v8;

  v8 = 0;
  v6 = objc_msgSend(a1, "dataWithVector3Array:count:bytesPerComponent:", normals, count, &v8);
  return (SCNGeometrySource *)objc_msgSend(a1, "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v6, CFSTR("kGeometrySourceSemanticNormal"), count, 1, 3, v8, 0, 0);
}

+ (SCNGeometrySource)geometrySourceWithTextureCoordinates:(const CGPoint *)texcoord count:(NSInteger)count
{
  uint64_t v6;
  uint64_t v8;

  v8 = 0;
  v6 = objc_msgSend(a1, "dataWithPointArray:count:bytesPerComponent:", texcoord, count, &v8);
  return (SCNGeometrySource *)objc_msgSend(a1, "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v6, CFSTR("kGeometrySourceSemanticTexcoord"), count, 1, 2, v8, 0, 0);
}

- (id)dataByConvertingColorData:(id)a3 colorSpace:(CGColorSpace *)a4 newColorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10 newDataOffset:(int64_t *)a11 newDataStride:(int64_t *)a12
{
  int64_t *v17;
  int64_t v18;
  CGColorSpace *ColorSpace;
  CGColorSpace *v20;
  CGColorSpace *v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void *v30;
  char *v31;
  int64_t v33;
  id v34;

  v17 = a12;
  v18 = a9;
  C3DGetColorTransformToGlobalColorSpace();
  ColorSpace = (CGColorSpace *)CGColorTransformGetColorSpace();
  v20 = *a5;
  if (*a5 != ColorSpace)
  {
    if (v20)
    {
      CFRelease(v20);
      *a5 = 0;
    }
    if (ColorSpace)
      v21 = (CGColorSpace *)CFRetain(ColorSpace);
    else
      v21 = 0;
    *a5 = v21;
  }
  if (CFEqual(a4, ColorSpace))
    goto LABEL_19;
  v22 = a8 * a7;
  if (a10)
    v23 = a10;
  else
    v23 = a8 * a7;
  v34 = a3;
  v24 = objc_msgSend(a3, "bytes");
  v33 = v22 * a6;
  v25 = (char *)malloc_type_malloc(v22 * a6, 0x98D104C3uLL);
  if (!CGColorTransformConvertData())
  {
    free(v25);
    v18 = a9;
    v17 = a12;
    a3 = v34;
LABEL_19:
    *a11 = v18;
    *v17 = a10;
    return a3;
  }
  *a11 = 0;
  *a12 = v22;
  if (a7 == 4)
  {
    v26 = v25;
    if (a6 >= 1)
    {
      v27 = v24;
      v28 = &v25[3 * a8];
      v29 = (char *)(v27 + 3 * a8 + a9);
      do
      {
        memcpy(v28, v29, a8);
        v28 += v22;
        v29 += v23;
        --a6;
      }
      while (a6);
    }
    v30 = (void *)MEMORY[0x1E0C99D50];
    v31 = v26;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0C99D50];
    v31 = v25;
  }
  return (id)objc_msgSend(v30, "dataWithBytesNoCopy:length:freeWhenDone:", v31, v33, 1);
}

+ (SCNGeometrySource)geometrySourceWithColorComponents:(const float *)a3 count:(int64_t)a4 hasAlpha:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  _BOOL4 v7;
  const void *ColorSpace;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  _DWORD *v15;
  const float *v16;
  int64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v7 = a5;
  C3DGetColorTransformToGlobalColorSpace();
  ColorSpace = (const void *)CGColorTransformGetColorSpace();
  if (!a6)
    a6 = (CGColorSpace *)C3DColorSpaceSRGB();
  if (v7)
    v12 = 4;
  else
    v12 = 3;
  if (CFEqual(a6, ColorSpace))
  {
    v13 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 4 * v12 * a4);
  }
  else
  {
    v23 = a1;
    v14 = malloc_type_malloc(4 * v12 * a4, 0xA51A0F37uLL);
    LODWORD(v22) = 4 * v12;
    LODWORD(v21) = 4 * v12;
    if (CGColorTransformConvertData())
    {
      if (a4 >= 1 && v7)
      {
        v15 = v14 + 3;
        v16 = a3 + 3;
        v17 = a4;
        do
        {
          v18 = *(_DWORD *)v16;
          v16 += 4;
          *v15 = v18;
          v15 += 4;
          --v17;
        }
        while (v17);
      }
      v19 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, 4 * v12 * a4, 1, v21, v14, 96, v22);
    }
    else
    {
      free(v14);
      v19 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 4 * v12 * a4, v21, v14, 96, v22);
    }
    v13 = v19;
    a1 = v23;
  }
  return (SCNGeometrySource *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v13, CFSTR("kGeometrySourceSemanticColor"), ColorSpace, a4, 1, v12, 4, 0, 4 * v12);
}

+ (SCNGeometrySource)geometrySourceWithColorData:(id)a3 colorSpace:(CGColorSpace *)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10
{
  return (SCNGeometrySource *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", a3, CFSTR("kGeometrySourceSemanticColor"), a4, a5, a6, a7, a8, a9, a10);
}

+ (SCNGeometrySource)geometrySourceWithBuffer:(id)buffer vertexFormat:(MTLVertexFormat)vertexFormat semantic:(SCNGeometrySourceSemantic)semantic vertexCount:(NSInteger)vertexCount dataOffset:(NSInteger)offset dataStride:(NSInteger)stride
{
  NSObject *v9;

  if (vertexFormat)
    return (SCNGeometrySource *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", buffer, vertexFormat, semantic, vertexCount, offset, stride);
  v9 = scn_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[SCNGeometrySource geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:].cold.1();
  return 0;
}

+ (id)_geometrySourceWithSource:(id)a3 vertexFormat:(unint64_t)a4
{
  unsigned int v6;
  uint64_t CopyWithBaseType;
  NSObject *v9;

  if (a3)
  {
    if (a4)
    {
      v6 = SCNMTLVertexFormatToC3DBaseType(a4);
      CopyWithBaseType = C3DMeshSourceCreateCopyWithBaseType(objc_msgSend(a3, "meshSource"), v6, 0);
      if (CopyWithBaseType)
        return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMeshSource:", CopyWithBaseType);
      NSLog(CFSTR("_geometrySourceWithSource - Conversion failed"));
    }
    else
    {
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[SCNGeometrySource _geometrySourceWithSource:vertexFormat:].cold.1();
    }
  }
  return 0;
}

- (BOOL)_encodeDataAsHalf
{
  return self->_encodeDataAsHalf;
}

- (void)set_encodeDataAsHalf:(BOOL)a3
{
  self->_encodeDataAsHalf = a3;
}

- (id)mkSemantic
{
  unint64_t mkSemantic;
  id *v3;

  mkSemantic = (char)self->_mkSemantic;
  if (mkSemantic > 9)
    v3 = (id *)MEMORY[0x1E0CC7730];
  else
    v3 = (id *)qword_1EA5A3BB0[mkSemantic];
  return *v3;
}

- (NSData)data
{
  NSData *result;

  result = self->_data;
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
  __C3DMeshSource *v2;
  uint64_t Count;

  v2 = -[SCNGeometrySource meshSource](self, "meshSource");
  Count = C3DMeshSourceGetCount((uint64_t)v2);
  C3DMeshSourcePrintData((uint64_t)v2, Count);
}

- (SCNGeometrySourceSemantic)semantic
{
  return self->_semantic;
}

- (NSInteger)vectorCount
{
  return self->_vectorCount;
}

- (BOOL)floatComponents
{
  return C3DBaseTypeIsFloatingValue(self->_componentType);
}

- (NSInteger)componentsPerVector
{
  return self->_componentCount;
}

- (NSInteger)bytesPerComponent
{
  return C3DBaseTypeGetBytesPerComponent(self->_componentType);
}

- (NSInteger)dataOffset
{
  return self->_dataOffset;
}

- (NSInteger)dataStride
{
  return self->_dataStride;
}

- (signed)_componentType
{
  return self->_componentType;
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNGeometrySource __CFObject](self, "__CFObject"));
}

- (id)scene
{
  id result;

  result = -[SCNGeometrySource sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (id)_uninterleaveData:(id)a3 count:(unint64_t)a4 srcOffset:(unint64_t)a5 srcStride:(unint64_t)a6 dstStride:(unint64_t)a7
{
  unint64_t v10;
  unint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  char *v16;

  v10 = a4;
  v12 = a7 * a4;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", a7 * a4);
  objc_msgSend(v13, "setLength:", v12);
  v14 = (char *)objc_msgSend(v13, "mutableBytes");
  v15 = objc_msgSend(a3, "bytes");
  if (v10)
  {
    v16 = (char *)(v15 + a5);
    do
    {
      memcpy(v14, v16, a7);
      v16 += a6;
      v14 += a7;
      --v10;
    }
    while (v10);
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  int v5;
  int64_t dataStride;
  int64_t dataOffset;
  NSData *v8;
  NSData *v9;
  int componentType;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSData *v19;
  NSInteger v20;
  int64_t v21;
  const __CFString *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *CopyWithBaseType;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t Accessor;
  unsigned int ComponentsValueType;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSString *semantic;
  uint64_t v62;
  const __CFString *v63;
  CGColorSpace *colorSpace;
  CFPropertyListRef v65;
  unsigned __int8 v66;
  uint64_t v67;
  uint64_t v68;

  LOWORD(v5) = self->_componentType;
  dataOffset = self->_dataOffset;
  dataStride = self->_dataStride;
  v8 = -[SCNGeometrySource data](self, "data");
  if (v8)
  {
    v9 = v8;
    if (self->_encodeDataAsHalf && C3DSceneSourceGetSceneCount())
    {
      componentType = (unsigned __int16)self->_componentType;
      if (componentType != (unsigned __int16)C3DBaseTypeGetComponentType((__int16)componentType))
      {
        v11 = scn_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[SCNGeometrySource encodeWithCoder:].cold.5(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      if (self->_componentType == 15)
      {
        v19 = v9;
      }
      else
      {
        if (self->_componentCount - 2 >= 3)
        {
          v25 = scn_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            -[SCNGeometrySource encodeWithCoder:].cold.4(v25, v26, v27, v28, v29, v30, v31, v32);
        }
        CopyWithBaseType = (const void *)C3DMeshSourceCreateCopyWithBaseType((uint64_t)self->_meshSource, *(__int16 *)&asc_1DD0DFA42[2 * self->_componentCount - 4], 0);
        if (!CopyWithBaseType)
        {
          v34 = scn_default_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            -[SCNGeometrySource encodeWithCoder:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);
        }
        Accessor = C3DMeshSourceGetAccessor(CopyWithBaseType);
        ComponentsValueType = C3DSourceAccessorGetComponentsValueType(Accessor);
        v5 = C3DBaseTypeGetComponentType(ComponentsValueType);
        dataStride = C3DSceneSourceGetLibrary(Accessor);
        dataOffset = C3DSourceAccessorGetOffset(Accessor);
        if (v5 != 15)
        {
          v44 = scn_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
            -[SCNGeometrySource encodeWithCoder:].cold.2(v44, v45, v46, v47, v48, v49, v50, v51);
        }
        C3DSizeOfBaseType(v5);
        v19 = (NSData *)(id)C3DMeshSourceGetData(CopyWithBaseType);
        CFRelease(CopyWithBaseType);
      }
      v68 = vImageEncodeVectorOptionsCreate();
      vImageEncodeVectorOptionsSetQuantization();
      v67 = 0;
      -[NSData bytes](v19, "bytes");
      -[NSData length](v19, "length");
      v52 = vImageEncodeVectorHalf();

      if (!v52)
      {
        v53 = scn_default_log();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
          -[SCNGeometrySource encodeWithCoder:].cold.1(v53, v54, v55, v56, v57, v58, v59, v60);
      }
      vImageEncodeVectorOptionsFree();
      v24 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v67, v52);
      v22 = CFSTR("cdata");
      v23 = a3;
    }
    else
    {
      v20 = -[SCNGeometrySource bytesPerComponent](self, "bytesPerComponent");
      v21 = -[SCNGeometrySource componentsPerVector](self, "componentsPerVector") * v20;
      if (v21 < self->_dataStride)
      {
        v9 = -[SCNGeometrySource _uninterleaveData:count:srcOffset:srcStride:dstStride:](self, "_uninterleaveData:count:srcOffset:srcStride:dstStride:", v9, self->_vectorCount, self->_dataOffset);
        dataOffset = 0;
        dataStride = v21;
      }
      v22 = CFSTR("data");
      v23 = a3;
      v24 = (uint64_t)v9;
    }
    objc_msgSend(v23, "encodeObject:forKey:", v24, v22);
  }
  semantic = self->_semantic;
  if (semantic)
    objc_msgSend(a3, "encodeObject:forKey:", semantic, CFSTR("semantic"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_vectorCount, CFSTR("vectorCount"));
  v67 = 0;
  v68 = 0;
  v66 = 0;
  if (C3DBaseTypeDescription((__int16)v5, &v68, &v67, &v66))
  {
    objc_msgSend(a3, "encodeBool:forKey:", v66, CFSTR("floatComponents"));
    v62 = v68;
    v63 = CFSTR("bytesPerComponent");
  }
  else
  {
    v62 = (__int16)v5;
    v63 = CFSTR("componentType");
  }
  objc_msgSend(a3, "encodeInteger:forKey:", v62, v63);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_componentCount, CFSTR("componentsPerVector"));
  objc_msgSend(a3, "encodeInteger:forKey:", dataOffset, CFSTR("dataOffset"));
  objc_msgSend(a3, "encodeInteger:forKey:", dataStride, CFSTR("dataStride"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_mkSemantic, CFSTR("mkSemantic"));
  colorSpace = self->_colorSpace;
  if (colorSpace)
  {
    v65 = CGColorSpaceCopyPropertyList(colorSpace);
    objc_msgSend(a3, "encodeObject:forKey:", v65, CFSTR("colorSpace"));
    CFRelease(v65);
  }
}

- (SCNGeometrySource)initWithCoder:(id)a3
{
  SCNGeometrySource *v4;
  uint64_t v5;
  unsigned __int16 v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int componentType;
  unsigned __int16 v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  size_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const void *v30;
  CGColorSpaceRef v31;
  CGColorSpaceRef v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int Semantic;
  int componentCount;
  NSObject *v37;
  unsigned int CompoundType;
  uint64_t CopyWithBaseType;
  uint64_t v40;
  __C3DMeshSource *meshSource;
  unint64_t v42;
  uint64_t Accessor;
  NSObject *v44;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)SCNGeometrySource;
  v4 = -[SCNGeometrySource init](&v46, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->_semantic = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("semantic"));
    v4->_vectorCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("vectorCount"));
    v4->_dataOffset = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("dataOffset"));
    v4->_dataStride = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("dataStride"));
    v4->_componentCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("componentsPerVector"));
    v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("componentType"));
    v4->_componentType = v6;
    if (v6)
    {
      if (v6 >= 0x2Eu)
      {
        v7 = scn_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[SCNGeometrySource initWithCoder:].cold.8();
        goto LABEL_40;
      }
    }
    else
    {
      v4->_componentType = C3DBaseTypeFromDescription(objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("bytesPerComponent")), 1, objc_msgSend(a3, "decodeBoolForKey:", CFSTR("floatComponents")));
    }
    v8 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cdata"));
    v4->_encodeDataAsHalf = v8 != 0;
    if (v8)
    {
      v9 = (void *)v8;
      if (C3DSceneSourceGetSceneCount())
      {
        componentType = (unsigned __int16)v4->_componentType;
        v11 = C3DBaseTypeGetComponentType((__int16)componentType);
        v12 = componentType != v11;
        if (componentType != v11)
        {
          v13 = scn_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[SCNGeometrySource initWithCoder:].cold.6();
        }
        if (v4->_componentType != 15)
        {
          v14 = scn_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[SCNGeometrySource initWithCoder:].cold.5();
          v12 = 1;
        }
        if (v4->_componentCount - 2 >= 3)
        {
          v37 = scn_default_log();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[SCNGeometrySource initWithCoder:].cold.4();
          goto LABEL_39;
        }
        if (v12)
        {
LABEL_39:
          +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
LABEL_40:

          return 0;
        }
        C3DSizeOfBaseType(v4->_componentType);
        v15 = v4->_dataStride * v4->_vectorCount;
        v16 = malloc_type_malloc(v15, 0x4C8D6FDDuLL);
        objc_msgSend(v9, "bytes");
        objc_msgSend(v9, "length");
        v17 = v16;
        if (vImageDecodeVectorHalf() != v15)
        {
          v18 = scn_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            -[SCNGeometrySource initWithCoder:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);
        }
        v4->_data = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v17, v15, 1);
        v5 = v5;
      }
      else
      {
        v26 = scn_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[SCNGeometrySource initWithCoder:].cold.7();
      }
    }
    else
    {
      v4->_data = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    }
    v27 = -[SCNGeometrySource bytesPerComponent](v4, "bytesPerComponent");
    v28 = -[SCNGeometrySource componentsPerVector](v4, "componentsPerVector");
    if (-[NSData length](v4->_data, "length") < v4->_dataOffset + v28 * v27 + (v4->_vectorCount - 1) * v4->_dataStride)
    {
      v29 = scn_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[SCNGeometrySource initWithCoder:].cold.1();
      goto LABEL_39;
    }
    v4->_mkSemantic = objc_msgSend(a3, "decodeIntForKey:", CFSTR("mkSemantic"));
    v30 = (const void *)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("colorSpace"));
    if (v30)
    {
      v31 = CGColorSpaceCreateWithPropertyList(v30);
      if (v31)
      {
        v32 = v31;
        v4->_data = (NSData *)-[SCNGeometrySource dataByConvertingColorData:colorSpace:newColorSpace:vectorCount:componentsPerVector:bytesPerComponent:dataOffset:dataStride:newDataOffset:newDataStride:](v4, "dataByConvertingColorData:colorSpace:newColorSpace:vectorCount:componentsPerVector:bytesPerComponent:dataOffset:dataStride:newDataOffset:newDataStride:", v4->_data, v31, &v4->_colorSpace, v4->_vectorCount, v4->_componentCount, C3DBaseTypeGetBytesPerComponent(v4->_componentType), v4->_dataOffset, v4->_dataStride, &v4->_dataOffset, &v4->_dataStride);
        CFRelease(v32);
      }
    }
    if (!C3DMetalIsSupported() || C3DPreferencesGetBool(0))
    {
      v33 = (unsigned __int16)v4->_componentType;
      if (v33 <= 0x18 && ((1 << v33) & 0x1808000) != 0)
      {
        v34 = -[SCNGeometrySource meshSource](v4, "meshSource");
        Semantic = C3DMeshSourceGetSemantic(v34);
        if ((unsigned __int16)v4->_componentType - 23 >= 2)
        {
          componentCount = v4->_componentCount;
        }
        else
        {
          componentCount = 4;
          v4->_componentCount = 4;
        }
        if (componentCount == 4 && Semantic <= 1)
        {
          componentCount = 3;
          v4->_componentCount = 3;
        }
        CompoundType = C3DBaseTypeGetCompoundType(1, componentCount);
        CopyWithBaseType = C3DMeshSourceCreateCopyWithBaseType(v34, CompoundType, 0);
        if (CopyWithBaseType)
        {
          v40 = CopyWithBaseType;
          meshSource = v4->_meshSource;
          if (meshSource)
            CFRelease(meshSource);
          v4->_meshSource = (__C3DMeshSource *)v40;

          v4->_data = (NSData *)(id)C3DMeshSourceGetData(v40);
          C3DMeshSourceGetContent(v40);
          v4->_componentType = 1;
          v4->_componentCount = HIBYTE(v42);
          C3DEntitySetObjCWrapper(v40, v4);
          Accessor = C3DMeshSourceGetAccessor(v40);
          v4->_dataOffset = C3DSourceAccessorGetOffset(Accessor);
          v4->_dataStride = C3DSceneSourceGetLibrary(Accessor);
        }
        else
        {
          v44 = scn_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            -[SCNGeometrySource initWithCoder:].cold.2();
        }
      }
    }
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: geometrySourceWithData: interleaved buffers as doubles are not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: geometrySourceWithBuffer - invalid vertex format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_geometrySourceWithSource:vertexFormat:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _geometrySourceWithSource - invalid vertex format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)meshSource
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not create mesh source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. vImageEncodeVectorHalf failed to write bytes", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Consistenty check issue during conversion for vImageEncodeVectorHalf", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. vImageEncodeVectorHalf only supports half2/3/4", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. SCNGeometrySource should only store a base type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Geometry source has invalid bounds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _geometrySourceWithSource - Conversion failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Decoding failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: vImageEncodeVectorHalf only supports half2/3/4", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCoder:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Data is marked as compressed but does not contain half components", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCoder:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: SCNGeometrySource should only store a base type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCoder:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Failed to decompress data because vImageDecodeVectorHalf is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCoder:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unknown component type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
