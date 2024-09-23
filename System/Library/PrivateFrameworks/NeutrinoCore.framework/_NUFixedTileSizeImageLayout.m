@implementation _NUFixedTileSizeImageLayout

- (_NUFixedTileSizeImageLayout)initWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5
{
  int64_t var1;
  uint64_t var0;
  int64_t v7;
  int64_t v8;
  double v9;
  int64_t v10;
  int64_t v11;
  _NUFixedTileSizeImageLayout *result;
  int64x2_t v13;
  float64x2_t v14;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  objc_super v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!a4.var0 || (var1 = a4.var1) == 0)
  {
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelSizeIsEmpty(tileSize)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v33;
        v49 = 2114;
        v50 = v35;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v36 = "!NUPixelSizeIsEmpty(tileSize)";
    v37 = 269;
LABEL_24:

    _NUAssertFailHandler((uint64_t)"-[_NUFixedTileSizeImageLayout initWithImageSize:tileSize:borderSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", v37, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)v36);
  }
  var0 = a5.var0;
  v7 = a4.var0;
  if (a4.var0 <= 2 * a5.var0 || (v8 = a5.var1, v9 = (double)a5.var1, v9 + v9 >= (double)a4.var1))
  {
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tileSize.width > (2 * borderSize.width) && tileSize.height > (2.0 * borderSize.height)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v30)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v38;
        v49 = 2114;
        v50 = v40;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v32;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v36 = "tileSize.width > (2 * borderSize.width) && tileSize.height > (2.0 * borderSize.height)";
    v37 = 270;
    goto LABEL_24;
  }
  v10 = a3.var1;
  v11 = a3.var0;
  v45 = (double)a5.var1;
  v46.receiver = self;
  v46.super_class = (Class)_NUFixedTileSizeImageLayout;
  result = -[NUImageLayout initWithImageSize:](&v46, sel_initWithImageSize_, (double)a4.var1, v9 + v9);
  if (result)
  {
    result->_tileSize.width = v7;
    result->_tileSize.height = var1;
    result->_borderSize.width = var0;
    result->_borderSize.height = v8;
    v13.i64[0] = v11;
    v13.i64[1] = v10;
    v14.f64[0] = (double)var0;
    v14.f64[1] = v45;
    __asm { FMOV            V3.2D, #-2.0 }
    result->_tileCounts = ($5BB7312FFE32F1AB3F1F5957C99A58B3)vcvtq_s64_f64(vrndpq_f64(vdivq_f64(vmaxnmq_f64(vmlaq_f64(vcvtq_f64_s64(v13), _Q3, v14), (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL)), vmlaq_f64(vcvtq_f64_s64((int64x2_t)result->_tileSize), _Q3, v14))));
  }
  return result;
}

- (int64_t)tileCount
{
  return self->_tileCounts.height * self->_tileCounts.width;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)frameRectForTileAtIndex:(SEL)a3
{
  int64_t width;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t height;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  int64_t v19;
  int64_t v20;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a4 < 0 || -[_NUFixedTileSizeImageLayout tileCount](self, "tileCount") <= a4)
  {
    NUAssertLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        v37 = 2114;
        v38 = v30;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUFixedTileSizeImageLayout frameRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 286, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  width = self->_tileCounts.width;
  v8 = a4 / width;
  v9 = self->_tileSize.width;
  v10 = (v9 - 2 * self->_borderSize.width) * (a4 % width);
  v11 = v10 & ~(v10 >> 63);
  v12 = v11 + v9;
  v13 = -[NUImageLayout imageSize](self, "imageSize");
  if (v13 < v12)
    v12 = v13;
  height = self->_tileSize.height;
  v15 = (height - 2 * self->_borderSize.height) * v8;
  v16 = v15 & ~(v15 >> 63);
  v17 = v16 + height;
  result = ($209B98C1CDF2DEBD503CBDE3C0ED7C90 *)-[NUImageLayout imageSize](self, "imageSize");
  if (v19 >= v17)
    v20 = v17;
  else
    v20 = v19;
  retstr->var0.var0 = v11;
  retstr->var0.var1 = v16;
  retstr->var1.var0 = v12 - v11;
  retstr->var1.var1 = v20 - v16;
  return result;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)contentRectForTileAtIndex:(SEL)a3
{
  int64_t width;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t height;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *v19;
  _NUFixedTileSizeImageLayout *v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  NSObject *v27;
  void *v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  int64_t v42;
  int64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a4 < 0 || -[_NUFixedTileSizeImageLayout tileCount](self, "tileCount") <= a4)
  {
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v34;
        v46 = 2114;
        v47 = v36;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUFixedTileSizeImageLayout contentRectForTileAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 301, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  width = self->_tileCounts.width;
  v8 = a4 / width;
  v9 = a4 / width * width;
  v10 = a4 % width;
  v12 = self->_borderSize.width;
  height = self->_borderSize.height;
  v13 = self->_tileSize.width - 2 * v12;
  v14 = a4 % width + 1;
  v15 = self->_tileSize.height - 2 * height;
  v16 = a4 / width + 1;
  v17 = height + v15 * v16;
  if (v14 == width)
  {
    v42 = a4 % width;
    v43 = a4 / width * width;
    v41 = self->_tileSize.width - 2 * v12;
    result = ($209B98C1CDF2DEBD503CBDE3C0ED7C90 *)-[NUImageLayout imageSize](self, "imageSize");
    v13 = v41;
    v10 = v42;
    v9 = v43;
  }
  else
  {
    result = ($209B98C1CDF2DEBD503CBDE3C0ED7C90 *)(v12 + v13 * v14);
  }
  if (v16 == self->_tileCounts.height)
  {
    v19 = result;
    v20 = self;
    v21 = v9;
    v22 = v10;
    v23 = v13;
    -[NUImageLayout imageSize](v20, "imageSize");
    result = v19;
    v13 = v23;
    v10 = v22;
    v9 = v21;
    v17 = v24;
  }
  v25 = height + v15 * v8;
  if (!v8)
    v25 = 0;
  v26 = v12 + v13 * v10;
  if (a4 == v9)
    v26 = 0;
  retstr->var0.var0 = v26;
  retstr->var0.var1 = v25;
  retstr->var1.var0 = (int64_t)result - v26;
  retstr->var1.var1 = v17 - v25;
  return result;
}

- (id)tileInfoAtIndex:(int64_t)a3
{
  __int128 v5;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[32];
  _OWORD v22[2];
  uint8_t buf[40];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 < 0 || -[_NUFixedTileSizeImageLayout tileCount](self, "tileCount") <= a3)
  {
    NUAssertLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "(tileIndex >= 0) && (tileIndex < self.tileCount)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v16;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUFixedTileSizeImageLayout tileInfoAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageLayout.mm", 331, CFSTR("Invalid parameter not satisfying: %s"), v17, v18, v19, v20, (uint64_t)"(tileIndex >= 0) && (tileIndex < self.tileCount)");
  }
  memset(buf, 0, 32);
  -[_NUFixedTileSizeImageLayout frameRectForTileAtIndex:](self, "frameRectForTileAtIndex:", a3);
  v5 = *(_OWORD *)&buf[16];
  v22[0] = *(_OWORD *)buf;
  v22[1] = *(_OWORD *)&buf[16];
  -[_NUFixedTileSizeImageLayout contentRectForTileAtIndex:](self, "contentRectForTileAtIndex:", a3);
  +[NUTileInfo tileInfoWithIndex:size:frameRect:contentRect:](NUTileInfo, "tileInfoWithIndex:size:frameRect:contentRect:", a3, v5, v22, v21);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_tileSize;
  int64_t width;
  int64_t height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_tileSize = &self->_tileSize;
  width = self->_tileSize.width;
  height = p_tileSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_borderSize;
  int64_t width;
  int64_t height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_borderSize = &self->_borderSize;
  width = self->_borderSize.width;
  height = p_borderSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileCounts
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_tileCounts;
  int64_t width;
  int64_t height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_tileCounts = &self->_tileCounts;
  width = self->_tileCounts.width;
  height = p_tileCounts->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (BOOL)isEqualToLayout:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_NUFixedTileSizeImageLayout;
  v7 = -[NUImageLayout isEqualToLayout:](&v10, sel_isEqualToLayout_, v4)
    && (self->_tileSize.width == v4[3] ? (v5 = self->_tileSize.height == v4[4]) : (v5 = 0),
        v5 && (self->_borderSize.width == v4[5] ? (v6 = self->_borderSize.height == v4[6]) : (v6 = 0), v6))
    && self->_tileCounts.width == v4[7]
    && self->_tileCounts.height == v4[8];

  return v7;
}

@end
