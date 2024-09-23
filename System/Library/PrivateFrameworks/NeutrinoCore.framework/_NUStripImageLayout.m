@implementation _NUStripImageLayout

- (_NUStripImageLayout)initWithImageSize:(id)a3 stripHeight:(int64_t)a4
{
  int64_t var1;
  _NUStripImageLayout *result;
  int64_t v7;
  objc_super v8;

  var1 = a3.var1;
  v8.receiver = self;
  v8.super_class = (Class)_NUStripImageLayout;
  result = -[NUImageLayout initWithImageSize:](&v8, sel_initWithImageSize_, a3.var0);
  if (result)
  {
    result->_stripHeight = a4;
    v7 = var1 / a4;
    if (var1 != var1 / a4 * a4)
      ++v7;
    result->_stripCount = v7;
  }
  return result;
}

- (int64_t)tileCount
{
  return self->_stripCount;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)contentRectForTileAtIndex:(SEL)a3
{
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  __int128 v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 v14;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  _OWORD v30[2];
  _OWORD v31[2];
  _BYTE buf[32];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a4 < 0 || -[_NUStripImageLayout tileCount](self, "tileCount") <= a4)
  {
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v24;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStripImageLayout contentRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 385, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  result = -[_NUStripImageLayout tileCount](self, "tileCount");
  if ((uint64_t)result > a4)
  {
    *(_QWORD *)&v8 = -[NUImageLayout imageSize](self, "imageSize");
    *((_QWORD *)&v8 + 1) = v9;
    v29 = v8;
    v10 = self->_stripHeight * a4;
    v11 = -[NUImageLayout imageSize](self, "imageSize");
    *(_QWORD *)&v12 = 0;
    *((_QWORD *)&v12 + 1) = v10;
    *(_QWORD *)&v13 = v11;
    *((_QWORD *)&v13 + 1) = self->_stripHeight;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    *(_OWORD *)&buf[16] = v29;
    v31[0] = v12;
    v31[1] = v13;
    NU::RectT<long>::Intersection((uint64_t)v30, (uint64_t *)buf, (uint64_t *)v31);
    v14 = ($0AC6E346AE4835514AAA8AC86D8F4844)v30[1];
    retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v30[0];
    retstr->var1 = v14;
  }
  return result;
}

- (id)tileInfoAtIndex:(int64_t)a3
{
  _OWORD v5[2];
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  -[_NUStripImageLayout contentRectForTileAtIndex:](self, "contentRectForTileAtIndex:");
  v6[0] = v7;
  v6[1] = v8;
  v5[0] = v7;
  v5[1] = v8;
  +[NUTileInfo tileInfoWithIndex:size:frameRect:contentRect:](NUTileInfo, "tileInfoWithIndex:size:frameRect:contentRect:", a3, v8, v6, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize
{
  int64_t v3;
  int64_t stripHeight;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v3 = -[NUImageLayout imageSize](self, "imageSize");
  stripHeight = self->_stripHeight;
  result.var1 = stripHeight;
  result.var0 = v3;
  return result;
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
  int64_t stripCount;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  stripCount = self->_stripCount;
  v3 = 1;
  result.var1 = stripCount;
  result.var0 = v3;
  return result;
}

- (BOOL)isEqualToLayout:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_NUStripImageLayout;
  v5 = -[NUImageLayout isEqualToLayout:](&v7, sel_isEqualToLayout_, v4)
    && self->_stripHeight == v4[3]
    && self->_stripCount == v4[4];

  return v5;
}

@end
