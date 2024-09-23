@implementation CHTextInputGesture

- (CHTextInputGesture)initWithGestureType:(int64_t)a3 targetContentInfo:(id)a4 locale:(id)a5 normalizedDrawing:(id)a6 originalDrawing:(id)a7 lastStroke:(id)a8 preferCharacterLevel:(BOOL)a9
{
  id v16;
  id v17;
  NSObject *v18;
  CHTextInputGesture *v19;
  CHTextInputGesture *v20;
  CHTokenizedTextResult *textResult;
  id v23;
  id v24;
  id v25;
  objc_super v26;
  uint8_t buf[16];

  v25 = a4;
  v24 = a5;
  v23 = a6;
  v16 = a7;
  v17 = a8;
  if (a3 == 1)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v18 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v18, OS_LOG_TYPE_FAULT, "CHTextInputGesture does not support the text correction type.", buf, 2u);
    }

  }
  v26.receiver = self;
  v26.super_class = (Class)CHTextInputGesture;
  v19 = -[CHTextInputGesture init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_gestureType = a3;
    objc_storeStrong((id *)&v19->_targetContentInfo, a4);
    objc_storeStrong((id *)&v20->_locale, a5);
    objc_storeStrong((id *)&v20->_normalizedDrawing, a6);
    objc_storeStrong((id *)&v20->_originalDrawing, a7);
    objc_storeStrong((id *)&v20->_lastStroke, a8);
    v20->_preferCharacterLevel = a9;
    textResult = v20->__textResult;
    v20->__textResult = 0;

    v20->__storedAffectedRange = (_NSRange)xmmword_1BE8D6920;
  }

  return v20;
}

- (id)textResult
{
  return self->__textResult;
}

- (void)getAffectedRange:(_NSRange *)a3 expandedToFullTokens:(BOOL *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger location;
  NSUInteger v16;
  NSUInteger length;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSUInteger v64;
  unint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  BOOL v124;
  uint8_t buf[4];
  uint64_t v126;
  __int16 v127;
  NSUInteger v128;
  __int16 v129;
  NSUInteger v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  objc_msgSend_targetContentInfo(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  location = objc_msgSend_strokeCoveredTextRange(v9, v10, v11, v12, v13, v14);
  length = v16;

  v124 = 0;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    switch(objc_msgSend_gestureType(self, v18, v19, v20, v21, v22))
    {
      case 0:
        length = 0;
        break;
      case 2:
        length = 0;
        if (qword_1EF568E88 != -1)
          goto LABEL_21;
        goto LABEL_13;
      case 3:
        v102 = sub_1BE72E9A8(self, (const char *)location, length, v23, v24, v25);
        v106 = (const char *)objc_msgSend__affectedRangeByAdjustingForProtectedCharacters_(self, v103, v102, (uint64_t)v103, v104, v105);
        v110 = (const char *)sub_1BE72EA70(self, v106, v107, v107, v108, v109);
        v114 = (const char *)sub_1BE72ED58(self, v110, v111, v111, v112, v113);
        v63 = sub_1BE72F034(self, v114, v115, 1, (char *)&v124, v116);
        goto LABEL_11;
      case 4:
      case 5:
        v26 = sub_1BE72E9A8(self, (const char *)location, length, v23, v24, v25);
        v28 = (uint64_t)v27;
        v33 = objc_msgSend_gestureType(self, v27, v29, v30, v31, v32);
        objc_msgSend_originalDrawing(self, v34, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetContentInfo(self, v40, v41, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = sub_1BE72F6CC((uint64_t)CHTextInputGesture, v26, v28, v33, v39, v45);
        v48 = v47;

        v52 = (const char *)objc_msgSend__affectedRangeByAdjustingForProtectedCharacters_(self, v49, v46, v48, v50, v51);
        v56 = (const char *)sub_1BE72EA70(self, v52, v53, v53, v54, v55);
        v60 = (const char *)sub_1BE72ED58(self, v56, v57, v57, v58, v59);
        v63 = sub_1BE72F034(self, v60, v61, 0, (char *)&v124, v62);
        goto LABEL_11;
      case 6:
        v65 = sub_1BE72E9A8(self, (const char *)location, length, v23, v24, v25);
        v67 = (uint64_t)v66;
        v72 = objc_msgSend_gestureType(self, v66, v68, v69, v70, v71);
        objc_msgSend_originalDrawing(self, v73, v74, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetContentInfo(self, v79, v80, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = sub_1BE72F6CC((uint64_t)CHTextInputGesture, v65, v67, v72, v78, v84);
        v87 = v86;

        v91 = (const char *)objc_msgSend__affectedRangeByAdjustingForProtectedCharacters_(self, v88, v85, v87, v89, v90);
        v95 = (const char *)sub_1BE72EA70(self, v91, v92, v92, v93, v94);
        v99 = (const char *)sub_1BE72ED58(self, v95, v96, v96, v97, v98);
        v63 = sub_1BE72F034(self, v99, v100, 1, (char *)&v124, v101);
LABEL_11:
        location = v63;
        length = v64;
        goto LABEL_12;
      case 7:
        location = self->__storedAffectedRange.location;
        length = self->__storedAffectedRange.length;
        if (qword_1EF568E88 != -1)
          goto LABEL_21;
        goto LABEL_13;
      default:
LABEL_12:
        if (qword_1EF568E88 == -1)
          goto LABEL_13;
        goto LABEL_21;
    }
  }
  location = 0x7FFFFFFFFFFFFFFFLL;
  if (qword_1EF568E88 != -1)
LABEL_21:
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
LABEL_13:
  v117 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
  {
    v123 = objc_msgSend_gestureType(self, v118, v119, v120, v121, v122);
    *(_DWORD *)buf = 134218496;
    v126 = v123;
    v127 = 2048;
    v128 = location;
    v129 = 2048;
    v130 = length;
    _os_log_impl(&dword_1BE607000, v117, OS_LOG_TYPE_DEBUG, "Gesture recognized with type %ld, range  = %ld,%ld", buf, 0x20u);
  }

  if (a3)
  {
    a3->location = location;
    a3->length = length;
  }
  if (a4)
    *a4 = v124;
}

- (_NSRange)_affectedRangeByAdjustingForProtectedCharacters:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  _QWORD v22[9];
  _QWORD v23[3];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  NSUInteger v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  NSUInteger v32;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = a3.length;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = a3.location;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  objc_msgSend_targetContentInfo(self, a2, a3.location, a3.length, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectedCharacterIndexes(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BE73007C;
  v22[3] = &unk_1E77F4558;
  v22[4] = &v25;
  v22[5] = &v29;
  v22[7] = location;
  v22[8] = length;
  v22[6] = v23;
  objc_msgSend_enumerateIndexesUsingBlock_(v13, v14, (uint64_t)v22, v15, v16, v17);

  v18 = v26[3];
  v19 = v30[3];
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  v20 = v18;
  v21 = v19;
  result.length = v21;
  result.location = v20;
  return result;
}

+ (_NSRange)rangeOfTokenAtCharacterIndex:(int64_t)a3 inString:(id)a4 locale:(id)a5
{
  __CFString *v7;
  const __CFLocale *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __CFStringTokenizer *v30;
  CFStringTokenizerTokenType v31;
  CFRange CurrentTokenRange;
  CFIndex location;
  CFIndex length;
  CFRange v35;
  NSUInteger v36;
  NSUInteger v37;
  int v38;
  int64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;
  _NSRange result;
  CFRange v44;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a4;
  v8 = (const __CFLocale *)a5;
  if (objc_msgSend_length(v7, v9, v10, v11, v12, v13))
  {
    if (a3 < 0 || objc_msgSend_length(v7, v14, v15, v16, v17, v18) <= (unint64_t)a3)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v24 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v38 = 134218240;
        v39 = a3;
        v40 = 2048;
        v41 = objc_msgSend_length(v7, v25, v26, v27, v28, v29);
        _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_FAULT, "Character index %lu beyond bounds for string length: %lu", (uint8_t *)&v38, 0x16u);
      }

    }
    v44.length = objc_msgSend_length(v7, v19, v20, v21, v22, v23);
    v44.location = 0;
    v30 = CFStringTokenizerCreate(0, v7, v44, 4uLL, v8);
    v31 = CFStringTokenizerGoToTokenAtIndex(v30, a3);
    if (v31)
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
      location = CurrentTokenRange.location;
      length = CurrentTokenRange.length;
      if (!(v31 | a3))
        goto LABEL_15;
    }
    else
    {
      length = 0;
      location = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == (unsigned __int128)0)
        goto LABEL_15;
    }
    if (location + length > (unint64_t)a3)
    {
LABEL_18:
      CFRelease(v30);
      goto LABEL_19;
    }
LABEL_15:
    if (CFStringTokenizerAdvanceToNextToken(v30))
    {
      v35 = CFStringTokenizerGetCurrentTokenRange(v30);
      if ((unint64_t)a3 >= v35.location && (unint64_t)(a3 - v35.location) < v35.length)
      {
        length = v35.length;
        location = v35.location;
      }
    }
    goto LABEL_18;
  }
  length = 0;
  location = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:

  v36 = location;
  v37 = length;
  result.length = v37;
  result.location = v36;
  return result;
}

+ (id)verticalBarGestureFromLineResult:(id)a3 currentGesture:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat MidX;
  CGFloat MidY;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __n128 v72;
  __n128 v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  void *v134;
  uint64_t Stroke_preferCharacterLevel;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  unint64_t active;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  CHTextInputGesture *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  NSObject *v266;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  int v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  const __CFString *v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  id v319;
  uint8_t buf[16];
  CGRect v321;
  CGRect v322;

  v319 = a3;
  v6 = a4;
  objc_msgSend_targetContentInfo(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalDrawing(v6, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend_isVerticalBarShapeFromLineResult_originalDrawing_isDirectionDownward_(a1, v19, (uint64_t)v319, (uint64_t)v18, 0, v20);

  if ((_DWORD)a1)
  {
    objc_msgSend_originalDrawing(v6, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v26, v27, v28, v29, v30, v31);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    v321.origin.x = v33;
    v321.origin.y = v35;
    v321.size.width = v37;
    v321.size.height = v39;
    MidX = CGRectGetMidX(v321);
    v322.origin.x = v33;
    v322.origin.y = v35;
    v322.size.width = v37;
    v322.size.height = v39;
    MidY = CGRectGetMidY(v322);
    v47 = objc_msgSend_strokeCoveredTextRange(v12, v42, v43, v44, v45, v46);
    v49 = (uint64_t)v48;
    v53 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v12, v48, v47, v50, v51, v52);
    objc_msgSend_referenceSubstring(v12, v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_baseWritingDirection(v12, v60, v61, v62, v63, v64);
    v71 = objc_msgSend_characterRectsInReferenceSubstring(v12, v66, v67, v68, v69, v70);
    v72.n128_f64[0] = MidX;
    v73.n128_f64[0] = MidY;
    v74 = sub_1BE7306E4(v72, v73, (uint64_t)CHTextInputGesture, v59, v65, v71, v53, v49);

    objc_msgSend_controlCharacterSet(MEMORY[0x1E0CB3780], v75, v76, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v318 = v80;
    objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v81, v82, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invertedSet(v86, v87, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formIntersectionWithCharacterSet_(v80, v93, (uint64_t)v92, v94, v95, v96);

    objc_msgSend_referenceSubstring(v12, v97, v98, v99, v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend_length(v102, v103, v104, v105, v106, v107);

    if (v74 == v108)
    {
      objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSubstring(v12, v115, v116, v117, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = objc_msgSend_length(v120, v121, v122, v123, v124, v125);
      v131 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v114, v127, v126 - 1, v128, v129, v130);
      v317 = v132;
      v133 = v131;

      if (v133 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_4:
        v133 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_11;
      }
    }
    else
    {
      if (v74 < 1
        || (objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113),
            v136 = (void *)objc_claimAutoreleasedReturnValue(),
            v142 = objc_msgSend_length(v136, v137, v138, v139, v140, v141),
            v136,
            v142 < v74))
      {
        v317 = 0;
        goto LABEL_4;
      }
      objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v273 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v268, v269, v74 - 1, v270, v271, v272);
      v317 = v274;
      v133 = v273;

      if (v133 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_4;
    }
    objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = objc_msgSend_characterAtIndex_(v143, v144, v133, v145, v146, v147);

    if (objc_msgSend_characterIsMember_(v80, v149, v148, v150, v151, v152))
    {
      objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_invertedSet(v80, v154, v155, v156, v157, v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v153, v160, (uint64_t)v159, 4, 0, v133 + v317);
      v317 = v162;
      v133 = v161;

    }
LABEL_11:
    objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = objc_msgSend_length(v163, v164, v165, v166, v167, v168);

    if (v74 >= v169)
    {
      v182 = 0;
      v180 = 0x7FFFFFFFFFFFFFFFLL;
      if (v133 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend_referenceSubstring(v12, v170, v171, v172, v173, v174);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v175, v176, v74, v177, v178, v179);
      v182 = v181;

      objc_msgSend_referenceSubstring(v12, v183, v184, v185, v186, v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = objc_msgSend_characterAtIndex_(v188, v189, v180, v190, v191, v192);

      if (objc_msgSend_characterIsMember_(v80, v194, v193, v195, v196, v197))
      {
        objc_msgSend_referenceSubstring(v12, v170, v171, v172, v173, v174);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_invertedSet(v80, v199, v200, v201, v202, v203);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceSubstring(v12, v205, v206, v207, v208, v209);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        v216 = objc_msgSend_length(v210, v211, v212, v213, v214, v215);
        v180 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v198, v217, (uint64_t)v204, 0, v180, v216 - v180);
        v182 = v218;

      }
      if (v133 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_19;
    }
    active = objc_msgSend_activePreviewRange(v12, v170, v171, v172, v173, v174);
    if (v133 < active || v133 - active >= (unint64_t)v170)
    {
      objc_msgSend_referenceSubstring(v12, v170, v171, v172, v173, v174);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringWithRange_(v221, v222, v133, v317, v223, v224);
      v220 = objc_claimAutoreleasedReturnValue();

      if (v180 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_24;
LABEL_22:
      v225 = objc_msgSend_activePreviewRange(v12, v170, v171, v172, v173, v174);
      if (v180 < v225 || v180 - v225 >= (unint64_t)v170)
      {
        objc_msgSend_referenceSubstring(v12, v170, v226, v172, v173, v174);
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringWithRange_(v262, v263, v180, v182, v264, v265);
        v227 = objc_claimAutoreleasedReturnValue();

        if (v220 | v227)
          goto LABEL_25;
        goto LABEL_31;
      }
LABEL_24:
      v227 = 0;
      if (v220)
      {
LABEL_25:
        v316 = objc_msgSend_absoluteLocationFromRelativeLocation_(v12, v170, v180, v172, v173, v174);
        if ((objc_msgSend_isEqualToString_((void *)v220, v228, (uint64_t)CFSTR(" "), v229, v230, v231) & 1) != 0
          || objc_msgSend_isEqualToString_((void *)v220, v232, (uint64_t)CFSTR("　"), v233, v234, v235))
        {
          v316 = objc_msgSend_absoluteLocationFromRelativeLocation_(v12, v232, v133, v233, v234, v235);
          v134 = 0;
          goto LABEL_28;
        }
        if ((objc_msgSend_isEqualToString_((void *)v227, v232, (uint64_t)CFSTR(" "), v233, v234, v235) & 1) != 0
          || (objc_msgSend_isEqualToString_((void *)v227, v275, (uint64_t)CFSTR("　"), v276, v277, v278) & 1) != 0)
        {
          v134 = 0;
          v317 = v182;
LABEL_28:
          v236 = [CHTextInputGesture alloc];
          objc_msgSend_locale(v6, v237, v238, v239, v240, v241);
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_normalizedDrawing(v6, v243, v244, v245, v246, v247);
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_originalDrawing(v6, v249, v250, v251, v252, v253);
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lastStroke(v6, v255, v256, v257, v258, v259);
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          Stroke_preferCharacterLevel = objc_msgSend_initWithGestureType_targetContentInfo_locale_normalizedDrawing_originalDrawing_lastStroke_preferCharacterLevel_(v236, v261, 7, (uint64_t)v12, (uint64_t)v242, (uint64_t)v248, v254, v260, 0);

          if (Stroke_preferCharacterLevel)
          {
            objc_storeStrong((id *)(Stroke_preferCharacterLevel + 64), v134);
            *(_QWORD *)(Stroke_preferCharacterLevel + 72) = v316;
            *(_QWORD *)(Stroke_preferCharacterLevel + 80) = v317;
          }
LABEL_36:

          goto LABEL_37;
        }
        v284 = 0x7FFFFFFFFFFFFFFFLL;
        if (v180 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v133 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_47:
            objc_msgSend_locale(v6, v279, v280, v281, v282, v283);
            v285 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_shouldUseFullWidthSpaceBasedOnContextForLocale_(CHRecognizerConfiguration, v286, (uint64_t)v285, v287, v288, v289))
            {
              v290 = isCharacterFullWidth((NSString *)v220);

              if (v290)
                v295 = CFSTR("　");
              else
                v295 = CFSTR(" ");
            }
            else
            {

              v295 = CFSTR(" ");
            }
            v316 = v284;
            objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB36B8], v291, 0, v292, v293, v294);
            v296 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_normalizedDrawing(v6, v297, v298, v299, v300, v301);
            v302 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_boundsForStrokeIndexes_(v302, v303, (uint64_t)v296, v304, v305, v306);
            v308 = v307;
            v310 = v309;
            v312 = v311;
            v314 = v313;

            objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_(CHTokenizedTextResult, v315, (uint64_t)v295, (uint64_t)v296, (uint64_t)&stru_1E77F6F28, 0, v308, v310, v312, v314, 0.0);
            v134 = (void *)objc_claimAutoreleasedReturnValue();

            v317 = 0;
            goto LABEL_28;
          }
          v180 = v133 + v317;
        }
        v284 = objc_msgSend_absoluteLocationFromRelativeLocation_(v12, v279, v180, v281, v282, v283);
        goto LABEL_47;
      }
LABEL_31:
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v266 = (id)qword_1EF568E48;
      if (os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v266, OS_LOG_TYPE_DEBUG, "No characters found on either side of the vertical bar stroke", buf, 2u);
      }

      v134 = 0;
      Stroke_preferCharacterLevel = 0;
      goto LABEL_36;
    }
LABEL_19:
    v220 = 0;
    if (v180 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_24;
    goto LABEL_22;
  }
  v134 = 0;
  Stroke_preferCharacterLevel = 0;
LABEL_37:

  return (id)Stroke_preferCharacterLevel;
}

+ (BOOL)isEditGestureForDrawing:(id)a3 targetContentInfo:(id)a4 tentativeResultType:(int64_t)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double MinX;
  void *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  double v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  double MinY;
  double v119;
  double MaxY;
  double v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  float32x2_t v128;
  float32_t v129;
  float32x2_t v130;
  float32_t v131;
  float32x2_t v132;
  float v133;
  float32x2_t v134;
  float32_t v135;
  float32x2_t v136;
  float v137;
  double v138;
  double v139;
  double v140;
  unint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  const char *v148;
  const char *v149;
  double v150;
  uint64_t v151;
  double v152;
  uint64_t v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  CHPolygon *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  double v204;
  BOOL v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  double *v210;
  double v211;
  double v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  double v220;
  double v221;
  BOOL v222;
  float32x2_t v223;
  float32_t v224;
  float64x2_t v225;
  float32x2_t v226;
  uint64_t v227;
  _BOOL4 v228;
  int v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  float64_t v234;
  float64_t v235;
  float32x2_t v237;
  float32_t v238;
  float64x2_t v239;
  float32x2_t v240;
  double v242;
  double v243;
  double v244;
  double v245;
  void *v246;
  double v247;
  double MaxX;
  double v249;
  CGFloat v250;
  double v251;
  double v252;
  CGFloat v253;
  uint8_t buf[16];
  CGPoint v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend_pointCount(v7, v9, v10, v11, v12, v13))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v19 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_FAULT, "The drawing cannot be empty", buf, 2u);
    }

  }
  v20 = objc_msgSend_strokeCoveredTextRange(v8, v14, v15, v16, v17, v18);
  v22 = (uint64_t)v21;
  objc_msgSend_referenceSubstringInRange_(v8, v21, v20, (uint64_t)v21, v23, v24);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if ((unint64_t)(a5 - 4) <= 2)
  {
    objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v246, v31, (uint64_t)v30, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_length(v35, v36, v37, v38, v39, v40);

    if (v41 != v22)
    {
      v42 = sub_1BE72F6CC((uint64_t)CHTextInputGesture, v20, v22, a5, v7, v8);
      objc_msgSend_referenceSubstringInRange_(v8, v43, v42, (uint64_t)v43, v44, v45);
      v46 = objc_claimAutoreleasedReturnValue();

      v246 = (void *)v46;
    }
  }
  objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v25, v26, v27, v28, v29);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByTrimmingCharactersInSet_(v246, v48, (uint64_t)v47, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend_length(v52, v53, v54, v55, v56, v57);

  if (!v58)
  {
    objc_msgSend_bounds(v7, v59, v60, v61, v62, v63);
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = v70;
    objc_msgSend_unionCharacterRects(v8, v72, v73, v74, v75, v76);
    x = v256.origin.x;
    y = v256.origin.y;
    width = v256.size.width;
    height = v256.size.height;
    if (CGRectIsNull(v256))
    {
      objc_msgSend_textInputTarget(v8, v81, v82, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_frame(v86, v87, v88, v89, v90, v91);
      x = v92;
      y = v93;
      width = v94;
      height = v95;

    }
    v257.origin.x = x;
    v257.origin.y = y;
    v257.size.width = width;
    v257.size.height = height;
    MinX = CGRectGetMinX(v257);
    v258.origin.x = v65;
    v258.origin.y = v67;
    v258.size.width = v69;
    v258.size.height = v71;
    if (CGRectGetMinX(v258) > MinX + -5.0)
    {
      v205 = 0;
      goto LABEL_61;
    }
  }
  v97 = (void *)MEMORY[0x1E0CB36B8];
  v98 = objc_msgSend_strokeCount(v7, v59, v60, v61, v62, v63);
  objc_msgSend_indexSetWithIndexesInRange_(v97, v99, 0, v98, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centroidForStrokeIndexes_(v7, v103, (uint64_t)v102, v104, v105, v106);
  v243 = v107;
  v245 = v108;

  objc_msgSend_bounds(v7, v109, v110, v111, v112, v113);
  v114 = v259.origin.x;
  v115 = v259.origin.y;
  v116 = v259.size.width;
  v117 = v259.size.height;
  v251 = CGRectGetMinX(v259);
  v260.origin.x = v114;
  v260.origin.y = v115;
  v260.size.width = v116;
  v260.size.height = v117;
  MinY = CGRectGetMinY(v260);
  v261.origin.x = v114;
  v261.origin.y = v115;
  v261.size.width = v116;
  v261.size.height = v117;
  v119 = CGRectGetMinX(v261);
  v262.origin.x = v114;
  v262.origin.y = v115;
  v262.size.width = v116;
  v262.size.height = v117;
  MaxY = CGRectGetMaxY(v262);
  v263.origin.x = v114;
  v263.origin.y = v115;
  v263.size.width = v116;
  v263.size.height = v117;
  MaxX = CGRectGetMaxX(v263);
  v264.origin.x = v114;
  v264.origin.y = v115;
  v264.size.width = v116;
  v264.size.height = v117;
  v247 = CGRectGetMaxY(v264);
  v265.origin.x = v114;
  v265.origin.y = v115;
  v265.size.width = v116;
  v265.size.height = v117;
  v121 = CGRectGetMaxX(v265);
  v266.origin.x = v114;
  v266.origin.y = v115;
  v266.size.width = v116;
  v266.size.height = v117;
  v127 = CGRectGetMinY(v266);
  v242 = v117;
  v244 = v116;
  v128.f32[0] = v251;
  v129 = MinY;
  v128.f32[1] = v129;
  v130.f32[0] = v243;
  v131 = v245;
  v130.f32[1] = v131;
  v132 = vsub_f32(v128, v130);
  v133 = sqrtf(vaddv_f32(vmul_f32(v132, v132)));
  v134.f32[0] = v119;
  v135 = MaxY;
  v134.f32[1] = v135;
  v136 = vsub_f32(v134, v130);
  v137 = sqrtf(vaddv_f32(vmul_f32(v136, v136)));
  if (v133 >= v137)
    v138 = v119;
  else
    v138 = v251;
  if (v133 >= v137)
  {
    v139 = v247;
  }
  else
  {
    MaxY = MinY;
    v139 = v127;
  }
  if (v133 >= v137)
    v140 = MaxX;
  else
    v140 = v121;
  v141 = objc_msgSend_referenceSubstringRange(v8, v122, v123, v124, v125, v126);
  v147 = v141;
  v148 = v142;
  v149 = &v142[v141];
  v150 = 0.0;
  if (v141 < (unint64_t)&v142[v141])
  {
    v151 = 0;
    v252 = (v245 + MaxY) * 0.5;
    v249 = (v243 + v138) * 0.5;
    v153 = v141;
    do
    {
      objc_msgSend_characterRectForCharacterIndex_(v8, v142, v153, v144, v145, v146);
      v155 = v154;
      v157 = v156;
      v159 = v158;
      v161 = v160;
      v162 = [CHPolygon alloc];
      v168 = (void *)objc_msgSend_initWithRect_(v162, v163, v164, v165, v166, v167, v155, v157, v159, v161);
      v174 = objc_msgSend_edgeCountIntersectingLineSegment_(v168, v169, v170, v171, v172, v173, v249, v252, v243 + v244 * 0.1, v252 - (v245 - v252) / (v243 - v249) * v249 + (v245 - v252) / (v243 - v249) * (v243 + v244 * 0.1));
      v152 = (v245 + v139) * 0.5;
      v151 += v174
            + objc_msgSend_edgeCountIntersectingLineSegment_(v168, v175, v176, v177, v178, v179, v243 - v244 * 0.1, v152- (v245 - v152) / (v243 - (v243 + v140) * 0.5) * ((v243 + v140) * 0.5)+ (v245 - v152) / (v243 - (v243 + v140) * 0.5) * (v243 - v244 * 0.1), (v243 + v140) * 0.5, v152);

      ++v153;
      --v148;
    }
    while (v148);
    v150 = (double)v151;
  }
  objc_msgSend_referenceSubstring(v8, v142, v143, v144, v145, v146);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = objc_msgSend_length(v180, v181, v182, v183, v184, v185);

  if (v186)
  {
    v192 = objc_msgSend_characterRectsInReferenceSubstring(v8, v187, v188, v189, v190, v191);
    objc_msgSend_referenceSubstring(v8, v193, v194, v195, v196, v197);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = *(double *)(v192 + 32 * objc_msgSend_length(v198, v199, v200, v201, v202, v203) - 16);

    if (v244 < v204 || v150 / (v244 * v242) * 100.0 > 0.01)
    {
      v205 = 1;
      goto LABEL_61;
    }
  }
  v209 = objc_msgSend_pointCountForStrokeIndex_(v7, v187, 0, v189, v190, v191);
  if (v209 < 1)
  {
    v215 = 0;
    v214 = 0;
    goto LABEL_60;
  }
  v210 = (double *)MEMORY[0x1E0C9D538];
  v212 = *MEMORY[0x1E0C9D538];
  v211 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v147 < (unint64_t)v149)
  {
    v213 = 0;
    v214 = 0;
    v215 = 0;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v7, v206, 0, 0, v207, v208);
    while (1)
    {
      v250 = v221;
      v253 = v220;
      v222 = v212 == *v210 && v211 == v210[1];
      if (v222
        || (v223.f32[0] = v212,
            v224 = v211,
            v223.f32[1] = v224,
            v225.f64[0] = v253,
            v225.f64[1] = v250,
            v226 = vsub_f32(v223, vcvt_f32_f64(v225)),
            sqrtf(vaddv_f32(vmul_f32(v226, v226))) >= 2.0))
      {
        v227 = v147;
        do
        {
          objc_msgSend_characterRectForCharacterIndex_(v8, v216, v227, v217, v218, v219);
          v255.y = v250;
          v255.x = v253;
          v228 = CGRectContainsPoint(v267, v255);
          v229 = ++v227 >= (unint64_t)v149 || v228;
        }
        while (v229 != 1);
        v215 += v228;
        v211 = v250;
        v212 = v253;
        if (++v213 == v209)
          goto LABEL_60;
      }
      else
      {
        ++v214;
        if (++v213 == v209)
          goto LABEL_60;
      }
      objc_msgSend_pointForStrokeIndex_pointIndex_(v7, v216, 0, v213, v218, v219);
    }
  }
  v230 = 0;
  v214 = 0;
  objc_msgSend_pointForStrokeIndex_pointIndex_(v7, v206, 0, 0, v207, v208);
  while (1)
  {
    if (v212 != *v210 || v211 != v210[1])
    {
      v237.f32[0] = v212;
      v238 = v211;
      v237.f32[1] = v238;
      v239.f64[0] = v234;
      v239.f64[1] = v235;
      v240 = vsub_f32(v237, vcvt_f32_f64(v239));
      if (sqrtf(vaddv_f32(vmul_f32(v240, v240))) < 2.0)
        break;
    }
    v211 = v235;
    v212 = v234;
    if (v209 == ++v230)
      goto LABEL_59;
LABEL_52:
    objc_msgSend_pointForStrokeIndex_pointIndex_(v7, v231, 0, v230, v232, v233);
  }
  ++v214;
  if (v209 != ++v230)
    goto LABEL_52;
LABEL_59:
  v215 = 0;
LABEL_60:
  v205 = (double)v215 / ((double)v209 - (double)v214) > 0.3;
LABEL_61:

  return v205;
}

+ (BOOL)shouldReclassifyGestureType:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x1FDu >> a3);
}

+ (BOOL)isVerticalBarShapeFromLineResult:(id)a3 originalDrawing:(id)a4 isDirectionDownward:(BOOL *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int isEqualToString;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  double v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  BOOL v85;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend_strokeCount(v8, v9, v10, v11, v12, v13) != 1
    || (unint64_t)objc_msgSend_pointCountForStrokeIndex_(v8, v14, 0, v15, v16, v17) <= 1)
  {
    v18 = 0;
    if (a5)
      *a5 = 0;
    goto LABEL_23;
  }
  v19 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  objc_msgSend_string(v19, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("Line"), v27, v28, v29))
  {

  }
  else
  {
    objc_msgSend_string(v19, v30, v31, v32, v33, v34);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v40, v41, (uint64_t)CFSTR("Manhattan Line"), v42, v43, v44);

    if (!isEqualToString)
    {
LABEL_19:
      v18 = 0;
      v85 = 0;
      goto LABEL_20;
    }
  }
  objc_msgSend_endLocation(v19, v35, v36, v37, v38, v39);
  v47 = v46;
  objc_msgSend_startLocation(v19, v48, v49, v50, v51, v52);
  v54 = v53;
  objc_msgSend_endLocation(v19, v55, v56, v57, v58, v59);
  v61 = v60;
  objc_msgSend_startLocation(v19, v62, v63, v64, v65, v66);
  v71 = v61 - v70;
  if (v71 >= 0.0)
    v72 = 0.000001;
  else
    v72 = -0.000001;
  if (v71 > -0.000001 && v71 < 0.000001)
    v71 = v72;
  if (fabs((v47 - v54) / v71) <= 2.0)
    goto LABEL_19;
  objc_msgSend_pointForStrokeIndex_pointIndex_(v8, v67, 0, 0, v68, v69);
  v75 = v74;
  v80 = objc_msgSend_pointCountForStrokeIndex_(v8, v76, 0, v77, v78, v79);
  objc_msgSend_pointForStrokeIndex_pointIndex_(v8, v81, 0, v80 - 1, v82, v83);
  v85 = v84 > v75;
  v18 = 1;
LABEL_20:
  if (a5)
    *a5 = v85;

LABEL_23:
  return v18;
}

+ (BOOL)isDrawingCenterOnBlank:(id)a3 targetContentInfo:(id)a4 insertionLocation:(int64_t *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double MaxY;
  uint64_t v46;
  double MinY;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL4 v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  double v72;
  double v73;
  BOOL v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  double v88;
  double MidX;
  double MidY;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  v7 = a3;
  v8 = a4;
  objc_msgSend_bounds(v7, v9, v10, v11, v12, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v27 = objc_msgSend_referenceSubstringRange(v8, v22, v23, v24, v25, v26);
  v29 = v28;
  v33 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v8, v28, v27, v30, v31, v32);
  if (objc_msgSend_textContentLength(v8, v34, v35, v36, v37, v38) <= 0)
    v44 = 0;
  else
    v44 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v29)
    goto LABEL_9;
  v91 = *(CGRect *)(objc_msgSend_characterRectsInReferenceSubstring(v8, v39, v40, v41, v42, v43)
                  + 32 * (_QWORD)v29
                  - 32);
  MaxY = CGRectGetMaxY(v91);
  v92.origin.x = v15;
  v92.origin.y = v17;
  v92.size.width = v19;
  v92.size.height = v21;
  if (MaxY <= CGRectGetMinY(v92))
  {
    v44 = (uint64_t)&v29[v33];
    goto LABEL_12;
  }
  v93 = *(CGRect *)objc_msgSend_characterRectsInReferenceSubstring(v8, v39, v46, v41, v42, v43);
  MinY = CGRectGetMinY(v93);
  v94.origin.x = v15;
  v94.origin.y = v17;
  v94.size.width = v19;
  v94.size.height = v21;
  if (MinY >= CGRectGetMaxY(v94))
  {
LABEL_9:
    v44 = 0;
    v52 = 1;
    if (a5)
      goto LABEL_16;
    goto LABEL_22;
  }
  v49 = objc_msgSend_characterRectsInReferenceSubstring(v8, v39, v48, v41, v42, v43);
  v95.origin.x = v15;
  v95.origin.y = v17;
  v95.size.width = v19;
  v95.size.height = v21;
  MidX = CGRectGetMidX(v95);
  v96.origin.x = v15;
  v96.origin.y = v17;
  v96.size.width = v19;
  v96.size.height = v21;
  MidY = CGRectGetMidY(v96);
  if (v33 >= (unint64_t)&v29[v33])
  {
LABEL_12:
    if ((unint64_t)(v44 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
    {
      objc_msgSend_referenceSubstring(v8, v39, v46, v41, v42, v43);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend_characterAtIndex_(v53, v54, v44 - 1, v55, v56, v57);

      objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v59, v60, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v58) = objc_msgSend_characterIsMember_(v64, v65, v58, v66, v67, v68);

      if ((_DWORD)v58)
        --v44;
    }
    v52 = 1;
    if (a5)
      goto LABEL_16;
    goto LABEL_22;
  }
  v50 = v33 + 1;
  v51 = v49 + 32 * v33 + 16;
  v88 = 1.79769313e308;
  v86 = v17;
  v87 = v15;
  v84 = v21;
  v85 = v19;
  while (1)
  {
    v75 = *(double *)(v51 - 16);
    v76 = *(double *)(v51 - 8);
    v78 = *(double *)v51;
    v77 = *(double *)(v51 + 8);
    v98.origin.x = v75;
    v98.origin.y = v76;
    v98.size.width = *(CGFloat *)v51;
    v98.size.height = v77;
    if (CGRectIsNull(v98))
      goto LABEL_28;
    v99.origin.x = v75;
    v99.origin.y = v76;
    v99.size.width = v78;
    v99.size.height = v77;
    if (CGRectGetMinY(v99) <= MidY)
    {
      v100.origin.x = v75;
      v100.origin.y = v76;
      v100.size.width = v78;
      v100.size.height = v77;
      if (CGRectGetMaxY(v100) >= MidY)
        break;
    }
    v101.origin.x = v75;
    v101.origin.y = v76;
    v101.size.width = v78;
    v101.size.height = v77;
    if (CGRectGetMinY(v101) >= MidY)
      goto LABEL_12;
LABEL_28:
    ++v50;
    v51 += 32;
    if (!--v29)
      goto LABEL_12;
  }
  v102.origin.x = v75;
  v102.origin.y = v76;
  v102.size.width = v78;
  v102.size.height = v77;
  v108.origin.x = v15;
  v108.origin.y = v17;
  v108.size.width = v19;
  v108.size.height = v21;
  v103 = CGRectIntersection(v102, v108);
  x = v103.origin.x;
  y = v103.origin.y;
  width = v103.size.width;
  height = v103.size.height;
  if (CGRectIsNull(v103))
    goto LABEL_36;
  v104.origin.y = v86;
  v104.origin.x = v87;
  v104.size.height = v84;
  v104.size.width = v85;
  v83 = CGRectGetHeight(v104);
  v105.origin.x = x;
  v105.origin.y = y;
  v105.size.width = width;
  v105.size.height = height;
  if (CGRectGetHeight(v105) < v83 * 0.3)
  {
LABEL_36:
    v106.origin.x = v75;
    v106.origin.y = v76;
    v106.size.width = v78;
    v106.size.height = v77;
    v17 = v86;
    v15 = v87;
    v21 = v84;
    v19 = v85;
    if (MidX - CGRectGetMidX(v106) >= 0.0)
    {
      v97.origin.x = v75;
      v97.origin.y = v76;
      v97.size.width = v78;
      v97.size.height = v77;
      v72 = MidX - CGRectGetMidX(v97);
    }
    else
    {
      v107.origin.x = v75;
      v107.origin.y = v76;
      v107.size.width = v78;
      v107.size.height = v77;
      v72 = -(MidX - CGRectGetMidX(v107));
    }
    v73 = v88;
    v74 = v72 < v88;
    if (v72 < v88)
      v73 = v72;
    v88 = v73;
    if (v74)
      v44 = v50;
    goto LABEL_28;
  }
  v52 = 0;
  if (!a5)
    goto LABEL_22;
LABEL_16:
  v69 = 0x7FFFFFFFFFFFFFFFLL;
  if (v44 != 0x7FFFFFFFFFFFFFFFLL && v52)
    v69 = objc_msgSend_absoluteLocationFromRelativeLocation_(v8, v39, v44, v41, v42, v43);
  *a5 = v69;
LABEL_22:

  return v52;
}

- (int64_t)gestureType
{
  return self->_gestureType;
}

- (void)setGestureType:(int64_t)a3
{
  self->_gestureType = a3;
}

- (CHTextInputTargetContentInfo)targetContentInfo
{
  return self->_targetContentInfo;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (CHDrawing)normalizedDrawing
{
  return self->_normalizedDrawing;
}

- (CHDrawing)originalDrawing
{
  return self->_originalDrawing;
}

- (BOOL)preferCharacterLevel
{
  return self->_preferCharacterLevel;
}

- (CHStroke)lastStroke
{
  return self->_lastStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textResult, 0);
  objc_storeStrong((id *)&self->_lastStroke, 0);
  objc_storeStrong((id *)&self->_originalDrawing, 0);
  objc_storeStrong((id *)&self->_normalizedDrawing, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_targetContentInfo, 0);
}

@end
