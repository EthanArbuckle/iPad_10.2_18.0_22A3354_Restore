@implementation NUMutableRegion

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NURegion initWithRegion:](+[NURegion allocWithZone:](NURegion, "allocWithZone:", a3), "initWithRegion:", self);
}

- (void)addRect:(id *)a3
{
  NU::Region *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  __n128 v5[2];

  imp = (NU::Region *)self->super._imp;
  var1 = a3->var1;
  v5[0] = (__n128)a3->var0;
  v5[1] = (__n128)var1;
  NU::Region::add(imp, v5);
}

- (void)removeRect:(id *)a3
{
  __n128 *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  __n128 v5[2];

  imp = (__n128 *)self->super._imp;
  var1 = a3->var1;
  v5[0] = (__n128)a3->var0;
  v5[1] = (__n128)var1;
  NU::Region::remove(imp, v5);
}

- (void)addRegion:(id)a3
{
  if (a3)
    NU::Region::add((NU::Region *)self->super._imp, *((const NU::Region **)a3 + 1));
}

- (void)removeRegion:(id)a3
{
  __n128 *imp;

  if (a3)
  {
    imp = (__n128 *)self->super._imp;
    NU::Region::breakRects(*((_QWORD *)a3 + 1), imp);
    NU::Region::mergeRectsVertically((NU::Region *)imp);
  }
}

- (void)clipToRect:(id *)a3
{
  NU::Region *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  __n128 v5[2];

  imp = (NU::Region *)self->super._imp;
  var1 = a3->var1;
  v5[0] = (__n128)a3->var0;
  v5[1] = (__n128)var1;
  NU::Region::clip(imp, v5);
}

- (void)clipToRegion:(id)a3
{
  if (a3)
    NU::Region::clip((NU::Region *)self->super._imp, *((const NU::Region **)a3 + 1));
}

- (void)diffWithRect:(id *)a3
{
  __n128 *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  __n128 v5[2];

  imp = (__n128 *)self->super._imp;
  var1 = a3->var1;
  v5[0] = (__n128)a3->var0;
  v5[1] = (__n128)var1;
  NU::Region::diff(imp, v5);
}

- (void)diffWithRegion:(id)a3
{
  if (a3)
    NU::Region::diff((__n128 *)self->super._imp, *((const NU::Region **)a3 + 1));
}

- (void)flipInRect:(id *)a3
{
  void *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v5[2];

  imp = self->super._imp;
  var1 = a3->var1;
  v5[0] = a3->var0;
  v5[1] = var1;
  NU::Region::flipInRect((uint64_t)imp, v5);
}

- (void)translateBy:(id)a3
{
  NU::Region::translate((NU::Region *)self->super._imp, a3.var0, a3.var1);
}

- (void)scaleBy:(CGPoint)a3 withRounding:(int64_t)a4
{
  NU::Region::scale((uint64_t)self->super._imp, a4, a3.x, a3.y);
}

- (void)clear
{
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear((_QWORD *)self->super._imp);
}

- (void)setRegion:(id)a3
{
  uint64_t v4;
  _DWORD *imp;
  _QWORD *v6;

  v6 = a3;
  v4 = v6[1];
  imp = self->super._imp;
  if (imp != (_DWORD *)v4)
  {
    imp[8] = *(_DWORD *)(v4 + 32);
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(imp, *(uint64_t **)(v4 + 16));
  }

}

- (void)growBy:(id)a3
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3.var0 < 0 || a3.var1 < 0)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "delta.x >= 0 && delta.y >= 0");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 2114;
        v20 = v12;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableRegion growBy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 980, CFSTR("Invalid parameter not satisfying: %s"), v13, v14, v15, v16, (uint64_t)"delta.x >= 0 && delta.y >= 0");
  }
  NU::Region::grow((NU::Region *)self->super._imp, a3.var0, a3.var1);
}

- (void)growBy:(id)a3 inRect:(id *)a4
{
  NU::Region *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE buf[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3.var0 < 0 || a3.var1 < 0)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "delta.x >= 0 && delta.y >= 0");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableRegion growBy:inRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 987, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"delta.x >= 0 && delta.y >= 0");
  }
  imp = (NU::Region *)self->super._imp;
  var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = var1;
  NU::Region::grow(imp, a3.var0, a3.var1);
  NU::Region::clip(imp, (__n128 *)buf);
}

- (void)shrinkBy:(id)a3
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3.var0 < 0 || a3.var1 < 0)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "delta.x >= 0 && delta.y >= 0");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 2114;
        v20 = v12;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableRegion shrinkBy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 994, CFSTR("Invalid parameter not satisfying: %s"), v13, v14, v15, v16, (uint64_t)"delta.x >= 0 && delta.y >= 0");
  }
  NU::Region::shrink((NU::Region *)self->super._imp, a3.var0, a3.var1);
}

- (void)shrinkBy:(id)a3 inRect:(id *)a4
{
  __n128 *imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE buf[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3.var0 < 0 || a3.var1 < 0)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "delta.x >= 0 && delta.y >= 0");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableRegion shrinkBy:inRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 1001, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"delta.x >= 0 && delta.y >= 0");
  }
  imp = (__n128 *)self->super._imp;
  var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = var1;
  NU::Region::shrinkInRect(imp, a3.var0, a3.var1, (__n128 *)buf);
}

- (void)applyOrientation:(int64_t)a3 imageSize:(id)a4
{
  NU::Region::applyOrientation((uint64_t)self->super._imp, a3, a4.var0, a4.var1);
}

- (void)applyAffineTransform:(CGAffineTransform *)a3 roundPolicy:(int64_t)a4
{
  NU::Region::applyAffineTransform((uint64_t)self->super._imp, a3, a4);
}

@end
