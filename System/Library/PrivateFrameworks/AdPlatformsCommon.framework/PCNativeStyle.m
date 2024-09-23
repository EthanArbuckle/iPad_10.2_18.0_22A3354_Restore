@implementation PCNativeStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeStyle)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  PCNativeStyle *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  PCNativeColor *backgroundColor;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  PCNativeBorderStyle *borderStyle;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  PCNativeButtonStyle *buttonStyle;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  PCNativeShadowStyle *shadowStyle;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  PCNativeColor *textColor;

  v4 = a3;
  v11 = (PCNativeStyle *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("backgroundColor"), v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v11->_backgroundColor;
    v11->_backgroundColor = (PCNativeColor *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("borderStyle"), v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    borderStyle = v11->_borderStyle;
    v11->_borderStyle = (PCNativeBorderStyle *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("buttonStyle"), v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    buttonStyle = v11->_buttonStyle;
    v11->_buttonStyle = (PCNativeButtonStyle *)v31;

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, (uint64_t)CFSTR("shadowStyle"), v35, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    shadowStyle = v11->_shadowStyle;
    v11->_shadowStyle = (PCNativeShadowStyle *)v38;

    v40 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, (uint64_t)CFSTR("textColor"), v42, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    textColor = v11->_textColor;
    v11->_textColor = (PCNativeColor *)v45;

  }
  return v11;
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
  void *v11;
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
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  double v58;
  id v59;

  v4 = a3;
  objc_msgSend_backgroundColor(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("backgroundColor"), v13, v14, v15);

  objc_msgSend_borderStyle(self, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("borderStyle"), v24, v25, v26);

  objc_msgSend_buttonStyle(self, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("buttonStyle"), v35, v36, v37);

  objc_msgSend_shadowStyle(self, v38, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("shadowStyle"), v46, v47, v48);

  objc_msgSend_textColor(self, v49, v50, v51, v52, v53, v54);
  v59 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v59, (uint64_t)CFSTR("textColor"), v56, v57, v58);

}

- (PCNativeColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (PCNativeBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(id)a3
{
  objc_storeStrong((id *)&self->_borderStyle, a3);
}

- (PCNativeButtonStyle)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStyle, a3);
}

- (PCNativeShadowStyle)shadowStyle
{
  return self->_shadowStyle;
}

- (void)setShadowStyle:(id)a3
{
  objc_storeStrong((id *)&self->_shadowStyle, a3);
}

- (PCNativeColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_shadowStyle, 0);
  objc_storeStrong((id *)&self->_buttonStyle, 0);
  objc_storeStrong((id *)&self->_borderStyle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
