@implementation CLLocationButtonTag

- (double)buttonWidth
{
  __n128 v2;
  __n128 v3;
  double v4;

  objc_msgSend_frame(self, a2, v2, v3);
  return v4;
}

- (double)buttonHeight
{
  __n128 v2;
  __n128 v3;
  double v4;

  objc_msgSend_frame(self, a2, v2, v3);
  return v4;
}

- (CLLocationButtonTag)initWithLabel:(int64_t)a3 iconType:(int64_t)a4 backgroundColor:(id)a5 tintColor:(id)a6 cornerRadius:(double)a7 frame:(CGRect)a8 fontSize:(double)a9
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  CLLocationButtonTag *v21;
  const char *v22;
  __n128 v23;
  __n128 v24;
  CLLocationButtonTag *v25;
  const char *v26;
  __n128 v27;
  __n128 v28;
  const char *v29;
  __n128 v30;
  __n128 v31;
  const char *v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  const char *v36;
  __n128 v37;
  __n128 v38;
  __n128 v39;
  const char *v40;
  __n128 v41;
  const char *v42;
  __n128 v43;
  const char *v44;
  __n128 v45;
  __n128 v46;
  const char *v47;
  __n128 v48;
  __n128 v49;
  objc_super v51;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v19 = a5;
  v20 = a6;
  v51.receiver = self;
  v51.super_class = (Class)CLLocationButtonTag;
  v21 = -[CLLocationButtonTag init](&v51, sel_init);
  v25 = v21;
  if (v21)
  {
    objc_msgSend_setLabel_(v21, v22, v23, v24, a3);
    objc_msgSend_setIcon_(v25, v26, v27, v28, a4);
    objc_msgSend_setBackgroundColor_(v25, v29, v30, v31, v19);
    objc_msgSend_setTintColor_(v25, v32, v33, v34, v20);
    v35.n128_f64[0] = a7;
    objc_msgSend_setCornerRadius_(v25, v36, v35, v37);
    v38.n128_f64[0] = x;
    v39.n128_f64[0] = y;
    objc_msgSend_setFrame_(v25, v40, v38, v39, width, height);
    v41.n128_f64[0] = a9;
    objc_msgSend_setFontSize_(v25, v42, v41, v43);
    objc_msgSend_fontSize(v25, v44, v45, v46);
    v49.n128_u64[0] = 12.0;
    if (v48.n128_f64[0] < 12.0)
    {
      v48.n128_u64[0] = 18.0;
      objc_msgSend_setFontSize_(v25, v47, v48, v49);
    }
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  id v5;
  __n128 v6;
  __n128 v7;
  uint64_t v8;
  const char *v9;
  __n128 v10;
  __n128 v11;
  const char *v12;
  __n128 v13;
  __n128 v14;
  uint64_t v15;
  const char *v16;
  __n128 v17;
  __n128 v18;
  const char *v19;
  __n128 v20;
  __n128 v21;
  void *v22;
  const char *v23;
  __n128 v24;
  __n128 v25;
  const char *v26;
  __n128 v27;
  __n128 v28;
  void *v29;
  const char *v30;
  __n128 v31;
  __n128 v32;
  const char *v33;
  __n128 v34;
  __n128 v35;
  const char *v36;
  __n128 v37;
  __n128 v38;
  const char *v39;
  __n128 v40;
  __n128 v41;
  const char *v42;
  __n128 v43;
  __n128 v44;
  const char *v45;
  __n128 v46;
  __n128 v47;
  void *v48;
  const char *v49;
  __n128 v50;
  __n128 v51;
  const char *v52;
  __n128 v53;
  __n128 v54;
  uint64_t v55;
  const char *v56;
  __n128 v57;
  __n128 v58;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    v8 = objc_msgSend_label(self, v4, v6, v7);
    objc_msgSend_setLabel_(v5, v9, v10, v11, v8);
    v15 = objc_msgSend_icon(self, v12, v13, v14);
    objc_msgSend_setIcon_(v5, v16, v17, v18, v15);
    objc_msgSend_backgroundColor(self, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundColor_(v5, v23, v24, v25, v22);

    objc_msgSend_tintColor(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTintColor_(v5, v30, v31, v32, v29);

    objc_msgSend_cornerRadius(self, v33, v34, v35);
    objc_msgSend_setCornerRadius_(v5, v36, v37, v38);
    objc_msgSend_frame(self, v39, v40, v41);
    objc_msgSend_setFrame_(v5, v42, v43, v44);
    objc_msgSend_style(self, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStyle_(v5, v49, v50, v51, v48);

    v55 = objc_msgSend_renderedSuccessfully(self, v52, v53, v54);
    objc_msgSend_setRenderedSuccessfully_(v5, v56, v57, v58, v55);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t label_low;
  const char *v5;
  __n128 v6;
  __n128 v7;
  const char *v8;
  __n128 v9;
  __n128 v10;
  const char *v11;
  __n128 v12;
  __n128 v13;
  const char *v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  const char *v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  const char *v22;
  __n128 v23;
  const char *v24;
  __n128 v25;
  id v26;

  label_low = LODWORD(self->_label);
  v26 = a3;
  objc_msgSend_encodeInt_forKey_(v26, v5, v6, v7, label_low, CFSTR("kCLLocationButtonLabel"));
  objc_msgSend_encodeInt_forKey_(v26, v8, v9, v10, LODWORD(self->_icon), CFSTR("kCLLocationButtonIcon"));
  objc_msgSend_encodeObject_forKey_(v26, v11, v12, v13, self->_backgroundColor, CFSTR("kCLLocationButtonBackgroundColor"));
  objc_msgSend_encodeObject_forKey_(v26, v14, v15, v16, self->_tintColor, CFSTR("kCLLocationButtonTintColor"));
  v17.n128_u64[0] = *(_QWORD *)&self->_cornerRadius;
  v17.n128_f32[0] = v17.n128_f64[0];
  objc_msgSend_encodeFloat_forKey_(v26, v18, v17, v19, CFSTR("kCLLocationButtonCornerRadius"));
  v20.n128_u64[0] = *(_QWORD *)&self->_frame.origin.x;
  v21.n128_u64[0] = *(_QWORD *)&self->_frame.origin.y;
  objc_msgSend_encodeCGRect_forKey_(v26, v22, v20, v21, CFSTR("kCLLocationButtonFrame"), self->_frame.size.width, self->_frame.size.height);
  v23.n128_u64[0] = *(_QWORD *)&self->_fontSize;
  v23.n128_f32[0] = v23.n128_f64[0];
  objc_msgSend_encodeFloat_forKey_(v26, v24, v23, v25, CFSTR("kCLLocationButtonFontSize"));

}

- (CLLocationButtonTag)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  __n128 v6;
  __n128 v7;
  int v8;
  const char *v9;
  __n128 v10;
  __n128 v11;
  int v12;
  uint64_t v13;
  const char *v14;
  __n128 v15;
  __n128 v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  __n128 v20;
  __n128 v21;
  void *v22;
  const char *v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  float v27;
  double v28;
  const char *v29;
  __n128 v30;
  __n128 v31;
  unint64_t v32;
  __n128 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  const char *v39;
  float v40;
  float v41;
  const char *v42;
  __n128 v43;
  __n128 v44;
  double v45;
  CLLocationButtonTag *v46;

  v4 = a3;
  v8 = objc_msgSend_decodeIntForKey_(v4, v5, v6, v7, CFSTR("kCLLocationButtonLabel"));
  v12 = objc_msgSend_decodeIntForKey_(v4, v9, v10, v11, CFSTR("kCLLocationButtonIcon"));
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v15, v16, v13, CFSTR("kCLLocationButtonBackgroundColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v20, v21, v18, CFSTR("kCLLocationButtonTintColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeFloatForKey_(v4, v23, v24, v25, CFSTR("kCLLocationButtonCornerRadius"));
  v27 = v26.n128_f32[0];
  v28 = v26.n128_f32[0];
  objc_msgSend_decodeCGRectForKey_(v4, v29, v26, v30, CFSTR("kCLLocationButtonFrame"));
  v32 = v31.n128_u64[0];
  v34 = v33.n128_f64[0];
  v36 = v35;
  v38 = v37;
  objc_msgSend_decodeFloatForKey_(v4, v39, v31, v33, CFSTR("kCLLocationButtonFontSize"));
  v41 = v40;

  if (v36 >= v38)
    v45 = v38;
  else
    v45 = v36;
  v43.n128_f64[0] = v45 * 0.5;
  if (v43.n128_f64[0] >= v28)
  {
    v43.n128_u64[0] = 0;
    if (v27 >= 0.0)
      v43.n128_f64[0] = v28;
  }
  v44.n128_u64[0] = v32;
  v46 = (CLLocationButtonTag *)objc_msgSend_initWithLabel_iconType_backgroundColor_tintColor_cornerRadius_frame_fontSize_(self, v42, v43, v44, v8, v12, v17, v22, v34, v36, v38, v41);

  return v46;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (unint64_t)cacheLimit
{
  return 0;
}

- (BOOL)isValid
{
  __n128 v2;
  __n128 v3;
  uint64_t v4;
  const char *v5;
  __n128 v6;
  __n128 v7;

  v4 = objc_msgSend_label(self, a2, v2, v3);
  return objc_msgSend_secureNameForLabel_(CLLocationButtonTag, v5, v6, v7, v4) - 0x20000 < 5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return 0x9FB774E4B8F165C9;
}

- (unint64_t)failGradeForStyle:(id)a3
{
  return -1;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 15;
}

- (id)resolvedStyleForStyle:(id)a3
{
  __n128 v3;
  __n128 v4;

  return (id)objc_msgSend_copyWithChangeBlock_(a3, a2, v3, v4, &unk_24F97D870);
}

- (BOOL)contrastValidForBgColorAndFgTextWithCumulativeOpacity:(float)a3
{
  __n128 v3;
  void *v6;
  const char *v7;
  __n128 v8;
  __n128 v9;
  double v10;
  __n128 v11;
  float v12;
  const char *v13;
  __n128 v14;
  void *v15;
  const char *v16;
  __n128 v17;
  __n128 v18;
  void *v19;
  double v20;
  double v21;
  const char *v22;
  __n128 v23;
  __n128 v24;
  void *v25;
  const char *v26;
  __n128 v27;
  __n128 v28;
  void *v29;
  double v30;
  const char *v31;
  __n128 v32;
  __n128 v33;
  void *v34;
  const char *v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  float v39;
  const char *v40;
  __n128 v41;
  void *v42;
  const char *v43;
  __n128 v44;
  __n128 v45;
  void *v46;
  double v47;
  double v48;
  const char *v49;
  __n128 v50;
  __n128 v51;
  void *v52;
  const char *v53;
  __n128 v54;
  __n128 v55;
  void *v56;
  double v57;
  _BOOL4 v58;
  double v60;
  double v61;
  uint8_t buf[4];
  double v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v61 = 0.0;
  objc_msgSend_tintColor(self, a2, *(__n128 *)&a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getRed_green_blue_alpha_(v6, v7, v8, v9, 0, 0, 0, &v61);

  v10 = a3;
  v11.n128_f64[0] = v61 * a3;
  v12 = v11.n128_f64[0];
  objc_msgSend_tintColor(self, v13, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_whiteColor(MEMORY[0x24BDF6948], v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  v21 = sub_22D9A5830(v15, v19, v12);

  objc_msgSend_tintColor(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_blackColor(MEMORY[0x24BDF6948], v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = sub_22D9A5830(v25, v29, v20);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    v63 = v10;
    v64 = 2048;
    v65 = v61;
    v66 = 2048;
    v67 = v20;
    v68 = 2048;
    v69 = v21;
    v70 = 2048;
    v71 = v30;
    _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton contrastRatio tintColor-details , cumulativeOpacity: %f tintColorAlpha: %f tintColorEffectiveOpacity: %f fgLuminanceAgainstWhite: %f fgLuminanceAgainstBlack: %f", buf, 0x34u);
  }
  objc_msgSend_backgroundColor(self, v31, v32, v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getRed_green_blue_alpha_(v34, v35, v36, v37, 0, 0, 0, &v60);

  v38.n128_f64[0] = v60 * v10;
  v39 = v60 * v10;
  objc_msgSend_backgroundColor(self, v40, v38, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_whiteColor(MEMORY[0x24BDF6948], v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v39;
  v48 = sub_22D9A5830(v42, v46, v39);

  objc_msgSend_backgroundColor(self, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_blackColor(MEMORY[0x24BDF6948], v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = sub_22D9A5830(v52, v56, v47);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    v63 = v10;
    v64 = 2048;
    v65 = v60;
    v66 = 2048;
    v67 = v47;
    v68 = 2048;
    v69 = v48;
    v70 = 2048;
    v71 = v57;
    _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton contrastRatio backgroundColor-details , cumulativeOpacity: %f bgColorAlpha: %f bgColorEffectiveOpacity: %f bgLuminanceAgainstWhite: %f bgLuminanceAgainstBlack: %f", buf, 0x34u);
  }
  if ((v30 + 0.05) / (v48 + 0.05) >= 1.5 || (v57 + 0.05) / (v21 + 0.05) >= 1.5)
  {
    LOBYTE(v58) = 1;
  }
  else
  {
    v58 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v58)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error: #locationButton failed due to insufficient contrastRatio between tintColor and backgroundColor", buf, 2u);
      LOBYTE(v58) = 0;
    }
  }
  return v58;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)secureNameForStyle:(id)a3
{
  __n128 v3;
  __n128 v4;
  uint64_t v5;
  const char *v6;
  __n128 v7;
  __n128 v8;

  v5 = objc_msgSend_label(self, a2, v3, v4, a3);
  return objc_msgSend_secureNameForLabel_(CLLocationButtonTag, v6, v7, v8, v5);
}

+ (unsigned)secureNameForLabel:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 4)
    return 0x20000;
  else
    return a3 + 0x1FFFF;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (int64_t)label
{
  return self->_label;
}

- (void)setLabel:(int64_t)a3
{
  self->_label = a3;
}

- (int64_t)icon
{
  return self->_icon;
}

- (void)setIcon:(int64_t)a3
{
  self->_icon = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UISSlotStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (BOOL)renderedSuccessfully
{
  return self->_renderedSuccessfully;
}

- (void)setRenderedSuccessfully:(BOOL)a3
{
  self->_renderedSuccessfully = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
