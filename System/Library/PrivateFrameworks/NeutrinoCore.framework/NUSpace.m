@implementation NUSpace

- (NUSpace)init
{
  return -[NUSpace initWithTransformStack:](self, "initWithTransformStack:", MEMORY[0x1E0C9AA60]);
}

- (NUSpace)initWithTransformStack:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NUSpace *v6;
  NSArray *transformStack;
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
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  if (!v4)
  {
    NUAssertLogger_39();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "transformStack != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_39();
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
        v27 = v16;
        v28 = 2114;
        v29 = v20;
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
      v27 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSpace initWithTransformStack:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUSpace.m", 32, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"transformStack != nil");
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUSpace;
  v6 = -[NUSpace init](&v25, sel_init);
  transformStack = v6->_transformStack;
  v6->_transformStack = v5;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUSpace *v4;
  void *v5;
  NUSpace *v6;

  v4 = +[NUSpace allocWithZone:](NUSpace, "allocWithZone:", a3);
  v5 = (void *)-[NSArray copy](self->_transformStack, "copy");
  v6 = -[NUSpace initWithTransformStack:](v4, "initWithTransformStack:", v5);

  return v6;
}

- (void)appendTransform:(id)a3
{
  NSArray *v4;
  NSArray *transformStack;

  -[NSArray arrayByAddingObject:](self->_transformStack, "arrayByAddingObject:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  transformStack = self->_transformStack;
  self->_transformStack = v4;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSArray *transformStack;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[NSArray count](self->_transformStack, "count"))
    transformStack = self->_transformStack;
  else
    transformStack = (NSArray *)CFSTR("{}");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p :: transforms: %@>"), v4, self, transformStack);
}

- (CGPoint)transformPoint:(CGPoint)a3 toSpace:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[NUSpace transformPointForward:](self, "transformPointForward:", x, y);
  objc_msgSend(v7, "transformPointBackward:");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)transformPointForward:(CGPoint)a3
{
  double y;
  double x;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_transformStack;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "transformPoint:", x, y, (_QWORD)v14);
        x = v10;
        y = v11;
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)transformPointBackward:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSArray reverseObjectEnumerator](self->_transformStack, "reverseObjectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "inverseTransform");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "transformPoint:", x, y);
        x = v11;
        y = v12;

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v12;
  int64_t var3;
  __int128 v14;
  int64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *retstr = *a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_transformStack;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if (v10)
        {
          v12 = *(_OWORD *)&retstr->var0;
          var3 = retstr->var3;
          objc_msgSend(v10, "transformTime:", &v12);
        }
        else
        {
          v14 = 0uLL;
          v15 = 0;
        }
        *(_OWORD *)&retstr->var0 = v14;
        retstr->var3 = v15;
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3 toSpace:(id *)a4
{
  id v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10[2];

  v8 = a5;
  memset(&v10[1], 0, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  v10[0] = *a4;
  -[NUSpace transformTime:](self, "transformTime:", v10);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  if (v8)
  {
    v10[0] = v10[1];
    objc_msgSend(v8, "transformTimeBackward:", v10);
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTimeBackward:(SEL)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v13;
  int64_t var3;
  __int128 v15;
  int64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *retstr = *a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSArray reverseObjectEnumerator](self->_transformStack, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "inverseTransform");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v13 = *(_OWORD *)&retstr->var0;
          var3 = retstr->var3;
          objc_msgSend(v10, "transformTime:", &v13);
        }
        else
        {
          v15 = 0uLL;
          v16 = 0;
        }
        *(_OWORD *)&retstr->var0 = v15;
        retstr->var3 = v16;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return result;
}

- (unint64_t)hash
{
  return NUDeepArrayHash(self->_transformStack);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NUSpace isEqualToSpace:](self, "isEqualToSpace:", v4);

  return v5;
}

- (BOOL)isEqualToSpace:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_39();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_39();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2114;
        v27 = v19;
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
      v25 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSpace isEqualToSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUSpace.m", 147, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"other != nil");
  }
  v5 = v4;
  v6 = -[NSArray isEqual:](self->_transformStack, "isEqual:", *((_QWORD *)v4 + 1));

  return v6;
}

- (NSArray)transformStack
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTransformStack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformStack, 0);
}

@end
