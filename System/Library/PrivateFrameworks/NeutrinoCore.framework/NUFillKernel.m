@implementation NUFillKernel

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int buf;
  void *buf_4;
  __int16 buf_12;
  void *buf_14;
  uint8_t v63[56];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      memset(v63, 0, 48);
      -[NUFillKernel region](self, "region");
      v9 = v8;
      if (objc_msgSend(v9, "width") && objc_msgSend(v9, "height"))
        objc_msgSend(v9, "depth");

      NUAssertLogger_8539();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid region"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 138543362;
        buf_4 = v11;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_8539();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v14)
        {
          v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v18 = (void *)MEMORY[0x1E0CB3978];
          v19 = v17;
          objc_msgSend(v18, "callStackSymbols");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          buf = 138543618;
          buf_4 = v17;
          buf_12 = 2114;
          buf_14 = v21;
          _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

        }
      }
      else if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 138543362;
        buf_4 = v16;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUFillKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 133, CFSTR("Invalid region"), v22, v23, v24, v25, v58);
    }
    NUAssertLogger_8539();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destinationTexture != nil");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v63 = 138543362;
      *(_QWORD *)&v63[4] = v34;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v63, 0xCu);

    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8539();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v63 = 138543618;
        *(_QWORD *)&v63[4] = v49;
        *(_WORD *)&v63[12] = 2114;
        *(_QWORD *)&v63[14] = v53;
        _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v63, 0x16u);

      }
    }
    else if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v63 = 138543362;
      *(_QWORD *)&v63[4] = v39;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v63, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFillKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 130, CFSTR("Invalid parameter not satisfying: %s"), v54, v55, v56, v57, (uint64_t)"destinationTexture != nil");
  }
  NUAssertLogger_8539();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "commandBuffer != nil");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v63 = 138543362;
    *(_QWORD *)&v63[4] = v27;
    _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v63, 0xCu);

  }
  v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  NUAssertLogger_8539();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
  if (v28)
  {
    if (v30)
    {
      v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v41 = (void *)MEMORY[0x1E0CB3978];
      v42 = v40;
      objc_msgSend(v41, "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v63 = 138543618;
      *(_QWORD *)&v63[4] = v40;
      *(_WORD *)&v63[12] = 2114;
      *(_QWORD *)&v63[14] = v44;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v63, 0x16u);

    }
  }
  else if (v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v63 = 138543362;
    *(_QWORD *)&v63[4] = v32;
    _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v63, 0xCu);

  }
  _NUAssertFailHandler((uint64_t)"-[NUFillKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 129, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"commandBuffer != nil");
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)color
{
  double red;
  double green;
  double blue;
  double alpha;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  red = self->_color.red;
  green = self->_color.green;
  blue = self->_color.blue;
  alpha = self->_color.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (void)setColor:(id)a3
{
  self->_color = ($3ED934EFF50B3E737D3D4A62C605F33B)a3;
}

- ($C129D91DC3270A352A20543D7AD3F7AA)region
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (void)setRegion:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var2;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_region.origin.x = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_region.origin.z = v4;
  *(_OWORD *)&self->_region.size.height = v3;
}

+ (void)fillTexture:(id)a3 color:(id)a4 withCommandBuffer:(id)a5
{
  double var3;
  double var2;
  double var1;
  double var0;
  id v11;
  id v12;
  _QWORD v13[6];

  var3 = a4.var3;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a3;
  memset(v13, 0, 24);
  v13[3] = objc_msgSend(v12, "width");
  v13[4] = objc_msgSend(v12, "height");
  v13[5] = 1;
  objc_msgSend(a1, "fillTexture:region:color:withCommandBuffer:", v12, v13, v11, var0, var1, var2, var3);

}

+ (void)fillTexture:(id)a3 region:(id *)a4 color:(id)a5 withCommandBuffer:(id)a6
{
  double var3;
  double var2;
  double var1;
  double var0;
  id v12;
  id v13;
  NUFillKernel *v14;
  void *v15;
  NUFillKernel *v16;
  __int128 v17;
  _OWORD v18[3];

  var3 = a5.var3;
  var2 = a5.var2;
  var1 = a5.var1;
  var0 = a5.var0;
  v12 = a6;
  v13 = a3;
  v14 = [NUFillKernel alloc];
  objc_msgSend(v12, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NUComputeKernel initWithDevice:](v14, "initWithDevice:", v15);

  -[NUFillKernel setColor:](v16, "setColor:", var0, var1, var2, var3);
  v17 = *(_OWORD *)&a4->var0.var2;
  v18[0] = *(_OWORD *)&a4->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a4->var1.var1;
  -[NUFillKernel setRegion:](v16, "setRegion:", v18);
  -[NUFillKernel encodeToCommandBuffer:destinationTexture:](v16, "encodeToCommandBuffer:destinationTexture:", v12, v13);

}

@end
