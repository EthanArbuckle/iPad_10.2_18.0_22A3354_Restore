@implementation CHTokenizedTextResultToken

- (CHTokenizedTextResultToken)init
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
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  CHTokenizedTextResultToken *v19;
  _QWORD v21[16];

  objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v8, (uint64_t)&stru_1E77F6F28, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9D628];
  v14 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  v17 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  v21[0] = *MEMORY[0x1E0C9D538];
  v21[1] = v17;
  v21[2] = v21[0];
  v21[3] = v17;
  v21[4] = v21[0];
  v21[5] = v17;
  v21[6] = v21[0];
  v21[7] = v17;
  v21[8] = v21[0];
  v21[9] = v17;
  v21[10] = v21[0];
  v21[11] = v17;
  v21[12] = v21[0];
  v21[13] = v17;
  v21[14] = v21[0];
  v21[15] = v17;
  v19 = (CHTokenizedTextResultToken *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(self, v18, (uint64_t)&stru_1E77F6F28, (uint64_t)v7, 0, 0, v12, 0, 0.0, 0.0, 0.0, 0.0, 0, v13, v14, v15, v16, v21);

  return v19;
}

- (CHTokenizedTextResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  CHTokenizedTextResultToken *v23;
  _QWORD v25[16];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v13, (uint64_t)&stru_1E77F6F28, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C9D628];
  v19 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 8);
  v20 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  v21 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  v25[0] = *MEMORY[0x1E0C9D538];
  v25[1] = v21;
  v25[2] = v25[0];
  v25[3] = v21;
  v25[4] = v25[0];
  v25[5] = v21;
  v25[6] = v25[0];
  v25[7] = v21;
  v25[8] = v25[0];
  v25[9] = v21;
  v25[10] = v25[0];
  v25[11] = v21;
  v25[12] = v25[0];
  v25[13] = v21;
  v25[14] = v25[0];
  v25[15] = v21;
  v23 = (CHTokenizedTextResultToken *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(self, v22, (uint64_t)v11, (uint64_t)v12, 0, 0, v17, 0, 0.0, 0.0, 0.0, 0.0, x, y, width, height, 0, v18, v19,
                                        v20,
                                        v25);

  return v23;
}

- (CHTokenizedTextResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 wordID:(unsigned int)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(unint64_t)a10 recognizerSourceLocale:(id)a11 inputSources:(unint64_t)a12 substrokeCount:(int64_t)a13 bounds:(CGRect)a14
{
  uint64_t v16;
  double y;
  double x;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  const char *v32;
  CHTokenizedTextResultToken *v33;
  __int128 v35;
  double width;
  double height;
  _QWORD v38[16];

  v16 = *(_QWORD *)&a5;
  width = a14.size.width;
  height = a14.size.height;
  y = a14.origin.y;
  x = a14.origin.x;
  v26 = *MEMORY[0x1E0C9D628];
  v35 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 8);
  v27 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  v28 = a11;
  v29 = a4;
  v30 = a3;
  v31 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  v38[0] = *MEMORY[0x1E0C9D538];
  v38[1] = v31;
  v38[2] = v38[0];
  v38[3] = v31;
  v38[4] = v38[0];
  v38[5] = v31;
  v38[6] = v38[0];
  v38[7] = v31;
  v38[8] = v38[0];
  v38[9] = v31;
  v38[10] = v38[0];
  v38[11] = v31;
  v38[12] = v38[0];
  v38[13] = v31;
  v38[14] = v38[0];
  v38[15] = v31;
  v33 = (CHTokenizedTextResultToken *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(self, v32, (uint64_t)v30, (uint64_t)v29, v16, a10, v28, a12, a6, a7, a8, a9, x, y, width, height, a13, v26, v35,
                                        v27,
                                        v38);

  return v33;
}

- (_DWORD)initWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(int)a13 bounds:(uint64_t)a14 originalBounds:(void *)a15 principalLines:(uint64_t)a16
{
  id v36;
  id v37;
  id v38;
  _DWORD *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _DWORD *v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v55;

  v36 = a11;
  v37 = a12;
  v38 = a15;
  v55.receiver = a1;
  v55.super_class = (Class)CHTokenizedTextResultToken;
  v39 = objc_msgSendSuper2(&v55, sel_initWithString_strokeIndexes_bounds_, v36, v37, a6, a7, a8, a9);
  v45 = v39;
  if (v39)
  {
    v39[14] = a13;
    *((double *)v39 + 8) = a2;
    *((double *)v39 + 9) = a3;
    *((double *)v39 + 10) = a4;
    *((double *)v39 + 11) = a5;
    *((_QWORD *)v39 + 12) = a14;
    v46 = objc_msgSend_copy(v38, v40, v41, v42, v43, v44);
    v47 = (void *)*((_QWORD *)v45 + 13);
    *((_QWORD *)v45 + 13) = v46;

    *((_QWORD *)v45 + 14) = a16;
    *((_QWORD *)v45 + 15) = a17;
    *((_QWORD *)v45 + 16) = a18;
    *((_QWORD *)v45 + 17) = a19;
    *((_QWORD *)v45 + 18) = a20;
    *((_QWORD *)v45 + 19) = a21;
    v49 = a22[4];
    v48 = a22[5];
    v50 = a22[7];
    *((_OWORD *)v45 + 16) = a22[6];
    *((_OWORD *)v45 + 17) = v50;
    *((_OWORD *)v45 + 14) = v49;
    *((_OWORD *)v45 + 15) = v48;
    v52 = *a22;
    v51 = a22[1];
    v53 = a22[3];
    *((_OWORD *)v45 + 12) = a22[2];
    *((_OWORD *)v45 + 13) = v53;
    *((_OWORD *)v45 + 10) = v52;
    *((_OWORD *)v45 + 11) = v51;
  }

  return v45;
}

+ (unint64_t)makeOriginalToken:(unint64_t)a3
{
  return a3 & 0xFFFFFFFFFFFFFE03 | 4;
}

- (double)heuristicTextScore
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v7 = objc_msgSend_properties(self, a2, v2, v3, v4, v5);
  v13 = objc_msgSend_properties(self, v8, v9, v10, v11, v12);
  objc_msgSend_string(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_length(v19, v20, v21, v22, v23, v24);

  v31 = 0.0;
  if (v7 & 4 | (unint64_t)(v13 & 0x40))
  {
    objc_msgSend_string(self, v26, v27, v28, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (double)(unint64_t)objc_msgSend_length(v32, v33, v34, v35, v36, v37);

  }
  return v31 + (double)(unint64_t)v25;
}

- (CHTokenizedTextResultToken)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHTokenizedTextResultToken *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSLocale *recognizerSourceLocale;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CGPoint *v48;
  CGSize v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  CGSize v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSString *v63;
  double v64;
  double v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSString *v70;
  double v71;
  double v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  NSString *v77;
  double v78;
  double v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  NSString *v84;
  double v85;
  double v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  NSString *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  NSString *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  NSString *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  NSString *v106;
  double v107;
  double v108;
  CHTokenizedTextResultToken *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  objc_super v140;
  objc_super v141;
  objc_super v142;
  objc_super v143;
  float *v144;
  float *v145;

  v4 = a3;
  v143.receiver = self;
  v143.super_class = (Class)CHTokenizedTextResultToken;
  v9 = -[CHTokenizedResultToken initWithCoder:](&v143, sel_initWithCoder_, v4);
  if (!v9)
    goto LABEL_39;
  v9->_wordID = objc_msgSend_decodeInt32ForKey_(v4, v5, (uint64_t)CFSTR("wordID"), v6, v7, v8);
  objc_msgSend_decodeDoubleForKey_(v4, v10, (uint64_t)CFSTR("modelScore"), v11, v12, v13);
  v9->_modelScore = v14;
  objc_msgSend_decodeDoubleForKey_(v4, v15, (uint64_t)CFSTR("recognitionScore"), v16, v17, v18);
  v9->_recognitionScore = v19;
  objc_msgSend_decodeDoubleForKey_(v4, v20, (uint64_t)CFSTR("combinedScore"), v21, v22, v23);
  v9->_combinedScore = v24;
  objc_msgSend_decodeDoubleForKey_(v4, v25, (uint64_t)CFSTR("alignmentScore"), v26, v27, v28);
  v9->_alignmentScore = v29;
  v9->_properties = objc_msgSend_decodeIntegerForKey_(v4, v30, (uint64_t)CFSTR("properties"), v31, v32, v33);
  v34 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("recognizerSourceLocale"), v36, v37);
  v38 = objc_claimAutoreleasedReturnValue();
  recognizerSourceLocale = v9->_recognizerSourceLocale;
  v9->_recognizerSourceLocale = (NSLocale *)v38;

  v9->_inputSources = objc_msgSend_decodeIntegerForKey_(v4, v40, (uint64_t)CFSTR("inputSources"), v41, v42, v43);
  v9->_substrokeCount = objc_msgSend_decodeIntegerForKey_(v4, v44, (uint64_t)CFSTR("substrokeCount"), v45, v46, v47);
  v48 = (CGPoint *)MEMORY[0x1E0C9D628];
  v49 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v9->_originalBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v9->_originalBounds.size = v49;
  v50 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, (uint64_t)CFSTR("originalBounds"), v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v54, v55, (uint64_t)&v9->_originalBounds, 32, v56, v57);
  if (CGRectEqualToRect(v9->_originalBounds, *MEMORY[0x1E0C9D648]))
  {
    v58 = (CGSize)v48[1];
    v9->_originalBounds.origin = *v48;
    v9->_originalBounds.size = v58;
  }
  v59 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, (uint64_t)CFSTR("PrincipalLineTopStart"), v61, v62);
  v63 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v63, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    v64 = *v144;
    v65 = v144[1];
  }
  else
  {
    v64 = *MEMORY[0x1E0C9D538];
    v65 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (!v144)
      goto LABEL_8;
  }
  v145 = v144;
  operator delete(v144);
LABEL_8:

  v66 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, (uint64_t)CFSTR("PrincipalLineTopEnd"), v68, v69);
  v70 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v70, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    v71 = *v144;
    v72 = v144[1];
  }
  else
  {
    v71 = *MEMORY[0x1E0C9D538];
    v72 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (!v144)
      goto LABEL_12;
  }
  v145 = v144;
  operator delete(v144);
LABEL_12:

  v73 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v74, v73, (uint64_t)CFSTR("PrincipalLineMidStart"), v75, v76);
  v77 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v77, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    v78 = *v144;
    v79 = v144[1];
  }
  else
  {
    v78 = *MEMORY[0x1E0C9D538];
    v79 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (!v144)
      goto LABEL_16;
  }
  v145 = v144;
  operator delete(v144);
LABEL_16:

  v80 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, (uint64_t)CFSTR("PrincipalLineMidEnd"), v82, v83);
  v84 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v84, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    v85 = *v144;
    v86 = v144[1];
  }
  else
  {
    v85 = *MEMORY[0x1E0C9D538];
    v86 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (!v144)
      goto LABEL_20;
  }
  v145 = v144;
  operator delete(v144);
LABEL_20:

  v87 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, (uint64_t)CFSTR("PrincipalLineBaseStart"), v89, v90);
  v91 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v91, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    v138 = v144[1];
    v139 = *v144;
  }
  else
  {
    v138 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v139 = *MEMORY[0x1E0C9D538];
    if (!v144)
      goto LABEL_24;
  }
  v145 = v144;
  operator delete(v144);
LABEL_24:

  v92 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, (uint64_t)CFSTR("PrincipalLineBaseEnd"), v94, v95);
  v96 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v96, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    v136 = v144[1];
    v137 = *v144;
  }
  else
  {
    v136 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v137 = *MEMORY[0x1E0C9D538];
    if (!v144)
      goto LABEL_28;
  }
  v145 = v144;
  operator delete(v144);
LABEL_28:

  v97 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v98, v97, (uint64_t)CFSTR("PrincipalLineDescStart"), v99, v100);
  v101 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v101, (char **)&v144);
  if ((char *)v145 - (char *)v144 == 8)
  {
    v134 = v144[1];
    v135 = *v144;
  }
  else
  {
    v134 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v135 = *MEMORY[0x1E0C9D538];
    if (!v144)
      goto LABEL_32;
  }
  v145 = v144;
  operator delete(v144);
LABEL_32:

  v102 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v103, v102, (uint64_t)CFSTR("PrincipalLineDescEnd"), v104, v105);
  v106 = (NSString *)objc_claimAutoreleasedReturnValue();
  parseFloatsFromString(v106, (char **)&v144);
  v132 = v86;
  v133 = v72;
  if ((char *)v145 - (char *)v144 == 8)
  {
    v107 = *v144;
    v108 = v144[1];
LABEL_35:
    v145 = v144;
    operator delete(v144);
    goto LABEL_36;
  }
  v107 = *MEMORY[0x1E0C9D538];
  v108 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v144)
    goto LABEL_35;
LABEL_36:

  v9->_principalLines.descender.start.x = v135;
  v9->_principalLines.descender.start.y = v134;
  v9->_principalLines.descender.end.x = v107;
  v9->_principalLines.descender.end.y = v108;
  v9->_principalLines.base.start.x = v139;
  v9->_principalLines.base.start.y = v138;
  v9->_principalLines.base.end.x = v137;
  v9->_principalLines.base.end.y = v136;
  v9->_principalLines.median.start.x = v78;
  v9->_principalLines.median.start.y = v79;
  v9->_principalLines.median.end.x = v85;
  v9->_principalLines.median.end.y = v132;
  v9->_principalLines.top.start.x = v64;
  v9->_principalLines.top.start.y = v65;
  v9->_principalLines.top.end.x = v71;
  v9->_principalLines.top.end.y = v133;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v109 = v9;
    v142.receiver = v109;
    v142.super_class = (Class)CHTokenizedTextResultToken;
    -[CHTokenizedResultToken string](&v142, sel_string);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setString_(v109, v111, (uint64_t)v110, v112, v113, v114);

    v141.receiver = v109;
    v141.super_class = (Class)CHTokenizedTextResultToken;
    -[CHTokenizedResultToken strokeIndexes](&v141, sel_strokeIndexes);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStrokeIndexes_(v109, v116, (uint64_t)v115, v117, v118, v119);

    v140.receiver = v109;
    v140.super_class = (Class)CHTokenizedTextResultToken;
    -[CHTokenizedResultToken bounds](&v140, sel_bounds);
    objc_msgSend_setBounds_(v109, v120, v121, v122, v123, v124);
    v130 = objc_msgSend_copy(v109, v125, v126, v127, v128, v129);

    v9 = (CHTokenizedTextResultToken *)v130;
  }

LABEL_39:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  $6B0D29254125F4CF859F8A895EF46F9A *p_principalLines;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
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
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  objc_super v124;

  v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)CHTokenizedTextResultToken;
  -[CHTokenizedResultToken encodeWithCoder:](&v124, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInt32_forKey_(v4, v5, self->_wordID, (uint64_t)CFSTR("wordID"), v6, v7);
  objc_msgSend_encodeDouble_forKey_(v4, v8, (uint64_t)CFSTR("modelScore"), v9, v10, v11, self->_modelScore);
  objc_msgSend_encodeDouble_forKey_(v4, v12, (uint64_t)CFSTR("recognitionScore"), v13, v14, v15, self->_recognitionScore);
  objc_msgSend_encodeDouble_forKey_(v4, v16, (uint64_t)CFSTR("combinedScore"), v17, v18, v19, self->_combinedScore);
  objc_msgSend_encodeDouble_forKey_(v4, v20, (uint64_t)CFSTR("alignmentScore"), v21, v22, v23, self->_alignmentScore);
  objc_msgSend_encodeInteger_forKey_(v4, v24, self->_properties, (uint64_t)CFSTR("properties"), v25, v26);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)self->_recognizerSourceLocale, (uint64_t)CFSTR("recognizerSourceLocale"), v28, v29);
  objc_msgSend_encodeInteger_forKey_(v4, v30, self->_inputSources, (uint64_t)CFSTR("inputSources"), v31, v32);
  objc_msgSend_encodeInteger_forKey_(v4, v33, self->_substrokeCount, (uint64_t)CFSTR("substrokeCount"), v34, v35);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v36, (uint64_t)&self->_originalBounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_encodeObject_forKey_(v4, v40, (uint64_t)v39, (uint64_t)CFSTR("originalBounds"), v41, v42);
  p_principalLines = &self->_principalLines;
  pointToString(self->_principalLines.top.start, v43, v45, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v50, (uint64_t)CFSTR("PrincipalLineTopStart"), v52, v53);

  pointToString(p_principalLines->top.end, v54, v55, v56, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v61, (uint64_t)v60, (uint64_t)CFSTR("PrincipalLineTopEnd"), v62, v63);

  pointToString(p_principalLines->median.start, v64, v65, v66, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v71, (uint64_t)v70, (uint64_t)CFSTR("PrincipalLineMidStart"), v72, v73);

  pointToString(p_principalLines->median.end, v74, v75, v76, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v81, (uint64_t)v80, (uint64_t)CFSTR("PrincipalLineMidEnd"), v82, v83);

  pointToString(p_principalLines->base.start, v84, v85, v86, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v91, (uint64_t)v90, (uint64_t)CFSTR("PrincipalLineBaseStart"), v92, v93);

  pointToString(p_principalLines->base.end, v94, v95, v96, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v101, (uint64_t)v100, (uint64_t)CFSTR("PrincipalLineBaseEnd"), v102, v103);

  pointToString(p_principalLines->descender.start, v104, v105, v106, v107, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v111, (uint64_t)v110, (uint64_t)CFSTR("PrincipalLineDescStart"), v112, v113);

  pointToString(p_principalLines->descender.end, v114, v115, v116, v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v121, (uint64_t)v120, (uint64_t)CFSTR("PrincipalLineDescEnd"), v122, v123);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tokenWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(uint64_t)a13 bounds:(uint64_t)a14 originalBounds:(void *)a15 principalLines:(uint64_t)a16
{
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const char *v40;
  void *v41;
  _OWORD v47[8];

  v32 = a11;
  v33 = a12;
  v34 = a15;
  v35 = [a1 alloc];
  v36 = a22[5];
  v47[4] = a22[4];
  v47[5] = v36;
  v37 = a22[7];
  v47[6] = a22[6];
  v47[7] = v37;
  v38 = a22[1];
  v47[0] = *a22;
  v47[1] = v38;
  v39 = a22[3];
  v47[2] = a22[2];
  v47[3] = v39;
  v41 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v35, v40, (uint64_t)v32, (uint64_t)v33, a13, a14, v34, a16, a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19,
                  a20,
                  a21,
                  v47);

  return v41;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CHMutableTokenizedTextResultToken *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t wordID;
  double modelScore;
  double recognitionScore;
  double combinedScore;
  double alignmentScore;
  unint64_t properties;
  NSLocale *recognizerSourceLocale;
  unint64_t inputSources;
  int64_t substrokeCount;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat x;
  __int128 v38;
  CGFloat height;
  CGPoint end;
  CGPoint v41;
  CGPoint v42;
  CGPoint v43;
  const char *v44;
  double v45;
  void *v46;
  _OWORD v48[8];

  v4 = [CHMutableTokenizedTextResultToken alloc];
  objc_msgSend_string(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIndexes(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  wordID = self->_wordID;
  modelScore = self->_modelScore;
  recognitionScore = self->_recognitionScore;
  combinedScore = self->_combinedScore;
  alignmentScore = self->_alignmentScore;
  properties = self->_properties;
  recognizerSourceLocale = self->_recognizerSourceLocale;
  inputSources = self->_inputSources;
  substrokeCount = self->_substrokeCount;
  objc_msgSend_bounds(self, v26, v27, v28, v29, v30);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  x = self->_originalBounds.origin.x;
  v38 = *(_OWORD *)&self->_originalBounds.origin.y;
  height = self->_originalBounds.size.height;
  end = self->_principalLines.median.end;
  v48[4] = self->_principalLines.median.start;
  v48[5] = end;
  v41 = self->_principalLines.top.end;
  v48[6] = self->_principalLines.top.start;
  v48[7] = v41;
  v42 = self->_principalLines.descender.end;
  v48[0] = self->_principalLines.descender.start;
  v48[1] = v42;
  v43 = self->_principalLines.base.end;
  v48[2] = self->_principalLines.base.start;
  v48[3] = v43;
  v46 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v4, v44, (uint64_t)v10, (uint64_t)v16, wordID, properties, recognizerSourceLocale, inputSources, modelScore, recognitionScore, combinedScore, alignmentScore, v32, v34, v36, v45, substrokeCount, *(_QWORD *)&x, v38,
                  *(_QWORD *)&height,
                  v48);

  return v46;
}

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t inputSources;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_super v35;

  if ((self->_properties & 2) != 0)
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v4 = v3;
  if ((self->_properties & 4) != 0)
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  v6 = v5;
  if ((self->_properties & 0x100) != 0)
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  v8 = v7;
  if ((self->_properties & 8) != 0)
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  v10 = v9;
  if ((self->_properties & 0x10) != 0)
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  v12 = v11;
  if ((self->_properties & 0x20) != 0)
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  v14 = v13;
  objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v15, (uint64_t)&stru_1E77F6F28, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v19;
  inputSources = self->_inputSources;
  if ((inputSources & 4) != 0)
  {
    objc_msgSend_appendString_(v19, v20, (uint64_t)CFSTR(" Top Model Result,"), v22, v23, v24);
  }
  else
  {
    if ((inputSources & 2) == 0)
      goto LABEL_24;
    objc_msgSend_appendString_(v19, v20, (uint64_t)CFSTR(" Model Result,"), v22, v23, v24);
  }
  inputSources = self->_inputSources;
LABEL_24:
  if ((inputSources & 0x10) != 0)
  {
    objc_msgSend_appendString_(v25, v20, (uint64_t)CFSTR(" Text Replacement,"), v22, v23, v24);
    inputSources = self->_inputSources;
  }
  if ((inputSources & 8) != 0)
  {
    objc_msgSend_appendString_(v25, v20, (uint64_t)CFSTR(" Transliteration,"), v22, v23, v24);
    inputSources = self->_inputSources;
  }
  if ((inputSources & 0x20) != 0)
  {
    objc_msgSend_appendString_(v25, v20, (uint64_t)CFSTR(" Spell Correction,"), v22, v23, v24);
    inputSources = self->_inputSources;
  }
  if ((inputSources & 0x80) != 0)
  {
    objc_msgSend_appendString_(v25, v20, (uint64_t)CFSTR(" Confusion Correction,"), v22, v23, v24);
    inputSources = self->_inputSources;
  }
  if ((inputSources & 0x40) != 0)
  {
    objc_msgSend_appendString_(v25, v20, (uint64_t)CFSTR(" Lexicon Correction,"), v22, v23, v24);
    inputSources = self->_inputSources;
  }
  if ((inputSources & 0x100) != 0)
  {
    objc_msgSend_appendString_(v25, v20, (uint64_t)CFSTR(" Case Correction,"), v22, v23, v24);
    inputSources = self->_inputSources;
  }
  if ((inputSources & 0x200) != 0)
  {
    objc_msgSend_appendString_(v25, v20, (uint64_t)CFSTR(" Space Correction,"), v22, v23, v24);
    inputSources = self->_inputSources;
  }
  if ((inputSources & 0x800) != 0)
    objc_msgSend_appendString_(v25, v20, (uint64_t)CFSTR(" Other,"), v22, v23, v24);
  objc_msgSend_localeIdentifier(self->_recognizerSourceLocale, v20, v21, v22, v23, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)CHTokenizedTextResultToken;
  -[CHTokenizedResultToken description](&v35, sel_description);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v28, v29, (uint64_t)CFSTR(", substrokeCount: %ld, wordID: %d, modelScore: %0.4f, recognitionScore: %0.4f, combinedScore: %0.4f, alignmentScore: %0.4f, rare: %@, lexicon: %@, lexiconMatching: %@, pattern: %@, inappropriate: %@, precedingSpace: %@, inputSources: {%@}, recognizerSourceLocale: %@"), v30, v31, v32, self->_substrokeCount, self->_wordID, *(_QWORD *)&self->_modelScore, *(_QWORD *)&self->_recognitionScore, *(_QWORD *)&self->_combinedScore, *(_QWORD *)&self->_alignmentScore, v4, v6, v8, v10, v12, v14, v25,
    v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (BOOL)isEquivalentToToken:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t properties;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int isEqual;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t inputSources;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  objc_super v49;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v49.receiver = self,
        v49.super_class = (Class)CHTokenizedTextResultToken,
        -[CHTokenizedResultToken isEquivalentToToken:](&v49, sel_isEquivalentToToken_, v4)))
  {
    v5 = v4;
    v11 = objc_msgSend_properties(v5, v6, v7, v8, v9, v10);
    properties = self->_properties;
    objc_msgSend_recognizerSourceLocale(v5, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v18, v19, (uint64_t)self->_recognizerSourceLocale, v20, v21, v22);

    v29 = objc_msgSend_inputSources(v5, v24, v25, v26, v27, v28);
    inputSources = self->_inputSources;
    v41 = 0;
    if (objc_msgSend_wordID(v5, v31, v32, v33, v34, v35) == self->_wordID
      && v11 == properties
      && ((isEqual ^ 1) & 1) == 0
      && v29 == inputSources)
    {
      v42 = objc_msgSend_substrokeCount(v5, v36, v37, v38, v39, v40);
      v41 = v42 == objc_msgSend_substrokeCount(self, v43, v44, v45, v46, v47);
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (unint64_t)inputSourceModifiersCount
{
  unint64_t *p_inputSources;
  uint64x2_t v3;
  int8x16_t v4;

  p_inputSources = &self->_inputSources;
  v3 = (uint64x2_t)vld1q_dup_f64((const double *)p_inputSources);
  v4 = (int8x16_t)vdupq_n_s64(1uLL);
  return vaddvq_s64(vaddq_s64(vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1BE8D51A0), v4), (int64x2_t)vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1BE8D51B0), v4)), vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1BE8D5180), v4), (int64x2_t)vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1BE8D5190), v4))));
}

- (BOOL)hasValidPrincipalLines
{
  double v2;

  v2 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (self->_principalLines.base.start.x != *MEMORY[0x1E0C9D538] || self->_principalLines.base.start.y != v2)
    return 1;
  if (self->_principalLines.base.end.y == v2)
    return self->_principalLines.base.end.x != *MEMORY[0x1E0C9D538];
  return 1;
}

- (double)principalOrientation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double x;
  double v19;
  CGFloat v20;
  double v21;
  long double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  CGRect v29;

  if (!objc_msgSend_hasValidPrincipalLines(self, a2, v2, v3, v4, v5))
    return 1.79769313e308;
  objc_msgSend_originalBounds(self, v7, v8, v9, v10, v11);
  if (CGRectIsNull(v29))
    return 1.79769313e308;
  x = self->_principalLines.base.start.x;
  v19 = self->_principalLines.base.end.x;
  v20 = self->_principalLines.base.end.y - self->_principalLines.base.start.y;
  objc_msgSend_originalBounds(self, v12, v13, v14, v15, v16);
  v22 = v20 * v21;
  objc_msgSend_originalBounds(self, v23, v24, v25, v26, v27);
  return atan2(v22, (v19 - x) * v28);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHTokenizedTextResultToken *v5;
  CHTokenizedTextResultToken *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int wordID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double modelScore;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double recognitionScore;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double combinedScore;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double alignmentScore;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  unint64_t properties;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSLocale *recognizerSourceLocale;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSLocale *v58;
  NSLocale *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t inputSources;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  objc_super v77;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHTokenizedTextResultToken *)v4;
    v6 = v5;
    if (self)
    {
      if (self == v5)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        v77.receiver = self;
        v77.super_class = (Class)CHTokenizedTextResultToken;
        if (!-[CHTokenizedResultToken isEqualToTokenizedResultToken:](&v77, sel_isEqualToTokenizedResultToken_, v5))
          goto LABEL_19;
        wordID = self->_wordID;
        if (wordID != objc_msgSend_wordID(v6, v7, v8, v9, v10, v11))
          goto LABEL_19;
        modelScore = self->_modelScore;
        objc_msgSend_modelScore(v6, v13, v14, v15, v16, v17);
        if (vabdd_f64(modelScore, v24) >= 2.22044605e-16)
          goto LABEL_19;
        recognitionScore = self->_recognitionScore;
        objc_msgSend_recognitionScore(v6, v19, v20, v21, v22, v23);
        if (vabdd_f64(recognitionScore, v31) >= 2.22044605e-16)
          goto LABEL_19;
        combinedScore = self->_combinedScore;
        objc_msgSend_combinedScore(v6, v26, v27, v28, v29, v30);
        if (vabdd_f64(combinedScore, v38) >= 2.22044605e-16)
          goto LABEL_19;
        alignmentScore = self->_alignmentScore;
        objc_msgSend_alignmentScore(v6, v33, v34, v35, v36, v37);
        if (vabdd_f64(alignmentScore, v45) >= 2.22044605e-16)
          goto LABEL_19;
        properties = self->_properties;
        if (properties != objc_msgSend_properties(v6, v40, v41, v42, v43, v44))
          goto LABEL_19;
        recognizerSourceLocale = self->_recognizerSourceLocale;
        objc_msgSend_recognizerSourceLocale(v6, v47, v48, v49, v50, v51);
        v58 = (NSLocale *)objc_claimAutoreleasedReturnValue();
        if (recognizerSourceLocale == v58)
        {

        }
        else
        {
          v59 = self->_recognizerSourceLocale;
          objc_msgSend_recognizerSourceLocale(v6, v53, v54, v55, v56, v57);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v59) = objc_msgSend_isEqual_(v59, v61, (uint64_t)v60, v62, v63, v64);

          if (!(_DWORD)v59)
            goto LABEL_19;
        }
        inputSources = self->_inputSources;
        if (inputSources != objc_msgSend_inputSources(v6, v65, v66, v67, v68, v69))
        {
LABEL_19:
          LOBYTE(self) = 0;
          goto LABEL_20;
        }
        self = (CHTokenizedTextResultToken *)self->_substrokeCount;
        LOBYTE(self) = self == (CHTokenizedTextResultToken *)objc_msgSend_substrokeCount(v6, v71, v72, v73, v74, v75);
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(self) = 0;
LABEL_21:

  return (char)self;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHTokenizedTextResultToken;
  return -[CHTokenizedResultToken hash](&v3, sel_hash);
}

- (unsigned)wordID
{
  return self->_wordID;
}

- (CGRect)originalBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalBounds.origin.x;
  y = self->_originalBounds.origin.y;
  width = self->_originalBounds.size.width;
  height = self->_originalBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($6DEFAE59D8B0B490C28D581BBA01C329)principalLines
{
  CGPoint var1;
  CGPoint v4;
  CGPoint v5;
  CGPoint v6;

  var1 = self[1].var3.var1;
  retstr->var2.var0 = self[1].var3.var0;
  retstr->var2.var1 = var1;
  v4 = self[2].var0.var1;
  retstr->var3.var0 = self[2].var0.var0;
  retstr->var3.var1 = v4;
  v5 = self[1].var1.var1;
  retstr->var0.var0 = self[1].var1.var0;
  retstr->var0.var1 = v5;
  v6 = self[1].var2.var1;
  retstr->var1.var0 = self[1].var2.var0;
  retstr->var1.var1 = v6;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizerSourceLocale, 0);
}

- (double)recognitionScore
{
  return self->_recognitionScore;
}

- (double)modelScore
{
  return self->_modelScore;
}

- (double)combinedScore
{
  return self->_combinedScore;
}

- (double)alignmentScore
{
  return self->_alignmentScore;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (NSLocale)recognizerSourceLocale
{
  return self->_recognizerSourceLocale;
}

- (unint64_t)inputSources
{
  return self->_inputSources;
}

- (BOOL)isOriginal
{
  return (self->_inputSources & 0x1F8) == 0;
}

- (BOOL)isTopOriginal
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((self->_inputSources & 4) != 0)
    return objc_msgSend_isOriginal(self, a2, v2, v3, v4, v5);
  else
    return 0;
}

- (BOOL)isTransliterated
{
  return (LOBYTE(self->_inputSources) >> 3) & 1;
}

- (int64_t)substrokeCount
{
  return self->_substrokeCount;
}

@end
