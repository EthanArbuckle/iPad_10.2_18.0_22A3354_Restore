@implementation CHSWidgetMetrics

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_8(uint64_t a1)
{
  return CHSRectFromEdgeInsets(objc_msgSend(*(id *)(a1 + 32), "contentMargins"));
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_7(uint64_t a1)
{
  return CHSRectFromEdgeInsets(objc_msgSend(*(id *)(a1 + 32), "layoutInsets"));
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_6(uint64_t a1)
{
  return CHSRectFromEdgeInsets(objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets"));
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dynamicTextSupport");
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fontStyle");
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scaleFactor");
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "size");
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (CHSEdgeInsets)safeAreaInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CHSEdgeInsets result;

  -[CHSWidgetMetrics margins](self, "margins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.trailing = v14;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (CHSWidgetMargins)margins
{
  return self->_margins;
}

- (CHSEdgeInsets)layoutInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CHSEdgeInsets result;

  -[CHSWidgetMetrics margins](self, "margins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.trailing = v14;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  id v16;
  double v17;
  double v18;
  id v19;
  id v20;
  double v21;
  double v22;
  id v23;
  id v24;
  int64_t v25;
  id v26;
  id v27;
  unint64_t v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t);
  void *v68;
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  -[CHSWidgetMetrics size](self, "size");
  v11 = v10;
  v13 = v12;
  v14 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __28__CHSWidgetMetrics_isEqual___block_invoke;
  v86[3] = &unk_1E2A5A580;
  v15 = v9;
  v87 = v15;
  v16 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v86, v11, v13);
  -[CHSWidgetMetrics cornerRadius](self, "cornerRadius");
  v18 = v17;
  v84[0] = v14;
  v84[1] = 3221225472;
  v84[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_2;
  v84[3] = &unk_1E2A5A4E0;
  v19 = v15;
  v85 = v19;
  v20 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v84, v18);
  -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
  v22 = v21;
  v82[0] = v14;
  v82[1] = 3221225472;
  v82[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_3;
  v82[3] = &unk_1E2A5A4E0;
  v23 = v19;
  v83 = v23;
  v24 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v82, v22);
  v25 = -[CHSWidgetMetrics fontStyle](self, "fontStyle");
  v80[0] = v14;
  v80[1] = 3221225472;
  v80[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_4;
  v80[3] = &unk_1E2A5A5D0;
  v26 = v23;
  v81 = v26;
  v27 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v25, v80);
  v28 = -[CHSWidgetMetrics dynamicTextSupport](self, "dynamicTextSupport");
  v78[0] = v14;
  v78[1] = 3221225472;
  v78[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_5;
  v78[3] = &unk_1E2A5A5D0;
  v29 = v26;
  v79 = v29;
  v30 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v28, v78);
  v31 = CHSRectFromEdgeInsets(-[CHSWidgetMetrics safeAreaInsets](self, "safeAreaInsets"));
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v76[0] = v14;
  v76[1] = 3221225472;
  v76[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_6;
  v76[3] = &unk_1E2A5AA98;
  v38 = v29;
  v77 = v38;
  v39 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v76, v31, v33, v35, v37);
  v40 = CHSRectFromEdgeInsets(-[CHSWidgetMetrics layoutInsets](self, "layoutInsets"));
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v74[0] = v14;
  v74[1] = 3221225472;
  v74[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_7;
  v74[3] = &unk_1E2A5AA98;
  v47 = v38;
  v75 = v47;
  v48 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v74, v40, v42, v44, v46);
  v49 = CHSRectFromEdgeInsets(-[CHSWidgetMetrics contentMargins](self, "contentMargins"));
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v72[0] = v14;
  v72[1] = 3221225472;
  v72[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_8;
  v72[3] = &unk_1E2A5AA98;
  v56 = v47;
  v73 = v56;
  v57 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v72, v49, v51, v53, v55);
  -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v14;
  v70[1] = 3221225472;
  v70[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_9;
  v70[3] = &unk_1E2A5B838;
  v59 = v56;
  v71 = v59;
  v60 = (id)objc_msgSend(v5, "appendObject:counterpart:", v58, v70);

  -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v14;
  v66 = 3221225472;
  v67 = __28__CHSWidgetMetrics_isEqual___block_invoke_10;
  v68 = &unk_1E2A5B860;
  v62 = v59;
  v69 = v62;
  v63 = (id)objc_msgSend(v5, "appendObject:counterpart:", v61, &v65);

  LOBYTE(v61) = objc_msgSend(v5, "isEqual", v65, v66, v67, v68);
  return (char)v61;
}

- (CHSWidgetMetrics)initWithXPCDictionary:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CHSWidgetMetrics *v12;
  void *v13;
  int64_t int64;
  int64_t v15;
  int64_t v16;
  CHSWidgetMargins *v17;
  uint64_t uint64;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
LABEL_5:
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(CFSTR("size"), "UTF8String");
  BSDeserializeCGSizeFromXPCDictionaryWithKey();
  v6 = v5;
  v8 = v7;
  v9 = MEMORY[0x194008A6C](v4, objc_msgSend(CFSTR("cornerRadius"), "UTF8String"));
  v10 = MEMORY[0x194008A6C](v4, objc_msgSend(CFSTR("scaleFactor"), "UTF8String"));
  xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("scaleFactors"), "UTF8String"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FB18000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Metrics no longer valid due to deprecated scale factor.", buf, 2u);
    }
    goto LABEL_5;
  }
  xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("textSizeAdjustment"), "UTF8String"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    int64 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("textSizeAdjustment"), "UTF8String"));
    v15 = CHSWidgetFontStyleFromTextSizeAdjustment(int64);
  }
  else
  {
    v15 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("fontStyle"), "UTF8String"));
  }
  v16 = v15;
  objc_msgSend(CFSTR("margins"), "UTF8String");
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v17 = (CHSWidgetMargins *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    v17 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:]([CHSWidgetMargins alloc], "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0);
  uint64 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("dynamicText"), "UTF8String"));
  objc_msgSend(CFSTR("widgetGroupMargins"), "UTF8String");
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("nestedContentMetrics"), "UTF8String");
  BSDeserializeDataFromXPCDictionaryWithKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3710];
  v22 = objc_opt_class();
  objc_msgSend(v21, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v22, objc_opt_class(), v20, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:", v16, v17, uint64, v19, v23, v6, v8, v9, v10);

  v12 = self;
LABEL_12:

  return v12;
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:", a6, a7, a8, 0, 0, a3.width, a3.height, a4, a5);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidgetMetrics size](self, "size");
  v4 = (id)objc_msgSend(v3, "appendCGSize:");
  -[CHSWidgetMetrics cornerRadius](self, "cornerRadius");
  v5 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
  v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  v7 = (id)objc_msgSend(v3, "appendInteger:", -[CHSWidgetMetrics fontStyle](self, "fontStyle"));
  v8 = (id)objc_msgSend(v3, "appendInteger:", -[CHSWidgetMetrics dynamicTextSupport](self, "dynamicTextSupport"));
  v9 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(-[CHSWidgetMetrics safeAreaInsets](self, "safeAreaInsets")));
  v10 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(-[CHSWidgetMetrics layoutInsets](self, "layoutInsets")));
  v11 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(-[CHSWidgetMetrics contentMargins](self, "contentMargins")));
  -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:", v12);

  -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:", v14);

  v16 = objc_msgSend(v3, "hash");
  return v16;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  xpc_object_t xdict;

  xdict = a3;
  if (xdict)
  {
    -[CHSWidgetMetrics size](self, "size");
    objc_msgSend(CFSTR("size"), "UTF8String");
    BSSerializeCGSizeToXPCDictionaryWithKey();
    -[CHSWidgetMetrics cornerRadius](self, "cornerRadius");
    MEMORY[0x194008B2C](xdict, objc_msgSend(CFSTR("cornerRadius"), "UTF8String"), v4);
    -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
    MEMORY[0x194008B2C](xdict, objc_msgSend(CFSTR("scaleFactor"), "UTF8String"), v5);
    xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("fontStyle"), "UTF8String"), -[CHSWidgetMetrics fontStyle](self, "fontStyle"));
    -[CHSWidgetMetrics margins](self, "margins");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("margins"), "UTF8String");
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

    xpc_dictionary_set_uint64(xdict, (const char *)objc_msgSend(CFSTR("dynamicText"), "UTF8String"), -[CHSWidgetMetrics dynamicTextSupport](self, "dynamicTextSupport"));
    -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("widgetGroupMargins"), "UTF8String");
      BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

    }
    -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB36F8];
      -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("nestedContentMetrics"), "UTF8String");
      BSSerializeDataToXPCDictionaryWithKey();

    }
  }

}

- (unint64_t)dynamicTextSupport
{
  return self->_dynamicTextSupport;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CHSEdgeInsets)contentMargins
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CHSEdgeInsets result;

  -[CHSWidgetMetrics margins](self, "margins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.trailing = v14;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedContentMetrics, 0);
  objc_storeStrong((id *)&self->_widgetGroupMargins, 0);
  objc_storeStrong((id *)&self->_margins, 0);
}

- (CHSWidgetMetrics)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetMetrics.m"), 50, CFSTR("Use initWithSize:cornerRadius:"));

  return -[CHSWidgetMetrics initWithSize:cornerRadius:](self, "initWithSize:cornerRadius:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:", 0, a3.width, a3.height, a4, 1.0);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 textSizeAdjustment:(int64_t)a5
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:textSizeAdjustment:](self, "initWithSize:cornerRadius:scaleFactor:textSizeAdjustment:", a5, a3.width, a3.height, a4, 1.0);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 textSizeAdjustment:(int64_t)a6
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:", CHSWidgetFontStyleFromTextSizeAdjustment(a6), a3.width, a3.height, a4, a5);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:", a6, a3.width, a3.height, a4, a5, 0.0, 0.0, 0.0, 0.0);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:supportsDynamicText:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:supportsDynamicText:", a6, 0, a3.width, a3.height, a4, a5, a7.top, a7.leading, a7.bottom, a7.trailing);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7 widgetGroupMargins:(id)a8 nestedContentMetrics:(id)a9
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double height;
  double width;
  id v20;
  id v21;
  CHSWidgetMargins *v22;
  CHSWidgetMetrics *v23;

  trailing = a7.trailing;
  bottom = a7.bottom;
  leading = a7.leading;
  top = a7.top;
  height = a3.height;
  width = a3.width;
  v20 = a8;
  v21 = a9;
  v22 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:]([CHSWidgetMargins alloc], "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", top, leading, bottom, trailing, 0, 0, 0, 0, 0, 0, 0, 0);
  v23 = -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:", a6, v22, 0, v20, v21, width, height, a4, a5);

  return v23;
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7 supportsDynamicText:(unint64_t)a8
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:", a6, a8, a3.width, a3.height, a4, a5, a7.top, a7.leading, a7.bottom, a7.trailing, 0, 0, 0, 0, 0, 0, 0,
           0);
}

- (uint64_t)initWithSize:(double)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(double)a6 safeAreaInsets:(double)a7 layoutInsets:(double)a8 contentMargins:(double)a9 supportsDynamicText:(uint64_t)a10
{
  CHSWidgetMargins *v31;
  uint64_t v32;

  v31 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:]([CHSWidgetMargins alloc], "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", a6, a7, a8, a9, a17, a18, a19, a20, a21, a22, a23, a24, a21, a22, a23, a24);
  v32 = objc_msgSend(a1, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:", a11, v31, a12, a2, a3, a4, a5);

  return v32;
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8 widgetGroupMargins:(id)a9 nestedContentMetrics:(id)a10
{
  CGFloat height;
  CGFloat width;
  id v19;
  id v20;
  id v21;
  CHSWidgetMetrics *v22;
  CHSWidgetMetrics *v23;
  uint64_t v24;
  CHSWidgetMargins *margins;
  uint64_t v26;
  CHSWidgetMargins *widgetGroupMargins;
  uint64_t v28;
  NSDictionary *nestedContentMetrics;
  objc_super v31;

  height = a3.height;
  width = a3.width;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v31.receiver = self;
  v31.super_class = (Class)CHSWidgetMetrics;
  v22 = -[CHSWidgetMetrics init](&v31, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_size.width = width;
    v22->_size.height = height;
    v22->_cornerRadius = a4;
    v22->_scaleFactor = a5;
    v22->_fontStyle = a6;
    v24 = objc_msgSend(v19, "copy");
    margins = v23->_margins;
    v23->_margins = (CHSWidgetMargins *)v24;

    v23->_dynamicTextSupport = a8;
    v26 = objc_msgSend(v20, "copy");
    widgetGroupMargins = v23->_widgetGroupMargins;
    v23->_widgetGroupMargins = (CHSWidgetMargins *)v26;

    v28 = objc_msgSend(v21, "copy");
    nestedContentMetrics = v23->_nestedContentMetrics;
    v23->_nestedContentMetrics = (NSDictionary *)v28;

  }
  return v23;
}

- (CHSEdgeInsets)widgetGroupSafeAreaInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CHSEdgeInsets result;

  -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.trailing = v14;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (CHSEdgeInsets)widgetGroupLayoutInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CHSEdgeInsets result;

  -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.trailing = v14;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (CHSEdgeInsets)widgetGroupContentMargins
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CHSEdgeInsets result;

  -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.trailing = v14;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widgetGroupMargins");
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nestedContentMetrics");
}

+ (id)sha256DataFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 md[32];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  if (CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidgetMetrics succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidgetMetrics size](self, "size");
  v4 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("size"));
  -[CHSWidgetMetrics cornerRadius](self, "cornerRadius");
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("cornerRadius"));
  -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
  v6 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("scaleFactor"));
  v7 = -[CHSWidgetMetrics dynamicTextSupport](self, "dynamicTextSupport");
  v8 = CFSTR("Unspecified");
  if (v7 == 2)
    v8 = CFSTR("No");
  if (v7 == 1)
    v9 = CFSTR("Yes");
  else
    v9 = v8;
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("supportsDynamicText"));
  CHSWidgetFontStyleDescription(-[CHSWidgetMetrics fontStyle](self, "fontStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("fontStyle"));

  -[CHSWidgetMetrics safeAreaInsets](self, "safeAreaInsets");
  CHSEdgeInsetsDescription(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v15, CFSTR("safeAreaInsets"));

  -[CHSWidgetMetrics layoutInsets](self, "layoutInsets");
  CHSEdgeInsetsDescription(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v20, CFSTR("layoutInsets"));

  -[CHSWidgetMetrics contentMargins](self, "contentMargins");
  CHSEdgeInsetsDescription(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v25, CFSTR("contentMargins"));

  -[CHSWidgetMetrics widgetGroupSafeAreaInsets](self, "widgetGroupSafeAreaInsets");
  CHSEdgeInsetsDescription(v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v30, CFSTR("widgetGroupSafeAreaInsets"));

  -[CHSWidgetMetrics widgetGroupLayoutInsets](self, "widgetGroupLayoutInsets");
  CHSEdgeInsetsDescription(v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v35, CFSTR("widgetgroupLayoutInsets"));

  -[CHSWidgetMetrics widgetGroupContentMargins](self, "widgetGroupContentMargins");
  CHSEdgeInsetsDescription(v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v40, CFSTR("widgetgroupContentMargins"));

  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v50;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v50 != v44)
          objc_enumerationMutation(v42);
        CHSWidgetFamilyDescription(objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v45), "integerValue"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v46);

        ++v45;
      }
      while (v43 != v45);
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v43);
  }

  objc_msgSend(v41, "componentsJoinedByString:", CFSTR(", "));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v47, CFSTR("nestedContentMetrics"), 1);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidgetMetrics descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CHSWidgetMetrics *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CHSWidgetMetrics_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

void __58__CHSWidgetMetrics_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v3 = (id)objc_msgSend(v2, "appendSize:withName:", CFSTR("size"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_rawEffectiveSize");
  v5 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("rawEffectiveSize"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cornerRadius");
  v7 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("cornerRadius"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scaleFactor");
  v9 = (id)objc_msgSend(v8, "appendFloat:withName:", CFSTR("scaleFactor"));
  v10 = *(void **)(a1 + 32);
  v11 = objc_msgSend(*(id *)(a1 + 40), "dynamicTextSupport");
  v12 = CFSTR("Unspecified");
  if (v11 == 2)
    v12 = CFSTR("No");
  if (v11 == 1)
    v13 = CFSTR("Yes");
  else
    v13 = v12;
  objc_msgSend(v10, "appendString:withName:", v13, CFSTR("supportsDynamicText"));
  v14 = *(void **)(a1 + 32);
  CHSWidgetFontStyleDescription(objc_msgSend(*(id *)(a1 + 40), "fontStyle"));
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:withName:");

  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
  CHSEdgeInsetsDescription(v16, v17, v18, v19);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:withName:");

  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "layoutInsets");
  CHSEdgeInsetsDescription(v21, v22, v23, v24);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendString:withName:");

  v25 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentMargins");
  CHSEdgeInsetsDescription(v26, v27, v28, v29);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendString:withName:");

  v30 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetGroupSafeAreaInsets");
  CHSEdgeInsetsDescription(v31, v32, v33, v34);
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendString:withName:");

  v35 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetGroupLayoutInsets");
  CHSEdgeInsetsDescription(v36, v37, v38, v39);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "appendString:withName:");

  v40 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetGroupContentMargins");
  CHSEdgeInsetsDescription(v41, v42, v43, v44);
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "appendString:withName:");

  v45 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "nestedContentMetrics");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CHSWidgetMetrics size](self, "size");
  objc_msgSend(v9, "encodeSize:forKey:", CFSTR("size"));
  -[CHSWidgetMetrics cornerRadius](self, "cornerRadius");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("cornerRadius"));
  -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("scaleFactor"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[CHSWidgetMetrics fontStyle](self, "fontStyle"), CFSTR("fontStyle"));
  -[CHSWidgetMetrics margins](self, "margins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("margins"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[CHSWidgetMetrics dynamicTextSupport](self, "dynamicTextSupport"), CFSTR("dynamicText"));
  -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("widgetGroupMargins"));

  }
  -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("nestedContentMetrics"));

  }
}

- (CHSWidgetMetrics)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  CHSWidgetMetrics *v16;
  uint64_t v17;
  uint64_t v18;
  CHSWidgetMargins *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeSizeForKey:", CFSTR("size"));
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
  v10 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scaleFactor"));
  v12 = v11;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("scaleFactors")))
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("No longer valid due to deprecated scale factor.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.chronoservices.metrics"), 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v15);

    v16 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("textSizeAdjustment")))
      v17 = CHSWidgetFontStyleFromTextSizeAdjustment(objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("textSizeAdjustment")));
    else
      v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fontStyle"));
    v18 = v17;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("margins"));
    v19 = (CHSWidgetMargins *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      v19 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:]([CHSWidgetMargins alloc], "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("dynamicText")))
      v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dynamicText"));
    else
      v20 = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetGroupMargins"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v22, objc_opt_class(), CFSTR("nestedContentMetrics"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:", v18, v19, v20, v21, v23, v6, v8, v10, v12);

    v16 = self;
  }

  return v16;
}

+ (void)_replaceFontStyleIn:(id)a3 withTextSizeAdjustment:(int64_t)a4
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_value(xdict, (const char *)objc_msgSend(CFSTR("fontStyle"), "UTF8String"), 0);
  xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("textSizeAdjustment"), "UTF8String"), a4);

}

+ (void)_removeSafeAreaInsetsIn:(id)a3
{
  void *v3;
  CHSWidgetMargins *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CHSWidgetMargins *v25;
  void *v26;
  CHSWidgetMargins *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CHSWidgetMargins *v48;
  id v49;

  v49 = a3;
  objc_msgSend(CFSTR("margins"), "UTF8String");
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [CHSWidgetMargins alloc];
    objc_msgSend(v3, "layoutInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v3, "contentMargins");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v3, "backgroundRemovedContentMargins");
    v25 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:](v4, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", 0.0, 0.0, 0.0, 0.0, v6, v8, v10, v12, v14, v16, v18, v20, v21, v22, v23, v24);
    objc_msgSend(CFSTR("margins"), "UTF8String");
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

  }
  objc_msgSend(CFSTR("widgetGroupMargins"), "UTF8String");
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = [CHSWidgetMargins alloc];
    objc_msgSend(v26, "layoutInsets");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v26, "contentMargins");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    objc_msgSend(v26, "backgroundRemovedContentMargins");
    v48 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:](v27, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", 0.0, 0.0, 0.0, 0.0, v29, v31, v33, v35, v37, v39, v41, v43, v44, v45, v46, v47);
    objc_msgSend(CFSTR("widgetGroupMargins"), "UTF8String");
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

  }
}

- (BOOL)_isUnitScale
{
  return BSFloatEqualToFloat();
}

- (BOOL)_hasZeroLayoutInsets
{
  void *v2;
  char v3;

  -[CHSWidgetMetrics margins](self, "margins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutInsets");
  v3 = CHSEdgeInsetsEqualToEdgeInsets();

  return v3;
}

- (CGSize)_rawEffectiveSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[CHSWidgetMetrics size](self, "size");
  v4 = v3;
  v6 = v5;
  -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
  v8 = v7;
  if (BSFloatEqualToFloat())
    v9 = 1.0;
  else
    v9 = v8;
  v10 = v6 * v9;
  v11 = v4 * v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGSize)_effectiveSizePixelAlignedForDisplayScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[CHSWidgetMetrics _rawEffectiveSize](self, "_rawEffectiveSize");
  v6 = v5;
  v8 = v7;
  -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    -[CHSWidgetMetrics _roundToNearestOrUp:withScale:](self, "_roundToNearestOrUp:withScale:", v6, a3);
    v6 = v9;
    -[CHSWidgetMetrics _roundToNearestOrUp:withScale:](self, "_roundToNearestOrUp:withScale:", v8, a3);
    v8 = v10;
  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)_rawSizePixelAlignedForDisplayScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CHSWidgetMetrics _roundToNearestOrUp:withScale:](self, "_roundToNearestOrUp:withScale:", self->_size.width, a3);
  v6 = v5;
  -[CHSWidgetMetrics _roundToNearestOrUp:withScale:](self, "_roundToNearestOrUp:withScale:", self->_size.height, a3);
  v8 = v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)_rawLayoutInsetAdjustedSizePixelAlignedForDisplayScale:(double)a3
{
  void *v5;
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
  double v18;
  CGSize result;

  -[CHSWidgetMetrics margins](self, "margins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CHSWidgetMetrics _roundToNearestOrUp:withScale:](self, "_roundToNearestOrUp:withScale:", fmax(self->_size.width - v9 - v13, 0.0), a3);
  v15 = v14;
  -[CHSWidgetMetrics _roundToNearestOrUp:withScale:](self, "_roundToNearestOrUp:withScale:", fmax(self->_size.height - v7 - v11, 0.0), a3);
  v17 = v16;
  v18 = v15;
  result.height = v17;
  result.width = v18;
  return result;
}

- (double)_effectiveCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[CHSWidgetMetrics cornerRadius](self, "cornerRadius");
  v4 = v3;
  -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
  v6 = v5;
  if (BSFloatEqualToFloat())
    v7 = 1.0;
  else
    v7 = v6;
  return v4 * v7;
}

- (double)_roundToNearestOrUp:(double)a3 withScale:(double)a4
{
  return 1.0 / a4 * floor((1.0 / a4 * 0.5 + a3) / (1.0 / a4));
}

- (id)filenameSafeSHAFrom:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *context;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  if (objc_msgSend(v16, "count"))
  {
    context = (void *)MEMORY[0x194008FB8]();
    v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v16;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      v7 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v17 = 0;
          objc_msgSend(MEMORY[0x1E0D87610], "encodeObject:error:", v9, &v17, context);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v17;
          if (v11)
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v11;
              _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "Failed to encode widget metrics %{public}@.", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v3, "appendData:", v10);
          }

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v5);
    }

    +[CHSWidgetMetrics sha256DataFromData:](CHSWidgetMetrics, "sha256DataFromData:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("#"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_stringKeyRepresentation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  -[CHSWidgetMetrics _rawEffectiveSize](self, "_rawEffectiveSize");
  v4 = v3;
  v6 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CHSWidgetMetrics nestedContentMetrics](self, "nestedContentMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CHSWidgetMetrics widgetGroupMargins](self, "widgetGroupMargins");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  -[CHSWidgetMetrics filenameSafeSHAFrom:](self, "filenameSafeSHAFrom:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[CHSWidgetMetrics _effectiveCornerRadius](self, "_effectiveCornerRadius");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%.2fw-%.2fh-%.2fr-%@"), v4, v6, v14, v12);
  }
  else
  {
    -[CHSWidgetMetrics _dawnStringKeyRepresentation](self, "_dawnStringKeyRepresentation");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_dawnStringKeyRepresentation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  -[CHSWidgetMetrics _rawEffectiveSize](self, "_rawEffectiveSize");
  v4 = v3;
  v6 = v5;
  -[CHSWidgetMetrics margins](self, "margins");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[CHSWidgetMetrics _effectiveCornerRadius](self, "_effectiveCornerRadius");
  return (id)objc_msgSend(v16, "stringWithFormat:", CFSTR("%.2fw--%.2fh--%.2fr--%ldf--%.2ft-%.2fl-%.2fb%.2ft"), v4, v6, v17, -[CHSWidgetMetrics fontStyle](self, "fontStyle"), v9, v11, v13, v15);
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;

  v4 = a3;
  -[CHSWidgetMetrics size](self, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "size");
  if (v6 < v9)
    goto LABEL_2;
  if (v6 > v9)
  {
LABEL_4:
    v11 = 1;
    goto LABEL_5;
  }
  if (v8 >= v10)
  {
    if (v8 > v10)
      goto LABEL_4;
    -[CHSWidgetMetrics cornerRadius](self, "cornerRadius");
    v14 = v13;
    objc_msgSend(v4, "cornerRadius");
    if (v14 >= v15)
    {
      if (v14 > v15)
        goto LABEL_4;
      -[CHSWidgetMetrics scaleFactor](self, "scaleFactor");
      v17 = v16;
      objc_msgSend(v4, "scaleFactor");
      if (v17 >= v18)
      {
        if (v17 > v18)
          goto LABEL_4;
        v19 = -[CHSWidgetMetrics fontStyle](self, "fontStyle");
        v20 = objc_msgSend(v4, "fontStyle");
        if (v19 >= v20)
        {
          if (v19 > v20)
            goto LABEL_4;
          v21 = -[CHSWidgetMetrics dynamicTextSupport](self, "dynamicTextSupport");
          v22 = objc_msgSend(v4, "dynamicTextSupport");
          if (v21 >= v22)
          {
            if (v21 <= v22)
            {
              -[CHSWidgetMetrics margins](self, "margins");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "margins");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v23, "compare:", v24);

              goto LABEL_5;
            }
            goto LABEL_4;
          }
        }
      }
    }
  }
LABEL_2:
  v11 = -1;
LABEL_5:

  return v11;
}

- (CGSize)scale
{
  double scaleFactor;
  double v3;
  CGSize result;

  scaleFactor = self->_scaleFactor;
  v3 = scaleFactor;
  result.height = v3;
  result.width = scaleFactor;
  return result;
}

- (int64_t)textSizeAdjustment
{
  return CHSWidgetTextSizeAdjustmentFromFontStyle(self->_fontStyle);
}

- (CHSWidgetMargins)widgetGroupMargins
{
  return self->_widgetGroupMargins;
}

- (NSDictionary)nestedContentMetrics
{
  return self->_nestedContentMetrics;
}

@end
