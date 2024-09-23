@implementation SPColorWrapper

+ (id)wrapperForColor:(id)a3
{
  id v4;
  SPColorWrapper *v5;
  SPColorWrapper *v6;
  SPColorWrapper *v7;

  v4 = a3;
  v5 = objc_alloc_init(SPColorWrapper);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_color, a3);
    v7 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPColorWrapper)initWithCoder:(id)a3
{
  id v4;
  SPColorWrapper *v5;
  uint64_t v6;
  UIColor *color;
  _BYTE *v8;
  id v9;
  unint64_t v10;
  double v11;
  double v12;
  NSObject *p_super;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  SPColorWrapper *v29;
  uint64_t v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SPColorWrapper;
  v5 = -[SPColorWrapper init](&v32, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("c")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
      v6 = objc_claimAutoreleasedReturnValue();
      color = v5->_color;
      v5->_color = (UIColor *)v6;

    }
    else
    {
      v31 = 0;
      v8 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesWithReturnedLength:", &v31);
      switch(v31)
      {
        case 1:
          v9 = objc_alloc(MEMORY[0x24BDF6950]);
          LOBYTE(v10) = *v8;
          v11 = (double)v10 / 255.0;
          v12 = 1.0;
          goto LABEL_9;
        case 2:
          v9 = objc_alloc(MEMORY[0x24BDF6950]);
          LOBYTE(v14) = *v8;
          v11 = (double)v14 / 255.0;
          LOBYTE(v15) = v8[1];
          v12 = (double)v15 / 255.0;
LABEL_9:
          v16 = objc_msgSend(v9, "initWithWhite:alpha:", v11, v12);
          goto LABEL_13;
        case 3:
          v17 = objc_alloc(MEMORY[0x24BDF6950]);
          LOBYTE(v18) = *v8;
          v19 = (double)v18 / 255.0;
          LOBYTE(v20) = v8[1];
          v21 = (double)v20 / 255.0;
          LOBYTE(v22) = v8[2];
          v23 = (double)v22 / 255.0;
          v24 = 1.0;
          goto LABEL_12;
        case 4:
          v17 = objc_alloc(MEMORY[0x24BDF6950]);
          LOBYTE(v25) = *v8;
          v19 = (double)v25 / 255.0;
          LOBYTE(v26) = v8[1];
          v21 = (double)v26 / 255.0;
          LOBYTE(v27) = v8[2];
          v23 = (double)v27 / 255.0;
          LOBYTE(v28) = v8[3];
          v24 = (double)v28 / 255.0;
LABEL_12:
          v16 = objc_msgSend(v17, "initWithRed:green:blue:alpha:", v19, v21, v23, v24);
LABEL_13:
          p_super = &v5->_color->super;
          v5->_color = (UIColor *)v16;
          break;
        default:
          wk_default_log();
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            -[SPColorWrapper initWithCoder:].cold.1();
          break;
      }

    }
    v29 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CGColor *v5;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  CGColorSpaceModel v8;
  size_t NumberOfComponents;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  const CGFloat *Components;
  __int128 v21;
  const CGFloat *v22;
  uint64_t v23;
  double *v24;
  uint8_t *v25;
  uint64_t v26;
  double v27;
  NSObject *v29;
  double v30;
  double *v31;
  double v32;
  NSObject *v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[UIColor CGColor](self->_color, "CGColor");
  ColorSpace = CGColorGetColorSpace(v5);
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model > kCGColorSpaceModelRGB)
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_color, CFSTR("c"));
  }
  else
  {
    v8 = Model;
    NumberOfComponents = CGColorGetNumberOfComponents(v5);
    v10 = NumberOfComponents;
    v11 = 4;
    if (v8 == kCGColorSpaceModelMonochrome)
      v11 = 2;
    if (NumberOfComponents != v11)
    {
      wk_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SPColorWrapper encodeWithCoder:].cold.2(v10, v12, v13, v14, v15, v16, v17, v18);

    }
    v19 = &buf[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
    Components = CGColorGetComponents(v5);
    v22 = Components;
    v23 = v10 - 1;
    if (v10 != 1)
    {
      *(_QWORD *)&v21 = 136446722;
      v35 = v21;
      v24 = (double *)Components;
      v25 = &buf[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
      v26 = v10 - 1;
      do
      {
        v27 = *v24;
        if (*v24 < 0.0 || v27 > 1.0)
        {
          wk_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = *v24;
            *(_DWORD *)buf = v35;
            v37 = "-[SPColorWrapper encodeWithCoder:]";
            v38 = 1024;
            v39 = 88;
            v40 = 2048;
            v41 = v30;
            _os_log_error_impl(&dword_215918000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%d: Color component with value %f must be in the range [0, 1].", buf, 0x1Cu);
          }

          v27 = *v24;
        }
        *v25++ = (int)(v27 * 255.0);
        ++v24;
        --v26;
      }
      while (v26);
    }
    v31 = (double *)&v22[v23];
    v32 = *v31;
    if (*v31 < 0.0 || v32 > 1.0)
    {
      wk_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SPColorWrapper encodeWithCoder:].cold.1();

      v32 = *v31;
    }
    if (v32 >= 1.0)
      --v10;
    else
      v19[v23] = (int)(v32 * 255.0);
    objc_msgSend(v4, "encodeBytes:length:", v19, v10, v35);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_color);
  return v4;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Unexpected number of decoded color components (%lu).", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Alpha component with value %f must be in the range [0, 1].", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_215918000, a2, a3, "%{public}s:%d: Unexpected number of color components (%lu).", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
