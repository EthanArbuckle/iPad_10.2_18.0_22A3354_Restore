@implementation SCNGeometryTessellator

- (SCNGeometryTessellator)init
{
  char *v2;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNGeometryTessellator;
  v2 = -[SCNGeometryTessellator init](&v9, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v2 + 20) = _Q0;
    *(_OWORD *)(v2 + 40) = xmmword_1DD008320;
  }
  return (SCNGeometryTessellator *)v2;
}

- (SCNGeometryTessellator)initWithCoder:(id)a3
{
  SCNGeometryTessellator *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNGeometryTessellator;
  v4 = -[SCNGeometryTessellator init](&v10, sel_init);
  if (v4)
  {
    v4->_clients = (NSMutableSet *)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("tessellationFactorScale"));
    v4->_tessellationFactorScale = v5;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maximumEdgeLength"));
    v4->_maximumEdgeLength = v6;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("edgeTessellationFactor"));
    v4->_edgeTessellationFactor = v7;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("insideTessellationFactor"));
    v4->_insideTessellationFactor = v8;
    v4->_adaptive = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("adaptive"));
    v4->_screenSpace = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("screenSpace"));
    v4->_partitionMode = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("tessellationPartitionMode"));
    v4->_smoothingMode = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("smoothingMode"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;
  double v6;
  double v7;
  double v8;

  *(float *)&v3 = self->_tessellationFactorScale;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("tessellationFactorScale"), v3);
  *(float *)&v6 = self->_maximumEdgeLength;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maximumEdgeLength"), v6);
  *(float *)&v7 = self->_edgeTessellationFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("edgeTessellationFactor"), v7);
  *(float *)&v8 = self->_insideTessellationFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("insideTessellationFactor"), v8);
  objc_msgSend(a3, "encodeBool:forKey:", self->_adaptive, CFSTR("adaptive"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_screenSpace, CFSTR("screenSpace"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_partitionMode, CFSTR("tessellationPartitionMode"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_smoothingMode, CFSTR("smoothingMode"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryTessellator;
  -[SCNGeometryTessellator dealloc](&v3, sel_dealloc);
}

- (id)description
{
  _BOOL4 screenSpace;
  void *v4;
  objc_class *v5;
  NSString *v6;
  double maximumEdgeLength;
  void *v9;
  objc_class *v10;
  uint64_t v11;

  if (self->_adaptive)
  {
    screenSpace = self->_screenSpace;
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    maximumEdgeLength = self->_maximumEdgeLength;
    if (screenSpace)
      return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, screen space (maximum edge length: %.3f px)>"), maximumEdgeLength, v6, self, self->_maximumEdgeLength, v11);
    else
      return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, local space (maximum edge length: %.3f)>"), maximumEdgeLength, v6, self, self->_maximumEdgeLength, v11);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    return (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p, uniform (inside: %.3f, edge: %.3f)>"), self->_insideTessellationFactor, NSStringFromClass(v10), self, self->_insideTessellationFactor, self->_edgeTessellationFactor);
  }
}

- (void)addClient:(id)a3
{
  -[NSMutableSet addObject:](self->_clients, "addObject:");
  -[SCNGeometryTessellator tessellatorValueDidChangeForClient:](self, "tessellatorValueDidChangeForClient:", a3);
}

- (void)removeClient:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v5 = objc_msgSend(a3, "geometryRef");
  v6 = objc_msgSend(a3, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SCNGeometryTessellator_removeClient___block_invoke;
  v7[3] = &__block_descriptor_40_e8_v16__0d8l;
  v7[4] = v5;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, a3, v7);
  -[NSMutableSet removeObject:](self->_clients, "removeObject:", a3);
}

void __39__SCNGeometryTessellator_removeClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[3];

  v1 = *(_QWORD *)(a1 + 32);
  memset(v2, 0, sizeof(v2));
  C3DGeometrySetTessellator(v1, (unsigned __int8 *)v2);
}

- (void)clientWillDie:(id)a3
{
  -[NSMutableSet removeObject:](self->_clients, "removeObject:", a3);
}

- (void)tessellatorValueDidChange
{
  NSMutableSet *clients;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  clients = self->_clients;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(clients);
        -[SCNGeometryTessellator tessellatorValueDidChangeForClient:](self, "tessellatorValueDidChangeForClient:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- ($7338CD085D135657D9A3115DAE7B9BC3)_tessellatorValueForGeometry:(SEL)a3
{
  void *v6;
  unsigned __int8 v7;
  double v8;
  float v9;
  $7338CD085D135657D9A3115DAE7B9BC3 *result;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;

  v6 = (void *)objc_msgSend(a4, "tessellator");
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0;
  *(_QWORD *)&retstr->var0 = 0;
  if (objc_msgSend(a4, "subdivisionLevel"))
  {
    v7 = 4;
  }
  else if (objc_msgSend(v6, "isAdaptive"))
  {
    if (objc_msgSend(v6, "isScreenSpace"))
      v7 = 2;
    else
      v7 = 3;
  }
  else
  {
    v7 = 1;
  }
  retstr->var0 = v7;
  objc_msgSend(v6, "tessellationFactorScale");
  if (v8 < 0.00100000005)
    v8 = 0.00100000005;
  v9 = v8;
  retstr->var1 = v9;
  retstr->var2 = objc_msgSend(v6, "tessellationPartitionMode");
  result = ($7338CD085D135657D9A3115DAE7B9BC3 *)objc_msgSend(v6, "smoothingMode");
  retstr->var3 = result;
  switch(v7)
  {
    case 1u:
      objc_msgSend(v6, "edgeTessellationFactor");
      *(float *)&v12 = v12;
      retstr->var4.var0.var0 = *(float *)&v12;
      result = ($7338CD085D135657D9A3115DAE7B9BC3 *)objc_msgSend(v6, "insideTessellationFactor");
      *(float *)&v13 = v13;
      retstr->var4.var0.var1 = *(float *)&v13;
      break;
    case 2u:
    case 3u:
      result = ($7338CD085D135657D9A3115DAE7B9BC3 *)objc_msgSend(v6, "maximumEdgeLength");
      *(float *)&v11 = v11;
      retstr->var4.var0.var0 = *(float *)&v11;
      break;
    case 4u:
      objc_msgSend(v6, "tessellationFactorScale");
      retstr->var4.var3.var0 = (int)v14;
      BYTE1(retstr->var4.var0.var0) = 1;
      result = ($7338CD085D135657D9A3115DAE7B9BC3 *)objc_msgSend(v6, "isScreenSpace");
      if ((_DWORD)result)
        v15 = 3;
      else
        v15 = 1;
      BYTE1(retstr->var4.var0.var0) = v15;
      break;
    default:
      return result;
  }
  return result;
}

- (void)tessellatorValueDidChangeForClient:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v8 = 0uLL;
  v9 = 0;
  if (self)
    -[SCNGeometryTessellator _tessellatorValueForGeometry:](self, "_tessellatorValueForGeometry:", a3);
  v4 = objc_msgSend(a3, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SCNGeometryTessellator_tessellatorValueDidChangeForClient___block_invoke;
  v5[3] = &unk_1EA5A36D0;
  v5[4] = a3;
  v6 = v8;
  v7 = v9;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, a3, v5);
}

void __61__SCNGeometryTessellator_tessellatorValueDidChangeForClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  C3DGeometrySetTessellator(v2, (unsigned __int8 *)&v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SCNGeometryTessellator tessellationFactorScale](self, "tessellationFactorScale");
  *(float *)&v5 = v5;
  v4[8] = LODWORD(v5);
  -[SCNGeometryTessellator maximumEdgeLength](self, "maximumEdgeLength");
  *(float *)&v6 = v6;
  v4[5] = LODWORD(v6);
  -[SCNGeometryTessellator edgeTessellationFactor](self, "edgeTessellationFactor");
  *(float *)&v7 = v7;
  v4[6] = LODWORD(v7);
  -[SCNGeometryTessellator insideTessellationFactor](self, "insideTessellationFactor");
  *(float *)&v8 = v8;
  v4[7] = LODWORD(v8);
  *((_BYTE *)v4 + 16) = -[SCNGeometryTessellator isAdaptive](self, "isAdaptive");
  *((_BYTE *)v4 + 17) = -[SCNGeometryTessellator isScreenSpace](self, "isScreenSpace");
  *((_QWORD *)v4 + 5) = -[SCNGeometryTessellator smoothingMode](self, "smoothingMode");
  return v4;
}

- (SCNTessellationSmoothingMode)smoothingMode
{
  return self->_smoothingMode;
}

- (void)setSmoothingMode:(SCNTessellationSmoothingMode)smoothingMode
{
  if (self->_smoothingMode != smoothingMode)
  {
    self->_smoothingMode = smoothingMode;
    -[SCNGeometryTessellator tessellatorValueDidChange](self, "tessellatorValueDidChange");
  }
}

- (BOOL)isAdaptive
{
  return self->_adaptive;
}

- (void)setAdaptive:(BOOL)adaptive
{
  if (self->_adaptive != adaptive)
  {
    self->_adaptive = adaptive;
    -[SCNGeometryTessellator tessellatorValueDidChange](self, "tessellatorValueDidChange");
  }
}

- (BOOL)isScreenSpace
{
  return self->_screenSpace;
}

- (void)setScreenSpace:(BOOL)screenSpace
{
  if (self->_screenSpace != screenSpace)
  {
    self->_screenSpace = screenSpace;
    -[SCNGeometryTessellator tessellatorValueDidChange](self, "tessellatorValueDidChange");
  }
}

- (CGFloat)tessellationFactorScale
{
  return self->_tessellationFactorScale;
}

- (void)setTessellationFactorScale:(CGFloat)tessellationFactorScale
{
  float v3;

  if (self->_tessellationFactorScale != tessellationFactorScale)
  {
    v3 = tessellationFactorScale;
    self->_tessellationFactorScale = v3;
    -[SCNGeometryTessellator tessellatorValueDidChange](self, "tessellatorValueDidChange");
  }
}

- (CGFloat)edgeTessellationFactor
{
  return self->_edgeTessellationFactor;
}

- (void)setEdgeTessellationFactor:(CGFloat)edgeTessellationFactor
{
  float v3;

  if (self->_edgeTessellationFactor != edgeTessellationFactor)
  {
    v3 = edgeTessellationFactor;
    self->_edgeTessellationFactor = v3;
    -[SCNGeometryTessellator tessellatorValueDidChange](self, "tessellatorValueDidChange");
  }
}

- (CGFloat)insideTessellationFactor
{
  return self->_insideTessellationFactor;
}

- (void)setInsideTessellationFactor:(CGFloat)insideTessellationFactor
{
  float v3;

  if (self->_insideTessellationFactor != insideTessellationFactor)
  {
    v3 = insideTessellationFactor;
    self->_insideTessellationFactor = v3;
    -[SCNGeometryTessellator tessellatorValueDidChange](self, "tessellatorValueDidChange");
  }
}

- (CGFloat)maximumEdgeLength
{
  return self->_maximumEdgeLength;
}

- (void)setMaximumEdgeLength:(CGFloat)maximumEdgeLength
{
  float v3;

  if (self->_maximumEdgeLength != maximumEdgeLength)
  {
    v3 = maximumEdgeLength;
    self->_maximumEdgeLength = v3;
    -[SCNGeometryTessellator tessellatorValueDidChange](self, "tessellatorValueDidChange");
  }
}

- (MTLTessellationPartitionMode)tessellationPartitionMode
{
  return self->_partitionMode;
}

- (void)setTessellationPartitionMode:(MTLTessellationPartitionMode)tessellationPartitionMode
{
  if (self->_partitionMode != tessellationPartitionMode)
  {
    self->_partitionMode = tessellationPartitionMode;
    -[SCNGeometryTessellator tessellatorValueDidChange](self, "tessellatorValueDidChange");
  }
}

@end
