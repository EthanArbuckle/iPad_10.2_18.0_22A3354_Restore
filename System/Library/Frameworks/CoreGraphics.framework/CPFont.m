@implementation CPFont

- (id)matchingFontName
{
  void *v3;
  double v4;
  CGPDFFont *cgPDFFont;
  unint64_t FontDescriptor;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  CGPDFDictionary *v11;
  _BOOL4 Number;
  int v13;
  NSString *fontName;
  const __CFString *v15;
  const __CFString *v16;
  CGPDFReal value;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 21);
  cgPDFFont = self->cgPDFFont;
  if (!cgPDFFont || (FontDescriptor = CGPDFFontGetFontDescriptor((uint64_t)cgPDFFont)) == 0)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_8;
  }
  v7 = *(_DWORD *)(FontDescriptor + 40);
  v8 = (v7 >> 1) & 1;
  v9 = v7 & 1;
  v10 = (v7 >> 6) & 1;
  v11 = *(CGPDFDictionary **)(FontDescriptor + 32);
  if (!v11)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  value = 0.0;
  Number = CGPDFDictionaryGetNumber(v11, "FontWeight", &value);
  v4 = value;
  v13 = value >= 600.0 && Number;
LABEL_9:
  fontName = self->fontName;
  if (!fontName)
    goto LABEL_18;
  if ((v10 & 1) != 0
    || -[NSString hasSuffix:](fontName, "hasSuffix:", CFSTR("Italic"), v4)
    || -[NSString hasSuffix:](self->fontName, "hasSuffix:", CFSTR("Oblique")))
  {
    v10 = 1;
    if ((v13 & 1) != 0)
      goto LABEL_27;
  }
  else
  {
    v10 = 0;
    if ((v13 & 1) != 0)
      goto LABEL_27;
  }
  if (!-[NSString hasSuffix:](self->fontName, "hasSuffix:", CFSTR("Bold"), v4)
    && !-[NSString hasSuffix:](self->fontName, "hasSuffix:", CFSTR("BoldItalic"))
    && !-[NSString hasSuffix:](self->fontName, "hasSuffix:", CFSTR("BoldOblique")))
  {
    v13 = 0;
LABEL_18:
    if (v8)
      goto LABEL_19;
LABEL_28:
    if (v9)
    {
      objc_msgSend(v3, "setString:", CFSTR("Monaco"), v4);
      return v3;
    }
    v15 = CFSTR("Helvetica");
    goto LABEL_31;
  }
LABEL_27:
  v13 = 1;
  if (!v8)
    goto LABEL_28;
LABEL_19:
  if (v9)
  {
    v15 = CFSTR("Courier");
LABEL_31:
    objc_msgSend(v3, "setString:", v15, v4);
    if (v13)
    {
      objc_msgSend(v3, "appendString:", CFSTR("-Bold"));
      if (v10)
      {
        v16 = CFSTR("Oblique");
        goto LABEL_37;
      }
    }
    else if (v10)
    {
      v16 = CFSTR("-Oblique");
      goto LABEL_37;
    }
    return v3;
  }
  objc_msgSend(v3, "setString:", CFSTR("Times"), v4);
  if (!v13)
  {
    if (v10)
      v16 = CFSTR("-Italic");
    else
      v16 = CFSTR("-Roman");
    goto LABEL_37;
  }
  objc_msgSend(v3, "appendString:", CFSTR("-Bold"));
  if (v10)
  {
    v16 = CFSTR("Italic");
LABEL_37:
    objc_msgSend(v3, "appendString:", v16);
  }
  return v3;
}

- (void)getFontName
{
  CGPDFFont *cgPDFFont;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  NSString *fontName;
  NSString *v10;
  NSString *v11;

  cgPDFFont = self->cgPDFFont;
  if (cgPDFFont)
  {
    v4 = *((_QWORD *)cgPDFFont + 4);
    if (v4)
    {
      if (strlen(*((const char **)cgPDFFont + 4)) >= 8 && *(_BYTE *)(v4 + 6) == 43)
      {
        v5 = 0;
        v6 = MEMORY[0x1E0C80978];
        v7 = 7;
        do
        {
          v8 = *(char *)(v4 + v5);
          if ((v8 & 0x80000000) != 0)
          {
            if (!__maskrune(v8, 0x8000uLL))
              goto LABEL_12;
          }
          else if ((*(_DWORD *)(v6 + 4 * v8 + 60) & 0x8000) == 0)
          {
            goto LABEL_12;
          }
          ++v5;
        }
        while (v5 != 6);
      }
      else
      {
LABEL_12:
        v7 = 0;
      }
      self->fontName = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v4 + v7, 1);
      self->exactMatch = 1;
    }
  }
  fontName = self->fontName;
  if (fontName && -[NSString length](fontName, "length"))
  {
    v10 = self->fontName;
  }
  else
  {
    v10 = -[CPFont matchingFontName](self, "matchingFontName");
    self->fontName = v10;
    self->exactMatch = 0;
  }
  v11 = v10;
}

- (void)loadExternalFontInfoFor:(id)a3
{
  NSString *fontName;
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const void *v41;
  CPFontKerning *v42;
  _Unwind_Exception *v43;
  __int16 v44;
  __int16 v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void *v49;

  fontName = self->fontName;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v5 = getCTFontCreateWithNameSymbolLoc_ptr;
  v49 = getCTFontCreateWithNameSymbolLoc_ptr;
  if (!getCTFontCreateWithNameSymbolLoc_ptr)
  {
    v6 = (void *)CoreTextLibrary();
    v5 = dlsym(v6, "CTFontCreateWithName");
    v47[3] = (uint64_t)v5;
    getCTFontCreateWithNameSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v46, 8);
  if (!v5)
    goto LABEL_51;
  v7 = ((uint64_t (*)(NSString *, _QWORD, double))v5)(fontName, 0, 1.0);
  if (!v7)
  {
    *(_OWORD *)&self->descriptor.stemH = unk_185001360;
    *(_OWORD *)&self->descriptor.maxWidth = xmmword_185001370;
    *(_OWORD *)&self->descriptor.spaceWidth = unk_185001380;
    *(_OWORD *)&self->descriptor.fontBBox.size.height = unk_185001320;
    *(_OWORD *)&self->descriptor.ascent = xmmword_185001330;
    *(_OWORD *)&self->descriptor.leading = unk_185001340;
    *(_OWORD *)&self->descriptor.xHeight = xmmword_185001350;
    *(_OWORD *)&self->descriptor.fontStretch = kCPFontDescriptorDefault;
    *(_OWORD *)&self->descriptor.flags = unk_185001300;
    self->descriptor.underlineThickness = 0.0493164062;
    *(_OWORD *)&self->descriptor.fontBBox.origin.y = xmmword_185001310;
    self->exactMatch = 0;
    return;
  }
  v8 = (const void *)v7;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v9 = getCTFontGetWeightSymbolLoc_ptr;
  v49 = getCTFontGetWeightSymbolLoc_ptr;
  if (!getCTFontGetWeightSymbolLoc_ptr)
  {
    v10 = (void *)CoreTextLibrary();
    v9 = dlsym(v10, "CTFontGetWeight");
    v47[3] = (uint64_t)v9;
    getCTFontGetWeightSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v46, 8);
  if (!v9)
    goto LABEL_51;
  self->descriptor.fontWeight = ((double (*)(const void *))v9)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v11 = getCTFontGetBoundingBoxSymbolLoc_ptr;
  v49 = getCTFontGetBoundingBoxSymbolLoc_ptr;
  if (!getCTFontGetBoundingBoxSymbolLoc_ptr)
  {
    v12 = (void *)CoreTextLibrary();
    v11 = dlsym(v12, "CTFontGetBoundingBox");
    v47[3] = (uint64_t)v11;
    getCTFontGetBoundingBoxSymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v46, 8);
  if (!v11)
    goto LABEL_51;
  self->descriptor.fontBBox.origin.x = ((double (*)(const void *))v11)(v8);
  self->descriptor.fontBBox.origin.y = v13;
  self->descriptor.fontBBox.size.width = v14;
  self->descriptor.fontBBox.size.height = v15;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v16 = getCTFontGetSlantAngleSymbolLoc_ptr;
  v49 = getCTFontGetSlantAngleSymbolLoc_ptr;
  if (!getCTFontGetSlantAngleSymbolLoc_ptr)
  {
    v17 = (void *)CoreTextLibrary();
    v16 = dlsym(v17, "CTFontGetSlantAngle");
    v47[3] = (uint64_t)v16;
    getCTFontGetSlantAngleSymbolLoc_ptr = v16;
  }
  _Block_object_dispose(&v46, 8);
  if (!v16)
    goto LABEL_51;
  self->descriptor.italicAngle = ((double (*)(const void *))v16)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v18 = getCTFontGetAscentSymbolLoc_ptr;
  v49 = getCTFontGetAscentSymbolLoc_ptr;
  if (!getCTFontGetAscentSymbolLoc_ptr)
  {
    v19 = (void *)CoreTextLibrary();
    v18 = dlsym(v19, "CTFontGetAscent");
    v47[3] = (uint64_t)v18;
    getCTFontGetAscentSymbolLoc_ptr = v18;
  }
  _Block_object_dispose(&v46, 8);
  if (!v18)
    goto LABEL_51;
  self->descriptor.ascent = ((double (*)(const void *))v18)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v20 = getCTFontGetDescentSymbolLoc_ptr;
  v49 = getCTFontGetDescentSymbolLoc_ptr;
  if (!getCTFontGetDescentSymbolLoc_ptr)
  {
    v21 = (void *)CoreTextLibrary();
    v20 = dlsym(v21, "CTFontGetDescent");
    v47[3] = (uint64_t)v20;
    getCTFontGetDescentSymbolLoc_ptr = v20;
  }
  _Block_object_dispose(&v46, 8);
  if (!v20)
    goto LABEL_51;
  self->descriptor.descent = ((double (*)(const void *))v20)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v22 = getCTFontGetLeadingSymbolLoc_ptr;
  v49 = getCTFontGetLeadingSymbolLoc_ptr;
  if (!getCTFontGetLeadingSymbolLoc_ptr)
  {
    v23 = (void *)CoreTextLibrary();
    v22 = dlsym(v23, "CTFontGetLeading");
    v47[3] = (uint64_t)v22;
    getCTFontGetLeadingSymbolLoc_ptr = v22;
  }
  _Block_object_dispose(&v46, 8);
  if (!v22)
    goto LABEL_51;
  self->descriptor.leading = ((double (*)(const void *))v22)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v24 = getCTFontGetCapHeightSymbolLoc_ptr;
  v49 = getCTFontGetCapHeightSymbolLoc_ptr;
  if (!getCTFontGetCapHeightSymbolLoc_ptr)
  {
    v25 = (void *)CoreTextLibrary();
    v24 = dlsym(v25, "CTFontGetCapHeight");
    v47[3] = (uint64_t)v24;
    getCTFontGetCapHeightSymbolLoc_ptr = v24;
  }
  _Block_object_dispose(&v46, 8);
  if (!v24)
    goto LABEL_51;
  self->descriptor.capHeight = ((double (*)(const void *))v24)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v26 = getCTFontGetXHeightSymbolLoc_ptr;
  v49 = getCTFontGetXHeightSymbolLoc_ptr;
  if (!getCTFontGetXHeightSymbolLoc_ptr)
  {
    v27 = (void *)CoreTextLibrary();
    v26 = dlsym(v27, "CTFontGetXHeight");
    v47[3] = (uint64_t)v26;
    getCTFontGetXHeightSymbolLoc_ptr = v26;
  }
  _Block_object_dispose(&v46, 8);
  if (!v26)
    goto LABEL_51;
  self->descriptor.xHeight = ((double (*)(const void *))v26)(v8);
  v45 = 0;
  v44 = 32;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v28 = getCTFontGetGlyphsForCharactersSymbolLoc_ptr;
  v49 = getCTFontGetGlyphsForCharactersSymbolLoc_ptr;
  if (!getCTFontGetGlyphsForCharactersSymbolLoc_ptr)
  {
    v29 = (void *)CoreTextLibrary();
    v28 = dlsym(v29, "CTFontGetGlyphsForCharacters");
    v47[3] = (uint64_t)v28;
    getCTFontGetGlyphsForCharactersSymbolLoc_ptr = v28;
  }
  _Block_object_dispose(&v46, 8);
  if (!v28)
    goto LABEL_51;
  ((void (*)(const void *, __int16 *, __int16 *, uint64_t))v28)(v8, &v44, &v45, 1);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v30 = getCTFontGetAdvancesForGlyphsSymbolLoc_ptr;
  v49 = getCTFontGetAdvancesForGlyphsSymbolLoc_ptr;
  if (!getCTFontGetAdvancesForGlyphsSymbolLoc_ptr)
  {
    v31 = (void *)CoreTextLibrary();
    v30 = dlsym(v31, "CTFontGetAdvancesForGlyphs");
    v47[3] = (uint64_t)v30;
    getCTFontGetAdvancesForGlyphsSymbolLoc_ptr = v30;
  }
  _Block_object_dispose(&v46, 8);
  if (!v30)
    goto LABEL_51;
  self->descriptor.spaceWidth = ((double (*)(const void *, _QWORD, __int16 *, _QWORD, uint64_t))v30)(v8, 0, &v45, 0, 1);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v32 = getCTFontGetUnderlinePositionSymbolLoc_ptr;
  v49 = getCTFontGetUnderlinePositionSymbolLoc_ptr;
  if (!getCTFontGetUnderlinePositionSymbolLoc_ptr)
  {
    v33 = (void *)CoreTextLibrary();
    v32 = dlsym(v33, "CTFontGetUnderlinePosition");
    v47[3] = (uint64_t)v32;
    getCTFontGetUnderlinePositionSymbolLoc_ptr = v32;
  }
  _Block_object_dispose(&v46, 8);
  if (!v32)
    goto LABEL_51;
  self->descriptor.underlinePosition = ((double (*)(const void *))v32)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v34 = getCTFontGetUnderlineThicknessSymbolLoc_ptr;
  v49 = getCTFontGetUnderlineThicknessSymbolLoc_ptr;
  if (!getCTFontGetUnderlineThicknessSymbolLoc_ptr)
  {
    v35 = (void *)CoreTextLibrary();
    v34 = dlsym(v35, "CTFontGetUnderlineThickness");
    v47[3] = (uint64_t)v34;
    getCTFontGetUnderlineThicknessSymbolLoc_ptr = v34;
  }
  _Block_object_dispose(&v46, 8);
  if (!v34)
    goto LABEL_51;
  self->descriptor.underlineThickness = ((double (*)(const void *))v34)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v36 = getCTFontGetUnitsPerEmSymbolLoc_ptr;
  v49 = getCTFontGetUnitsPerEmSymbolLoc_ptr;
  if (!getCTFontGetUnitsPerEmSymbolLoc_ptr)
  {
    v37 = (void *)CoreTextLibrary();
    v36 = dlsym(v37, "CTFontGetUnitsPerEm");
    v47[3] = (uint64_t)v36;
    getCTFontGetUnitsPerEmSymbolLoc_ptr = v36;
  }
  _Block_object_dispose(&v46, 8);
  if (!v36)
    goto LABEL_51;
  self->kernUnitsPerEm = (double)((unsigned int (*)(const void *))v36)(v8);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v38 = getCTFontCopyTableSymbolLoc_ptr;
  v49 = getCTFontCopyTableSymbolLoc_ptr;
  if (!getCTFontCopyTableSymbolLoc_ptr)
  {
    v39 = (void *)CoreTextLibrary();
    v38 = dlsym(v39, "CTFontCopyTable");
    v47[3] = (uint64_t)v38;
    getCTFontCopyTableSymbolLoc_ptr = v38;
  }
  _Block_object_dispose(&v46, 8);
  if (!v38)
  {
LABEL_51:
    dlerror();
    v43 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v46, 8);
    _Unwind_Resume(v43);
  }
  v40 = ((uint64_t (*)(const void *, uint64_t, _QWORD))v38)(v8, 1801810542, 0);
  if (v40)
  {
    v41 = (const void *)v40;
    v42 = -[CPFontKerning initWithKernData:]([CPFontKerning alloc], "initWithKernData:", v40);
    self->kernDictionary = -[CPFontKerning createKernTable](v42, "createKernTable");
    -[CPFontKerning dispose](v42, "dispose");

    CFRelease(v41);
  }
  CFRelease(v8);
  self->exactMatch = 1;
}

- (void)loadEmbeddedFontInfo
{
  CGPDFFont *cgPDFFont;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t FontDescriptor;
  unsigned int v10;
  CGPDFDictionary *v11;
  BOOL v12;
  float64x2_t v13;
  CGPoint v14;
  CGSize v15;
  double v16;
  double FontBBox;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double width;
  double height;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGPDFFont *v28;
  unint64_t CMap;
  unsigned int (*v30)(_QWORD);
  BOOL v31;
  CGPDFFont *v32;
  CGPDFDictionary *v33;
  double v34;
  double v35;
  CGPDFReal value;
  CGRect v37;

  self->isHorizontal = 1;
  self->defaultWidth = 1.0;
  cgPDFFont = self->cgPDFFont;
  if (cgPDFFont)
  {
    v4 = *((double *)cgPDFFont + 7);
    v5 = *((double *)cgPDFFont + 10);
    v6 = fabs(v4);
    v7 = fabs(v5);
    v12 = v4 == 0.0;
    v8 = 0.001;
    if (v12)
      v6 = 0.001;
    if (v5 != 0.0)
      v8 = v7;
    v34 = v6;
    v35 = v8;
    FontDescriptor = CGPDFFontGetFontDescriptor((uint64_t)cgPDFFont);
    if (!FontDescriptor)
      goto LABEL_56;
    v10 = *(_DWORD *)(FontDescriptor + 40);
    if (v10)
      self->descriptor.flags = v10;
    v11 = *(CGPDFDictionary **)(FontDescriptor + 32);
    if (v11)
    {
      v37 = CGRectNull;
      if (CGPDFDictionaryGetRect(v11, "FontBBox", &v37.origin.x))
      {
        v12 = v37.origin.x == INFINITY || v37.origin.y == INFINITY;
        if (!v12 && v37.size.width != 0.0 && v37.size.height != 0.0)
        {
          v13.f64[0] = v34;
          v13.f64[1] = v35;
          v14 = (CGPoint)vmulq_f64(v13, (float64x2_t)v37.origin);
          v15 = (CGSize)vmulq_f64(v13, (float64x2_t)v37.size);
          self->descriptor.fontBBox.origin = v14;
          self->descriptor.fontBBox.size = v15;
        }
      }
      value = 0.0;
      if (CGPDFDictionaryGetNumber(v11, "FontWeight", &value) && value != 0.0)
        self->descriptor.fontWeight = (value + -400.0) / dbl_185005080[value < 400.0];
      if (CGPDFDictionaryGetNumber(v11, "ItalicAngle", &value) && value != 0.0)
        self->descriptor.italicAngle = value;
      if (CGPDFDictionaryGetNumber(v11, "Ascent", &value) && value != 0.0)
        self->descriptor.ascent = v35 * value;
      if (CGPDFDictionaryGetNumber(v11, "Descent", &value))
      {
        v16 = value;
        if (value != 0.0)
        {
          if (value > 0.0)
          {
            v16 = -value;
            value = -value;
          }
          self->descriptor.descent = v35 * v16;
        }
      }
      if (CGPDFDictionaryGetNumber(v11, "Leading", &value) && value != 0.0)
        self->descriptor.leading = v35 * value;
      if (CGPDFDictionaryGetNumber(v11, "CapHeight", &value) && value != 0.0)
        self->descriptor.capHeight = v35 * value;
      if (CGPDFDictionaryGetNumber(v11, "XHeight", &value) && value != 0.0)
        self->descriptor.xHeight = v35 * value;
      if (CGPDFDictionaryGetNumber(v11, "StemV", &value) && value != 0.0)
        self->descriptor.stemV = v35 * value;
      if (CGPDFDictionaryGetNumber(v11, "StemH", &value) && value != 0.0)
        self->descriptor.stemH = v34 * value;
      if (CGPDFDictionaryGetNumber(v11, "AvgWidth", &value) && value != 0.0)
        self->descriptor.avgWidth = v34 * value;
      if (CGPDFDictionaryGetNumber(v11, "MaxWidth", &value) && value != 0.0)
        self->descriptor.maxWidth = v34 * value;
      if (CGPDFDictionaryGetNumber(v11, "MissingWidth", &value) && value != 0.0)
        self->descriptor.missingWidth = v34 * value;
    }
    else
    {
LABEL_56:
      FontBBox = CGPDFFontGetFontBBox((uint64_t)self->cgPDFFont);
      v21 = FontBBox == INFINITY || v18 == INFINITY;
      if (!v21 && v19 != 0.0 && v20 != 0.0)
      {
        width = self->descriptor.fontBBox.size.width;
        height = self->descriptor.fontBBox.size.height;
        if (width == 0.0)
          width = 2.39648438;
        if (height == 0.0)
          height = 1.60253906;
        v24 = v34 * v19;
        v25 = v24 / width;
        v26 = v35 * v20;
        v27 = v26 / height;
        self->descriptor.fontBBox.origin.x = v34 * FontBBox;
        self->descriptor.fontBBox.origin.y = v35 * v18;
        self->descriptor.fontBBox.size.width = v24;
        self->descriptor.fontBBox.size.height = v26;
        *(float64x2_t *)&self->descriptor.ascent = vmulq_n_f64(*(float64x2_t *)&self->descriptor.ascent, v27);
        *(float64x2_t *)&self->descriptor.leading = vmulq_n_f64(*(float64x2_t *)&self->descriptor.leading, v27);
        *(float64x2_t *)&self->descriptor.xHeight = vmulq_n_f64(*(float64x2_t *)&self->descriptor.xHeight, v27);
        *(float64x2_t *)&self->descriptor.stemH = vmulq_n_f64(*(float64x2_t *)&self->descriptor.stemH, v25);
        *(float64x2_t *)&self->descriptor.maxWidth = vmulq_n_f64(*(float64x2_t *)&self->descriptor.maxWidth, v25);
      }
    }
    v28 = self->cgPDFFont;
    if (v28 && *((_DWORD *)v28 + 50) == 1)
    {
      CMap = CGPDFFontGetCMap((unint64_t)v28);
      v31 = !CMap
         || !cmap_vtable
         || (v30 = *(unsigned int (**)(_QWORD))(cmap_vtable + 40)) == 0
         || v30(*(_QWORD *)(CMap + 16)) == 0;
      self->isHorizontal = v31;
      v32 = self->cgPDFFont;
      if (v32)
      {
        if (*((_QWORD *)v32 + 6))
        {
          v33 = (CGPDFDictionary *)*((_QWORD *)v32 + 2);
          v37.origin.x = 0.0;
          if (CGPDFDictionaryGetNumber(v33, "DW", &v37.origin.x))
            self->defaultWidth = v34 * fabs(v37.origin.x);
        }
      }
    }
  }
  if (self->descriptor.leading == 0.0)
    self->descriptor.leading = 0.2;
  if (self->descriptor.spaceWidth == 0.0)
    self->descriptor.spaceWidth = 0.277832031;
}

- (CPFont)initWith:(CGPDFDictionary *)a3
{
  CPFont *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPFont;
  v4 = -[CPFont init](&v6, sel_init);
  if (v4)
  {
    v4->cgPDFFont = (CGPDFFont *)CGPDFFontCreate(a3);
    -[CPFont getFontName](v4, "getFontName");
    -[CPFont loadExternalFontInfoFor:](v4, "loadExternalFontInfoFor:", v4->fontName);
    -[CPFont loadEmbeddedFontInfo](v4, "loadEmbeddedFontInfo");
  }
  return v4;
}

- (void)dispose
{
  __CFDictionary *kernDictionary;
  CGPDFFont *cgPDFFont;

  if (!self->disposed)
  {
    kernDictionary = self->kernDictionary;
    if (kernDictionary)
      CFRelease(kernDictionary);
    cgPDFFont = self->cgPDFFont;
    if (cgPDFFont)
      CFRelease(cgPDFFont);
    self->disposed = 1;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPFont dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPFont;
  -[CPFont finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPFont dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPFont;
  -[CPFont dealloc](&v3, sel_dealloc);
}

- (CGPDFFont)cgPDFFont
{
  return self->cgPDFFont;
}

- (CGFont)cgFont
{
  CGFont *result;

  result = self->cgFont;
  if (!result)
  {
    result = (CGFont *)self->cgPDFFont;
    if (result)
    {
      result = (CGFont *)CGPDFFontGetFont((uint64_t)result);
      self->cgFont = result;
    }
  }
  return result;
}

- (id)fontName
{
  return self->fontName;
}

- (BOOL)isSameFontAs:(id)a3
{
  return self == a3 || -[NSString isEqualToString:](self->fontName, "isEqualToString:", *((_QWORD *)a3 + 3));
}

- (double)fontStretch
{
  return self->descriptor.fontStretch;
}

- (double)fontWeight
{
  return self->descriptor.fontWeight;
}

- (unsigned)flags
{
  return self->descriptor.flags;
}

- (CGRect)fontBBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->descriptor.fontBBox.origin.x;
  y = self->descriptor.fontBBox.origin.y;
  width = self->descriptor.fontBBox.size.width;
  height = self->descriptor.fontBBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)italicAngle
{
  return self->descriptor.italicAngle;
}

- (double)ascent
{
  if (self->isHorizontal)
    return self->descriptor.ascent;
  else
    return self->defaultWidth * 0.5;
}

- (double)descent
{
  if (self->isHorizontal)
    return self->descriptor.descent;
  else
    return self->defaultWidth * -0.5;
}

- (double)leading
{
  return self->descriptor.leading;
}

- (double)capHeight
{
  return self->descriptor.capHeight;
}

- (double)xHeight
{
  return self->descriptor.xHeight;
}

- (double)stemV
{
  return self->descriptor.stemV;
}

- (double)stemH
{
  return self->descriptor.stemH;
}

- (double)avgWidth
{
  return self->descriptor.avgWidth;
}

- (double)maxWidth
{
  return self->descriptor.maxWidth;
}

- (double)missingWidth
{
  return self->descriptor.missingWidth;
}

- (double)spaceWidth
{
  return self->descriptor.spaceWidth;
}

- (double)underlinePosition
{
  return self->descriptor.underlinePosition;
}

- (double)underlineThickness
{
  return self->descriptor.underlineThickness;
}

- (BOOL)isHorizontal
{
  return self->isHorizontal;
}

- (double)kernBetweenUnicode:(unsigned __int16)a3 andUnicode:(unsigned __int16)a4
{
  __CFDictionary *kernDictionary;
  double v6;
  unsigned int v7;
  unsigned int v8;

  kernDictionary = self->kernDictionary;
  v6 = 0.0;
  if (kernDictionary)
  {
    v7 = a4;
    v8 = a3;
    if (CFDictionaryGetCount(kernDictionary))
    {
      if (self->kernUnitsPerEm != 0.0)
        return (double)(__int16)CFDictionaryGetValue(self->kernDictionary, (const void *)(v7 | ((unint64_t)v8 << 16)))/ self->kernUnitsPerEm;
    }
  }
  return v6;
}

- (BOOL)getGlyphs:(unsigned __int16 *)a3 forCodes:(const unsigned __int16 *)a4 count:(unsigned int)a5
{
  CGPDFFont *cgPDFFont;
  unint64_t *Encoding;
  _OWORD *GlyphVector;
  uint64_t v12;
  unsigned int v13;
  __int16 *CIDToGlyphMap;
  CGFont *cgFont;
  uint64_t v16;
  unsigned __int16 v17;
  uint64_t v19;
  unsigned __int16 v20;
  unsigned __int16 v22;
  unsigned __int16 v23;

  cgPDFFont = self->cgPDFFont;
  if (cgPDFFont)
  {
    Encoding = CGPDFFontGetEncoding((unint64_t *)self->cgPDFFont);
    if (Encoding)
    {
      GlyphVector = CGPDFEncodingGetGlyphVector((size_t)Encoding);
      if (a5)
      {
        v12 = a5;
        do
        {
          v13 = *a4++;
          *a3++ = *((_WORD *)GlyphVector + v13);
          --v12;
        }
        while (v12);
      }
    }
    else
    {
      CIDToGlyphMap = (__int16 *)CGPDFFontGetCIDToGlyphMap((uint64_t)self->cgPDFFont);
      if (CIDToGlyphMap)
      {
        CGFontIndexMapGetValues(CIDToGlyphMap, (unsigned __int16 *)a4, a5, a3);
      }
      else
      {
        -[CPFont cgFont](self, "cgFont");
        cgFont = self->cgFont;
        if (cgFont && (v16 = a5, CGFontGetGlyphsForCIDs(cgFont, (unsigned __int16 *)a4, a5, a3)))
        {
          if (!CGPDFFontIsEmbedded((uint64_t)self->cgPDFFont))
          {
            v23 = 1;
            v22 = 0;
            if ((CGFontGetGlyphsForCIDs((_QWORD *)self->cgFont, &v23, 1, &v22) & 1) == 0)
              v22 = 0;
            if (a5)
            {
              v17 = v22;
              do
              {
                if (!*a4++)
                  *a3 = v17;
                ++a3;
                --v16;
              }
              while (v16);
            }
          }
        }
        else if (a5)
        {
          v19 = a5;
          do
          {
            v20 = *a4++;
            *a3++ = v20;
            --v19;
          }
          while (v19);
        }
      }
    }
  }
  return cgPDFFont != 0;
}

- (void)uniCharsFor:(unint64_t)a3 count:(unint64_t *)a4 toArray:(unsigned __int16 *)a5 maxChars:(unsigned int)a6
{
  unint64_t *cgPDFFont;
  unint64_t v8;
  unint64_t *Encoding;
  unsigned __int16 *UnicodesForIndex;
  unint64_t v14;
  unsigned __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, _QWORD, _QWORD);
  unint64_t v21;
  unint64_t v22;
  uint64_t (*v23)(uint64_t, _QWORD, unsigned __int16 *);
  unint64_t v24;
  unint64_t v25;

  *a4 = 0;
  cgPDFFont = (unint64_t *)self->cgPDFFont;
  if (!cgPDFFont)
    return;
  LODWORD(v8) = a6;
  Encoding = CGPDFFontGetEncoding(cgPDFFont);
  if (!Encoding)
  {
    v16 = CGPDFFontGetToUnicodeCMap((uint64_t)self->cgPDFFont);
    if (!v16)
      return;
    if (a3 >> 16)
    {
      v8 = v8;
    }
    else
    {
      v17 = v16;
      v18 = *(_QWORD *)(v16 + 16);
      v19 = cmap_vtable;
      if (cmap_vtable && (v20 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(cmap_vtable + 64)) != 0)
      {
        v21 = v20(v18, (unsigned __int16)a3, 0);
        v22 = 0;
        *a4 = v21;
        if (v21 > v8)
        {
LABEL_21:
          *a4 = v22;
          return;
        }
        v8 = v8;
        v18 = *(_QWORD *)(v17 + 16);
        v19 = cmap_vtable;
      }
      else
      {
        *a4 = 0;
        v8 = v8;
      }
      if (v19)
      {
        v23 = *(uint64_t (**)(uint64_t, _QWORD, unsigned __int16 *))(v19 + 64);
        if (v23)
        {
          v24 = v23(v18, (unsigned __int16)a3, a5);
          *a4 = v24;
          if (v24)
            return;
          goto LABEL_19;
        }
      }
    }
    *a4 = 0;
LABEL_19:
    v25 = CGPDFGetUnicharGuessForCID((unsigned __int16)a3, 0);
    v22 = 0;
    *a4 = v25;
    if (v25 <= v8)
      v22 = CGPDFGetUnicharGuessForCID((unsigned __int16)a3, a5);
    goto LABEL_21;
  }
  UnicodesForIndex = (unsigned __int16 *)CGPDFEncodingGetUnicodesForIndex((uint64_t)Encoding, a3, a4);
  v14 = *a4;
  if (*a4 - 1 < v8)
  {
    do
    {
      v15 = *UnicodesForIndex++;
      *a5++ = v15;
      --v14;
    }
    while (v14);
  }
}

@end
