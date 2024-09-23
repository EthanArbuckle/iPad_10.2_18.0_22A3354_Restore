@implementation PCNativeButtonStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeButtonStyle)initWithCoder:(id)a3
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
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  void *v52;

  v4 = a3;
  v11 = objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("color"), v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("highlightColor"), v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(v11 + 16);
    *(_QWORD *)(v11 + 16) = v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("disabledColor"), v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v31;

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, (uint64_t)CFSTR("textColor"), v35, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = v38;

    objc_msgSend_decodeDoubleForKey_(v4, v40, (uint64_t)CFSTR("cornerRadius"), v41, v42, v43, v44);
    *(_QWORD *)(v11 + 40) = v45;
    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, (uint64_t)CFSTR("borderStyle"), v48, v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = *(void **)(v11 + 48);
    *(_QWORD *)(v11 + 48) = v51;

  }
  return (PCNativeButtonStyle *)v11;
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
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  const char *v66;
  uint64_t v67;
  double v68;
  double v69;
  id v70;

  v4 = a3;
  objc_msgSend_color(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("color"), v13, v14, v15);

  objc_msgSend_highlightColor(self, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("highlightColor"), v24, v25, v26);

  objc_msgSend_disabledColor(self, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("disabledColor"), v35, v36, v37);

  objc_msgSend_textColor(self, v38, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("textColor"), v46, v47, v48);

  objc_msgSend_cornerRadius(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeDouble_forKey_(v4, v55, (uint64_t)CFSTR("cornerRadius"), v56, v57, v58, v59);
  objc_msgSend_borderStyle(self, v60, v61, v62, v63, v64, v65);
  v70 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v66, (uint64_t)v70, (uint64_t)CFSTR("borderStyle"), v67, v68, v69);

}

- (PCNativeColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (PCNativeColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (PCNativeColor)disabledColor
{
  return self->_disabledColor;
}

- (void)setDisabledColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledColor, a3);
}

- (PCNativeColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (PCNativeBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(id)a3
{
  objc_storeStrong((id *)&self->_borderStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderStyle, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
