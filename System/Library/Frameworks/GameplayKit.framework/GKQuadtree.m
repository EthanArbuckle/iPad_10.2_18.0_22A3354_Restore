@implementation GKQuadtree

+ (GKQuadtree)quadtreeWithBoundingQuad:(GKQuad)quad minimumCellSize:(float)minCellSize
{
  double v5;
  double v6;
  GKQuadtree *v7;
  double v8;

  v5 = *(double *)&quad.quadMax;
  v6 = *(double *)&quad.quadMin;
  v7 = [GKQuadtree alloc];
  *(float *)&v8 = minCellSize;
  return -[GKQuadtree initWithBoundingQuad:minimumCellSize:](v7, "initWithBoundingQuad:minimumCellSize:", v6, v5, v8);
}

- (GKQuadtree)initWithBoundingQuad:(GKQuad)quad minimumCellSize:(float)minCellSize
{
  vector_float2 quadMax;
  vector_float2 quadMin;
  GKQuadtree *v7;
  _QWORD *v8;
  uint64_t v9;
  objc_super v11;

  quadMax = quad.quadMax;
  quadMin = quad.quadMin;
  v11.receiver = self;
  v11.super_class = (Class)GKQuadtree;
  v7 = -[GKQuadtree init](&v11, sel_init);
  if (v7)
  {
    v8 = (_QWORD *)operator new();
    *v8 = &off_24F04F018;
    v9 = operator new();
    GKCQuadTreeNode<NSObject>::GKCQuadTreeNode(v9, 0, (float32x2_t)quadMin, (float32x2_t)quadMax, minCellSize);
    v8[1] = v9;
    v7->_cQuadTree = v8;
  }
  return v7;
}

- (void)dealloc
{
  void *cQuadTree;
  objc_super v4;

  cQuadTree = self->_cQuadTree;
  if (cQuadTree)
    (*(void (**)(void *, SEL))(*(_QWORD *)cQuadTree + 8))(cQuadTree, a2);
  v4.receiver = self;
  v4.super_class = (Class)GKQuadtree;
  -[GKQuadtree dealloc](&v4, sel_dealloc);
}

- (GKQuadtreeNode)addElement:(id)element withPoint:(vector_float2)point
{
  return (GKQuadtreeNode *)*(id *)&GKCQuadTreeNode<NSObject>::addPoint(*((float32x2_t **)self->_cQuadTree + 1), element, *(double *)&point)[14];
}

- (GKQuadtreeNode)addElement:(id)element withQuad:(GKQuad)quad
{
  return (GKQuadtreeNode *)*(id *)&GKCQuadTreeNode<NSObject>::addQuad(*((float32x2_t **)self->_cQuadTree + 1), element, (__n128)quad, 0.0)[14];
}

- (NSArray)elementsAtPoint:(vector_float2)point
{
  void *v5;
  float32x2_t *v6;
  double v7;
  float32x2_t *v8;
  const float *v9;
  float32x2_t v10;
  int32x2_t v11;
  int32x2_t v12;
  void **v13;
  void **v14;
  char *v15;
  char *v16;
  char *v17;
  void *v18;
  void *v19;
  void *__p;
  char *v22;
  uint64_t v23;

  __p = 0;
  v22 = 0;
  v23 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (float32x2_t *)*((_QWORD *)self->_cQuadTree + 1);
  v7 = 0.0000305175853;
  while (1)
  {
    v9 = (const float *)&v6[5];
    v10 = vld1_dup_f32(v9);
    v11 = vcgt_f32(vmul_f32(v6[3], (float32x2_t)0x3F0000003F000000), v10);
    if ((v11.i32[0] & v11.i32[1] & 1) == 0)
      break;
    v12 = vcgt_f32(v6[4], (float32x2_t)point);
    if ((v12.i8[0] & 1) != 0)
    {
      if ((v12.i8[4] & 1) != 0)
        v8 = v6 + 9;
      else
        v8 = v6 + 7;
    }
    else if ((v12.i8[4] & 1) != 0)
    {
      v8 = v6 + 10;
    }
    else
    {
      v8 = v6 + 8;
    }
    v6 = (float32x2_t *)*v8;
    if (!v6)
      goto LABEL_13;
  }
  v13 = (void **)v6[11];
  v14 = (void **)v6[12];
  if (v14 != v13)
    std::vector<NSObject * {__strong}>::__insert_with_size[abi:ne180100]<std::__wrap_iter<NSObject * const {__strong}*>,NSObject * const {__strong}*>((id **)&__p, (uint64_t)v22, v13, v14, v14 - v13);
LABEL_13:
  v15 = (char *)__p;
  if (__p != v22)
  {
    do
    {
      objc_msgSend(v5, "addObject:", *(_QWORD *)v15, v7);
      v15 += 8;
    }
    while (v15 != v22);
  }
  v16 = (char *)__p;
  if (__p)
  {
    v17 = v22;
    v18 = __p;
    if (v22 != __p)
    {
      do
      {
        v19 = (void *)*((_QWORD *)v17 - 1);
        v17 -= 8;

      }
      while (v17 != v16);
      v18 = __p;
    }
    v22 = v16;
    operator delete(v18);
  }
  return (NSArray *)v5;
}

- (NSArray)elementsInQuad:(GKQuad)quad
{
  vector_float2 quadMax;
  vector_float2 quadMin;
  void *v6;
  id **cQuadTree;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  float32x2_t v14;
  void *__p;
  _QWORD *v16;
  uint64_t v17;
  float32x2_t v18[2];

  quadMax = quad.quadMax;
  quadMin = quad.quadMin;
  v18[0] = (float32x2_t)quad.quadMin;
  v18[1] = (float32x2_t)quad.quadMax;
  __p = 0;
  v16 = 0;
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  cQuadTree = (id **)self->_cQuadTree;
  v14 = vsub_f32((float32x2_t)quadMax, (float32x2_t)quadMin);
  GKCQuadTreeNode<NSObject>::queryQuad(cQuadTree[1], v18, &v14, (uint64_t)&__p);
  v8 = __p;
  if (__p != v16)
  {
    do
      objc_msgSend(v6, "addObject:", *v8++);
    while (v8 != v16);
  }
  v9 = __p;
  if (__p)
  {
    v10 = v16;
    v11 = __p;
    if (v16 != __p)
    {
      do
      {
        v12 = (void *)*--v10;

      }
      while (v10 != v9);
      v11 = __p;
    }
    v16 = v9;
    operator delete(v11);
  }
  return (NSArray *)v6;
}

- (BOOL)removeElement:(id)element
{
  return GKCQuadTreeNode<NSObject>::removeDataRecursive(*((_QWORD **)self->_cQuadTree + 1), element);
}

- (BOOL)removeElement:(id)data withNode:(GKQuadtreeNode *)node
{
  id v6;
  GKQuadtreeNode *v7;

  v6 = data;
  v7 = node;
  LOBYTE(self) = GKCQuadTree<NSObject>::removeDataWithNode((uint64_t)self->_cQuadTree, v6, (uint64_t)-[GKQuadtreeNode cQuadTreeNode](v7, "cQuadTreeNode"));

  return (char)self;
}

@end
