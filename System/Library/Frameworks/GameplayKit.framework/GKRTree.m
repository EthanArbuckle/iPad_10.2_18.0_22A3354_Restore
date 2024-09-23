@implementation GKRTree

- (void)dealloc
{
  id *cRTree;
  objc_super v4;

  cRTree = (id *)self->_cRTree;
  if (cRTree)
  {

    _ZNSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEED1B8ne180100Ev(cRTree + 3);
    MEMORY[0x22E2A50A0](cRTree, 0x10A0C40EBF3C9F8);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKRTree;
  -[GKRTree dealloc](&v4, sel_dealloc);
}

- (GKRTree)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GKInitNotAllowedException"), CFSTR("initWithMaxNumberOfChildren: is the destignated initialize for GKRTree.  Use that instead"));
  return -[GKRTree initWithMaxNumberOfChildren:](self, "initWithMaxNumberOfChildren:", 0);
}

+ (GKRTree)treeWithMaxNumberOfChildren:(NSUInteger)maxNumberOfChildren
{
  return (GKRTree *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMaxNumberOfChildren:", maxNumberOfChildren);
}

- (GKRTree)initWithMaxNumberOfChildren:(NSUInteger)maxNumberOfChildren
{
  unsigned int v3;
  GKRTree *v4;
  uint64_t v5;
  objc_super v7;

  v3 = maxNumberOfChildren;
  v7.receiver = self;
  v7.super_class = (Class)GKRTree;
  v4 = -[GKRTree init](&v7, sel_init);
  if (v4)
  {
    v5 = operator new();
    *(_DWORD *)v5 = 0;
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    if (v3 <= 1)
      __assert_rtn("GKCRTree", "GKCRTree.h", 821, "maxNumberOfObjects >= 2");
    *(_DWORD *)v5 = v3;
    v4->_cRTree = (void *)v5;
    -[GKRTree setQueryReserve:](v4, "setQueryReserve:", 1);
  }
  return v4;
}

- (void)addElement:(id)element boundingRectMin:(vector_float2)boundingRectMin boundingRectMax:(vector_float2)boundingRectMax splitStrategy:(GKRTreeSplitStrategy)splitStrategy
{
  _ZN12GKCRTreeNodeI8NSObjectDv2_fE12InsertObjectEPS0_S1_S1_21GKCRTreeSplitStrategy((float32x2_t *)self->_cRTree, element, splitStrategy, (float32x2_t)boundingRectMin, (float32x2_t)boundingRectMax);
}

- (void)removeElement:(id)element boundingRectMin:(vector_float2)boundingRectMin boundingRectMax:(vector_float2)boundingRectMax
{
  id v8;
  _QWORD *cRTree;
  id v10;

  v8 = element;
  cRTree = self->_cRTree;
  v10 = v8;
  if (cRTree[4] != cRTree[3])
    _ZN12GKCRTreeNodeI8NSObjectDv2_fE12RemoveObjectEPS0_S1_S1_(cRTree, v10, *(double *)&boundingRectMin, *(double *)&boundingRectMax);

}

- (NSArray)elementsInBoundingRectMin:(vector_float2)rectMin rectMax:(vector_float2)rectMax
{
  float32x2_t *cRTree;
  float32x2_t v8;
  float32x2_t v9;
  int32x2_t v10;
  void *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  void *__p;
  char *v18;
  uint64_t v19;

  __p = 0;
  v18 = 0;
  v19 = 0;
  std::vector<NSObject * {__strong}>::reserve((uint64_t)&__p, -[GKRTree queryReserve](self, "queryReserve"));
  cRTree = (float32x2_t *)self->_cRTree;
  v8 = cRTree[2];
  if ((vcgt_f32((float32x2_t)rectMin, v8).u32[0] & 1) == 0)
  {
    v9 = cRTree[1];
    if ((vcge_f32((float32x2_t)rectMax, v9).u32[0] & 1) != 0)
    {
      v10 = vcge_f32((float32x2_t)vzip2_s32((int32x2_t)rectMax, (int32x2_t)v8), (float32x2_t)vzip2_s32((int32x2_t)v9, (int32x2_t)rectMin));
      if ((v10.i8[4] & 1) != 0 && (v10.i8[0] & 1) != 0)
        _ZN12GKCRTreeNodeI8NSObjectDv2_fE5QueryES1_S1_RNSt3__16vectorIU8__strongPS0_NS3_9allocatorIS6_EEEE(cRTree, &__p, (float32x2_t)rectMin, (float32x2_t)rectMax);
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (char *)__p;
  if (__p)
  {
    v13 = v18;
    v14 = __p;
    if (v18 != __p)
    {
      do
      {
        v15 = (void *)*((_QWORD *)v13 - 1);
        v13 -= 8;

      }
      while (v13 != v12);
      v14 = __p;
    }
    v18 = v12;
    operator delete(v14);
  }
  return (NSArray *)v11;
}

- (NSUInteger)queryReserve
{
  return self->_queryReserve;
}

- (void)setQueryReserve:(NSUInteger)queryReserve
{
  self->_queryReserve = queryReserve;
}

@end
