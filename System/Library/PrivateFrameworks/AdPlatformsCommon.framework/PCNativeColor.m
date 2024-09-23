@implementation PCNativeColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeColor)init
{
  PCNativeColor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCNativeColor;
  result = -[PCNativeColor init](&v3, sel_init);
  if (result)
    result->_gradientOrientation = 20000;
  return result;
}

- (PCNativeColor)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  PCNativeColor *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  NSArray *lightModeColors;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  NSArray *darkModeColors;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;

  v4 = a3;
  v11 = (PCNativeColor *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v12, v15, v13, v16, v17, v18, v19, v14, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("lightModeColors"), v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    lightModeColors = v11->_lightModeColors;
    v11->_lightModeColors = (NSArray *)v25;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v20, (uint64_t)CFSTR("darkModeColors"), v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    darkModeColors = v11->_darkModeColors;
    v11->_darkModeColors = (NSArray *)v31;

    v11->_gradientOrientation = (int)objc_msgSend_decodeInt32ForKey_(v4, v33, (uint64_t)CFSTR("gradientOrientation"), v34, v35, v36, v37);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  double v36;
  id v37;

  v37 = a3;
  objc_msgSend_lightModeColors(self, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v11, (uint64_t)v10, (uint64_t)CFSTR("lightModeColors"), v12, v13, v14);

  objc_msgSend_darkModeColors(self, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v22, (uint64_t)v21, (uint64_t)CFSTR("darkModeColors"), v23, v24, v25);

  v32 = objc_msgSend_gradientOrientation(self, v26, v27, v28, v29, v30, v31);
  objc_msgSend_encodeInt32_forKey_(v37, v33, v32, (uint64_t)CFSTR("gradientOrientation"), v34, v35, v36);

}

- (NSArray)lightModeColors
{
  return self->_lightModeColors;
}

- (void)setLightModeColors:(id)a3
{
  objc_storeStrong((id *)&self->_lightModeColors, a3);
}

- (NSArray)darkModeColors
{
  return self->_darkModeColors;
}

- (void)setDarkModeColors:(id)a3
{
  objc_storeStrong((id *)&self->_darkModeColors, a3);
}

- (int64_t)gradientOrientation
{
  return self->_gradientOrientation;
}

- (void)setGradientOrientation:(int64_t)a3
{
  self->_gradientOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeColors, 0);
  objc_storeStrong((id *)&self->_lightModeColors, 0);
}

@end
