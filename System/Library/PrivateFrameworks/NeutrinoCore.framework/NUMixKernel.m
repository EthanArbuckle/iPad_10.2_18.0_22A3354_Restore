@implementation NUMixKernel

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint8_t v80[56];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (v7)
    {
      -[NUMixKernel sourceTexture1](self, "sourceTexture1");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        memset(v80, 0, 48);
        -[NUMixKernel sourceRegion1](self, "sourceRegion1");
        v10 = v9;
        if (objc_msgSend(v10, "width") && objc_msgSend(v10, "height"))
          objc_msgSend(v10, "depth");

        NUAssertLogger_8539();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid region"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 138543362;
          v77 = v12;
          _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v76, 0xCu);

        }
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_8539();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v15)
          {
            v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v19 = (void *)MEMORY[0x1E0CB3978];
            v20 = v18;
            objc_msgSend(v19, "callStackSymbols");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = 138543618;
            v77 = v18;
            v78 = 2114;
            v79 = v22;
            _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v76, 0x16u);

          }
        }
        else if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 138543362;
          v77 = v17;
          _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v76, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUMixKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 237, CFSTR("Invalid region"), v23, v24, v25, v26, v75);
      }
      NUAssertLogger_8539();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing source texture"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v80 = 138543362;
        *(_QWORD *)&v80[4] = v42;
        _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v80, 0xCu);

      }
      v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_8539();
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
      if (v43)
      {
        if (v45)
        {
          v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v67 = (void *)MEMORY[0x1E0CB3978];
          v68 = v66;
          objc_msgSend(v67, "callStackSymbols");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v80 = 138543618;
          *(_QWORD *)&v80[4] = v66;
          *(_WORD *)&v80[12] = 2114;
          *(_QWORD *)&v80[14] = v70;
          _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v80, 0x16u);

        }
      }
      else if (v45)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v80 = 138543362;
        *(_QWORD *)&v80[4] = v47;
        _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v80, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUMixKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 235, CFSTR("Missing source texture"), v71, v72, v73, v74, v75);
    }
    NUAssertLogger_8539();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destinationTexture != nil");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v80 = 138543362;
      *(_QWORD *)&v80[4] = v35;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v80, 0xCu);

    }
    v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8539();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v80 = 138543618;
        *(_QWORD *)&v80[4] = v57;
        *(_WORD *)&v80[12] = 2114;
        *(_QWORD *)&v80[14] = v61;
        _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v80, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v80 = 138543362;
      *(_QWORD *)&v80[4] = v40;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v80, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMixKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 232, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"destinationTexture != nil");
  }
  NUAssertLogger_8539();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "commandBuffer != nil");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v80 = 138543362;
    *(_QWORD *)&v80[4] = v28;
    _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v80, 0xCu);

  }
  v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  NUAssertLogger_8539();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
  if (v29)
  {
    if (v31)
    {
      v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v49 = (void *)MEMORY[0x1E0CB3978];
      v50 = v48;
      objc_msgSend(v49, "callStackSymbols");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v80 = 138543618;
      *(_QWORD *)&v80[4] = v48;
      *(_WORD *)&v80[12] = 2114;
      *(_QWORD *)&v80[14] = v52;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v80, 0x16u);

    }
  }
  else if (v31)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v80 = 138543362;
    *(_QWORD *)&v80[4] = v33;
    _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v80, 0xCu);

  }
  _NUAssertFailHandler((uint64_t)"-[NUMixKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 231, CFSTR("Invalid parameter not satisfying: %s"), v53, v54, v55, v56, (uint64_t)"commandBuffer != nil");
}

- (float)factor
{
  return self->_factor;
}

- (void)setFactor:(float)a3
{
  self->_factor = a3;
}

- (MTLTexture)sourceTexture1
{
  return self->_sourceTexture1;
}

- (void)setSourceTexture1:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTexture1, a3);
}

- (MTLTexture)sourceTexture2
{
  return self->_sourceTexture2;
}

- (void)setSourceTexture2:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTexture2, a3);
}

- ($C129D91DC3270A352A20543D7AD3F7AA)sourceRegion1
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var2;
  *(_OWORD *)&retstr->var0.var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- (void)setSourceRegion1:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var2;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_sourceRegion1.origin.x = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_sourceRegion1.origin.z = v4;
  *(_OWORD *)&self->_sourceRegion1.size.height = v3;
}

- ($C129D91DC3270A352A20543D7AD3F7AA)sourceRegion2
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var2;
  *(_OWORD *)&retstr->var0.var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setSourceRegion2:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var2;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_sourceRegion2.origin.x = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_sourceRegion2.origin.z = v4;
  *(_OWORD *)&self->_sourceRegion2.size.height = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)destinationOffset
{
  *($B15351F604C5A8240EC3E8415888573B *)retstr = *($B15351F604C5A8240EC3E8415888573B *)((char *)self + 40);
  return self;
}

- (void)setDestinationOffset:(id *)a3
{
  unint64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_destinationOffset.x = *(_OWORD *)&a3->var0;
  self->_destinationOffset.z = var2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTexture2, 0);
  objc_storeStrong((id *)&self->_sourceTexture1, 0);
}

+ (void)mixTexture:(id)a3 withTexture:(id)a4 factor:(float)a5 intoTexture:(id)a6 withCommandBuffer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  _QWORD v17[3];
  _QWORD v18[6];
  _QWORD v19[6];

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  memset(v19, 0, 24);
  v19[3] = objc_msgSend(v15, "width");
  v19[4] = objc_msgSend(v15, "height");
  v19[5] = 1;
  memset(v18, 0, 24);
  v18[3] = objc_msgSend(v14, "width");
  v18[4] = objc_msgSend(v14, "height");
  v18[5] = 1;
  memset(v17, 0, sizeof(v17));
  *(float *)&v16 = a5;
  objc_msgSend(a1, "mixTexture:region:withTexture:region:factor:intoTexture:atPoint:withCommandBuffer:", v15, v19, v14, v18, v13, v17, v16, v12);

}

+ (void)mixTexture:(id)a3 region:(id *)a4 withTexture:(id)a5 region:(id *)a6 factor:(float)a7 intoTexture:(id)a8 atPoint:(id *)a9 withCommandBuffer:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  NUMixKernel *v21;
  void *v22;
  NUMixKernel *v23;
  __int128 v24;
  __int128 v25;
  double v26;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v27;
  _OWORD v28[3];
  _OWORD v29[3];

  v17 = a10;
  v18 = a8;
  v19 = a5;
  v20 = a3;
  v21 = [NUMixKernel alloc];
  objc_msgSend(v17, "device");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[NUComputeKernel initWithDevice:](v21, "initWithDevice:", v22);

  -[NUMixKernel setSourceTexture1:](v23, "setSourceTexture1:", v20);
  -[NUMixKernel setSourceTexture2:](v23, "setSourceTexture2:", v19);

  v24 = *(_OWORD *)&a4->var0.var2;
  v29[0] = *(_OWORD *)&a4->var0.var0;
  v29[1] = v24;
  v29[2] = *(_OWORD *)&a4->var1.var1;
  -[NUMixKernel setSourceRegion1:](v23, "setSourceRegion1:", v29);
  v25 = *(_OWORD *)&a6->var0.var2;
  v28[0] = *(_OWORD *)&a6->var0.var0;
  v28[1] = v25;
  v28[2] = *(_OWORD *)&a6->var1.var1;
  -[NUMixKernel setSourceRegion2:](v23, "setSourceRegion2:", v28);
  v27 = *a9;
  -[NUMixKernel setDestinationOffset:](v23, "setDestinationOffset:", &v27);
  *(float *)&v26 = a7;
  -[NUMixKernel setFactor:](v23, "setFactor:", v26);
  -[NUMixKernel encodeToCommandBuffer:destinationTexture:](v23, "encodeToCommandBuffer:destinationTexture:", v17, v18);

}

@end
