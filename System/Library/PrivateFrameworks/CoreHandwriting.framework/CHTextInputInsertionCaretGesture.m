@implementation CHTextInputInsertionCaretGesture

- (CHTextInputInsertionCaretGesture)initWithCaretTipPoint:(CGPoint)a3 targetContentInfo:(id)a4 locale:(id)a5 normalizedDrawing:(id)a6 originalDrawing:(id)a7
{
  CGFloat y;
  CGFloat x;
  CHTextInputInsertionCaretGesture *result;
  char v10;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)CHTextInputInsertionCaretGesture;
  v10 = 0;
  result = -[CHTextInputGesture initWithGestureType:targetContentInfo:locale:normalizedDrawing:originalDrawing:lastStroke:preferCharacterLevel:](&v11, sel_initWithGestureType_targetContentInfo_locale_normalizedDrawing_originalDrawing_lastStroke_preferCharacterLevel_, 8, a4, a5, a6, a7, 0, v10);
  if (result)
  {
    result->_caretTipPoint.x = x;
    result->_caretTipPoint.y = y;
  }
  return result;
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
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSUInteger v54;
  const char *v55;
  NSUInteger v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  NSUInteger length;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  CGFloat x;
  CGFloat y;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  __n128 v126;
  __n128 v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  BOOL v134;
  unint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  unint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  NSUInteger v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char isEqualToString;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  unint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  int v190;
  unint64_t v191;
  __int16 v192;
  uint64_t v193;
  uint64_t v194;
  NSRange v195;
  NSRange v196;

  v194 = *MEMORY[0x1E0C80C00];
  objc_msgSend_targetContentInfo(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceSubstringRange(v9, v10, v11, v12, v13, v14);
  v16 = v15;

  if (v16)
  {
    objc_msgSend_targetContentInfo(self, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_referenceSubstringRange(v22, v23, v24, v25, v26, v27);
    v30 = v29;

    objc_msgSend_targetContentInfo(self, v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_strokeCoveredTextRange(v36, v37, v38, v39, v40, v41);

    if (v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_targetContentInfo(self, v43, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend_strokeCoveredTextRange(v48, v49, v50, v51, v52, v53);
      v56 = (NSUInteger)v55;
      objc_msgSend_targetContentInfo(self, v55, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v196.location = objc_msgSend_referenceSubstringRange(v61, v62, v63, v64, v65, v66);
      v196.length = v67;
      v195.location = v54;
      v195.length = v56;
      length = NSIntersectionRange(v195, v196).length;

      if (!length)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v74 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v190) = 0;
          _os_log_impl(&dword_1BE607000, v74, OS_LOG_TYPE_FAULT, "The stroke covered range must be within the reference substring range", (uint8_t *)&v190, 2u);
        }

      }
      objc_msgSend_targetContentInfo(self, v69, v70, v71, v72, v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_strokeCoveredTextRange(v75, v76, v77, v78, v79, v80);
      v30 = v81;

    }
    objc_msgSend_targetContentInfo(self, v43, v44, v45, v46, v47);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v82, v83, v28, v84, v85, v86);

    objc_msgSend_targetContentInfo(self, v88, v89, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_referenceSubstring(v93, v94, v95, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    x = self->_caretTipPoint.x;
    y = self->_caretTipPoint.y;
    objc_msgSend_targetContentInfo(self, v102, v103, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend_baseWritingDirection(v107, v108, v109, v110, v111, v112);
    objc_msgSend_targetContentInfo(self, v114, v115, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend_characterRectsInReferenceSubstring(v119, v120, v121, v122, v123, v124);
    v126.n128_f64[0] = x;
    v127.n128_f64[0] = y;
    v128 = sub_1BE7306E4(v126, v127, (uint64_t)CHTextInputGesture, v99, v113, v125, v87, v30);

    v134 = v128 > 0;
    v135 = v128;
    if (v128 >= 1)
    {
      if (v128 != objc_msgSend_length(v99, v129, v130, v131, v132, v133))
      {
        v134 = 0;
        v135 = v128;
LABEL_20:
        if (v135 < objc_msgSend_length(v99, v129, v130, v131, v132, v133))
        {
LABEL_26:
          v147 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v99, v136, v135, v137, v138, v139);
          v149 = (unint64_t)v148;
          objc_msgSend_targetContentInfo(self, v148, v150, v151, v152, v153);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = objc_msgSend_absoluteLocationFromRelativeLocation_(v154, v155, v128, v156, v157, v158);

          objc_msgSend_substringWithRange_(v99, v160, v147, v149, v161, v162);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v163, v164, (uint64_t)CFSTR(" "), v165, v166, v167);

          if ((isEqualToString & 1) == 0)
          {
            LOBYTE(v190) = 0;
            sub_1BE730120((uint64_t)CHTextInputGesture, v99, v147, v149, &v190, 0);
            if ((_BYTE)v190)
            {
              v174 = (void *)objc_opt_class();
              objc_msgSend_locale(self, v175, v176, v177, v178, v179);
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              v147 = objc_msgSend_rangeOfTokenAtCharacterIndex_inString_locale_(v174, v181, v147, (uint64_t)v99, (uint64_t)v180, v182);
              v149 = v183;

            }
            objc_msgSend_targetContentInfo(self, v169, v170, v171, v172, v173);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v189 = objc_msgSend_absoluteLocationFromRelativeLocation_(v184, v185, v147, v186, v187, v188);

            if (v134 || (uint64_t)(v159 - v189) > (uint64_t)(v149 - v159 + v189))
              v189 += v149;
            v159 = v189;
          }
          if (a3)
          {
            a3->location = v159;
            a3->length = 0;
          }
          if (a4)
            *a4 = 0;

          return;
        }
LABEL_21:
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v140 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v140, OS_LOG_TYPE_FAULT))
        {
          v146 = objc_msgSend_length(v99, v141, v142, v143, v144, v145);
          v190 = 134218240;
          v191 = v135;
          v192 = 2048;
          v193 = v146;
          _os_log_impl(&dword_1BE607000, v140, OS_LOG_TYPE_FAULT, "The computed character index (%li) must be valid in the string (length=%li)", (uint8_t *)&v190, 0x16u);
        }

        goto LABEL_26;
      }
      v135 = objc_msgSend_length(v99, v129, v130, v131, v132, v133) - 1;
    }
    if ((v135 & 0x8000000000000000) != 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (a3)
    *a3 = (_NSRange)xmmword_1BE8D6920;
  if (a4)
    *a4 = 0;
}

- (int64_t)caretDirection
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGPoint *p_caretTipPoint;
  double v22;
  double *v23;
  double *v24;
  _QWORD *v25;
  double v26;
  double *v27;
  double *v28;
  double *v29;
  double *v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  double *v36;
  int64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  char *v42;
  double *v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _QWORD *v47;
  double v48;
  double *v49;
  double *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _BYTE *v54;
  double *v55;
  double *v56;
  int64_t v57;
  unint64_t v58;
  double *v59;
  uint64_t v60;
  uint64_t v61;
  _OWORD *v62;
  double *v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  _QWORD *v67;
  double v68;
  double *v69;
  double *v70;
  int64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  BOOL v75;
  unint64_t v76;
  char *v77;
  double *v78;
  int64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double *v83;
  char *v84;
  double *v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  BOOL v89;
  double *v90;
  double *v91;
  double v92;
  double *v93;
  double v94;
  double v95;
  int64_t v96;
  double *v98;
  double *v99;
  CGRect v100;
  CGRect v101;

  objc_msgSend_originalDrawing(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v7, v8, v9, v10, v11, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  p_caretTipPoint = &self->_caretTipPoint;
  v22 = vabdd_f64(v16, self->_caretTipPoint.y);
  v23 = (double *)operator new(8uLL);
  *v23 = v22;
  v24 = v23 + 1;
  v98 = v23;
  v99 = v23 + 1;
  v25 = operator new(8uLL);
  *v25 = 2;
  v100.origin.x = v14;
  v100.origin.y = v16;
  v100.size.width = v18;
  v100.size.height = v20;
  v26 = vabdd_f64(CGRectGetMaxY(v100), p_caretTipPoint->y);
  v28 = v24;
  v27 = v99;
  if (v24 < v99)
  {
    *v24 = v26;
    v29 = v24 + 1;
    goto LABEL_22;
  }
  v30 = v98;
  v31 = (char *)v24 - (char *)v98;
  v32 = v24 - v98;
  v33 = v32 + 1;
  if ((unint64_t)(v32 + 1) >> 61)
    sub_1BE61F930();
  if (((char *)v99 - (char *)v98) >> 2 > v33)
    v33 = ((char *)v99 - (char *)v98) >> 2;
  if ((unint64_t)((char *)v99 - (char *)v98) >= 0x7FFFFFFFFFFFFFF8)
    v34 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v34 = v33;
  if (v34)
  {
    if (v34 >> 61)
      sub_1BE61F100();
    v35 = (char *)operator new(8 * v34);
    v36 = (double *)&v35[8 * v32];
    v27 = (double *)&v35[8 * v34];
    *v36 = v26;
    v29 = v36 + 1;
    v37 = (char *)v28 - (char *)v98;
    if (v28 == v98)
      goto LABEL_20;
    goto LABEL_14;
  }
  v35 = 0;
  v36 = (double *)(8 * v32);
  v27 = 0;
  *(double *)(8 * v32) = v26;
  v29 = (double *)(8 * v32 + 8);
  v37 = (char *)v28 - (char *)v98;
  if (v28 != v98)
  {
LABEL_14:
    v38 = v37 - 8;
    if (v38 < 0x58)
      goto LABEL_87;
    if ((unint64_t)((char *)v28 - v35 - v31) < 0x20)
      goto LABEL_87;
    v39 = (v38 >> 3) + 1;
    v40 = 8 * (v39 & 0x3FFFFFFFFFFFFFFCLL);
    v41 = &v28[v40 / 0xFFFFFFFFFFFFFFF8];
    v36 = (double *)((char *)v36 - v40);
    v42 = &v35[8 * v32 - 16];
    v43 = v28 - 2;
    v44 = v39 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v45 = *(_OWORD *)v43;
      *((_OWORD *)v42 - 1) = *((_OWORD *)v43 - 1);
      *(_OWORD *)v42 = v45;
      v42 -= 32;
      v43 -= 4;
      v44 -= 4;
    }
    while (v44);
    v28 = v41;
    if (v39 != (v39 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_87:
      do
      {
        v46 = *((_QWORD *)v28-- - 1);
        *((_QWORD *)v36-- - 1) = v46;
      }
      while (v28 != v98);
    }
  }
LABEL_20:
  v98 = v36;
  v99 = v27;
  if (v30)
    operator delete(v30);
LABEL_22:
  v47 = operator new(0x10uLL);
  *v47 = *v25;
  v47[1] = 1;
  operator delete(v25);
  v48 = vabdd_f64(v14, p_caretTipPoint->x);
  if (v29 < v27)
  {
    *v29 = v48;
    v49 = v29 + 1;
    goto LABEL_45;
  }
  v50 = v98;
  v51 = v29 - v98;
  v52 = v51 + 1;
  if ((unint64_t)(v51 + 1) >> 61)
    sub_1BE61F930();
  if (((char *)v27 - (char *)v98) >> 2 > v52)
    v52 = ((char *)v27 - (char *)v98) >> 2;
  if ((unint64_t)((char *)v27 - (char *)v98) >= 0x7FFFFFFFFFFFFFF8)
    v53 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v53 = v52;
  if (v53)
  {
    if (v53 >> 61)
      sub_1BE61F100();
    v54 = operator new(8 * v53);
    v55 = (double *)&v54[8 * v51];
    v56 = (double *)&v54[8 * v53];
    *v55 = v48;
    v49 = v55 + 1;
    v57 = (char *)v29 - (char *)v98;
    if (v29 == v98)
      goto LABEL_43;
  }
  else
  {
    v54 = 0;
    v55 = (double *)(8 * v51);
    v56 = 0;
    *(double *)(8 * v51) = v48;
    v49 = (double *)(8 * v51 + 8);
    v57 = (char *)v29 - (char *)v98;
    if (v29 == v98)
      goto LABEL_43;
  }
  v58 = v57 - 8;
  if (v58 < 0x58)
  {
    v59 = v29;
    goto LABEL_42;
  }
  if ((unint64_t)((char *)v98 - v54) < 0x20)
  {
    v59 = v29;
    do
    {
LABEL_42:
      v66 = *((_QWORD *)v59-- - 1);
      *((_QWORD *)v55-- - 1) = v66;
    }
    while (v59 != v98);
    goto LABEL_43;
  }
  v60 = (v58 >> 3) + 1;
  v61 = 8 * (v60 & 0x3FFFFFFFFFFFFFFCLL);
  v59 = &v29[v61 / 0xFFFFFFFFFFFFFFF8];
  v55 = (double *)((char *)v55 - v61);
  v62 = &v54[8 * v51 - 16];
  v63 = v29 - 2;
  v64 = v60 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v65 = *(_OWORD *)v63;
    *(v62 - 1) = *((_OWORD *)v63 - 1);
    *v62 = v65;
    v62 -= 2;
    v63 -= 4;
    v64 -= 4;
  }
  while (v64);
  if (v60 != (v60 & 0x3FFFFFFFFFFFFFFCLL))
    goto LABEL_42;
LABEL_43:
  v98 = v55;
  v99 = v56;
  if (v50)
    operator delete(v50);
LABEL_45:
  v67 = operator new(0x20uLL);
  v67[2] = 3;
  *(_OWORD *)v67 = *(_OWORD *)v47;
  operator delete(v47);
  v101.origin.x = v14;
  v101.origin.y = v16;
  v101.size.width = v18;
  v101.size.height = v20;
  v68 = vabdd_f64(CGRectGetMaxX(v101), p_caretTipPoint->x);
  v69 = v49;
  if (v49 < v99)
  {
    *v49 = v68;
    v70 = v98;
    goto LABEL_67;
  }
  v71 = (char *)v49 - (char *)v98;
  v72 = v49 - v98;
  v73 = v72 + 1;
  if ((unint64_t)(v72 + 1) >> 61)
    sub_1BE61F930();
  v74 = (char *)v99 - (char *)v98;
  if (((char *)v99 - (char *)v98) >> 2 > v73)
    v73 = v74 >> 2;
  v75 = (unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8;
  v76 = 0x1FFFFFFFFFFFFFFFLL;
  if (!v75)
    v76 = v73;
  if (v76)
  {
    if (v76 >> 61)
      sub_1BE61F100();
    v77 = (char *)operator new(8 * v76);
    v78 = (double *)&v77[8 * v72];
    *v78 = v68;
    v70 = v78;
    v79 = (char *)v69 - (char *)v98;
    if (v69 == v98)
      goto LABEL_64;
  }
  else
  {
    v77 = 0;
    v78 = (double *)(8 * v72);
    *(double *)(8 * v72) = v68;
    v70 = (double *)(8 * v72);
    v79 = (char *)v69 - (char *)v98;
    if (v69 == v98)
      goto LABEL_64;
  }
  v80 = v79 - 8;
  if (v80 >= 0x58)
  {
    v70 = v78;
    if ((unint64_t)((char *)v69 - &v77[v71]) >= 0x20)
    {
      v81 = (v80 >> 3) + 1;
      v82 = 8 * (v81 & 0x3FFFFFFFFFFFFFFCLL);
      v83 = &v69[v82 / 0xFFFFFFFFFFFFFFF8];
      v70 = &v78[v82 / 0xFFFFFFFFFFFFFFF8];
      v84 = &v77[8 * v72 - 16];
      v85 = v69 - 2;
      v86 = v81 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v87 = *(_OWORD *)v85;
        *((_OWORD *)v84 - 1) = *((_OWORD *)v85 - 1);
        *(_OWORD *)v84 = v87;
        v84 -= 32;
        v85 -= 4;
        v86 -= 4;
      }
      while (v86);
      v69 = v83;
      if (v81 == (v81 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_64;
    }
  }
  else
  {
    v70 = v78;
  }
  do
  {
    v88 = *((_QWORD *)v69-- - 1);
    *((_QWORD *)v70-- - 1) = v88;
  }
  while (v69 != v98);
LABEL_64:
  if (v98)
    operator delete(v98);
  v69 = v78;
LABEL_67:
  v67[3] = 4;
  v89 = v70 == v69 + 1 || v70 == v69;
  v90 = v70;
  if (!v89)
  {
    v91 = v70 + 1;
    v92 = *v70;
    v90 = v70;
    v93 = v70 + 1;
    do
    {
      v94 = *v93++;
      v95 = v94;
      if (v94 < v92)
      {
        v92 = v95;
        v90 = v91;
      }
      v89 = v91 == v69;
      v91 = v93;
    }
    while (!v89);
  }
  v96 = *(_QWORD *)((char *)v67 + (((char *)v90 - (char *)v70) << 29 >> 29));
  operator delete(v67);
  if (v70)
    operator delete(v70);
  return v96;
}

- (CGPoint)caretTipPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_caretTipPoint.x;
  y = self->_caretTipPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
