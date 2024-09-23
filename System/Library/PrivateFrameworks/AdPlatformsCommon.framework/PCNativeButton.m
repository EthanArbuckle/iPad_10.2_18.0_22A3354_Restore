@implementation PCNativeButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeButton)init
{
  PCNativeButton *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCNativeButton;
  result = -[PCNativeButton init](&v3, sel_init);
  if (result)
    result->_type = -1;
  return result;
}

- (PCNativeButton)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  PCNativeButton *v14;
  double v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  NSString *text;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  NSString *accessibleText;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  PCNativeButtonStyle *style;

  v4 = a3;
  v14 = (PCNativeButton *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v14)
  {
    v14->_type = (int)objc_msgSend_decodeInt32ForKey_(v4, v11, (uint64_t)CFSTR("type"), v12, v13, v15, v16);
    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("text"), v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    text = v14->_text;
    v14->_text = (NSString *)v22;

    v24 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, (uint64_t)CFSTR("accessibleText"), v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    accessibleText = v14->_accessibleText;
    v14->_accessibleText = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("style"), v33, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    style = v14->_style;
    v14->_style = (PCNativeButtonStyle *)v36;

  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  double v47;
  id v48;

  v4 = a3;
  v11 = objc_msgSend_type(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeInt32_forKey_(v4, v12, v11, (uint64_t)CFSTR("type"), v13, v14, v15);
  objc_msgSend_text(self, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("text"), v24, v25, v26);

  objc_msgSend_accessibleText(self, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("accessibleText"), v35, v36, v37);

  objc_msgSend_style(self, v38, v39, v40, v41, v42, v43);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v48, (uint64_t)CFSTR("style"), v45, v46, v47);

}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)accessibleText
{
  return self->_accessibleText;
}

- (void)setAccessibleText:(id)a3
{
  objc_storeStrong((id *)&self->_accessibleText, a3);
}

- (PCNativeButtonStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_accessibleText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
