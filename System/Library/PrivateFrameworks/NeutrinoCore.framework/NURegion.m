@implementation NURegion

- (NURegion)init
{
  NURegion *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NURegion;
  v2 = -[NURegion init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_DWORD *)(v3 + 32) = 1065353216;
    v2->_imp = (void *)v3;
  }
  return v2;
}

- (NURegion)initWithRect:(id *)a3
{
  int64_t var1;
  int64_t var0;
  NURegion *v6;
  uint64_t v7;
  $0AC6E346AE4835514AAA8AC86D8F4844 v8;
  __n128 v10[2];
  objc_super v11;

  var0 = a3->var1.var0;
  var1 = a3->var1.var1;
  v11.receiver = self;
  v11.super_class = (Class)NURegion;
  v6 = -[NURegion init](&v11, sel_init);
  if (v6)
  {
    v7 = operator new();
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
    *(_DWORD *)(v7 + 32) = 1065353216;
    v6->_imp = (void *)v7;
    if (var0)
    {
      if (var1)
      {
        v8 = a3->var1;
        v10[0] = (__n128)a3->var0;
        v10[1] = (__n128)v8;
        NU::Region::add((NU::Region *)v7, v10);
      }
    }
  }
  return v6;
}

- (NURegion)initWithRegion:(id)a3
{
  uint64_t *v4;
  NURegion *v5;
  uint64_t v6;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t *)a3;
  if (!v4)
  {
    NUAssertLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "region != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v15;
        v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURegion initWithRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 756, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"region != nil");
  }
  v22.receiver = self;
  v22.super_class = (Class)NURegion;
  v5 = -[NURegion init](&v22, sel_init);
  if (v5)
  {
    v6 = operator new();
    std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set(v6, v4[1]);
    v5->_imp = (void *)v6;
  }

  return v5;
}

- (void)dealloc
{
  void *imp;
  uint64_t v4;
  objc_super v5;

  imp = self->_imp;
  if (imp)
  {
    v4 = std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)imp);
    MEMORY[0x1A85C0F94](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)NURegion;
  -[NURegion dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __23__NURegion_description__block_invoke;
  v11[3] = &unk_1E50632F8;
  v4 = v3;
  v12 = v4;
  -[NURegion enumerateRects:](self, "enumerateRects:", v11);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  v7 = -[NURegion count](self, "count");
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p %lu rects: %@>"), v6, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NURegion initWithRegion:](+[NUMutableRegion allocWithZone:](NUMutableRegion, "allocWithZone:", a3), "initWithRegion:", self);
}

- (unint64_t)count
{
  return *((_QWORD *)self->_imp + 3);
}

- (BOOL)isEmpty
{
  return *((_QWORD *)self->_imp + 3) == 0;
}

- (unint64_t)hash
{
  return NU::Region::getHash((NU::Region *)self->_imp);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isEqualToRegion:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToRegion:(id)a3
{
  return a3
      && std::operator==[abi:ne180100]<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>((uint64_t)self->_imp, *((uint64_t **)a3 + 1));
}

- (void)enumerateRects:(id)a3
{
  void (**v4)(id, _OWORD *);
  char *v5;
  __int128 v6;
  _OWORD v7[2];

  v4 = (void (**)(id, _OWORD *))a3;
  v5 = (char *)self->_imp + 16;
  while (1)
  {
    v5 = *(char **)v5;
    if (!v5)
      break;
    v6 = *((_OWORD *)v5 + 2);
    v7[0] = *((_OWORD *)v5 + 1);
    v7[1] = v6;
    v4[2](v4, v7);
  }

}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)bounds
{
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  $0AC6E346AE4835514AAA8AC86D8F4844 v5;
  _OWORD v6[2];

  NU::Region::getBounds((NU::Region *)self->_imp, (uint64_t)v6);
  v5 = ($0AC6E346AE4835514AAA8AC86D8F4844)v6[1];
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v6[0];
  retstr->var1 = v5;
  return result;
}

- (BOOL)intersectsRect:(id *)a3
{
  void *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  __n128 v6[2];

  imp = self->_imp;
  var1 = a3->var1;
  v6[0] = (__n128)a3->var0;
  v6[1] = (__n128)var1;
  return NU::Region::intersects((uint64_t)imp, v6);
}

- (BOOL)intersectsRegion:(id)a3
{
  if (a3)
    return NU::Region::intersects((uint64_t)self->_imp, *((_QWORD *)a3 + 1));
  else
    return 0;
}

- (BOOL)includesRect:(id *)a3
{
  NU::Region *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  __n128 v6[2];

  imp = (NU::Region *)self->_imp;
  var1 = a3->var1;
  v6[0] = (__n128)a3->var0;
  v6[1] = (__n128)var1;
  return NU::Region::includes(imp, v6);
}

- (BOOL)includesRegion:(id)a3
{
  return a3 && NU::Region::includes((NU::Region *)self->_imp, *((const NU::Region **)a3 + 1));
}

- (double)area
{
  _QWORD *v2;
  double result;

  v2 = (_QWORD *)*((_QWORD *)self->_imp + 2);
  if (!v2)
    return 0.0;
  result = 0.0;
  do
  {
    result = result + (double)(uint64_t)(v2[5] * v2[4]);
    v2 = (_QWORD *)*v2;
  }
  while (v2);
  return result;
}

- (double)density
{
  BOOL v3;
  double result;
  double v5;
  double v6;

  v3 = -[NURegion isEmpty](self, "isEmpty");
  result = 1.0;
  if (!v3)
  {
    -[NURegion area](self, "area", 1.0);
    v6 = v5;
    -[NURegion bounds](self, "bounds", 0, 0);
    return v6 / (double)0;
  }
  return result;
}

void __23__NURegion_description__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%ld, %ld}, {%lu, %lu}}"), *a2, a2[1], a2[2], a2[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");

}

+ (id)region
{
  return objc_alloc_init((Class)a1);
}

+ (NURegion)regionWithRect:(id *)a3
{
  id v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v7[2];

  v4 = objc_alloc((Class)a1);
  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  return (NURegion *)(id)objc_msgSend(v4, "initWithRect:", v7);
}

+ (NURegion)regionWithRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegion:", v4);

  return (NURegion *)v5;
}

- (id)regionByAddingRect:(id *)a3
{
  void *v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v7[2];

  v4 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  objc_msgSend(v4, "addRect:", v7);
  return v4;
}

- (id)regionByAddingRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "addRegion:", v4);

  return v5;
}

- (id)regionByRemovingRect:(id *)a3
{
  void *v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v7[2];

  v4 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  objc_msgSend(v4, "removeRect:", v7);
  return v4;
}

- (id)regionByRemovingRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "removeRegion:", v4);

  return v5;
}

- (id)regionByClippingToRect:(id *)a3
{
  void *v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v7[2];

  v4 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  objc_msgSend(v4, "clipToRect:", v7);
  return v4;
}

- (id)regionByClippingToRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "clipToRegion:", v4);

  return v5;
}

- (id)regionByExcludingRect:(id *)a3
{
  void *v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v7[2];

  v4 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  objc_msgSend(v4, "diffWithRect:", v7);
  return v4;
}

- (id)regionByExcludingRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "diffWithRegion:", v4);

  return v5;
}

- (id)regionByScalingBy:(CGPoint)a3 withRounding:(int64_t)a4
{
  double y;
  double x;
  void *v7;

  y = a3.y;
  x = a3.x;
  v7 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "scaleBy:withRounding:", a4, x, y);
  return v7;
}

- (id)regionByTranslatingBy:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v5;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "translateBy:", var0, var1);
  return v5;
}

- (id)regionByGrowingBy:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v5;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "growBy:", var0, var1);
  return v5;
}

- (id)regionByGrowingBy:(id)a3 inRect:(id *)a4
{
  int64_t var1;
  int64_t var0;
  void *v7;
  $0AC6E346AE4835514AAA8AC86D8F4844 v8;
  _OWORD v10[2];

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  v8 = a4->var1;
  v10[0] = a4->var0;
  v10[1] = v8;
  objc_msgSend(v7, "growBy:inRect:", var0, var1, v10);
  return v7;
}

- (id)regionByShrinkingBy:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v5;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "shrinkBy:", var0, var1);
  return v5;
}

- (id)regionByShrinkingBy:(id)a3 inRect:(id *)a4
{
  int64_t var1;
  int64_t var0;
  void *v7;
  $0AC6E346AE4835514AAA8AC86D8F4844 v8;
  _OWORD v10[2];

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  v8 = a4->var1;
  v10[0] = a4->var0;
  v10[1] = v8;
  objc_msgSend(v7, "shrinkBy:inRect:", var0, var1, v10);
  return v7;
}

- (id)regionByApplyingOrientation:(int64_t)a3 imageSize:(id)a4
{
  int64_t var1;
  int64_t var0;
  void *v7;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "applyOrientation:imageSize:", a3, var0, var1);
  return v7;
}

- (id)regionByApplyingAffineTransform:(CGAffineTransform *)a3 roundPolicy:(int64_t)a4
{
  void *v6;
  __int128 v7;
  _OWORD v9[3];

  v6 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  v7 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v6, "applyAffineTransform:roundPolicy:", v9, a4);
  return v6;
}

- (id)regionByFlippingInRect:(id *)a3
{
  void *v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v7[2];

  v4 = (void *)-[NURegion mutableCopy](self, "mutableCopy");
  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  objc_msgSend(v4, "flipInRect:", v7);
  return v4;
}

- (id)convertImageRegion:(id)a3 fromRect:(id *)a4 toRect:(id *)a5
{
  int64_t var0;
  int64_t var1;
  int64_t v9;
  int64_t v10;
  void *v11;

  var0 = a5->var1.var0;
  var1 = a5->var1.var1;
  v9 = a4->var1.var0;
  v10 = a4->var1.var1;
  v11 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v11, "translateBy:", -a4->var0.var0, -a4->var0.var1);
  objc_msgSend(v11, "scaleBy:withRounding:", 2, (double)var0 / (double)v9, (double)var1 / (double)v10);
  objc_msgSend(v11, "translateBy:", a5->var0.var0, a5->var0.var1);
  return v11;
}

- (NURegion)regionWithSubregionsOfMinimumDensity:(double)a3
{
  NUMutableRegion *v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NUMutableRegion *v25;
  NUMutableRegion *v26;
  NSObject *v27;
  NUMutableRegion *v28;
  NURegion *v29;
  NSObject *v31;
  void *v32;
  void *specific;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NURegion *v45;
  _QWORD v46[5];
  NUMutableRegion *v47;
  _OWORD v48[2];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[4];
  uint8_t buf[40];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0 || a3 > 1.0)
  {
    NUAssertLogger();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "0.0 <= density && density <= 1.0");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURegion(Mutability) regionWithSubregionsOfMinimumDensity:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 1193, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"0.0 <= density && density <= 1.0");
  }
  v6 = objc_alloc_init(NUMutableRegion);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = self;
  objc_msgSend(v7, "addObject:", self);
  while (objc_msgSend(v7, "count"))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_119);
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_debug_impl(&dword_1A6553000, v8, OS_LOG_TYPE_DEBUG, "Dense subregions: %@, result: %@", buf, 0x16u);
    }
    objc_msgSend(v7, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeLastObject");
    objc_msgSend(v9, "density");
    if (v10 >= a3)
    {
      if (v9)
        objc_msgSend(v9, "bounds");
      else
        memset(v48, 0, sizeof(v48));
      -[NUMutableRegion addRect:](v6, "addRect:", v48);
    }
    else
    {
      memset(buf, 0, 32);
      if (v9)
      {
        objc_msgSend(v9, "bounds");
        v12 = *(_QWORD *)buf;
        v11 = *(_QWORD *)&buf[8];
        v13 = *(_QWORD *)&buf[24];
        v14 = *(_QWORD *)&buf[16];
      }
      else
      {
        v13 = 0;
        v14 = 0;
        v11 = 0;
        v12 = 0;
      }
      v15 = v14 / 2;
      v52[0] = v12;
      v52[1] = v11;
      v16 = v13 / 2;
      v52[2] = v14 / 2;
      v52[3] = v13 / 2;
      objc_msgSend(v9, "regionByClippingToRect:", v52);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v17);

      v18 = v16 + v11;
      v19 = *(_QWORD *)&buf[24] - v16;
      v51[0] = v12;
      v51[1] = v18;
      v51[2] = v15;
      v51[3] = v19;
      objc_msgSend(v9, "regionByClippingToRect:", v51);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v20);

      v21 = v15 + v12;
      v22 = *(_QWORD *)&buf[16] - v15;
      v50[0] = v21;
      v50[1] = v18;
      v50[2] = v22;
      v50[3] = v19;
      objc_msgSend(v9, "regionByClippingToRect:", v50);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v23);

      v49[0] = v21;
      v49[1] = *(_QWORD *)&buf[8];
      v49[2] = v22;
      v49[3] = v18 - *(_QWORD *)&buf[8];
      objc_msgSend(v9, "regionByClippingToRect:", v49);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v24);

    }
  }
  v25 = objc_alloc_init(NUMutableRegion);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __61__NURegion_Mutability__regionWithSubregionsOfMinimumDensity___block_invoke;
  v46[3] = &unk_1E5063320;
  v46[4] = v45;
  v26 = v25;
  v47 = v26;
  -[NURegion enumerateRects:](v6, "enumerateRects:", v46);
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_119);
  v27 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v26;
    _os_log_debug_impl(&dword_1A6553000, v27, OS_LOG_TYPE_DEBUG, "Dense subregions result: %@, optimized: %@", buf, 0x16u);
  }
  v28 = v47;
  v29 = v26;

  return v29;
}

void __61__NURegion_Mutability__regionWithSubregionsOfMinimumDensity___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[2];
  _OWORD v9[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v9[0] = *a2;
  v9[1] = v4;
  objc_msgSend(v3, "regionByClippingToRect:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(void **)(a1 + 40);
  if (v5)
    objc_msgSend(v5, "bounds");
  else
    memset(v8, 0, sizeof(v8));
  objc_msgSend(v7, "addRect:", v8);

}

@end
