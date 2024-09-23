@implementation NUCopyKernel

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
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
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int buf;
  void *buf_4;
  __int16 buf_12;
  void *buf_14;
  uint8_t v98[56];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      -[NUCopyKernel sourceTexture](self, "sourceTexture");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;
        v11 = objc_msgSend(v9, "pixelFormat");
        if (v11 == objc_msgSend(v8, "pixelFormat"))
        {
          memset(v98, 0, 48);
          -[NUCopyKernel sourceRegion](self, "sourceRegion");
          v12 = v10;
          if (objc_msgSend(v12, "width") && objc_msgSend(v12, "height"))
            objc_msgSend(v12, "depth");

          NUAssertLogger_8539();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid source region"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            buf = 138543362;
            buf_4 = v14;
            _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

          }
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          NUAssertLogger_8539();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
          if (specific)
          {
            if (v17)
            {
              v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v21 = (void *)MEMORY[0x1E0CB3978];
              v22 = v20;
              objc_msgSend(v21, "callStackSymbols");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              buf = 138543618;
              buf_4 = v20;
              buf_12 = 2114;
              buf_14 = v24;
              _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

            }
          }
          else if (v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            buf = 138543362;
            buf_4 = v19;
            _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

          }
          _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 198, CFSTR("Invalid source region"), v25, v26, v27, v28, v93);
        }
        NUAssertLogger_8539();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Pixel format mismatch"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v98 = 138543362;
          *(_QWORD *)&v98[4] = v51;
          _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v98, 0xCu);

        }
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_8539();
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
        if (v52)
        {
          if (v54)
          {
            v84 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v85 = (void *)MEMORY[0x1E0CB3978];
            v86 = v84;
            objc_msgSend(v85, "callStackSymbols");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "componentsJoinedByString:", CFSTR("\n"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v98 = 138543618;
            *(_QWORD *)&v98[4] = v84;
            *(_WORD *)&v98[12] = 2114;
            *(_QWORD *)&v98[14] = v88;
            _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v98, 0x16u);

          }
        }
        else if (v54)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v98 = 138543362;
          *(_QWORD *)&v98[4] = v56;
          _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v98, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 195, CFSTR("Pixel format mismatch"), v89, v90, v91, v92, v93);
      }
      NUAssertLogger_8539();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing source texture"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v98 = 138543362;
        *(_QWORD *)&v98[4] = v44;
        _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v98, 0xCu);

      }
      v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_8539();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
      if (v45)
      {
        if (v47)
        {
          v75 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v76 = (void *)MEMORY[0x1E0CB3978];
          v77 = v75;
          objc_msgSend(v76, "callStackSymbols");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "componentsJoinedByString:", CFSTR("\n"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v98 = 138543618;
          *(_QWORD *)&v98[4] = v75;
          *(_WORD *)&v98[12] = 2114;
          *(_QWORD *)&v98[14] = v79;
          _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v98, 0x16u);

        }
      }
      else if (v47)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v98 = 138543362;
        *(_QWORD *)&v98[4] = v49;
        _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v98, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 192, CFSTR("Missing source texture"), v80, v81, v82, v83, v93);
    }
    NUAssertLogger_8539();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dstTexture != nil");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v98 = 138543362;
      *(_QWORD *)&v98[4] = v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v98, 0xCu);

    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8539();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v98 = 138543618;
        *(_QWORD *)&v98[4] = v66;
        *(_WORD *)&v98[12] = 2114;
        *(_QWORD *)&v98[14] = v70;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v98, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v98 = 138543362;
      *(_QWORD *)&v98[4] = v42;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v98, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 190, CFSTR("Invalid parameter not satisfying: %s"), v71, v72, v73, v74, (uint64_t)"dstTexture != nil");
  }
  NUAssertLogger_8539();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "commandBuffer != nil");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v98 = 138543362;
    *(_QWORD *)&v98[4] = v30;
    _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v98, 0xCu);

  }
  v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  NUAssertLogger_8539();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
  if (v31)
  {
    if (v33)
    {
      v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v58 = (void *)MEMORY[0x1E0CB3978];
      v59 = v57;
      objc_msgSend(v58, "callStackSymbols");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v98 = 138543618;
      *(_QWORD *)&v98[4] = v57;
      *(_WORD *)&v98[12] = 2114;
      *(_QWORD *)&v98[14] = v61;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v98, 0x16u);

    }
  }
  else if (v33)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v98 = 138543362;
    *(_QWORD *)&v98[4] = v35;
    _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v98, 0xCu);

  }
  _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 189, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"commandBuffer != nil");
}

- (MTLTexture)sourceTexture
{
  return self->_sourceTexture;
}

- (void)setSourceTexture:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTexture, a3);
}

- ($C129D91DC3270A352A20543D7AD3F7AA)sourceRegion
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (void)setSourceRegion:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var2;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_sourceRegion.origin.x = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_sourceRegion.origin.z = v4;
  *(_OWORD *)&self->_sourceRegion.size.height = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)destinationOffset
{
  *($B15351F604C5A8240EC3E8415888573B *)retstr = ($B15351F604C5A8240EC3E8415888573B)self[1];
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
  objc_storeStrong((id *)&self->_sourceTexture, 0);
}

+ (void)copyFromTexture:(id)a3 toTexture:(id)a4 withCommandBuffer:(id)a5
{
  _QWORD v5[3];

  memset(v5, 0, sizeof(v5));
  objc_msgSend(a1, "copyFromTexture:toTexture:atPoint:withCommandBuffer:", a3, a4, v5, a5);
}

+ (void)copyFromTexture:(id)a3 toTexture:(id)a4 atPoint:(id *)a5 withCommandBuffer:(id)a6
{
  id v10;
  id v11;
  id v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;
  _QWORD v14[6];

  memset(v14, 0, 24);
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v14[3] = objc_msgSend(v12, "width");
  v14[4] = objc_msgSend(v12, "height");
  v14[5] = objc_msgSend(v12, "depth");
  v13 = *a5;
  objc_msgSend(a1, "copyFromTexture:region:toTexture:atPoint:withCommandBuffer:", v12, v14, v11, &v13, v10);

}

+ (void)copyFromTexture:(id)a3 region:(id *)a4 toTexture:(id)a5 atPoint:(id *)a6 withCommandBuffer:(id)a7
{
  id v11;
  id v12;
  id v13;
  NUCopyKernel *v14;
  void *v15;
  NUCopyKernel *v16;
  __int128 v17;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v18;
  _OWORD v19[3];

  v11 = a7;
  v12 = a5;
  v13 = a3;
  v14 = [NUCopyKernel alloc];
  objc_msgSend(v11, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NUComputeKernel initWithDevice:](v14, "initWithDevice:", v15);

  -[NUCopyKernel setSourceTexture:](v16, "setSourceTexture:", v13);
  v17 = *(_OWORD *)&a4->var0.var2;
  v19[0] = *(_OWORD *)&a4->var0.var0;
  v19[1] = v17;
  v19[2] = *(_OWORD *)&a4->var1.var1;
  -[NUCopyKernel setSourceRegion:](v16, "setSourceRegion:", v19);
  v18 = *a6;
  -[NUCopyKernel setDestinationOffset:](v16, "setDestinationOffset:", &v18);
  -[NUCopyKernel encodeToCommandBuffer:destinationTexture:](v16, "encodeToCommandBuffer:destinationTexture:", v11, v12);

}

@end
