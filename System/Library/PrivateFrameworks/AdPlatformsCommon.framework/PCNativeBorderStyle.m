@implementation PCNativeBorderStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeBorderStyle)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;

  v4 = a3;
  v11 = objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("color"), v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v17;

    objc_msgSend_decodeDoubleForKey_(v4, v19, (uint64_t)CFSTR("width"), v20, v21, v22, v23);
    *(double *)(v11 + 16) = v24;
    objc_msgSend_decodeDoubleForKey_(v4, v25, (uint64_t)CFSTR("cornerRadius"), v26, v27, v24, v28);
    *(_QWORD *)(v11 + 24) = v29;
  }

  return (PCNativeBorderStyle *)v11;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  id v37;

  v37 = a3;
  objc_msgSend_color(self, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v11, (uint64_t)v10, (uint64_t)CFSTR("color"), v12, v13, v14);

  objc_msgSend_width(self, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(v37, v21, (uint64_t)CFSTR("width"), v22, v23, v24, v25);
  objc_msgSend_cornerRadius(self, v26, v27, v28, v29, v30, v31);
  objc_msgSend_encodeDouble_forKey_(v37, v32, (uint64_t)CFSTR("cornerRadius"), v33, v34, v35, v36);

}

- (PCNativeColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
