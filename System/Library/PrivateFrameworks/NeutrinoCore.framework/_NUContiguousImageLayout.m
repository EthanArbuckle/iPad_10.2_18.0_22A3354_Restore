@implementation _NUContiguousImageLayout

- (int64_t)tileCount
{
  return 1;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)contentRectForTileAtIndex:(SEL)a3
{
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  int64_t v7;
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
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a4 < 0 || -[_NUContiguousImageLayout tileCount](self, "tileCount") <= a4)
  {
    NUAssertLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
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
        v23 = v15;
        v24 = 2114;
        v25 = v17;
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
      v23 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUContiguousImageLayout contentRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 213, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  retstr->var0.var0 = 0;
  retstr->var0.var1 = 0;
  result = ($209B98C1CDF2DEBD503CBDE3C0ED7C90 *)-[NUImageLayout imageSize](self, "imageSize");
  retstr->var1.var0 = (int64_t)result;
  retstr->var1.var1 = v7;
  return result;
}

- (id)tileInfoAtIndex:(int64_t)a3
{
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
  _OWORD v20[2];
  _OWORD v21[2];
  uint8_t buf[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 < 0 || -[_NUContiguousImageLayout tileCount](self, "tileCount") <= a3)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "(tileIndex >= 0) && (tileIndex < self.tileCount)");
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
    _NUAssertFailHandler((uint64_t)"-[_NUContiguousImageLayout tileInfoAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 218, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  memset(buf, 0, 32);
  -[_NUContiguousImageLayout contentRectForTileAtIndex:](self, "contentRectForTileAtIndex:", a3);
  v21[0] = *(_OWORD *)buf;
  v21[1] = *(_OWORD *)&buf[16];
  v20[0] = *(_OWORD *)buf;
  v20[1] = *(_OWORD *)&buf[16];
  +[NUTileInfo tileInfoWithIndex:size:frameRect:contentRect:](NUTileInfo, "tileInfoWithIndex:size:frameRect:contentRect:", a3, *(_OWORD *)&buf[16], v21, v20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)tileIndexAtPoint:(id)a3
{
  int64_t var1;
  int64_t var0;
  uint64_t v5;
  int64_t v6;
  int64_t v7;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = -[NUImageLayout imageSize](self, "imageSize");
  if (var1 >= v6)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = 0;
  if (var1 < 0 || var0 >= v5 || var0 < 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v7;
}

- (void)enumerateTilesForReadingInRect:(id *)a3 withBlock:(id)a4
{
  void (**v6)(id, void *, _BYTE *);
  __int128 v7;
  uint64_t v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  void *v11;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[16];
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  _BYTE buf[32];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _BYTE *))a4;
  if (!v6)
  {
    NUAssertLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v21;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUContiguousImageLayout enumerateTilesForReadingInRect:withBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 232, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"block != nil");
  }
  *(_QWORD *)&v7 = -[NUImageLayout imageSize](self, "imageSize");
  *((_QWORD *)&v7 + 1) = v8;
  var0 = a3->var0;
  var1 = a3->var1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  *(_OWORD *)&buf[16] = v7;
  v29[0] = var0;
  v29[1] = var1;
  NU::RectT<long>::Intersection((uint64_t)v26, (uint64_t *)buf, (uint64_t *)v29);
  if (v27 && v28)
  {
    buf[0] = 0;
    -[_NUContiguousImageLayout tileInfoAtIndex:](self, "tileInfoAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11, buf);

  }
}

- (void)enumerateTilesForWritingInRect:(id *)a3 withBlock:(id)a4
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v5[2];

  var1 = a3->var1;
  v5[0] = a3->var0;
  v5[1] = var1;
  -[_NUContiguousImageLayout enumerateTilesForReadingInRect:withBlock:](self, "enumerateTilesForReadingInRect:withBlock:", v5, a4);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = 0;
  v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = 1;
  v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end
