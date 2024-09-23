@implementation NUMaskUtilities

+ (id)propertiesForMask:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NUMaskProperties *v12;
  uint64_t v13;
  uint64_t v14;
  NUMaskProperties *v15;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[2];
  uint8_t buf[40];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_2683();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "mask != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2683();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUMaskUtilities propertiesForMask:context:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskUtilities.m", 34, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"mask != nil");
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));
  objc_msgSend(a1, "_areaOfMaskImage:context:", v9, v8);
  v11 = v10;
  memset(buf, 0, 32);
  objc_msgSend(a1, "_tightBoundsOfMaskImage:context:", v9, v8);
  v12 = [NUMaskProperties alloc];
  v13 = objc_msgSend(v6, "size");
  v33[0] = *(_OWORD *)buf;
  v33[1] = *(_OWORD *)&buf[16];
  v15 = -[NUMaskProperties initWithDensity:bounds:size:](v12, "initWithDensity:bounds:size:", v33, v13, v14, v11);

  return v15;
}

+ (double)_areaOfMaskImage:(id)a3 context:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  float v20;

  v5 = (void *)MEMORY[0x1E0C9DDB8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "areaAverageFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInputImage:", v7);
  objc_msgSend(v7, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v8, "setExtent:", v10, v12, v14, v16);
  objc_msgSend(v8, "outputImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0.0;
  objc_msgSend(v17, "extent");
  objc_msgSend(v6, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v17, &v20, 4, *MEMORY[0x1E0C9E028], 0);

  v18 = v20;
  return v18;
}

+ ($209B98C1CDF2DEBD503CBDE3C0ED7C90)_tightBoundsOfMaskImage:(SEL)a3 context:(id)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGPoint v28;
  CGSize v29;
  CGSize var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v31;
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  CGSize v33;
  CGPoint v34;
  _OWORD v35[2];
  CGPoint v36;
  CGSize v37;
  CGRect v38;
  float v39[4];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C9DDB8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "areaBoundsRedFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInputImage:", v9);
  objc_msgSend(v9, "extent");
  objc_msgSend(v10, "setExtent:");
  objc_msgSend(v10, "outputImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extent");
  objc_msgSend(v8, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v11, v39, 16, *MEMORY[0x1E0C9E078], objc_msgSend(v8, "workingColorSpace"), v12, v13, v14, v15);

  v16 = v39[0];
  v17 = v39[1];
  v18 = v39[2];
  v19 = v39[3];
  objc_msgSend(v9, "extent");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v38.origin.x = v21;
  v38.origin.y = v23;
  v38.size.width = v25;
  v38.size.height = v27;
  NU::RectT<long>::RectT(&v36, &v38, 0);
  v28 = v36;
  v29 = v37;
  v33 = v37;
  v34 = v36;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  v38.origin = v28;
  v38.size = v29;
  NUPixelRectDenormalize((uint64_t *)&v38, 0, retstr, v16, v17, v18, v19);
  var1 = (CGSize)retstr->var1;
  v38.origin = (CGPoint)retstr->var0;
  v38.size = var1;
  v36 = v34;
  v37 = v33;
  NU::RectT<long>::Intersection((uint64_t)v35, (uint64_t *)&v38, (uint64_t *)&v36);
  v31 = ($0AC6E346AE4835514AAA8AC86D8F4844)v35[1];
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v35[0];
  retstr->var1 = v31;

  return result;
}

@end
