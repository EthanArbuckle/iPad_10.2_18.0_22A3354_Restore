@implementation NUColorSpace

- (void)nu_updateDigest:(id)a3
{
  uint64_t MD5Digest;
  id v5;

  v5 = a3;
  -[NUColorSpace CGColorSpace](self, "CGColorSpace");
  MD5Digest = CGColorSpaceGetMD5Digest();
  objc_msgSend(v5, "addString:", CFSTR("CGColorSpace<"));
  objc_msgSend(v5, "addBytes:length:", MD5Digest, 16);
  objc_msgSend(v5, "addString:", CFSTR(">"));

}

- (NUColorSpace)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3966);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3966);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3966);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUColorSpace init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 69, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUColorSpace)initWithCGColorSpace:(CGColorSpace *)a3
{
  return -[NUColorSpace initWithCGColorSpace:descriptionName:](self, "initWithCGColorSpace:descriptionName:", a3, 0);
}

- (NUColorSpace)initWithCGColorSpace:(CGColorSpace *)a3 descriptionName:(id)a4
{
  id v7;
  void *v8;
  NUColorSpace *v9;
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
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    NUAssertLogger_3955();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorSpace != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
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
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2114;
        v31 = v22;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSpace initWithCGColorSpace:descriptionName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 79, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"colorSpace != NULL");
  }
  v8 = v7;
  v27.receiver = self;
  v27.super_class = (Class)NUColorSpace;
  v9 = -[NUColorSpace init](&v27, sel_init);
  if (v9)
  {
    v9->_CGColorSpace = CGColorSpaceRetain(a3);
    objc_storeStrong((id *)&v9->_descriptionName, a4);
  }

  return v9;
}

- (NUColorSpace)initWithICCProfileData:(id)a3 descriptionName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CGColorSpace *v9;
  NUColorSpace *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 || (v8 = v7, !objc_msgSend(v6, "length")))
  {
    NUAssertLogger_3955();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "data != nil && data.length > 0");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        v30 = 2114;
        v31 = v23;
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
      v29 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSpace initWithICCProfileData:descriptionName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 92, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"data != nil && data.length > 0");
  }
  v9 = (CGColorSpace *)MEMORY[0x1A85C0574](v6);
  v10 = -[NUColorSpace initWithCGColorSpace:descriptionName:](self, "initWithCGColorSpace:descriptionName:", v9, v8);
  CGColorSpaceRelease(v9);

  return v10;
}

- (BOOL)isRGB
{
  return CGColorSpaceGetModel(-[NUColorSpace CGColorSpace](self, "CGColorSpace")) == kCGColorSpaceModelRGB;
}

- (BOOL)isHDR
{
  return CGColorSpaceUsesITUR_2100TF(-[NUColorSpace CGColorSpace](self, "CGColorSpace"));
}

- (BOOL)isExtended
{
  return CGColorSpaceUsesExtendedRange(-[NUColorSpace CGColorSpace](self, "CGColorSpace"));
}

- (BOOL)isWideGamut
{
  return CGColorSpaceIsWideGamutRGB(-[NUColorSpace CGColorSpace](self, "CGColorSpace"));
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_CGColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)NUColorSpace;
  -[NUColorSpace dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  -[NUColorSpace descriptionName](self, "descriptionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NUColorSpace descriptionName](self, "descriptionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(": "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E5068958;
  }

  v6 = (__CFString *)CFCopyDescription(self->_CGColorSpace);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return (NSString *)(id)CGColorSpaceCopyICCProfileDescription();
}

- (unint64_t)hash
{
  return CFHash(self->_CGColorSpace);
}

- (BOOL)isEqual:(id)a3
{
  NUColorSpace *v4;
  NUColorSpace *v5;
  BOOL v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v4 = (NUColorSpace *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if ((CGColorSpaceEqualToColorSpace() & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = 0;
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        v8 = 0;
        v9 = &v8;
        v10 = 0x2020000000;
        v11 = 0;
        v6 = CGColorConversionInfoIterateColorSpaceFunctionsWithCallbacks()
          && !*((_DWORD *)v9 + 6)
          && !*((_DWORD *)v17 + 6)
          && *((_DWORD *)v13 + 6) == 0;
        _Block_object_dispose(&v8, 8);
        _Block_object_dispose(&v12, 8);
        _Block_object_dispose(&v16, 8);
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSDictionary)cvPixelBufferAttachments
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CGColorSpace **v9;
  uint64_t *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  CGColorSpace *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  +[NUColorSpace rec709ColorSpace](NUColorSpace, "rec709ColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NUColorSpace isEqual:](self, "isEqual:", v3);

  if (v4)
  {
    v5 = *MEMORY[0x1E0CA8D88];
    v6 = *MEMORY[0x1E0CA8E98];
    v29[0] = *MEMORY[0x1E0CA8D68];
    v29[1] = v6;
    v7 = *MEMORY[0x1E0CA8EB0];
    v30[0] = v5;
    v30[1] = v7;
    v29[2] = *MEMORY[0x1E0CA8EE8];
    v30[2] = *MEMORY[0x1E0CA8F18];
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (CGColorSpace **)v30;
    v10 = v29;
  }
  else
  {
    +[NUColorSpace displayP3ColorSpace](NUColorSpace, "displayP3ColorSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NUColorSpace isEqual:](self, "isEqual:", v11);

    if (v12)
    {
      v13 = *MEMORY[0x1E0CA8D98];
      v14 = *MEMORY[0x1E0CA8E98];
      v27[0] = *MEMORY[0x1E0CA8D68];
      v27[1] = v14;
      v15 = *MEMORY[0x1E0CA8EB0];
      v28[0] = v13;
      v28[1] = v15;
      v27[2] = *MEMORY[0x1E0CA8EE8];
      v28[2] = *MEMORY[0x1E0CA8F10];
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = (CGColorSpace **)v28;
      v10 = v27;
    }
    else
    {
      +[NUColorSpace itur2100HLGColorSpace](NUColorSpace, "itur2100HLGColorSpace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NUColorSpace isEqual:](self, "isEqual:", v16);

      if (!v17)
      {
        v23 = *MEMORY[0x1E0CA8CD8];
        v24 = -[NUColorSpace CGColorSpace](self, "CGColorSpace");
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v24;
        v10 = &v23;
        v21 = 1;
        goto LABEL_8;
      }
      v18 = *MEMORY[0x1E0CA8D80];
      v19 = *MEMORY[0x1E0CA8E98];
      v25[0] = *MEMORY[0x1E0CA8D68];
      v25[1] = v19;
      v20 = *MEMORY[0x1E0CA8EA8];
      v26[0] = v18;
      v26[1] = v20;
      v25[2] = *MEMORY[0x1E0CA8EE8];
      v26[2] = *MEMORY[0x1E0CA8F00];
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = (CGColorSpace **)v26;
      v10 = v25;
    }
  }
  v21 = 3;
LABEL_8:
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v21);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)applyAttachmentsToCVPixelBuffer:(__CVBuffer *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFString *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8CD8]);
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8EE8]);
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8E98]);
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8D68]);
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8DF8]);
  -[NUColorSpace cvPixelBufferAttachments](self, "cvPixelBufferAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "keyEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(const __CFString **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CVBufferSetAttachment(a3, v11, v12, kCVAttachmentMode_ShouldPropagate);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)linearized
{
  CGColorSpace *BaseColorSpace;
  uint64_t v4;
  CGColorSpace *v5;
  CGColorSpace *v6;
  CGColorSpaceRef Linearized;
  CGColorSpaceRef v8;
  NUColorSpace *v9;
  NSObject *v10;
  _BYTE v12[12];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  BaseColorSpace = CGColorSpaceGetBaseColorSpace(-[NUColorSpace CGColorSpace](self, "CGColorSpace"));
  if (BaseColorSpace)
  {
    v4 = (uint64_t)CGColorSpaceRetain(BaseColorSpace);
    goto LABEL_3;
  }
  -[NUColorSpace CGColorSpace](self, "CGColorSpace");
  if (CGColorSpaceContainsFlexGTCInfo())
  {
    *(_DWORD *)v12 = 0;
    -[NUColorSpace CGColorSpace](self, "CGColorSpace", *(_QWORD *)v12);
    if (!CGColorSpaceGetCICPInfo())
    {
      v5 = 0;
LABEL_4:
      v6 = v5;
      if (v5)
        goto LABEL_10;
      goto LABEL_9;
    }
    v4 = CGColorSpaceCreateFromCICP();
LABEL_3:
    v5 = (CGColorSpace *)v4;
    goto LABEL_4;
  }
LABEL_9:
  v6 = -[NUColorSpace CGColorSpace](self, "CGColorSpace");
  v5 = 0;
LABEL_10:
  Linearized = CGColorSpaceCreateLinearized(v6);
  if (Linearized)
  {
    v8 = Linearized;
    v9 = -[NUColorSpace initWithCGColorSpace:]([NUColorSpace alloc], "initWithCGColorSpace:", Linearized);
    CFRelease(v8);
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_170_3942);
    v10 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 138412290;
      *(_QWORD *)&v12[4] = self;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Failed to linearize colorspace: %@", v12, 0xCu);
    }
    v9 = 0;
  }
  CGColorSpaceRelease(v5);
  return v9;
}

- (CGColorSpace)CGColorSpace
{
  return self->_CGColorSpace;
}

- (NSString)descriptionName
{
  return self->_descriptionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionName, 0);
}

+ (id)_loadICCProfileDataWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  void *v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, CFSTR("icc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (v7 = v6, !objc_msgSend(v6, "length")))
  {
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load %@"), v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace _loadICCProfileDataWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 63, CFSTR("Failed to load %@"), v21, v22, v23, v24, (uint64_t)v3);
  }

  return v7;
}

+ (id)sRGBColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__NUColorSpace_sRGBColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sRGBColorSpace_onceToken != -1)
    dispatch_once(&sRGBColorSpace_onceToken, block);
  return (id)sRGBColorSpace_result;
}

+ (id)genericGrayGamma2_2ColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NUColorSpace_genericGrayGamma2_2ColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genericGrayGamma2_2ColorSpace_onceToken != -1)
    dispatch_once(&genericGrayGamma2_2ColorSpace_onceToken, block);
  return (id)genericGrayGamma2_2ColorSpace_result;
}

+ (id)linearGrayColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NUColorSpace_linearGrayColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (linearGrayColorSpace_onceToken != -1)
    dispatch_once(&linearGrayColorSpace_onceToken, block);
  return (id)linearGrayColorSpace_result;
}

+ (id)itur2100HLGColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NUColorSpace_itur2100HLGColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (itur2100HLGColorSpace_onceToken != -1)
    dispatch_once(&itur2100HLGColorSpace_onceToken, block);
  return (id)itur2100HLGColorSpace_result;
}

+ (id)itur2100PQColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NUColorSpace_itur2100PQColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (itur2100PQColorSpace_onceToken != -1)
    dispatch_once(&itur2100PQColorSpace_onceToken, block);
  return (id)itur2100PQColorSpace_result;
}

+ (id)extendedSRGBColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NUColorSpace_extendedSRGBColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extendedSRGBColorSpace_onceToken != -1)
    dispatch_once(&extendedSRGBColorSpace_onceToken, block);
  return (id)extendedSRGBColorSpace_result;
}

+ (id)sRGBLinearColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NUColorSpace_sRGBLinearColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sRGBLinearColorSpace_onceToken != -1)
    dispatch_once(&sRGBLinearColorSpace_onceToken, block);
  return (id)sRGBLinearColorSpace_result;
}

+ (id)extendedSRGBLinearColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NUColorSpace_extendedSRGBLinearColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extendedSRGBLinearColorSpace_onceToken != -1)
    dispatch_once(&extendedSRGBLinearColorSpace_onceToken, block);
  return (id)extendedSRGBLinearColorSpace_result;
}

+ (id)adobeRGBColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NUColorSpace_adobeRGBColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (adobeRGBColorSpace_onceToken != -1)
    dispatch_once(&adobeRGBColorSpace_onceToken, block);
  return (id)adobeRGBColorSpace_result;
}

+ (id)genericRGBColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NUColorSpace_genericRGBColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genericRGBColorSpace_onceToken != -1)
    dispatch_once(&genericRGBColorSpace_onceToken, block);
  return (id)genericRGBColorSpace_result;
}

+ (id)genericRGBLinearColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NUColorSpace_genericRGBLinearColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genericRGBLinearColorSpace_onceToken != -1)
    dispatch_once(&genericRGBLinearColorSpace_onceToken, block);
  return (id)genericRGBLinearColorSpace_result;
}

+ (id)genericGrayColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NUColorSpace_genericGrayColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genericGrayColorSpace_onceToken != -1)
    dispatch_once(&genericGrayColorSpace_onceToken, block);
  return (id)genericGrayColorSpace_result;
}

+ (id)displayP3ColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NUColorSpace_displayP3ColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (displayP3ColorSpace_onceToken != -1)
    dispatch_once(&displayP3ColorSpace_onceToken, block);
  return (id)displayP3ColorSpace_result;
}

+ (id)displayP3LinearColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NUColorSpace_displayP3LinearColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (displayP3LinearColorSpace_onceToken != -1)
    dispatch_once(&displayP3LinearColorSpace_onceToken, block);
  return (id)displayP3LinearColorSpace_result;
}

+ (id)rec709ColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NUColorSpace_rec709ColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (rec709ColorSpace_onceToken != -1)
    dispatch_once(&rec709ColorSpace_onceToken, block);
  return (id)rec709ColorSpace_result;
}

+ (NUColorSpace)displayP3_PQ
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__NUColorSpace_displayP3_PQ__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (displayP3_PQ_onceToken != -1)
    dispatch_once(&displayP3_PQ_onceToken, block);
  return (NUColorSpace *)(id)displayP3_PQ_result;
}

+ (NUColorSpace)displayP3_HLG
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__NUColorSpace_displayP3_HLG__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (displayP3_HLG_onceToken != -1)
    dispatch_once(&displayP3_HLG_onceToken, block);
  return (NUColorSpace *)(id)displayP3_HLG_result;
}

+ (id)colorSpaceFromVideoColorProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_3955();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorProperties != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace colorSpaceFromVideoColorProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 390, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"colorProperties != nil");
  }
  v5 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AE90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AF40]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AF68]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (v10 || v8 == 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(a1, "colorSpaceFromColorPrimaries:transferFunction:yccMatrix:", v6, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)colorSpaceFromColorPrimaries:(id)a3 transferFunction:(id)a4 yccMatrix:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  const __CFDictionary *v13;
  CGColorSpaceRef ColorSpaceFromAttachments;
  CGColorSpaceRef v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
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
  _QWORD v66[3];
  _QWORD v67[3];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_3955();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorPrimaries != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v39;
        v70 = 2114;
        v71 = v43;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace colorSpaceFromColorPrimaries:transferFunction:yccMatrix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 405, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"colorPrimaries != nil");
  }
  if (!v9)
  {
    NUAssertLogger_3955();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "transferFunction != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v48;
        v70 = 2114;
        v71 = v52;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace colorSpaceFromColorPrimaries:transferFunction:yccMatrix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 406, CFSTR("Invalid parameter not satisfying: %s"), v53, v54, v55, v56, (uint64_t)"transferFunction != nil");
  }
  v11 = v10;
  if (!v10)
  {
    NUAssertLogger_3955();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "yccMatrix != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v57;
        v70 = 2114;
        v71 = v61;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace colorSpaceFromColorPrimaries:transferFunction:yccMatrix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 407, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"yccMatrix != nil");
  }
  v12 = *MEMORY[0x1E0CA8E98];
  v66[0] = *MEMORY[0x1E0CA8D68];
  v66[1] = v12;
  v67[0] = v8;
  v67[1] = v9;
  v66[2] = *MEMORY[0x1E0CA8EE8];
  v67[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ColorSpaceFromAttachments = CVImageBufferCreateColorSpaceFromAttachments(v13);
  if (ColorSpaceFromAttachments)
  {
    v15 = ColorSpaceFromAttachments;
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCGColorSpace:descriptionName:", ColorSpaceFromAttachments, CFSTR("custom"));
    CFRelease(v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __29__NUColorSpace_displayP3_HLG__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D910]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceDisplayP3_HLG"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace displayP3_HLG]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 376, CFSTR("Failed to load kCGColorSpaceDisplayP3_HLG"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("DisplayP3+HLG"));
  v5 = (void *)displayP3_HLG_result;
  displayP3_HLG_result = v4;

  CGColorSpaceRelease(v3);
}

void __28__NUColorSpace_displayP3_PQ__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D918]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceDisplayP3_PQ"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace displayP3_PQ]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 363, CFSTR("Failed to load kCGColorSpaceDisplayP3_PQ"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("DisplayP3+PQ"));
  v5 = (void *)displayP3_PQ_result;
  displayP3_PQ_result = v4;

  CGColorSpaceRelease(v3);
}

void __32__NUColorSpace_rec709ColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[12];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "colorSpaceFromColorPrimaries:transferFunction:yccMatrix:", *MEMORY[0x1E0CA8D88], *MEMORY[0x1E0CA8EB0], *MEMORY[0x1E0CA8F18]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)rec709ColorSpace_result;
  rec709ColorSpace_result = v1;

  if (!rec709ColorSpace_result)
  {
    NUAssertLogger_3955();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load HDTV colorspace"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v19, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E0CB3978];
        v12 = v10;
        objc_msgSend(v11, "callStackSymbols");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v19 = 138543618;
        *(_QWORD *)&v19[4] = v10;
        v20 = 2114;
        v21 = v14;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v19, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v19, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace rec709ColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 352, CFSTR("Failed to load HDTV colorspace"), v15, v16, v17, v18, *(uint64_t *)v19);
  }
}

void __41__NUColorSpace_displayP3LinearColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9E8]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceLinearDisplayP3"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace displayP3LinearColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 331, CFSTR("Failed to load kCGColorSpaceLinearDisplayP3"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("DisplayP3 (linear)"));
  v5 = (void *)displayP3LinearColorSpace_result;
  displayP3LinearColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __35__NUColorSpace_displayP3ColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceDisplayP3"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace displayP3ColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 318, CFSTR("Failed to load kCGColorSpaceDisplayP3"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("DisplayP3"));
  v5 = (void *)displayP3ColorSpace_result;
  displayP3ColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __37__NUColorSpace_genericGrayColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D970]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceGenericGray"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace genericGrayColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 305, CFSTR("Failed to load kCGColorSpaceGenericGray"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("Generic Gray"));
  v5 = (void *)genericGrayColorSpace_result;
  genericGrayColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __42__NUColorSpace_genericRGBLinearColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D990]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceGenericRGBLinear"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace genericRGBLinearColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 292, CFSTR("Failed to load kCGColorSpaceGenericRGBLinear"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("Generic RGB (linear)"));
  v5 = (void *)genericRGBLinearColorSpace_result;
  genericRGBLinearColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __36__NUColorSpace_genericRGBColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D988]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceGenericRGB"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace genericRGBColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 279, CFSTR("Failed to load kCGColorSpaceGenericRGB"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("Generic RGB"));
  v5 = (void *)genericRGBColorSpace_result;
  genericRGBColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __34__NUColorSpace_adobeRGBColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D8F8]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceAdobeRGB1998"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace adobeRGBColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 266, CFSTR("Failed to load kCGColorSpaceAdobeRGB1998"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("Adobe RGB 1998"));
  v5 = (void *)adobeRGBColorSpace_result;
  adobeRGBColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __44__NUColorSpace_extendedSRGBLinearColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D958]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceExtendedLinearSRGB"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace extendedSRGBLinearColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 253, CFSTR("Failed to load kCGColorSpaceExtendedLinearSRGB"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("sRGB (linear, extended)"));
  v5 = (void *)extendedSRGBLinearColorSpace_result;
  extendedSRGBLinearColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __36__NUColorSpace_sRGBLinearColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceLinearSRGB"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace sRGBLinearColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 240, CFSTR("Failed to load kCGColorSpaceLinearSRGB"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("sRGB (linear)"));
  v5 = (void *)sRGBLinearColorSpace_result;
  sRGBLinearColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __38__NUColorSpace_extendedSRGBColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceExtendedSRGB"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace extendedSRGBColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 227, CFSTR("Failed to load kCGColorSpaceExtendedSRGB"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("sRGB (extended)"));
  v5 = (void *)extendedSRGBColorSpace_result;
  extendedSRGBColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __36__NUColorSpace_itur2100PQColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9C8]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceITUR_2100_PQ"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace itur2100PQColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 215, CFSTR("Failed to load kCGColorSpaceITUR_2100_PQ"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("ITU Rec2100 PQ"));
  v5 = (void *)itur2100PQColorSpace_result;
  itur2100PQColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __37__NUColorSpace_itur2100HLGColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9C0]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceITUR_2100_HLG"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace itur2100HLGColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 202, CFSTR("Failed to load kCGColorSpaceITUR_2100_HLG"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("ITU Rec2100 HLG"));
  v5 = (void *)itur2100HLGColorSpace_result;
  itur2100HLGColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __36__NUColorSpace_linearGrayColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9F0]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load linear gray color space"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace linearGrayColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 189, CFSTR("Failed to load linear gray color space"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("Linear Gray"));
  v5 = (void *)linearGrayColorSpace_result;
  linearGrayColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __45__NUColorSpace_genericGrayGamma2_2ColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceGenericGrayGamma2_2"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace genericGrayGamma2_2ColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 176, CFSTR("Failed to load kCGColorSpaceGenericGrayGamma2_2"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("Generic Gray (2.2)"));
  v5 = (void *)genericGrayGamma2_2ColorSpace_result;
  genericGrayGamma2_2ColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

void __30__NUColorSpace_sRGBColorSpace__block_invoke(uint64_t a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  if (!v2)
  {
    NUAssertLogger_3955();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load kCGColorSpaceSRGB"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3955();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace sRGBColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 163, CFSTR("Failed to load kCGColorSpaceSRGB"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCGColorSpace:descriptionName:", v2, CFSTR("sRGB"));
  v5 = (void *)sRGBColorSpace_result;
  sRGBColorSpace_result = v4;

  CGColorSpaceRelease(v3);
}

@end
