@implementation CNMemojiBackgroundColor

+ (id)log
{
  if (log_cn_once_token_0_12 != -1)
    dispatch_once(&log_cn_once_token_0_12, &__block_literal_global_120);
  return (id)log_cn_once_object_0_12;
}

void __30__CNMemojiBackgroundColor_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNMemojiBackgroundColor");
  v1 = (void *)log_cn_once_object_0_12;
  log_cn_once_object_0_12 = (uint64_t)v0;

}

- (CNMemojiBackgroundColor)initWithColorDescription:(id)a3 alpha:(double)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CNMemojiBackgroundColor *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  if (v6)
  {
    if (initWithColorDescription_alpha__cn_once_token_2 != -1)
      dispatch_once(&initWithColorDescription_alpha__cn_once_token_2, &__block_literal_global_3_13);
    v7 = (id)initWithColorDescription_alpha__cn_once_object_2;
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__CNMemojiBackgroundColor_initWithColorDescription_alpha___block_invoke_2;
    v23[3] = &unk_1E29FD900;
    v9 = v7;
    v24 = v9;
    objc_msgSend(v8, "_cn_compactMap:", v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") == 3)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = -[CNMemojiBackgroundColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v13, v16, v18, a4);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[CNMemojiBackgroundColor initWithColorDescription:alpha:].cold.2((uint64_t)v6, v21);

      v19 = -[CNMemojiBackgroundColor initWithDefaultColorWithAlpha:](self, "initWithDefaultColorWithAlpha:", a4);
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CNMemojiBackgroundColor initWithColorDescription:alpha:].cold.1(v20);

    v19 = -[CNMemojiBackgroundColor initWithDefaultColorWithAlpha:](self, "initWithDefaultColorWithAlpha:", a4);
  }

  return v19;
}

void __58__CNMemojiBackgroundColor_initWithColorDescription_alpha___block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  objc_msgSend(v0, "setNumberStyle:", 1);
  v2 = (void *)initWithColorDescription_alpha__cn_once_object_2;
  initWithColorDescription_alpha__cn_once_object_2 = (uint64_t)v0;

}

uint64_t __58__CNMemojiBackgroundColor_initWithColorDescription_alpha___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "numberFromString:", a2);
}

- (CNMemojiBackgroundColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CNMemojiBackgroundColor *v10;
  CNMemojiBackgroundColor *v11;
  CNMemojiBackgroundColor *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNMemojiBackgroundColor;
  v10 = -[CNMemojiBackgroundColor init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_red = a3;
    v10->_green = a4;
    v10->_blue = a5;
    v10->_alpha = a6;
    v12 = v10;
  }

  return v11;
}

- (CNMemojiBackgroundColor)initWithDefaultColorWithAlpha:(double)a3
{
  char *v4;
  CNMemojiBackgroundColor *v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNMemojiBackgroundColor;
  v4 = -[CNMemojiBackgroundColor init](&v8, sel_init);
  v5 = (CNMemojiBackgroundColor *)v4;
  if (v4)
  {
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(0x4061C00000000000uLL);
    *((_QWORD *)v4 + 3) = 0x4062600000000000;
    *((double *)v4 + 4) = a3;
    v6 = v4;
  }

  return v5;
}

- (CNMemojiBackgroundColor)initWithColorDescription:(id)a3
{
  return -[CNMemojiBackgroundColor initWithColorDescription:alpha:](self, "initWithColorDescription:alpha:", a3, 0.4);
}

- (double)red
{
  return self->_red;
}

- (void)setRed:(double)a3
{
  self->_red = a3;
}

- (double)green
{
  return self->_green;
}

- (void)setGreen:(double)a3
{
  self->_green = a3;
}

- (double)blue
{
  return self->_blue;
}

- (void)setBlue:(double)a3
{
  self->_blue = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void)initWithColorDescription:(os_log_t)log alpha:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Color description is nil", v1, 2u);
}

- (void)initWithColorDescription:(uint64_t)a1 alpha:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Color description format should be r:g:b, got description: %@", (uint8_t *)&v2, 0xCu);
}

@end
