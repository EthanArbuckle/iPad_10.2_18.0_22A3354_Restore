@implementation BKSHitTestRegion

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendCGRect:", self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  v5 = (id)objc_msgSend(v3, "appendCGRect:", self->_exclusiveTouchNormalizedSubRect.origin.x, self->_exclusiveTouchNormalizedSubRect.origin.y, self->_exclusiveTouchNormalizedSubRect.size.width, self->_exclusiveTouchNormalizedSubRect.size.height);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  v9 = a3;
  objc_msgSend(v4, "bs_valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v10, CFSTR("_rect"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", self->_exclusiveTouchNormalizedSubRect.origin.x, self->_exclusiveTouchNormalizedSubRect.origin.y, self->_exclusiveTouchNormalizedSubRect.size.width, self->_exclusiveTouchNormalizedSubRect.size.height);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v11, CFSTR("_exclusiveTouchNormalizedSubRect"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BKSHitTestRegion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_exclusiveTouchNormalizedSubRect"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "bs_CGRectValue");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  return (BKSHitTestRegion *)-[BKSHitTestRegion _initWithRect:exclusiveTouchNormalizedSubRect:](self, "_initWithRect:exclusiveTouchNormalizedSubRect:", v7, v9, v11, v13, v16, v18, v20, v22);
}

- (CGRect)_exclusiveTouchNormalizedSubRectInReferenceSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.x;
  y = self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.y;
  width = self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.width;
  height = self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BKSHitTestRegion)initWithRect:(CGRect)a3 exclusiveTouchSubRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  BKSHitTestRegion *v12;
  BKSHitTestRegion *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)BKSHitTestRegion;
  v12 = -[BKSHitTestRegion init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_rect.origin.x = v11;
    v12->_rect.origin.y = v10;
    v12->_rect.size.width = v9;
    v12->_rect.size.height = v8;
    -[BKSHitTestRegion setExclusiveTouchNormalizedSubRect:](v12, "setExclusiveTouchNormalizedSubRect:", x / v9, y / v8, width / v9, height / v8);
  }
  return v13;
}

- (id)_initWithRect:(CGRect)a3 exclusiveTouchNormalizedSubRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  BKSHitTestRegion *v12;
  BKSHitTestRegion *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)BKSHitTestRegion;
  v12 = -[BKSHitTestRegion init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_rect.origin.x = v11;
    v12->_rect.origin.y = v10;
    v12->_rect.size.width = v9;
    v12->_rect.size.height = v8;
    -[BKSHitTestRegion setExclusiveTouchNormalizedSubRect:](v12, "setExclusiveTouchNormalizedSubRect:", x, y, width, height);
  }
  return v13;
}

- (void)setExclusiveTouchNormalizedSubRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  BKSHitTestRegion *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v41 = *MEMORY[0x1E0C80C00];
  if (!CGRectEqualToRect(a3, self->_exclusiveTouchNormalizedSubRect))
  {
    if (!BSFloatGreaterThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid exclusiveTouchNormalizedSubRect x coordinate: %f - needs to be between 0 and 1"), *(_QWORD *)&x);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v14;
        v31 = 2114;
        v32 = v16;
        v33 = 2048;
        v34 = self;
        v35 = 2114;
        v36 = CFSTR("BKSHitTestRegion.m");
        v37 = 1024;
        v38 = 61;
        v39 = 2114;
        v40 = v13;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0FFA8CLL);
    }
    if (!BSFloatGreaterThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid exclusiveTouchNormalizedSubRect y coordinate: %f - needs to be between 0 and 1"), *(_QWORD *)&y);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v18;
        v31 = 2114;
        v32 = v20;
        v33 = 2048;
        v34 = self;
        v35 = 2114;
        v36 = CFSTR("BKSHitTestRegion.m");
        v37 = 1024;
        v38 = 62;
        v39 = 2114;
        v40 = v17;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0FFB7CLL);
    }
    if (!BSFloatGreaterThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid exclusiveTouchNormalizedSubRect width: %f - needs to be between 0 and 1"), *(_QWORD *)&width);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v22;
        v31 = 2114;
        v32 = v24;
        v33 = 2048;
        v34 = self;
        v35 = 2114;
        v36 = CFSTR("BKSHitTestRegion.m");
        v37 = 1024;
        v38 = 63;
        v39 = 2114;
        v40 = v21;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0FFC6CLL);
    }
    if (!BSFloatGreaterThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid exclusiveTouchNormalizedSubRect height: %f - needs to be between 0 and 1"), *(_QWORD *)&height);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v26;
        v31 = 2114;
        v32 = v28;
        v33 = 2048;
        v34 = self;
        v35 = 2114;
        v36 = CFSTR("BKSHitTestRegion.m");
        v37 = 1024;
        v38 = 64;
        v39 = 2114;
        v40 = v25;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0FFD5CLL);
    }
    v9 = self->_rect.origin.y;
    v10 = self->_rect.size.width;
    v11 = self->_rect.size.height;
    v12 = self->_rect.origin.x + x * v10;
    self->_exclusiveTouchNormalizedSubRect.origin.x = x;
    self->_exclusiveTouchNormalizedSubRect.origin.y = y;
    self->_exclusiveTouchNormalizedSubRect.size.width = width;
    self->_exclusiveTouchNormalizedSubRect.size.height = height;
    self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.x = v12;
    self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.y = v9 + y * v11;
    self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.width = width * v10;
    self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.height = height * v11;
  }
}

- (BKSHitTestRegion)initWithRect:(CGRect)a3
{
  return (BKSHitTestRegion *)-[BKSHitTestRegion _initWithRect:exclusiveTouchNormalizedSubRect:](self, "_initWithRect:exclusiveTouchNormalizedSubRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  double x;
  double y;
  double width;
  double height;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __28__BKSHitTestRegion_isEqual___block_invoke;
  v21[3] = &unk_1E1EA0928;
  v7 = v4;
  v22 = v7;
  v8 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v21, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  v16 = v6;
  v17 = 3221225472;
  v18 = __28__BKSHitTestRegion_isEqual___block_invoke_2;
  v19 = &unk_1E1EA0928;
  v20 = v7;
  x = self->_exclusiveTouchNormalizedSubRect.origin.x;
  y = self->_exclusiveTouchNormalizedSubRect.origin.y;
  width = self->_exclusiveTouchNormalizedSubRect.size.width;
  height = self->_exclusiveTouchNormalizedSubRect.size.height;
  v13 = v7;
  v14 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", &v16, x, y, width, height);
  LOBYTE(v7) = objc_msgSend(v5, "isEqual", v16, v17, v18, v19);

  return (char)v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_msgSend(v7, "appendRect:withName:", CFSTR("hitTestRegion"), self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  v5 = (id)objc_msgSend(v7, "appendRect:withName:", CFSTR("exclusiveTouchNormalizedSubRect"), self->_exclusiveTouchNormalizedSubRect.origin.x, self->_exclusiveTouchNormalizedSubRect.origin.y, self->_exclusiveTouchNormalizedSubRect.size.width, self->_exclusiveTouchNormalizedSubRect.size.height);
  v6 = (id)objc_msgSend(v7, "appendRect:withName:", CFSTR("exclusiveTouchNormalizedSubRectInReferenceSpace"), self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.x, self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.y, self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.width, self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.height);

}

- (CGRect)exclusiveTouchNormalizedSubRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_exclusiveTouchNormalizedSubRect.origin.x;
  y = self->_exclusiveTouchNormalizedSubRect.origin.y;
  width = self->_exclusiveTouchNormalizedSubRect.size.width;
  height = self->_exclusiveTouchNormalizedSubRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

uint64_t __28__BKSHitTestRegion_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rect");
}

uint64_t __28__BKSHitTestRegion_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "exclusiveTouchNormalizedSubRect");
}

@end
