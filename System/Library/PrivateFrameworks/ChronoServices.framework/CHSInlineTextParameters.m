@implementation CHSInlineTextParameters

- (CHSInlineTextParameters)init
{
  CHSInlineTextParameters *v2;
  CHSInlineTextParameters *v3;
  CHSFontSpecification *fontSpecification;
  BSColor *foregroundColor;
  NSString *dateFormat;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHSInlineTextParameters;
  v2 = -[CHSInlineTextParameters init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    fontSpecification = v2->_fontSpecification;
    v2->_fontSpecification = 0;

    foregroundColor = v3->_foregroundColor;
    v3->_foregroundColor = 0;

    v3->_allowsNonSystemForegroundColors = 0;
    v3->_showsDateAlongsideText = 0;
    dateFormat = v3->_dateFormat;
    v3->_dateFormat = 0;

    v3->_horizontalAlignment = 0;
    *(_WORD *)&v3->_ignoresRTL = 0;
    *(_OWORD *)&v3->_graphicAlignment = xmmword_18FBD4C20;
    v3->_graphicMaxSize = (CGSize)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  return v3;
}

- (id)_initWithInlineTextProperties:(id)a3
{
  id v4;
  CHSInlineTextParameters *v5;
  uint64_t v6;
  CHSFontSpecification *fontSpecification;
  uint64_t v8;
  BSColor *foregroundColor;
  uint64_t v10;
  NSString *dateFormat;

  v4 = a3;
  v5 = -[CHSInlineTextParameters init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 3), "copy");
    fontSpecification = v5->_fontSpecification;
    v5->_fontSpecification = (CHSFontSpecification *)v6;

    v8 = objc_msgSend(*((id *)v4 + 4), "copy");
    foregroundColor = v5->_foregroundColor;
    v5->_foregroundColor = (BSColor *)v8;

    v5->_allowsNonSystemForegroundColors = *((_BYTE *)v4 + 40);
    v5->_showsDateAlongsideText = *((_BYTE *)v4 + 8);
    v10 = objc_msgSend(*((id *)v4 + 2), "copy");
    dateFormat = v5->_dateFormat;
    v5->_dateFormat = (NSString *)v10;

    v5->_horizontalAlignment = *((_QWORD *)v4 + 6);
    v5->_ignoresRTL = *((_BYTE *)v4 + 56);
    v5->_graphicAlignment = *((_QWORD *)v4 + 8);
    v5->_graphicMaxSize = (CGSize)*((_OWORD *)v4 + 5);
    v5->_symbolScale = *((_QWORD *)v4 + 9);
    v5->_forceUppercase = *((_BYTE *)v4 + 57);
  }

  return v5;
}

- (id)_effectiveDateFormat
{
  __CFString *v3;

  if (-[NSString length](self->_dateFormat, "length"))
    v3 = self->_dateFormat;
  else
    v3 = CFSTR("EEE d");
  return v3;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t graphicAlignment;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  CHSInlineTextParameters *v23;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __38__CHSInlineTextParameters_description__block_invoke;
  v21 = &unk_1E2A5A290;
  v4 = v3;
  v22 = v4;
  v23 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", &v18);
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_fontSpecification, CFSTR("font"), 1, v18, v19, v20, v21);
  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_foregroundColor, CFSTR("color"), 1);
  v8 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_allowsNonSystemForegroundColors, CFSTR("customColors"), 1);
  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_ignoresRTL, CFSTR("ignoresRTL"), 1);
  graphicAlignment = self->_graphicAlignment;
  v11 = CFSTR("center");
  if (graphicAlignment == 1)
    v11 = CFSTR("leading");
  if (graphicAlignment == 2)
    v12 = CFSTR("trailing");
  else
    v12 = v11;
  objc_msgSend(v4, "appendString:withName:", v12, CFSTR("graphicAlignment"));
  v13 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("graphicMaxSize"), self->_graphicMaxSize.width, self->_graphicMaxSize.height);
  v14 = (id)objc_msgSend(v4, "appendUInt64:withName:", self->_symbolScale, CFSTR("symbolScale"));
  v15 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_forceUppercase, CFSTR("forceUppercase"), 1);
  objc_msgSend(v4, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

uint64_t __38__CHSInlineTextParameters_description__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("showsDate"));
  result = objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("dateFormat"), 1);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  if (v4)
  {
    v5 = CFSTR("center");
    if (v4 == 1)
      v5 = CFSTR("leading");
    if (v4 == 2)
      v6 = CFSTR("trailing");
    else
      v6 = v5;
    return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v6, CFSTR("hAlign"));
  }
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
  _BOOL8 showsDateAlongsideText;
  uint64_t v11;
  id v12;
  id v13;
  NSString *dateFormat;
  id v15;
  id v16;
  CHSFontSpecification *fontSpecification;
  id v18;
  id v19;
  BSColor *foregroundColor;
  id v21;
  id v22;
  _BOOL8 allowsNonSystemForegroundColors;
  id v24;
  id v25;
  unint64_t horizontalAlignment;
  id v27;
  id v28;
  _BOOL8 ignoresRTL;
  id v30;
  id v31;
  unint64_t graphicAlignment;
  id v33;
  id v34;
  id v35;
  id v36;
  unint64_t symbolScale;
  id v38;
  id v39;
  _BOOL8 forceUppercase;
  id v41;
  id v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;

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

  showsDateAlongsideText = self->_showsDateAlongsideText;
  v11 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __35__CHSInlineTextParameters_isEqual___block_invoke;
  v67[3] = &unk_1E2A5A508;
  v12 = v9;
  v68 = v12;
  v13 = (id)objc_msgSend(v5, "appendBool:counterpart:", showsDateAlongsideText, v67);
  dateFormat = self->_dateFormat;
  v65[0] = v11;
  v65[1] = 3221225472;
  v65[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_2;
  v65[3] = &unk_1E2A5A5A8;
  v15 = v12;
  v66 = v15;
  v16 = (id)objc_msgSend(v5, "appendString:counterpart:", dateFormat, v65);
  fontSpecification = self->_fontSpecification;
  v63[0] = v11;
  v63[1] = 3221225472;
  v63[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_3;
  v63[3] = &unk_1E2A5A268;
  v18 = v15;
  v64 = v18;
  v19 = (id)objc_msgSend(v5, "appendObject:counterpart:", fontSpecification, v63);
  foregroundColor = self->_foregroundColor;
  v61[0] = v11;
  v61[1] = 3221225472;
  v61[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_4;
  v61[3] = &unk_1E2A5A268;
  v21 = v18;
  v62 = v21;
  v22 = (id)objc_msgSend(v5, "appendObject:counterpart:", foregroundColor, v61);
  allowsNonSystemForegroundColors = self->_allowsNonSystemForegroundColors;
  v59[0] = v11;
  v59[1] = 3221225472;
  v59[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_5;
  v59[3] = &unk_1E2A5A508;
  v24 = v21;
  v60 = v24;
  v25 = (id)objc_msgSend(v5, "appendBool:counterpart:", allowsNonSystemForegroundColors, v59);
  horizontalAlignment = self->_horizontalAlignment;
  v57[0] = v11;
  v57[1] = 3221225472;
  v57[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_6;
  v57[3] = &unk_1E2A5A558;
  v27 = v24;
  v58 = v27;
  v28 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", horizontalAlignment, v57);
  ignoresRTL = self->_ignoresRTL;
  v55[0] = v11;
  v55[1] = 3221225472;
  v55[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_7;
  v55[3] = &unk_1E2A5A508;
  v30 = v27;
  v56 = v30;
  v31 = (id)objc_msgSend(v5, "appendBool:counterpart:", ignoresRTL, v55);
  graphicAlignment = self->_graphicAlignment;
  v53[0] = v11;
  v53[1] = 3221225472;
  v53[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_8;
  v53[3] = &unk_1E2A5A558;
  v33 = v30;
  v54 = v33;
  v34 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", graphicAlignment, v53);
  v51[0] = v11;
  v51[1] = 3221225472;
  v51[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_9;
  v51[3] = &unk_1E2A5A580;
  v35 = v33;
  v52 = v35;
  v36 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v51, self->_graphicMaxSize.width, self->_graphicMaxSize.height);
  symbolScale = self->_symbolScale;
  v49[0] = v11;
  v49[1] = 3221225472;
  v49[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_10;
  v49[3] = &unk_1E2A5A558;
  v38 = v35;
  v50 = v38;
  v39 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", symbolScale, v49);
  forceUppercase = self->_forceUppercase;
  v44 = v11;
  v45 = 3221225472;
  v46 = __35__CHSInlineTextParameters_isEqual___block_invoke_11;
  v47 = &unk_1E2A5A508;
  v41 = v38;
  v48 = v41;
  v42 = (id)objc_msgSend(v5, "appendBool:counterpart:", forceUppercase, &v44);
  LOBYTE(v38) = objc_msgSend(v5, "isEqual", v44, v45, v46, v47);

  return (char)v38;
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

id __35__CHSInlineTextParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __35__CHSInlineTextParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __35__CHSInlineTextParameters_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_6(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_7(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_8(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
}

double __35__CHSInlineTextParameters_isEqual___block_invoke_9(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 80);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_10(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_11(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 57);
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
  id v12;
  id v13;
  id v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_showsDateAlongsideText);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_dateFormat);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_foregroundColor);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_allowsNonSystemForegroundColors);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_fontSpecification);
  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_horizontalAlignment);
  v10 = (id)objc_msgSend(v3, "appendBool:", self->_ignoresRTL);
  v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_graphicAlignment);
  v12 = (id)objc_msgSend(v3, "appendCGSize:", self->_graphicMaxSize.width, self->_graphicMaxSize.height);
  v13 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_symbolScale);
  v14 = (id)objc_msgSend(v3, "appendBool:", self->_forceUppercase);
  v15 = objc_msgSend(v3, "hash");

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSInlineTextParameters _initWithInlineTextProperties:]([CHSInlineTextParameters alloc], "_initWithInlineTextProperties:", self);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", self->_fontSpecification, CFSTR("font"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_foregroundColor, CFSTR("fc"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_allowsNonSystemForegroundColors, CFSTR("nsfc"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_showsDateAlongsideText, CFSTR("sdat"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_dateFormat, CFSTR("df"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_horizontalAlignment);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("ha"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_ignoresRTL, CFSTR("irtl"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_graphicAlignment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("gp"));

  objc_msgSend(v7, "encodeCGSize:forKey:", CFSTR("gms"), self->_graphicMaxSize.width, self->_graphicMaxSize.height);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_symbolScale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("ss"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_forceUppercase, CFSTR("fu"));
}

- (CHSInlineTextParameters)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSInlineTextParameters *v5;
  uint64_t v6;
  CHSFontSpecification *fontSpecification;
  uint64_t v8;
  BSColor *foregroundColor;
  uint64_t v10;
  NSString *dateFormat;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;

  v4 = a3;
  v5 = -[CHSInlineTextParameters init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("font"));
    v6 = objc_claimAutoreleasedReturnValue();
    fontSpecification = v5->_fontSpecification;
    v5->_fontSpecification = (CHSFontSpecification *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fc"));
    v8 = objc_claimAutoreleasedReturnValue();
    foregroundColor = v5->_foregroundColor;
    v5->_foregroundColor = (BSColor *)v8;

    v5->_allowsNonSystemForegroundColors = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nsfc"));
    v5->_showsDateAlongsideText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sdat"));
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("df"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateFormat = v5->_dateFormat;
    v5->_dateFormat = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ha"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_horizontalAlignment = objc_msgSend(v12, "unsignedIntegerValue");

    v5->_ignoresRTL = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("irtl"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gp"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_graphicAlignment = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("gms"));
    v5->_graphicMaxSize.width = v14;
    v5->_graphicMaxSize.height = v15;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ss"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_symbolScale = objc_msgSend(v16, "unsignedIntegerValue");

    v5->_forceUppercase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fu"));
  }

  return v5;
}

- (CHSFontSpecification)fontSpecification
{
  return self->_fontSpecification;
}

- (void)setFontSpecification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BSColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)allowsNonSystemForegroundColors
{
  return self->_allowsNonSystemForegroundColors;
}

- (void)setAllowsNonSystemForegroundColors:(BOOL)a3
{
  self->_allowsNonSystemForegroundColors = a3;
}

- (BOOL)showsDateAlongsideText
{
  return self->_showsDateAlongsideText;
}

- (void)setShowsDateAlongsideText:(BOOL)a3
{
  self->_showsDateAlongsideText = a3;
}

- (NSString)dateFormat
{
  return self->_dateFormat;
}

- (void)setDateFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (void)setHorizontalAlignment:(unint64_t)a3
{
  self->_horizontalAlignment = a3;
}

- (BOOL)ignoresRTL
{
  return self->_ignoresRTL;
}

- (void)setIgnoresRTL:(BOOL)a3
{
  self->_ignoresRTL = a3;
}

- (unint64_t)graphicAlignment
{
  return self->_graphicAlignment;
}

- (void)setGraphicAlignment:(unint64_t)a3
{
  self->_graphicAlignment = a3;
}

- (CGSize)graphicMaxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_graphicMaxSize.width;
  height = self->_graphicMaxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setGraphicMaxSize:(CGSize)a3
{
  self->_graphicMaxSize = a3;
}

- (unint64_t)symbolScale
{
  return self->_symbolScale;
}

- (void)setSymbolScale:(unint64_t)a3
{
  self->_symbolScale = a3;
}

- (BOOL)forceUppercase
{
  return self->_forceUppercase;
}

- (void)setForceUppercase:(BOOL)a3
{
  self->_forceUppercase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_fontSpecification, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
}

@end
