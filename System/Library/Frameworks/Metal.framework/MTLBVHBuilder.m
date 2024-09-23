@implementation MTLBVHBuilder

- (MTLBVHBuilder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBVHBuilder;
  return -[MTLBVHBuilder init](&v3, sel_init);
}

- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 innerNodeCapacity:(unint64_t *)a5 leafNodeCapacity:(unint64_t *)a6
{
  uint64_t v6;

  v6 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a3, a4, a5, a6, &v6);
}

+ (BOOL)useTemporalSplitsForDescriptor:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "useTemporalSplits");
  if (v4)
    LOBYTE(v4) = (unint64_t)objc_msgSend(a3, "primitiveKeyframeCount") > 1;
  return v4;
}

- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 fragmentIndexCapacity:(unint64_t *)a5 innerNodeCapacity:(unint64_t *)a6 leafNodeCapacity:(unint64_t *)a7 primitiveDataCapacity:(unint64_t *)a8
{
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  float v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v14 = objc_msgSend(a3, "fragmentCount");
  v15 = objc_msgSend(a3, "primitiveDataSize");
  if (a8)
  {
    v16 = v15;
    v17 = ((8 * objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count") + 255) & 0xFFFFFFFFFFFFFF00) + v15;
    if (!v16)
      v17 = 0;
    *a8 = v17;
  }
  v18 = 1.0;
  if (objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType")&& objc_msgSend(a3, "splitHeuristic") == 3)
  {
    objc_msgSend(a3, "splitCapacity");
    v18 = v19;
  }
  v20 = (unint64_t)(v18 * (double)v14);
  v21 = v20;
  if (+[MTLBVHBuilder useTemporalSplitsForDescriptor:](MTLBVHBuilder, "useTemporalSplitsForDescriptor:", a3))
  {
    v20 *= objc_msgSend(a3, "primitiveKeyframeCount") - 1;
    v21 = v20 * (1 << objc_msgSend(a3, "maxSubKeyframeTemporalSplits"));
  }
  if (a4)
    *a4 = v20;
  if (a5)
    *a5 = v21;
  v22 = objc_msgSend(a3, "minPrimitivesPerLeaf");
  if ((v22 + v21 - 1) / v22 <= 1)
    v23 = 1;
  else
    v23 = (v22 + v21 - 1) / v22;
  if (a7)
    *a7 = v23;
  if (v21)
  {
    v24 = objc_msgSend(a3, "branchingFactor");
    if (objc_msgSend(a3, "maxPrimitivesPerInnerNode"))
    {
      v25 = objc_msgSend(a3, "minPrimitivesPerInnerNode");
      v26 = ((v25 + v21 - 1) / v25 * v24 + 2 * v24 - 5) / (2 * v24 - 2) + (v25 + v21 - 1) / v25;
      if (!a6)
        return;
    }
    else
    {
      v26 = (2 * v24 - 2 + v24 * v23 - 3) / (2 * v24 - 2);
      if (!a6)
        return;
    }
  }
  else
  {
    v26 = 0;
    if (!a6)
      return;
  }
  *a6 = v26;
}

- (void)getCapacitiesForDescriptor:(id)a3 fragmentCapacity:(unint64_t *)a4 innerNodeCapacity:(unint64_t *)a5 leafNodeCapacity:(unint64_t *)a6 primitiveDataCapacity:(unint64_t *)a7
{
  uint64_t v7;

  v7 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a3, a4, &v7, a5, a6, a7);
}

@end
