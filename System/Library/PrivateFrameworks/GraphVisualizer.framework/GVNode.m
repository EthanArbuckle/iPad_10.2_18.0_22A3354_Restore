@implementation GVNode

- (GVNode)init
{
  char *v2;
  GVNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GVNode;
  v2 = -[GVNode init](&v5, sel_init);
  v3 = (GVNode *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *((_QWORD *)v2 + 7) = 0;
    *((_QWORD *)v2 + 8) = 0;
    *((_QWORD *)v2 + 11) = 0;
    *((_QWORD *)v2 + 12) = 0;
    *((_QWORD *)v2 + 5) = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v3->outNodes = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GVNode;
  -[GVNode dealloc](&v3, sel_dealloc);
}

- (double)cx
{
  return self->x + self->w * 0.5;
}

- (void)setCx:(double)a3
{
  self->x = a3 + self->w * -0.5;
}

- (double)cy
{
  return self->y + self->h * 0.5;
}

- (void)setCy:(double)a3
{
  self->y = a3 + self->h * -0.5;
}

- (CGRect)frame
{
  double x;
  double y;
  double w;
  double h;
  CGRect result;

  x = self->x;
  y = self->y;
  w = self->w;
  h = self->h;
  result.size.height = h;
  result.size.width = w;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  *(CGRect *)&self->x = a3;
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->x;
  y = self->y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  *(CGPoint *)&self->x = a3;
}

- (CGPoint)center
{
  float64x2_t v7;
  double v8;
  CGPoint result;

  __asm { FMOV            V2.2D, #0.5 }
  v7 = vaddq_f64(*(float64x2_t *)&self->x, vmulq_f64(*(float64x2_t *)&self->w, _Q2));
  v8 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v8;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y;

  __asm { FMOV            V3.2D, #-0.5 }
  y = a3.y;
  *(float64x2_t *)&self->x = vaddq_f64((float64x2_t)a3, vmulq_f64(*(float64x2_t *)&self->w, _Q3));
}

- (CGSize)size
{
  double w;
  double h;
  CGSize result;

  w = self->w;
  h = self->h;
  result.height = h;
  result.width = w;
  return result;
}

- (void)setSize:(CGSize)a3
{
  *(CGSize *)&self->w = a3;
}

- (unint64_t)inDegree
{
  return -[NSMutableOrderedSet count](-[GVNode inNodes](self, "inNodes"), "count");
}

- (unint64_t)outDegree
{
  return -[NSMutableOrderedSet count](-[GVNode outNodes](self, "outNodes"), "count");
}

- (BOOL)hasEdgeFrom:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->inNodes, "containsObject:", a3);
}

- (BOOL)hasEdgeTo:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->outNodes, "containsObject:", a3);
}

- (void)addEdgeFrom:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->inNodes, "addObject:");
  objc_msgSend((id)objc_msgSend(a3, "outNodes"), "addObject:", self);
}

- (void)addEdgeTo:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->outNodes, "addObject:");
  objc_msgSend((id)objc_msgSend(a3, "inNodes"), "addObject:", self);
}

- (void)removeEdgeFrom:(id)a3
{
  -[NSMutableOrderedSet removeObject:](self->inNodes, "removeObject:");
  objc_msgSend((id)objc_msgSend(a3, "outNodes"), "removeObject:", self);
}

- (void)removeEdgeTo:(id)a3
{
  -[NSMutableOrderedSet removeObject:](self->outNodes, "removeObject:");
  objc_msgSend((id)objc_msgSend(a3, "inNodes"), "removeObject:", self);
}

- (void)computePriority
{
  NSMutableOrderedSet *inNodes;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSMutableOrderedSet *outNodes;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->inPriority = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  inNodes = self->inNodes;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](inNodes, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(inNodes);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "isMemberOfClass:", objc_opt_class()))
          v8 = 2;
        else
          v8 = 1;
        self->inPriority += v8;
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](inNodes, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }
  self->outPriority = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  outNodes = self->outNodes;
  v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](outNodes, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(outNodes);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "isMemberOfClass:", objc_opt_class()))
          v14 = 2;
        else
          v14 = 1;
        self->inPriority += v14;
      }
      v11 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](outNodes, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }
}

- (id)description
{
  void *v3;
  const char *ClassName;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  ClassName = object_getClassName(self);
  -[GVNode center](self, "center");
  v6 = v5;
  -[GVNode center](self, "center");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%p [%s center=<%f,%f>]"), self, ClassName, v6, v7);
}

- (void)traversePostorder:(int)a3 withCallback:(id)a4 stopper:(id)a5 randomize:(BOOL)a6
{
  void *v11;

  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if (a6)
    _traverse_postorder_randomized((uint64_t)self, 0, 0, a3, (uint64_t)a5, (uint64_t)a4, v11);
  else
    _traverse_postorder((uint64_t)self, 0, 0, a3, (uint64_t)a5, (uint64_t)a4, v11);
}

- (void)traversePreorder:(int)a3 withCallback:(id)a4 randomize:(BOOL)a5
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = v9;
  if (a5)
  {
    if (self
      && (objc_msgSend(v9, "containsObject:", self) & 1) == 0
      && ((*((uint64_t (**)(id, GVNode *, _QWORD, _QWORD))a4 + 2))(a4, self, 0, 0) & 1) == 0)
    {
      objc_msgSend(v10, "addObject:", self);
      if (a3 == 2)
      {
        v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
        objc_msgSend(v16, "unionOrderedSet:", -[GVNode inNodes](self, "inNodes"));
        objc_msgSend(v16, "unionOrderedSet:", -[GVNode outNodes](self, "outNodes"));
        objc_msgSend(v16, "minusSet:", v10);
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v17 = fisherYates(v16);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v28 != v20)
                objc_enumerationMutation(v17);
              _traverse_preorder(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), (uint64_t)self, 1, 2, (uint64_t)a4, v10);
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v19);
        }
      }
      else if (a3 == 1)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v22 = fisherYates(-[GVNode inNodes](self, "inNodes", 0));
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v28 != v25)
                objc_enumerationMutation(v22);
              _traverse_preorder(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j), (uint64_t)self, 1, 1, (uint64_t)a4, v10);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v24);
        }
      }
      else
      {
        if (a3)
          -[GVNode traversePreorder:withCallback:randomize:].cold.1();
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v11 = fisherYates(-[GVNode outNodes](self, "outNodes", 0));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v28;
          do
          {
            for (k = 0; k != v13; ++k)
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              _traverse_preorder(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k), (uint64_t)self, 1, 0, (uint64_t)a4, v10);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v13);
        }
      }
    }
  }
  else
  {
    _traverse_preorder((uint64_t)self, 0, 0, a3, (uint64_t)a4, v9);
  }
}

- (double)x
{
  return self->x;
}

- (void)setX:(double)a3
{
  self->x = a3;
}

- (double)y
{
  return self->y;
}

- (void)setY:(double)a3
{
  self->y = a3;
}

- (double)w
{
  return self->w;
}

- (void)setW:(double)a3
{
  self->w = a3;
}

- (double)h
{
  return self->h;
}

- (void)setH:(double)a3
{
  self->h = a3;
}

- (NSMutableOrderedSet)inNodes
{
  return self->inNodes;
}

- (void)setInNodes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableOrderedSet)outNodes
{
  return self->outNodes;
}

- (void)setOutNodes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int64_t)rank
{
  return self->rank;
}

- (void)setRank:(int64_t)a3
{
  self->rank = a3;
}

- (int64_t)index
{
  return self->index;
}

- (void)setIndex:(int64_t)a3
{
  self->index = a3;
}

- (GVNode)prev
{
  return self->prev;
}

- (void)setPrev:(id)a3
{
  self->prev = (GVNode *)a3;
}

- (GVNode)next
{
  return self->next;
}

- (void)setNext:(id)a3
{
  self->next = (GVNode *)a3;
}

- (unint64_t)inPriority
{
  return self->inPriority;
}

- (void)setInPriority:(unint64_t)a3
{
  self->inPriority = a3;
}

- (unint64_t)outPriority
{
  return self->outPriority;
}

- (void)setOutPriority:(unint64_t)a3
{
  self->outPriority = a3;
}

- (void)traversePreorder:withCallback:randomize:.cold.1()
{
  __assert_rtn("_traverse_preorder_randomized", "GVNode.m", 381, "0 && \"unreachable\");
}

@end
