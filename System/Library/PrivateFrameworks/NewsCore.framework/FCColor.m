@implementation FCColor

+ (FCColor)colorWithHexString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8;
  v14 = __Block_byref_object_dispose__8;
  v15 = 0;
  if (objc_msgSend(v4, "fc_isValidColorHexString"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__FCColor_colorWithHexString___block_invoke;
    v9[3] = &unk_1E463C520;
    v9[4] = &v10;
    v9[5] = a1;
    FCDeconstructHexStringWithBlock(v4, v9);
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v6 = (void *)v11[5];
    v11[5] = v5;

  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (FCColor *)v7;
}

+ (id)nullableColorWithHexString:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = 0;
  if (objc_msgSend(v4, "fc_isValidColorHexString"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__FCColor_nullableColorWithHexString___block_invoke;
    v7[3] = &unk_1E463C520;
    v7[4] = &v8;
    v7[5] = a1;
    FCDeconstructHexStringWithBlock(v4, v7);
  }
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __38__FCColor_nullableColorWithHexString___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:alpha:", a2, a3, a4, a5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (FCColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  FCColor *result;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "red >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCColor initWithRed:green:blue:alpha:]";
    v19 = 2080;
    v20 = "FCColor.m";
    v21 = 1024;
    v22 = 82;
    v23 = 2114;
    v24 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a4 < 0.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "green >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCColor initWithRed:green:blue:alpha:]";
    v19 = 2080;
    v20 = "FCColor.m";
    v21 = 1024;
    v22 = 83;
    v23 = 2114;
    v24 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a5 < 0.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "blue >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCColor initWithRed:green:blue:alpha:]";
    v19 = 2080;
    v20 = "FCColor.m";
    v21 = 1024;
    v22 = 84;
    v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a6 < 0.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "alpha >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCColor initWithRed:green:blue:alpha:]";
    v19 = 2080;
    v20 = "FCColor.m";
    v21 = 1024;
    v22 = 85;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v16.receiver = self;
  v16.super_class = (Class)FCColor;
  result = -[FCColor init](&v16, sel_init);
  if (result)
  {
    result->_red = a3;
    result->_green = a4;
    result->_blue = a5;
    result->_alpha = a6;
  }
  return result;
}

void __30__FCColor_colorWithHexString___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:alpha:", a2, a3, a4, a5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

+ (id)whiteColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__FCColor_whiteColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0F7D98 != -1)
    dispatch_once(&qword_1ED0F7D98, block);
  return (id)_MergedGlobals_141;
}

void __21__FCColor_whiteColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v1 = (void *)_MergedGlobals_141;
  _MergedGlobals_141 = v0;

}

- (FCColor)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCColor init]";
    v9 = 2080;
    v10 = "FCColor.m";
    v11 = 1024;
    v12 = 77;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCColor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (FCColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "red >= 0");
    *(_DWORD *)buf = 136315906;
    v17 = "+[FCColor colorWithRed:green:blue:alpha:]";
    v18 = 2080;
    v19 = "FCColor.m";
    v20 = 1024;
    v21 = 100;
    v22 = 2114;
    v23 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a4 < 0.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "green >= 0");
    *(_DWORD *)buf = 136315906;
    v17 = "+[FCColor colorWithRed:green:blue:alpha:]";
    v18 = 2080;
    v19 = "FCColor.m";
    v20 = 1024;
    v21 = 101;
    v22 = 2114;
    v23 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a5 < 0.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "blue >= 0");
    *(_DWORD *)buf = 136315906;
    v17 = "+[FCColor colorWithRed:green:blue:alpha:]";
    v18 = 2080;
    v19 = "FCColor.m";
    v20 = 1024;
    v21 = 102;
    v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a6 < 0.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "alpha >= 0");
    *(_DWORD *)buf = 136315906;
    v17 = "+[FCColor colorWithRed:green:blue:alpha:]";
    v18 = 2080;
    v19 = "FCColor.m";
    v20 = 1024;
    v21 = 103;
    v22 = 2114;
    v23 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return (FCColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (id)blackColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__FCColor_blackColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0F7DA8 != -1)
    dispatch_once(&qword_1ED0F7DA8, block);
  return (id)qword_1ED0F7DA0;
}

void __21__FCColor_blackColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v1 = (void *)qword_1ED0F7DA0;
  qword_1ED0F7DA0 = v0;

}

+ (id)clearColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__FCColor_clearColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0F7DB8 != -1)
    dispatch_once(&qword_1ED0F7DB8, block);
  return (id)qword_1ED0F7DB0;
}

void __21__FCColor_clearColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v1 = (void *)qword_1ED0F7DB0;
  qword_1ED0F7DB0 = v0;

}

- (void)readDeconstructedRepresentationWithAcccessor:(id)a3
{
  void (**v4)(_QWORD, double, double, double, double);
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD, double, double, double, double))a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCColor readDeconstructedRepresentationWithAcccessor:]";
    v15 = 2080;
    v16 = "FCColor.m";
    v17 = 1024;
    v18 = 173;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCColor red](self, "red");
  v6 = v5;
  -[FCColor green](self, "green");
  v8 = v7;
  -[FCColor blue](self, "blue");
  v10 = v9;
  -[FCColor alpha](self, "alpha");
  v4[2](v4, v6, v8, v10, v11);

}

- (BOOL)isSimilarToColor:(id)a3 withinPercentage:(double)a4
{
  id v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;

  v6 = a3;
  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (a4 >= 0.00000011920929)
  {
    -[FCColor red](self, "red");
    v9 = v8;
    objc_msgSend(v6, "red");
    if (vabdd_f64(v9, v10) <= a4)
    {
      -[FCColor green](self, "green");
      v12 = v11;
      objc_msgSend(v6, "green");
      if (vabdd_f64(v12, v13) <= a4)
      {
        -[FCColor blue](self, "blue");
        v15 = v14;
        objc_msgSend(v6, "blue");
        if (vabdd_f64(v15, v16) <= a4)
        {
          -[FCColor alpha](self, "alpha");
          v19 = v18;
          objc_msgSend(v6, "alpha");
          v7 = vabdd_f64(v19, v20) <= a4;
          goto LABEL_8;
        }
      }
    }
    goto LABEL_7;
  }
  v7 = -[FCColor isEqual:](self, "isEqual:", v6);
LABEL_8:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FCColor red](self, "red");
    v7 = v6;
    objc_msgSend(v5, "red");
    if (vabdd_f64(v7, v8) >= 0.00999999978
      || (-[FCColor green](self, "green"), v10 = v9, objc_msgSend(v5, "green"), vabdd_f64(v10, v11) >= 0.00999999978)
      || (-[FCColor blue](self, "blue"), v13 = v12, objc_msgSend(v5, "blue"), vabdd_f64(v13, v14) >= 0.00999999978))
    {
      v18 = 0;
    }
    else
    {
      -[FCColor alpha](self, "alpha");
      v16 = v15;
      objc_msgSend(v5, "alpha");
      v18 = vabdd_f64(v16, v17) < 0.00999999978;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[FCColor red](self, "red");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[FCColor green](self, "green");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v5;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[FCColor blue](self, "blue");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[FCColor alpha](self, "alpha");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v11 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (id)legibleColor
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23__FCColor_legibleColor__block_invoke;
  v4[3] = &unk_1E463C568;
  v4[4] = self;
  v4[5] = &v5;
  -[FCColor readDeconstructedRepresentationWithAcccessor:](self, "readDeconstructedRepresentationWithAcccessor:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __23__FCColor_legibleColor__block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  double v5;
  void *v6;
  id v7;

  v5 = a3 * 0.7152 + a2 * 0.2126 + a4 * 0.0722;
  v6 = (void *)objc_opt_class();
  if (v5 > 0.7)
    objc_msgSend(v6, "blackColor");
  else
    objc_msgSend(v6, "whiteColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);

}

- (NSString)hex
{
  float v2;
  unint64_t v3;
  float v4;
  unint64_t v5;
  float v6;
  float v7;

  v2 = self->_red * 255.0;
  v3 = llroundf(v2);
  v4 = self->_green * 255.0;
  v5 = llroundf(v4);
  v6 = self->_blue * 255.0;
  v7 = self->_alpha * 255.0;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02lX%02lX%02lX%02lX"), v3, v5, llroundf(v6), llroundf(v7));
}

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

@end
