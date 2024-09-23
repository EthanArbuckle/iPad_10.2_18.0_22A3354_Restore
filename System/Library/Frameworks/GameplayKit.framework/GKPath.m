@implementation GKPath

- (void)set_cyclical:(BOOL)a3
{
  self->_pathway.cyclic = a3;
}

- (BOOL)_cyclical
{
  return self->_pathway.cyclic;
}

- (PolylinePathway)pathway
{
  return &self->_pathway;
}

- (void)setRadius:(float)radius
{
  *(float *)(-[GKPath pathway](self, "pathway") + 24) = radius;
}

- (float)radius
{
  return (float)-[GKPath pathway](self, "pathway")[24];
}

- (NSUInteger)numPoints
{
  uint64_t v3;

  v3 = (int)-[GKPath pathway](self, "pathway")[8];
  return v3 - -[GKPath isCyclical](self, "isCyclical");
}

+ (GKPath)pathWithPoints:(vector_float2 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical
{
  _BOOL8 v6;
  GKPath *v10;
  double v11;

  v6 = cyclical;
  v10 = [GKPath alloc];
  *(float *)&v11 = radius;
  return -[GKPath initWithPoints:count:radius:cyclical:](v10, "initWithPoints:count:radius:cyclical:", points, count, v6, v11);
}

- (GKPath)initWithPoints:(vector_float2 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical
{
  _BOOL4 v6;
  GKPath *v10;
  GKPath *v11;
  Vec3 *v12;
  __int128 v13;
  uint64_t v14;
  Vec3 *v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  Vec3 *v20;
  uint64_t v21;
  float z;
  int v24;
  GKPath *v25;
  __int128 v26;
  Vec3 *__p;
  Vec3 *v28;
  objc_super v29;

  v6 = cyclical;
  v29.receiver = self;
  v29.super_class = (Class)GKPath;
  v10 = -[GKPath init](&v29, sel_init);
  v11 = v10;
  if (count <= 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("GKPathLessThanTwoPointsException: GKPaths MUST be initialized with 2 or more points.  Single point paths are not allowed"));
    return v11;
  }
  if (!v10)
    return v11;
  v25 = v10;
  if (count > 0x1555555555555555)
    _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
  v24 = v6;
  v12 = (Vec3 *)operator new(12 * count);
  v14 = 0;
  __p = v12;
  v28 = &v12[count];
  do
  {
    *(vector_float2 *)&v13 = points[v14];
    v16 = *((float *)&v13 + 1);
    if (v12 < v28)
    {
      LODWORD(v12->x) = v13;
      v12->y = 0.0;
      v15 = v12 + 1;
      v12->z = *((float *)&v13 + 1);
      goto LABEL_7;
    }
    v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)__p) >> 2) + 1;
    if (v17 > 0x1555555555555555)
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    if (0x5555555555555556 * (((char *)v28 - (char *)__p) >> 2) > v17)
      v17 = 0x5555555555555556 * (((char *)v28 - (char *)__p) >> 2);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v28 - (char *)__p) >> 2) >= 0xAAAAAAAAAAAAAAALL)
      v18 = 0x1555555555555555;
    else
      v18 = v17;
    if (v18)
    {
      v26 = v13;
      if (v18 > 0x1555555555555555)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v19 = (char *)operator new(12 * v18);
      v13 = v26;
    }
    else
    {
      v19 = 0;
    }
    v20 = (Vec3 *)&v19[4 * (((char *)v12 - (char *)__p) >> 2)];
    LODWORD(v20->x) = v13;
    v20->y = 0.0;
    v20->z = v16;
    v15 = v20 + 1;
    if (v12 == __p)
    {
      __p = (Vec3 *)&v19[4 * (((char *)v12 - (char *)__p) >> 2)];
      v28 = (Vec3 *)&v19[12 * v18];
LABEL_24:
      operator delete(v12);
      goto LABEL_7;
    }
    do
    {
      v21 = *(_QWORD *)&v12[-1].x;
      --v12;
      z = v12->z;
      *(_QWORD *)&v20[-1].x = v21;
      --v20;
      v20->z = z;
    }
    while (v12 != __p);
    v12 = __p;
    __p = v20;
    v28 = (Vec3 *)&v19[12 * v18];
    if (v12)
      goto LABEL_24;
LABEL_7:
    ++v14;
    v12 = v15;
  }
  while (v14 != count);
  v11 = v25;
  OpenSteer::PolylinePathway::initialize((OpenSteer::PolylinePathway *)-[GKPath pathway](v25, "pathway"), count, __p, radius, v24);
  if (__p)
    operator delete(__p);
  return v11;
}

+ (GKPath)pathWithGraphNodes:(NSArray *)graphNodes radius:(float)radius
{
  NSArray *v5;
  GKPath *v6;
  double v7;
  GKPath *v8;

  v5 = graphNodes;
  v6 = [GKPath alloc];
  *(float *)&v7 = radius;
  v8 = -[GKPath initWithGraphNodes:radius:](v6, "initWithGraphNodes:radius:", v5, v7);

  return v8;
}

- (GKPath)initWithGraphNodes:(NSArray *)graphNodes radius:(float)radius
{
  NSArray *v6;
  GKPath *v7;
  void *v8;
  unint64_t v9;
  unint64_t i;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t j;
  void *v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  double v19;
  GKPath *v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *__p;
  void *v26;
  uint64_t v27;

  v6 = graphNodes;
  if (-[NSArray count](v6, "count") > 1)
  {
    -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __p = 0;
      v26 = 0;
      v27 = 0;
      v9 = -[NSArray count](v6, "count");
      if (v9)
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE8__appendEm((char **)&__p, v9);
      for (i = 0; -[NSArray count](v6, "count") > i; ++i)
      {
        -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "position");
        *((_QWORD *)__p + i) = v12;

      }
      v17 = __p;
      v18 = -[NSArray count](v6, "count");
      *(float *)&v19 = radius;
      v20 = -[GKPath initWithPoints:count:radius:cyclical:](self, "initWithPoints:count:radius:cyclical:", v17, v18, 0, v19);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("GKPath: only GKGraphNode2D and GKGraphNode3D are accepted by initWithGraphNodes:radius:"));
        v7 = 0;
LABEL_21:

        goto LABEL_22;
      }
      __p = 0;
      v26 = 0;
      v27 = 0;
      v13 = -[NSArray count](v6, "count");
      if (v13)
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE8__appendEm((char **)&__p, v13);
      for (j = 0; -[NSArray count](v6, "count") > j; ++j)
      {
        -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", j);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "position");
        *((_OWORD *)__p + j) = v16;

      }
      v21 = __p;
      v22 = -[NSArray count](v6, "count");
      *(float *)&v23 = radius;
      v20 = -[GKPath initWithFloat3Points:count:radius:cyclical:](self, "initWithFloat3Points:count:radius:cyclical:", v21, v22, 0, v23);
    }
    self = v20;
    if (__p)
    {
      v26 = __p;
      operator delete(__p);
    }
    v7 = self;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("GKPath: must be initialized with 2 or more graph nodes.  Single node paths are not allowed"));
  self = -[GKPath init](self, "init");
  v7 = self;
LABEL_22:

  return v7;
}

+ (GKPath)pathWithFloat3Points:(vector_float3 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical
{
  _BOOL8 v6;
  GKPath *v10;
  double v11;

  v6 = cyclical;
  v10 = [GKPath alloc];
  *(float *)&v11 = radius;
  return -[GKPath initWithFloat3Points:count:radius:cyclical:](v10, "initWithFloat3Points:count:radius:cyclical:", points, count, v6, v11);
}

- (GKPath)initWithFloat3Points:(vector_float3 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical
{
  _BOOL4 v6;
  GKPath *v10;
  GKPath *v11;
  Vec3 *v12;
  uint64_t v13;
  Vec3 *v14;
  vector_float3 *v15;
  __int32 v16;
  __int32 v17;
  __int32 v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  Vec3 *v22;
  uint64_t v23;
  float z;
  int v26;
  GKPath *v27;
  Vec3 *__p;
  Vec3 *v29;
  objc_super v30;

  v6 = cyclical;
  v30.receiver = self;
  v30.super_class = (Class)GKPath;
  v10 = -[GKPath init](&v30, sel_init);
  v11 = v10;
  if (count <= 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("GKPathLessThanTwoPointsException: GKPaths MUST be initialized with 2 or more points.  Single point paths are not allowed"));
    return v11;
  }
  if (!v10)
    return v11;
  v27 = v10;
  if (count > 0x1555555555555555)
    _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
  v26 = v6;
  v12 = (Vec3 *)operator new(12 * count);
  v13 = 0;
  __p = v12;
  v29 = &v12[count];
  do
  {
    v15 = &points[v13];
    v17 = v15->i32[0];
    v16 = v15->i32[1];
    v18 = v15->i32[2];
    if (v12 < v29)
    {
      LODWORD(v12->x) = v17;
      LODWORD(v12->y) = v16;
      v14 = v12 + 1;
      LODWORD(v12->z) = v18;
      goto LABEL_7;
    }
    v19 = 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)__p) >> 2) + 1;
    if (v19 > 0x1555555555555555)
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    if (0x5555555555555556 * (((char *)v29 - (char *)__p) >> 2) > v19)
      v19 = 0x5555555555555556 * (((char *)v29 - (char *)__p) >> 2);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v29 - (char *)__p) >> 2) >= 0xAAAAAAAAAAAAAAALL)
      v20 = 0x1555555555555555;
    else
      v20 = v19;
    if (v20)
    {
      if (v20 > 0x1555555555555555)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v21 = (char *)operator new(12 * v20);
    }
    else
    {
      v21 = 0;
    }
    v22 = (Vec3 *)&v21[4 * (((char *)v12 - (char *)__p) >> 2)];
    LODWORD(v22->x) = v17;
    LODWORD(v22->y) = v16;
    LODWORD(v22->z) = v18;
    v14 = v22 + 1;
    if (v12 == __p)
    {
      __p = (Vec3 *)&v21[4 * (((char *)v12 - (char *)__p) >> 2)];
      v29 = (Vec3 *)&v21[12 * v20];
LABEL_24:
      operator delete(v12);
      goto LABEL_7;
    }
    do
    {
      v23 = *(_QWORD *)&v12[-1].x;
      --v12;
      z = v12->z;
      *(_QWORD *)&v22[-1].x = v23;
      --v22;
      v22->z = z;
    }
    while (v12 != __p);
    v12 = __p;
    __p = v22;
    v29 = (Vec3 *)&v21[12 * v20];
    if (v12)
      goto LABEL_24;
LABEL_7:
    ++v13;
    v12 = v14;
  }
  while (v13 != count);
  v11 = v27;
  OpenSteer::PolylinePathway::initialize((OpenSteer::PolylinePathway *)-[GKPath pathway](v27, "pathway"), count, __p, radius, v26);
  if (__p)
    operator delete(__p);
  return v11;
}

- (vector_float2)pointAtIndex:(NSUInteger)index
{
  NSUInteger v5;
  vector_float2 result;
  NSUInteger v7;
  PolylinePathway *v8;
  __int32 v9;

  v5 = -[GKPath numPoints](self, "numPoints");
  result = 0;
  if (v5 > index)
  {
    v7 = index;
    v9 = *(_DWORD *)((_QWORD)-[GKPath pathway](self, "pathway", 0.0)[16] + v7 * 12);
    v8 = -[GKPath pathway](self, "pathway");
    result.i32[0] = v9;
    result.i32[1] = LODWORD(v8->points[v7].z);
  }
  return result;
}

- (vector_float2)float2AtIndex:(NSUInteger)index
{
  NSUInteger v5;
  vector_float2 result;
  NSUInteger v7;
  PolylinePathway *v8;
  __int32 v9;

  v5 = -[GKPath numPoints](self, "numPoints");
  result = 0;
  if (v5 > index)
  {
    v7 = index;
    v9 = *(_DWORD *)((_QWORD)-[GKPath pathway](self, "pathway", 0.0)[16] + v7 * 12);
    v8 = -[GKPath pathway](self, "pathway");
    result.i32[0] = v9;
    result.i32[1] = LODWORD(v8->points[v7].z);
  }
  return result;
}

- (vector_float3)float3AtIndex:(NSUInteger)index
{
  PolylinePathway *v5;
  uint64_t v6;
  vector_float3 result;

  v5 = -[GKPath numPoints](self, "numPoints");
  if ((unint64_t)v5 > index)
  {
    -[GKPath pathway](self, "pathway", 0.0);
    -[GKPath pathway](self, "pathway");
    v5 = -[GKPath pathway](self, "pathway");
  }
  result.i64[1] = v6;
  result.i64[0] = (uint64_t)v5;
  return result;
}

- (void).cxx_destruct
{
  OpenSteer::PolylinePathway::~PolylinePathway((OpenSteer::PolylinePathway *)&self->_pathway);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = &off_24F04F318;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 0;
  return self;
}

@end
