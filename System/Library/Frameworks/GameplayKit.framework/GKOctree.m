@implementation GKOctree

+ (GKOctree)octreeWithBoundingBox:(GKBox *)box minimumCellSize:(float)minCellSize
{
  double v4;
  int v5;
  int v6;
  GKOctree *v7;
  double v8;
  double v10;
  double v11;

  v6 = v5;
  v10 = *(double *)&minCellSize;
  v11 = v4;
  v7 = [GKOctree alloc];
  LODWORD(v8) = v6;
  return -[GKOctree initWithBoundingBox:minimumCellSize:](v7, "initWithBoundingBox:minimumCellSize:", v10, v11, v8);
}

- (GKOctree)init
{
  double v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("initWithMinPosition: is the destignated initialize for GKOctree.  Use that instead"));
  LODWORD(v3) = 0;
  return -[GKOctree initWithBoundingBox:minimumCellSize:](self, "initWithBoundingBox:minimumCellSize:", *(double *)&_PromotedConst, 0.0, v3);
}

- (GKOctree)initWithBoundingBox:(GKBox *)box minimumCellSize:(float)minCellSize
{
  float32x4_t v4;
  int v5;
  int v6;
  GKOctree *v7;
  _QWORD *v8;
  uint64_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  GKOctreeNode *v13;
  void *v14;
  float32x4_t v16;
  float32x4_t v17;
  objc_super v18;

  v6 = v5;
  v16 = v4;
  v17 = *(float32x4_t *)&minCellSize;
  v18.receiver = self;
  v18.super_class = (Class)GKOctree;
  v7 = -[GKOctree init](&v18, sel_init, box);
  if (v7)
  {
    v8 = (_QWORD *)operator new();
    *v8 = &off_24F04F460;
    v9 = operator new();
    *(_QWORD *)v9 = &off_24F04F490;
    *(float32x4_t *)(v9 + 16) = v17;
    *(float32x4_t *)(v9 + 32) = v16;
    v10 = vsubq_f32(v16, v17);
    v11.i64[0] = 0x3F0000003F000000;
    v11.i64[1] = 0x3F0000003F000000;
    v12 = vmulq_f32(v10, v11);
    *(float32x4_t *)(v9 + 64) = v10;
    *(float32x4_t *)(v9 + 80) = vaddq_f32(v12, v17);
    *(_DWORD *)(v9 + 96) = v6;
    *(_OWORD *)(v9 + 104) = 0u;
    *(_OWORD *)(v9 + 120) = 0u;
    *(_OWORD *)(v9 + 136) = 0u;
    *(_OWORD *)(v9 + 152) = 0u;
    *(_OWORD *)(v9 + 168) = 0u;
    *(_OWORD *)(v9 + 184) = 0u;
    *(_QWORD *)(v9 + 200) = 0;
    *(float32x4_t *)(v9 + 48) = v12;
    v13 = objc_alloc_init(GKOctreeNode);
    v14 = *(void **)(v9 + 200);
    *(_QWORD *)(v9 + 200) = v13;

    objc_msgSend(*(id *)(v9 + 200), "setCOctreeNode:", v9);
    v8[1] = v9;
    v7->_cOctree = v8;
  }
  return v7;
}

- (void)dealloc
{
  void *cOctree;
  objc_super v4;

  cOctree = self->_cOctree;
  if (cOctree)
    (*(void (**)(void *, SEL))(*(_QWORD *)cOctree + 8))(cOctree, a2);
  v4.receiver = self;
  v4.super_class = (Class)GKOctree;
  -[GKOctree dealloc](&v4, sel_dealloc);
}

- (GKOctreeNode)addElement:(id)element withPoint:(vector_float3)point
{
  int8x16_t v4;

  return (GKOctreeNode *)*(id *)(GKCOctreeNode<NSObject>::addPoint(*((_QWORD *)self->_cOctree + 1), element, v4)+ 200);
}

- (GKOctreeNode)addElement:(id)element withBox:(GKBox *)box
{
  float32x4_t v4;
  float32x4_t v5;

  return (GKOctreeNode *)*(id *)(GKCOctreeNode<NSObject>::addBox(*((_QWORD *)self->_cOctree + 1), element, v4, vsubq_f32(v5, v4))+ 200);
}

- (NSArray)elementsAtPoint:(vector_float3)point
{
  int8x16_t v3;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  int8x16_t v12;
  void *__p;
  _QWORD *v14;
  uint64_t v15;

  v12 = v3;
  __p = 0;
  v14 = 0;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", point.i64[0], point.i64[1]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKCOctreeNode<NSObject>::queryPoint(*((id **)self->_cOctree + 1), (uint64_t)&__p, v12);
  v6 = __p;
  if (__p != v14)
  {
    do
      objc_msgSend(v5, "addObject:", *v6++);
    while (v6 != v14);
  }
  v7 = __p;
  if (__p)
  {
    v8 = v14;
    v9 = __p;
    if (v14 != __p)
    {
      do
      {
        v10 = (void *)*--v8;

      }
      while (v8 != v7);
      v9 = __p;
    }
    v14 = v7;
    operator delete(v9);
  }
  return (NSArray *)v5;
}

- (NSArray)elementsInBox:(GKBox *)box
{
  float32x4_t v3;
  float32x4_t v4;
  void *v6;
  id **cOctree;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  void *__p;
  _QWORD *v18;
  uint64_t v19;
  float32x4_t v20;
  float32x4_t v21;

  v14 = v3;
  v15 = v4;
  v20 = v3;
  v21 = v4;
  __p = 0;
  v18 = 0;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", box);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  cOctree = (id **)self->_cOctree;
  v16 = vsubq_f32(v15, v14);
  GKCOctreeNode<NSObject>::queryBox(cOctree[1], &v20, &v16, (uint64_t)&__p);
  v8 = __p;
  if (__p != v18)
  {
    do
      objc_msgSend(v6, "addObject:", *v8++);
    while (v8 != v18);
  }
  v9 = __p;
  if (__p)
  {
    v10 = v18;
    v11 = __p;
    if (v18 != __p)
    {
      do
      {
        v12 = (void *)*--v10;

      }
      while (v10 != v9);
      v11 = __p;
    }
    v18 = v9;
    operator delete(v11);
  }
  return (NSArray *)v6;
}

- (BOOL)removeElement:(id)element
{
  return GKCOctreeNode<NSObject>::removeDataRecursive(*((_QWORD **)self->_cOctree + 1), element);
}

- (BOOL)removeElement:(id)element withNode:(GKOctreeNode *)node
{
  id v5;
  GKOctreeNode *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  _QWORD *v13;
  void *v14;
  void *v15;

  v5 = element;
  v6 = node;
  v7 = -[GKOctreeNode cOctreeNode](v6, "cOctreeNode");
  v8 = v5;
  v9 = v8;
  v10 = *(_QWORD **)(v7 + 176);
  v11 = *(_QWORD **)(v7 + 184);
  if (v10 == v11)
  {
LABEL_4:
    v12 = 0;
  }
  else
  {
    while ((id)*v10 != v8)
    {
      if (++v10 == v11)
        goto LABEL_4;
    }
    v13 = v10 + 1;
    if (v10 + 1 != v11)
    {
      do
      {
        v10 = v13;
        v14 = (void *)*(v13 - 1);
        *(v13 - 1) = *v13;
        *v13 = 0;

        v13 = v10 + 1;
      }
      while (v10 + 1 != v11);
      v11 = *(_QWORD **)(v7 + 184);
    }
    while (v11 != v10)
    {
      v15 = (void *)*--v11;

    }
    *(_QWORD *)(v7 + 184) = v10;
    v12 = 1;
  }

  return v12;
}

- (void)initWithBoundingBox:(uint64_t)a1 minimumCellSize:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void **v6;
  char v7;
  void **v8;
  void *v9;

  v5 = (void *)OUTLINED_FUNCTION_0_0(a1, a2);
  if (!v7)
  {
    v8 = v6;
    do
    {
      v9 = *(void **)(v4 - 8);
      v4 -= 8;

    }
    while (v4 != v2);
    v5 = *v8;
  }
  *(_QWORD *)(v3 + 184) = v2;
  operator delete(v5);
}

@end
