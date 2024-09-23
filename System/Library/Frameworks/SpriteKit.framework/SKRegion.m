@implementation SKRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPathRef)path
{
  return (CGPathRef)-[PKRegion path](self->_region, "path");
}

+ (SKRegion)infiniteRegion
{
  void *v2;
  SKRegion *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)sharedInfiniteRegion;
  if (!sharedInfiniteRegion)
  {
    v3 = objc_alloc_init(SKRegion);
    v4 = (void *)sharedInfiniteRegion;
    sharedInfiniteRegion = (uint64_t)v3;

    objc_msgSend(MEMORY[0x1E0D7D338], "infiniteRegion");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(sharedInfiniteRegion + 8);
    *(_QWORD *)(sharedInfiniteRegion + 8) = v5;

    v2 = (void *)sharedInfiniteRegion;
  }
  return (SKRegion *)v2;
}

- (SKRegion)initWithCoder:(id)a3
{
  id v4;
  SKRegion *v5;
  uint64_t v6;
  PKRegion *region;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKRegion;
  v5 = -[SKRegion init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_region"));
    v6 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (PKRegion *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKRegion *region;
  id v5;

  v5 = a3;
  region = self->_region;
  if (region)
    objc_msgSend(v5, "encodeObject:forKey:", region, CFSTR("_region"));

}

- (BOOL)isEqualToRegion:(id)a3
{
  PKRegion *region;

  region = self->_region;
  if (region == *((PKRegion **)a3 + 1))
    return 1;
  else
    return -[PKRegion isEqualToRegion:](region, "isEqualToRegion:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_region);
  return v4;
}

- (SKRegion)initWithRadius:(float)radius
{
  SKRegion *v4;
  id v5;
  double v6;
  uint64_t v7;
  PKRegion *region;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKRegion;
  v4 = -[SKRegion init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D7D338]);
    *(float *)&v6 = radius;
    v7 = objc_msgSend(v5, "initWithRadius:", v6);
    region = v4->_region;
    v4->_region = (PKRegion *)v7;

  }
  return v4;
}

- (SKRegion)initWithSize:(CGSize)size
{
  double height;
  double width;
  SKRegion *v5;
  uint64_t v6;
  PKRegion *region;
  objc_super v9;

  height = size.height;
  width = size.width;
  v9.receiver = self;
  v9.super_class = (Class)SKRegion;
  v5 = -[SKRegion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7D338]), "initWithSize:", width, height);
    region = v5->_region;
    v5->_region = (PKRegion *)v6;

  }
  return v5;
}

- (SKRegion)initWithPath:(CGPathRef)path
{
  SKRegion *v4;
  uint64_t v5;
  PKRegion *region;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKRegion;
  v4 = -[SKRegion init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7D338]), "initWithPath:", path);
    region = v4->_region;
    v4->_region = (PKRegion *)v5;

  }
  return v4;
}

- (SKRegion)inverseRegion
{
  id *v2;
  uint64_t v3;
  id v4;

  v2 = (id *)-[SKRegion copy](self, "copy");
  objc_msgSend(v2[1], "inverseRegion");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v2[1];
  v2[1] = (id)v3;

  return (SKRegion *)v2;
}

- (SKRegion)regionByUnionWithRegion:(SKRegion *)region
{
  SKRegion *v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = region;
  v5 = (id *)-[SKRegion copy](self, "copy");
  objc_msgSend(v5[1], "regionByUnionWithRegion:", v4->_region);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[1];
  v5[1] = (id)v6;

  return (SKRegion *)v5;
}

- (SKRegion)regionByDifferenceFromRegion:(SKRegion *)region
{
  SKRegion *v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = region;
  v5 = (id *)-[SKRegion copy](self, "copy");
  objc_msgSend(v5[1], "regionByDifferenceFromRegion:", v4->_region);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[1];
  v5[1] = (id)v6;

  return (SKRegion *)v5;
}

- (SKRegion)regionByIntersectionWithRegion:(SKRegion *)region
{
  SKRegion *v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = region;
  v5 = (id *)-[SKRegion copy](self, "copy");
  objc_msgSend(v5[1], "regionByIntersectionWithRegion:", v4->_region);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[1];
  v5[1] = (id)v6;

  return (SKRegion *)v5;
}

- (BOOL)isInfinite
{
  return -[PKRegion isInfinite](self->_region, "isInfinite");
}

- (BOOL)isEmpty
{
  return -[PKRegion isEmpty](self->_region, "isEmpty");
}

- (BOOL)containsPoint:(CGPoint)point
{
  double y;
  double x;
  float v6;

  if (!self->_region)
    return 0;
  y = point.y;
  x = point.x;
  PKGet_INV_PTM_RATIO();
  return -[PKRegion containsPoint:](self->_region, "containsPoint:", x * v6, y * v6);
}

- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a7 >= 1)
  {
    v21 = v12;
    v22 = v11;
    v23 = v10;
    v24 = v9;
    v25 = v8;
    v26 = v7;
    v27 = v13;
    v28 = v14;
    v15 = a7;
    v20 = (float *)(a3 + 1);
    do
    {
      *a5 = -[SKRegion containsPoint:](self, "containsPoint:", *(v20 - 1), *v20, v21, v22, v23, v24, v25, v26, v27, v28);
      a5 += a6;
      v20 = (float *)((char *)v20 + a4);
      --v15;
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

@end
