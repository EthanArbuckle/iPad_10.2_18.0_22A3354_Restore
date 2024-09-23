@implementation CLLocationButtonDrawing

- (CLLocationButtonDrawing)initWithStyle:(id)a3 tag:(id)a4 remote:(BOOL)a5
{
  id v9;
  id v10;
  CLLocationButtonDrawing *v11;
  CLLocationButtonDrawing *v12;
  const char *v13;
  __n128 v14;
  __n128 v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CLLocationButtonDrawing;
  v11 = -[CLLocationButtonDrawing init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_style, a3);
    objc_storeStrong((id *)&v12->_currentTag, a4);
    v12->_remote = a5;
    objc_msgSend__computeImageMetrics(v12, v13, v14, v15);
  }

  return v12;
}

+ (id)_drawingWithStyle:(id)a3 tag:(id)a4 remote:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  const char *v11;
  __n128 v12;
  __n128 v13;
  void *v14;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  v14 = (void *)objc_msgSend_initWithStyle_tag_remote_(v10, v11, v12, v13, v9, v8, v5);

  return v14;
}

- (CGSize)drawingSize
{
  __n128 v2;
  __n128 v3;
  __n128 v5;
  double v6;
  const char *v7;
  __n128 v8;
  const char *v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  double v13;
  const char *v14;
  __n128 v15;
  double v16;
  double v17;
  CGSize result;

  objc_msgSend_buttonWidth(self->_currentTag, a2, v2, v3);
  v6 = v5.n128_f64[0];
  objc_msgSend_neededSize(self, v7, v5, v8);
  if (v6 < v10.n128_f64[0])
    v6 = v10.n128_f64[0];
  objc_msgSend_buttonHeight(self->_currentTag, v9, v10, v11);
  v13 = v12.n128_f64[0];
  objc_msgSend_neededSize(self, v14, v12, v15);
  if (v13 >= v16)
    v16 = v13;
  v17 = v6;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  const char *v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  double v10;
  __n128 v11;
  double v12;
  const char *v13;
  id v14;
  const char *v15;
  __n128 v16;
  __n128 v17;
  CGColor *v18;
  const char *v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  CGFloat v23;
  const char *v24;
  __n128 v25;
  double v26;
  CGFloat v27;
  const CGPath *v28;
  double v29;
  const char *v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  double v34;
  const char *v35;
  __n128 v36;
  __n128 v37;
  double v38;
  const char *v39;
  __n128 v40;
  void *v41;
  const char *v42;
  __n128 v43;
  __n128 v44;
  double v45;
  double v46;
  const char *v47;
  __n128 v48;
  __n128 v49;
  void *v50;
  const char *v51;
  __n128 v52;
  __n128 v53;
  double v54;
  double v55;
  const char *v56;
  __n128 v57;
  __n128 v58;
  void *v59;
  const char *v60;
  __n128 v61;
  __n128 v62;
  void *v63;
  const char *v64;
  __n128 v65;
  __n128 v66;
  const char *v67;
  __n128 v68;
  __n128 v69;
  double v70;
  __n128 v71;
  double v72;
  const char *v73;
  __n128 v74;
  double v75;
  __n128 v76;
  double v77;
  const char *v78;
  __n128 v79;
  void *v80;
  const char *v81;
  __n128 v82;
  __n128 v83;
  double v84;
  double v85;
  double v86;
  const char *v87;
  __n128 v88;
  __n128 v89;
  void *v90;
  __n128 v91;
  __n128 v92;
  const char *v93;
  const char *v94;
  __n128 v95;
  __n128 v96;
  const char *v97;
  __n128 v98;
  __n128 v99;
  double v100;
  __n128 v101;
  __n128 v102;
  const char *v103;
  id v104;
  id v105;
  CGRect v106;

  CGContextSaveGState(a3);
  objc_msgSend_drawingSize(self, v6, v7, v8);
  v10 = v9.n128_f64[0];
  v12 = v11.n128_f64[0];
  objc_msgSend_backgroundColor(self->_currentTag, v13, v9, v11);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (CGColor *)objc_msgSend_CGColor(v14, v15, v16, v17);
  CGContextSetFillColorWithColor(a3, v18);

  objc_msgSend_cornerRadius(self->_currentTag, v19, v20, v21);
  v23 = v22.n128_f64[0];
  objc_msgSend_cornerRadius(self->_currentTag, v24, v22, v25);
  v27 = v26;
  v106.origin.x = 0.0;
  v106.origin.y = 0.0;
  v106.size.width = v10;
  v106.size.height = v12;
  v28 = CGPathCreateWithRoundedRect(v106, v23, v27, 0);
  CGContextAddPath(a3, v28);
  CGPathRelease(v28);
  CGContextFillPath(a3);
  v29 = v10 * 0.5;
  objc_msgSend_engravedSize(self, v30, v31, v32);
  v34 = v33.n128_f64[0];
  objc_msgSend_engravedSize(self, v35, v33, v36);
  v38 = v37.n128_f64[0];
  objc_msgSend_textDrawing(self, v39, v37, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_drawingSize(v41, v42, v43, v44);
  v46 = v45;

  objc_msgSend_glyphDrawing(self, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_drawingSize(v50, v51, v52, v53);
  v55 = v54;

  objc_msgSend_textDrawing(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_drawingSize(v59, v60, v61, v62);
  v104 = v63;

  if (objc_msgSend_layoutDirection(self->_style, v64, v65, v66) == 1)
  {
    objc_msgSend_engravedSize(self, v67, v68, v69);
    v71.n128_f64[0] = v70 * 0.5;
    v72 = v29 - v71.n128_f64[0];
    objc_msgSend_engravedSize(self, v73, v71, v74);
    v76.n128_f64[0] = v75 * 0.5;
    v77 = v29 + v76.n128_f64[0];
    objc_msgSend_glyphDrawing(self, v78, v76, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_drawingSize(v80, v81, v82, v83);
    v85 = v77 - v84;

  }
  else
  {
    v85 = v29 - v34 * 0.5;
    v68.n128_f64[0] = v29 + v38 * 0.5;
    v72 = v68.n128_f64[0] - v46;
  }
  if (!self->_remote)
    CGContextSetAlpha(a3, 0.5);
  v86 = v12 * 0.5;
  if (objc_msgSend_icon(self->_currentTag, v67, v68, v69))
  {
    v88.n128_f64[0] = v55 * 0.5;
    objc_msgSend_glyphDrawing(self, v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91.n128_f64[0] = v85;
    v92.n128_f64[0] = v86 - v55 * 0.5;
    objc_msgSend_drawInContext_atPoint_(v90, v93, v91, v92, a3);

  }
  CGContextRestoreGState(a3);
  if (!self->_remote)
    CGContextSetAlpha(a3, 0.5);
  if (objc_msgSend_label(self->_currentTag, v94, v95, v96) || !objc_msgSend_icon(self->_currentTag, v97, v98, v99))
  {
    v98.n128_f64[0] = *(double *)&v104 * 0.5;
    v100 = v86 - *(double *)&v104 * 0.5;
    objc_msgSend_textDrawing(self, v97, v98, v99);
    v105 = (id)objc_claimAutoreleasedReturnValue();
    v101.n128_f64[0] = v72;
    v102.n128_f64[0] = v100;
    objc_msgSend_drawInContext_atPoint_(v105, v103, v101, v102, a3);

  }
}

- (void)_computeImageMetrics
{
  __n128 v2;
  __n128 v3;
  const char *v5;
  __n128 v6;
  __n128 v7;
  void *v8;
  id v9;
  const char *v10;
  __n128 v11;
  __n128 v12;
  void *v13;
  id v14;
  const char *v15;
  __n128 v16;
  __n128 v17;
  void *v18;
  BOOL v19;
  const __CTFontDescriptor *v20;
  const char *v21;
  __n128 v22;
  __n128 v23;
  CGFloat v24;
  CTFontRef v25;
  const char *v26;
  __n128 v27;
  __n128 v28;
  uint64_t v29;
  const char *v30;
  __n128 v31;
  __n128 v32;
  void *v33;
  const char *v34;
  __n128 v35;
  __n128 v36;
  const char *v37;
  __n128 v38;
  __n128 v39;
  void *v40;
  void *v41;
  const char *v42;
  __n128 v43;
  __n128 v44;
  const char *v45;
  __n128 v46;
  __n128 v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  __n128 v52;
  __n128 v53;
  void *v54;
  const char *v55;
  __n128 v56;
  __n128 v57;
  void *v58;
  void *v59;
  const char *v60;
  __n128 v61;
  __n128 v62;
  const char *v63;
  __n128 v64;
  __n128 v65;
  void *v66;
  const char *v67;
  __n128 v68;
  __n128 v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  const char *v74;
  __n128 v75;
  __n128 v76;
  const char *v77;
  __n128 v78;
  __n128 v79;
  void *v80;
  id v81;
  const char *v82;
  __n128 v83;
  __n128 v84;
  __n128 v85;
  __n128 v86;
  const char *v87;
  void *v88;
  const char *v89;
  __n128 v90;
  __n128 v91;
  const char *v92;
  __n128 v93;
  __n128 v94;
  void *v95;
  const char *v96;
  __n128 v97;
  __n128 v98;
  uint64_t v99;
  const char *v100;
  __n128 v101;
  __n128 v102;
  void *v103;
  const char *v104;
  __n128 v105;
  __n128 v106;
  __n128 v107;
  unint64_t v108;
  const char *v109;
  __n128 v110;
  uint64_t v111;
  const char *v112;
  __n128 v113;
  __n128 v114;
  uint64_t v115;
  __n128 v116;
  unint64_t v117;
  const char *v118;
  __n128 v119;
  void *v120;
  const char *v121;
  __n128 v122;
  __n128 v123;
  void *v124;
  __n128 v125;
  __n128 v126;
  const char *v127;
  void *v128;
  id v129;
  const char *v130;
  __n128 v131;
  __n128 v132;
  id v133;
  const char *v134;
  __n128 v135;
  __n128 v136;
  uint64_t v137;
  const char *v138;
  __n128 v139;
  __n128 v140;
  void *v141;
  const char *v142;
  __n128 v143;
  __n128 v144;
  const char *v145;
  __n128 v146;
  __n128 v147;
  void *v148;
  const char *v149;
  __n128 v150;
  __n128 v151;
  const char *v152;
  __n128 v153;
  __n128 v154;
  const char *v155;
  __n128 v156;
  __n128 v157;
  __n128 v158;
  __n128 v159;
  double v160;
  const char *v161;
  void *v162;
  const char *v163;
  __n128 v164;
  __n128 v165;
  __n128 v166;
  double v167;
  const char *v168;
  __n128 v169;
  void *v170;
  const char *v171;
  __n128 v172;
  __n128 v173;
  double v174;
  double v175;
  const char *v176;
  __n128 v177;
  __n128 v178;
  void *v179;
  const char *v180;
  __n128 v181;
  __n128 v182;
  double v183;
  double v184;
  const char *v185;
  __n128 v186;
  __n128 v187;
  void *v188;
  const char *v189;
  __n128 v190;
  __n128 v191;
  double v192;
  double v193;
  const char *v194;
  __n128 v195;
  __n128 v196;
  const char *v197;
  __n128 v198;
  __n128 v199;
  void *v200;
  const char *v201;
  __n128 v202;
  __n128 v203;
  void *v204;
  const char *v205;
  __n128 v206;
  __n128 v207;
  __n128 v208;
  double v209;
  const char *v210;
  __n128 v211;
  __n128 v212;
  double v213;
  const char *v214;
  __n128 v215;
  double v216;
  __n128 v217;
  __n128 v218;
  const char *v219;
  const char *v220;
  __n128 v221;
  __n128 v222;
  const char *v223;
  __n128 v224;
  __n128 v225;
  __n128 v226;
  double v227;
  const char *v228;
  __n128 v229;
  const char *v230;
  __n128 v231;
  __n128 v232;
  __n128 v233;
  double v234;
  const char *v235;
  __n128 v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  _QWORD v242[2];
  _QWORD v243[2];
  uint8_t buf[4];
  void *v245;
  __int16 v246;
  void *v247;
  uint64_t v248;
  CGRect v249;

  v248 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_setRenderedSuccessfully_(self->_currentTag, a2, v2, v3, 0);
  objc_msgSend_bundleWithPath_(MEMORY[0x24BDD1488], v5, v6, v7, CFSTR("/System/Library/CoreServices/CoreGlyphs.bundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE28C28]);
    v241 = 0;
    v13 = (void *)objc_msgSend_initWithName_fromBundle_error_(v9, v10, v11, v12, CFSTR("Assets"), v8, &v241);
    v14 = v241;
    v18 = v14;
    if (v13)
      v19 = v14 == 0;
    else
      v19 = 0;
    if (!v19)
      goto LABEL_43;
    objc_msgSend_fontContentSizeCategory(self->_style, v15, v16, v17);
    v20 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
    objc_msgSend_fontSize(self->_currentTag, v21, v22, v23);
    v25 = CTFontCreateWithFontDescriptor(v20, v24, 0);
    CFRelease(v20);
    CFAutorelease(v25);
    v29 = objc_msgSend_label(self->_currentTag, v26, v27, v28);
    objc_msgSend_objectAtIndexedSubscript_(&unk_24F97ED98, v30, v31, v32, v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_secureNameForStyle_(self->_currentTag, v34, v35, v36, self->_style);
    objc_msgSend_localization(self->_style, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    UISLocalizedStringForSecureName();
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v33, v42, v43, v44, v41))
    {
      if (!CFBundleGetBundleWithIdentifier(CFSTR("com.apple.locationd.CoreLocationUI")))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton could not find CoreLocationUI bundle for localization", buf, 2u);
        }
        v59 = v41;
        goto LABEL_42;
      }
      v239 = v18;
      v48 = (void *)MEMORY[0x24BDBCEA0];
      objc_msgSend_localization(self->_style, v45, v46, v47);
      v49 = v33;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localeWithLocaleIdentifier_(v48, v51, v52, v53, v50);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_languageCode(v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v49;
      v59 = (void *)CFBundleCopyLocalizedStringForLocalization();

      if ((objc_msgSend_isEqualToString_(v49, v60, v61, v62, v59) & 1) != 0)
      {
        v18 = v239;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localization(self->_style, v63, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v245 = v66;

        }
        goto LABEL_42;
      }

      v18 = v239;
    }
    else
    {
      v59 = v41;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_localization(self->_style, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v245 = v59;
      v246 = 2112;
      v247 = v70;

    }
    if (v59)
      objc_msgSend_setLocalizedTitle_(self, v67, v68, v69, v59);
    v71 = *MEMORY[0x24BDC4C28];
    v243[0] = v25;
    v72 = *MEMORY[0x24BDC4EE0];
    v242[0] = v71;
    v242[1] = v72;
    objc_msgSend_tintColor(self->_currentTag, v67, v68, v69);
    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v243[1] = objc_msgSend_CGColor(v73, v74, v75, v76);
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v77, v78, v79, v243, v242, 2);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = objc_alloc(MEMORY[0x24BEBEC50]);
    v85.n128_f64[0] = (double)objc_msgSend_displayScale(self->_style, v82, v83, v84);
    v86.n128_u64[0] = 0x7FF8000000000000;
    v88 = (void *)objc_msgSend_initWithString_attributes_lineBreakMode_textAlignment_width_scale_(v81, v87, v86, v85, v59, v80, 0, 0);
    objc_msgSend_setTextDrawing_(self, v89, v90, v91, v88);

    objc_msgSend_textDrawing(self, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v95)
    {
LABEL_41:

LABEL_42:
LABEL_43:

      goto LABEL_44;
    }
    v237 = v59;
    v238 = v80;
    v240 = v33;
    v99 = objc_msgSend_icon(self->_currentTag, v96, v97, v98);
    objc_msgSend_objectAtIndexedSubscript_(&unk_24F97EDB0, v100, v101, v102, v99);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetScaleFactor(self->_style, v104, v105, v106);
    v108 = v107.n128_u64[0];
    v111 = objc_msgSend_assetDeviceIdiom(self->_style, v109, v107, v110);
    v115 = objc_msgSend_layoutDirection(self->_style, v112, v113, v114);
    v116.n128_f64[0] = CTFontGetSize(v25);
    v117 = v116.n128_u64[0];
    objc_msgSend_assetAppearanceNames(self->_style, v118, v116, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v120, v121, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125.n128_u64[0] = v108;
    v126.n128_u64[0] = v117;
    objc_msgSend_namedVectorGlyphWithName_scaleFactor_deviceIdiom_layoutDirection_glyphSize_glyphWeight_glyphPointSize_appearanceName_(v13, v127, v125, v126, v103, v111, v115, 2, 6, v124);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v128)
      goto LABEL_40;
    v129 = objc_alloc(MEMORY[0x24BEBEC60]);
    objc_msgSend_tintColor(self->_currentTag, v130, v131, v132);
    v133 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v137 = objc_msgSend_CGColor(v133, v134, v135, v136);
    v141 = (void *)objc_msgSend_initWithVectorGlyph_tintColor_(v129, v138, v139, v140, v128, v137);
    objc_msgSend_setGlyphDrawing_(self, v142, v143, v144, v141);

    objc_msgSend_glyphDrawing(self, v145, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v148)
    {
LABEL_40:

      v80 = v238;
      v33 = v240;
      v59 = v237;
      goto LABEL_41;
    }
    if (objc_msgSend_icon(self->_currentTag, v149, v150, v151))
    {
      if (objc_msgSend_label(self->_currentTag, v152, v153, v154))
      {
        objc_msgSend_fontSize(self->_currentTag, v155, v156, v157);
        v158.n128_u64[0] = 0.5;
        v160 = v159.n128_f64[0] * 0.5;
        objc_msgSend_textDrawing(self, v161, v159, v158);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawingSize(v162, v163, v164, v165);
        v167 = v166.n128_f64[0];
        objc_msgSend_glyphDrawing(self, v168, v166, v169);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawingSize(v170, v171, v172, v173);
        v175 = v160 + v167 + v174;

        objc_msgSend_glyphDrawing(self, v176, v177, v178);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawingSize(v179, v180, v181, v182);
        v184 = v183;

        objc_msgSend_textDrawing(self, v185, v186, v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawingSize(v188, v189, v190, v191);
        v193 = v192;

        if (v184 >= v193)
          v196.n128_f64[0] = v184;
        else
          v196.n128_f64[0] = v193;
        v195.n128_f64[0] = v175;
        objc_msgSend_setEngravedSize_(self, v194, v195, v196);
LABEL_34:
        objc_msgSend_fontSize(self->_currentTag, v197, v198, v199);
        v209 = v208.n128_f64[0];
        objc_msgSend_engravedSize(self, v210, v208, v211);
        v213 = v209 + v212.n128_f64[0];
        objc_msgSend_engravedSize(self, v214, v212, v215);
        v217.n128_f64[0] = v209 + v216;
        v218.n128_f64[0] = v213;
        objc_msgSend_setNeededSize_(self, v219, v218, v217);
        objc_msgSend_frame(self->_currentTag, v220, v221, v222);
        if (CGRectIsEmpty(v249)
          || (objc_msgSend_neededSize(self, v223, v224, v225),
              v227 = v226.n128_f64[0],
              objc_msgSend_buttonWidth(self->_currentTag, v228, v226, v229),
              v227 <= v231.n128_f64[0])
          && (objc_msgSend_neededSize(self, v230, v231, v232),
              v234 = v233.n128_f64[0],
              objc_msgSend_buttonHeight(self->_currentTag, v235, v236, v233),
              v234 <= v224.n128_f64[0]))
        {
          objc_msgSend_setRenderedSuccessfully_(self->_currentTag, v223, v224, v225, 1);
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error: #locationButton failed due to inappropriate sizes", buf, 2u);
        }
        goto LABEL_40;
      }
      objc_msgSend_glyphDrawing(self, v155, v156, v157);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_textDrawing(self, v152, v153, v154);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v204 = v200;
    objc_msgSend_drawingSize(v200, v201, v202, v203);
    objc_msgSend_setEngravedSize_(self, v205, v206, v207);

    goto LABEL_34;
  }
LABEL_44:

}

- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  return 0;
}

- (CGSize)neededSize
{
  double width;
  double height;
  CGSize result;

  width = self->_neededSize.width;
  height = self->_neededSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNeededSize:(CGSize)a3
{
  self->_neededSize = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (CGSize)engravedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_engravedSize.width;
  height = self->_engravedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEngravedSize:(CGSize)a3
{
  self->_engravedSize = a3;
}

- (UISTextLineDrawing)textDrawing
{
  return self->_textDrawing;
}

- (void)setTextDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_textDrawing, a3);
}

- (UISVectorGlyphDrawing)glyphDrawing
{
  return self->_glyphDrawing;
}

- (void)setGlyphDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_glyphDrawing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphDrawing, 0);
  objc_storeStrong((id *)&self->_textDrawing, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_currentTag, 0);
}

@end
