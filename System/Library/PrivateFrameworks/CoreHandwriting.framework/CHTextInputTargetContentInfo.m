@implementation CHTextInputTargetContentInfo

- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 activePreviewRange:(_NSRange)a10 lastCharacterLevelPosition:(int64_t)a11
{
  NSUInteger length;
  NSUInteger location;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSObject *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  CHTextInputTargetContentInfo *v51;
  CHTextInputTargetContentInfo *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSString *referenceSubstring;
  Class isa;
  NSObject *v61;
  void *v62;
  CGRect *v63;
  CGRect *v65;
  id v68;
  id v69;
  objc_super v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  int64_t v74;
  uint64_t v75;
  NSRange v76;
  NSRange v77;
  NSRange v78;
  NSRange v79;
  NSRange v80;
  NSRange v81;

  length = a6.length;
  location = a6.location;
  v75 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v69 = a5;
  if (a9.location == 0x7FFFFFFFFFFFFFFFLL || a9.location + a9.length <= a4)
  {
    if (a10.location == 0x7FFFFFFFFFFFFFFFLL || a10.location + a10.length <= a4)
      goto LABEL_9;
    goto LABEL_22;
  }
  if (qword_1EF568E88 == -1)
  {
    v26 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    goto LABEL_16;
  }
  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v26 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
LABEL_16:
    NSStringFromRange(a9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v72 = v27;
    v73 = 2048;
    v74 = a4;
    _os_log_impl(&dword_1BE607000, v26, OS_LOG_TYPE_FAULT, "selectedTextRange %@ beyond text length %ld", buf, 0x16u);

  }
LABEL_17:

  if (a10.location == 0x7FFFFFFFFFFFFFFFLL || a10.location + a10.length <= a4)
  {
LABEL_9:
    if (location != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_22:
  if (qword_1EF568E88 == -1)
  {
    v29 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    goto LABEL_24;
  }
  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v29 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
LABEL_24:
    NSStringFromRange(a10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v72 = v30;
    v73 = 2048;
    v74 = a4;
    _os_log_impl(&dword_1BE607000, v29, OS_LOG_TYPE_FAULT, "activePreviewRange %@ beyond text length %ld", buf, 0x16u);

  }
LABEL_25:

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    v23 = location + length;
    if (location + length <= a4)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_26:
  if (qword_1EF568E88 == -1)
  {
    v31 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      goto LABEL_29;
    goto LABEL_28;
  }
  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v31 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
LABEL_28:
    v76.location = location;
    v76.length = length;
    NSStringFromRange(v76);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v72 = v32;
    _os_log_impl(&dword_1BE607000, v31, OS_LOG_TYPE_FAULT, "Invalid referenceSubstringRange %@", buf, 0xCu);

  }
LABEL_29:

  v23 = location + length;
  if (location + length <= a4)
  {
LABEL_11:
    v24 = a8.location;
    if (length == objc_msgSend_length(v69, v16, v17, v18, v19, v20))
      goto LABEL_12;
LABEL_34:
    if (qword_1EF568E88 == -1)
    {
      v40 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        goto LABEL_37;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v40 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
LABEL_37:

        v25 = a8.length;
        if (v24 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_46;
        goto LABEL_38;
      }
    }
    v78.location = location;
    v78.length = length;
    NSStringFromRange(v78);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_length(v69, v42, v43, v44, v45, v46);
    *(_DWORD *)buf = 138412546;
    v72 = v41;
    v73 = 2048;
    v74 = v47;
    _os_log_impl(&dword_1BE607000, v40, OS_LOG_TYPE_FAULT, "Invalid referenceSubstringRange %@, length doesn't match string length %ld", buf, 0x16u);

    goto LABEL_37;
  }
LABEL_30:
  if (qword_1EF568E88 == -1)
  {
    v33 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    goto LABEL_32;
  }
  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v33 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
  {
LABEL_32:
    v77.location = location;
    v77.length = length;
    NSStringFromRange(v77);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v72 = v34;
    v73 = 2048;
    v74 = a4;
    _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_FAULT, "referenceSubstringRange %@ beyond text length %ld", buf, 0x16u);

  }
LABEL_33:

  v24 = a8.location;
  if (length != objc_msgSend_length(v69, v35, v36, v37, v38, v39))
    goto LABEL_34;
LABEL_12:
  v25 = a8.length;
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_46;
LABEL_38:
  if (v24 < location || v24 - location >= length || v24 + v25 > v23)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v48 = (id)qword_1EF568E48;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v79.location = v24;
      v79.length = v25;
      NSStringFromRange(v79);
      v65 = a7;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v80.location = location;
      v80.length = length;
      NSStringFromRange(v80);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v72 = v49;
      v73 = 2112;
      v74 = (int64_t)v50;
      _os_log_impl(&dword_1BE607000, v48, OS_LOG_TYPE_ERROR, "The strokeCoveredTextRange %@ must be within the referenceSubstringRange %@", buf, 0x16u);

      a7 = v65;
    }

  }
LABEL_46:
  v70.receiver = self;
  v70.super_class = (Class)CHTextInputTargetContentInfo;
  v51 = -[CHTextInputTargetContentInfo init](&v70, sel_init);
  v52 = v51;
  if (v51)
  {
    objc_storeStrong((id *)&v51->_textInputTarget, a3);
    v52->_textContentLength = a4;
    v58 = objc_msgSend_copy(v69, v53, v54, v55, v56, v57);
    referenceSubstring = v52->_referenceSubstring;
    v52->_referenceSubstring = (NSString *)v58;

    v52->_referenceSubstringRange.location = location;
    v52->_referenceSubstringRange.length = length;
    v52->_strokeCoveredTextRange.location = v24;
    v52->_strokeCoveredTextRange.length = v25;
    v52->_selectedTextRange = a9;
    v52->_isCursorStrong = 1;
    v52->_activePreviewRange = a10;
    *(_QWORD *)&v52->_contentType = 0x100000000;
    v52->_autoCorrectionMode = 0;
    *(_QWORD *)&v52->_isSingleLine = 255;
    LOBYTE(v52->_lastCharacterLevelPosition) = 1;
    isa = v52[1].super.isa;
    v52->_protectedCharacterIndexes = (NSIndexSet *)a11;
    v52[1].super.isa = 0;

    if (length)
    {
      if (!a7)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v61 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
        {
          v81.location = location;
          v81.length = length;
          NSStringFromRange(v81);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v72 = v62;
          _os_log_impl(&dword_1BE607000, v61, OS_LOG_TYPE_FAULT, "charRectsInReferenceSubstring cannot be NULL for referenceSubstringRange: %@", buf, 0xCu);

        }
      }
      v63 = (CGRect *)malloc_type_calloc(length, 0x20uLL, 0x1000040E0EAB150uLL);
      v52->_characterRectsInReferenceSubstring = v63;
      memcpy(v63, a7, 32 * length);
    }
  }

  return v52;
}

- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 isCursorStrong:(BOOL)a10 activePreviewRange:(_NSRange)a11 contentType:(int)a12 autoCapitalizationMode:(int)a13 autoCorrectionMode:(int)a14 isSingleLine:(BOOL)a15 lastCharacterLevelPosition:(int64_t)a16
{
  return (CHTextInputTargetContentInfo *)sub_1BE6A4994(self, a3, a4, a5, a6.location, a6.length, a7, (uint64_t)a7, a8.location, a8.length, a9.location, a9.length, a10, a11.location, a11.length, a12, a13, a14, (void *)0xFF,
                                           a15,
                                           (void *)a16,
                                           0);
}

- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 isCursorStrong:(BOOL)a10 activePreviewRange:(_NSRange)a11 contentType:(int)a12 isSingleLine:(BOOL)a13 lastCharacterLevelPosition:(int64_t)a14
{
  return (CHTextInputTargetContentInfo *)sub_1BE6A4994(self, a3, a4, a5, a6.location, a6.length, a7, (uint64_t)a7, a8.location, a8.length, a9.location, a9.length, a10, a11.location, a11.length, a12, 1, 0, (void *)0xFF,
                                           a13,
                                           (void *)a14,
                                           0);
}

- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 activePreviewRange:(_NSRange)a10 contentType:(int)a11 lastCharacterLevelPosition:(int64_t)a12
{
  char v13;
  uint64_t v14;

  BYTE4(v14) = 1;
  LODWORD(v14) = a11;
  v13 = 1;
  return (CHTextInputTargetContentInfo *)objc_msgSend_initWithTextInputTarget_contentLength_referenceSubstring_referenceSubstringRange_charRectsInReferenceSubstring_strokeCoveredTextRange_selectedTextRange_isCursorStrong_activePreviewRange_contentType_isSingleLine_lastCharacterLevelPosition_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6.location, a6.length, a7, a8.location, a8.length, a9.location, a9.length, v13, a10.location, a10.length, v14, a12);
}

- (void)dealloc
{
  CGRect *characterRectsInReferenceSubstring;
  objc_super v4;

  characterRectsInReferenceSubstring = self->_characterRectsInReferenceSubstring;
  if (characterRectsInReferenceSubstring)
    free(characterRectsInReferenceSubstring);
  v4.receiver = self;
  v4.super_class = (Class)CHTextInputTargetContentInfo;
  -[CHTextInputTargetContentInfo dealloc](&v4, sel_dealloc);
}

- (id)description
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t i;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
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
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t CharacterLevelPosition;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  __CFString *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const __CFString *v148;
  const __CFString *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const __CFString *v155;
  const __CFString *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  __CFString *v163;
  __CFString *v164;
  __CFString *v165;
  __CFString *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  objc_super v172;
  NSRange v173;
  NSRange v174;
  NSRange v175;
  NSRange v176;

  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_referenceSubstringRange(self, a2, v2, v3, v4, v5);
  objc_msgSend_arrayWithCapacity_(v7, v8, (uint64_t)v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceSubstringRange(self, v13, v14, v15, v16, v17);
  if (v18)
  {
    v23 = 0;
    for (i = 0; i < (unint64_t)v18; ++i)
    {
      v25 = objc_msgSend_referenceSubstringRange(self, v18, v19, v20, v21, v22) + i;
      v31 = objc_msgSend_characterRectsInReferenceSubstring(self, v26, v27, v28, v29, v30);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v32, (uint64_t)CFSTR("  %ld: origin: (%0.2f, %0.2f), size: (%0.2f, %0.2f)"), v33, v34, v35, v25, *(_QWORD *)(v31 + v23), *(_QWORD *)(v31 + v23 + 8), *(_QWORD *)(v31 + v23 + 16), *(_QWORD *)(v31 + v23 + 24));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v12, v37, (uint64_t)v36, v38, v39, v40);

      objc_msgSend_referenceSubstringRange(self, v41, v42, v43, v44, v45);
      v23 += 32;
    }
  }
  objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v12, v18, (uint64_t)CFSTR("\n"), (uint64_t)&unk_1E77F1570, v21, v22);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v46, v47, v48, v49, v50, v51))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v52, (uint64_t)CFSTR("\n%@\n"), v54, v55, v56, v46);
    v57 = objc_claimAutoreleasedReturnValue();

    v46 = (void *)v57;
  }
  v58 = objc_msgSend_contentType(self, v52, v53, v54, v55, v56);
  objc_msgSend_stringForRecognitionContentType_(CHRecognizerConfiguration, v59, v58, v60, v61, v62);
  v63 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_referenceSubstringRange(self, v64, v65, v66, v67, v68) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v166 = CFSTR("(none)");
    if (objc_msgSend_selectedTextRange(self, v69, v70, v71, v72, v73) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_8;
  }
  else
  {
    v176.location = objc_msgSend_referenceSubstringRange(self, v69, v70, v71, v72, v73);
    NSStringFromRange(v176);
    v166 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_selectedTextRange(self, v116, v117, v118, v119, v120) != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      v173.location = objc_msgSend_selectedTextRange(self, v74, v75, v76, v77, v78);
      NSStringFromRange(v173);
      v165 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_activePreviewRange(self, v79, v80, v81, v82, v83) != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  v165 = CFSTR("(none)");
  if (objc_msgSend_activePreviewRange(self, v74, v75, v76, v77, v78) != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_9:
    v174.location = objc_msgSend_activePreviewRange(self, v84, v85, v86, v87, v88);
    NSStringFromRange(v174);
    v164 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_strokeCoveredTextRange(self, v89, v90, v91, v92, v93) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
LABEL_15:
    v163 = CFSTR("(none)");
    v170 = (void *)v63;
    v171 = v46;
    if (objc_msgSend_lastCharacterLevelPosition(self, v94, v95, v96, v97, v98) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_11;
    goto LABEL_16;
  }
LABEL_14:
  v164 = CFSTR("(none)");
  if (objc_msgSend_strokeCoveredTextRange(self, v84, v85, v86, v87, v88) == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
LABEL_10:
  v175.location = objc_msgSend_strokeCoveredTextRange(self, v94, v95, v96, v97, v98);
  NSStringFromRange(v175);
  v163 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v170 = (void *)v63;
  v171 = v46;
  if (objc_msgSend_lastCharacterLevelPosition(self, v99, v100, v101, v102, v103) != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    v109 = (void *)MEMORY[0x1E0CB3940];
    CharacterLevelPosition = objc_msgSend_lastCharacterLevelPosition(self, v104, v105, v106, v107, v108);
    objc_msgSend_stringWithFormat_(v109, v111, (uint64_t)CFSTR("%ld"), v112, v113, v114, CharacterLevelPosition);
    v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_16:
  v115 = CFSTR("(none)");
LABEL_17:
  v172.receiver = self;
  v172.super_class = (Class)CHTextInputTargetContentInfo;
  -[CHTextInputTargetContentInfo description](&v172, sel_description);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textInputTarget(self, v121, v122, v123, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = objc_msgSend_textContentLength(self, v127, v128, v129, v130, v131);
  objc_msgSend_referenceSubstring(self, v132, v133, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = CFSTR("Yes");
  if (objc_msgSend_isCursorStrong(self, v138, v139, v140, v141, v142))
    v149 = CFSTR("Yes");
  else
    v149 = CFSTR("No");
  if (objc_msgSend_containsCommittedStrokes(self, v143, v144, v145, v146, v147))
    v155 = CFSTR("Yes");
  else
    v155 = CFSTR("No");
  if (LOBYTE(self->_lastCharacterLevelPosition))
    v156 = CFSTR("Yes");
  else
    v156 = CFSTR("No");
  if (!BYTE1(self->_lastCharacterLevelPosition))
    v148 = CFSTR("No");
  objc_msgSend_protectedCharacterIndexes(self, v150, v151, v152, v153, v154);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v169, v158, (uint64_t)CFSTR(" textInputTarget: (%@), contentType: %@, textContentLength: %ld, referenceSubstring: \"%@\", referenceSubstringRange: %@, selectedRange: %@, isCursorStrong: %@, containsCommittedStrokes: %@, activePreviewRange: %@, strokeCoveredTextRange: %@, lastCharacterLevelPosition: %@, isSingleLine: %@, supportsAutoLineBreaks: %@, characterRectsInReferenceSubstring: {%@}, protectedCharacterIndexes: {%@}"), v159, v160, v161, v126, v170, v167, v137, v166, v165, v149, v155, v164, v163, v115, v156, v148,
    v171,
    v157);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  return v168;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CHMutableTextInputTargetContentInfo *v4;
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
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
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
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t isCursorStrong;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t active;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t isSingleLine;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t CharacterLevelPosition;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;

  v4 = objc_alloc_init(CHMutableTextInputTargetContentInfo);
  objc_msgSend_referenceSubstring(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_referenceSubstringRange(self, v11, v12, v13, v14, v15);
  v18 = (uint64_t)v17;
  v23 = objc_msgSend_characterRectsInReferenceSubstring(self, v17, v19, v20, v21, v22);
  objc_msgSend_setReferenceSubstring_range_characterRects_(v4, v24, (uint64_t)v10, v16, v18, v23);

  objc_msgSend_textInputTarget(self, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextInputTarget_(v4, v31, (uint64_t)v30, v32, v33, v34);

  v40 = objc_msgSend_textContentLength(self, v35, v36, v37, v38, v39);
  objc_msgSend_setTextContentLength_(v4, v41, v40, v42, v43, v44);
  v50 = objc_msgSend_strokeCoveredTextRange(self, v45, v46, v47, v48, v49);
  objc_msgSend_setStrokeCoveredTextRange_(v4, v51, v50, (uint64_t)v51, v52, v53);
  v59 = objc_msgSend_selectedTextRange(self, v54, v55, v56, v57, v58);
  objc_msgSend_setSelectedTextRange_(v4, v60, v59, (uint64_t)v60, v61, v62);
  isCursorStrong = objc_msgSend_isCursorStrong(self, v63, v64, v65, v66, v67);
  objc_msgSend_setIsCursorStrong_(v4, v69, isCursorStrong, v70, v71, v72);
  v78 = objc_msgSend_containsCommittedStrokes(self, v73, v74, v75, v76, v77);
  objc_msgSend_setContainsCommittedStrokes_(v4, v79, v78, v80, v81, v82);
  active = objc_msgSend_activePreviewRange(self, v83, v84, v85, v86, v87);
  objc_msgSend_setActivePreviewRange_(v4, v89, active, (uint64_t)v89, v90, v91);
  v97 = objc_msgSend_contentType(self, v92, v93, v94, v95, v96);
  objc_msgSend_setContentType_(v4, v98, v97, v99, v100, v101);
  v107 = objc_msgSend_autoCapitalizationMode(self, v102, v103, v104, v105, v106);
  objc_msgSend_setAutoCapitalizationMode_(v4, v108, v107, v109, v110, v111);
  v117 = objc_msgSend_autoCorrectionMode(self, v112, v113, v114, v115, v116);
  objc_msgSend_setAutoCorrectionMode_(v4, v118, v117, v119, v120, v121);
  v127 = objc_msgSend_baseWritingDirection(self, v122, v123, v124, v125, v126);
  objc_msgSend_setBaseWritingDirection_(v4, v128, v127, v129, v130, v131);
  isSingleLine = objc_msgSend_isSingleLine(self, v132, v133, v134, v135, v136);
  objc_msgSend_setIsSingleLine_(v4, v138, isSingleLine, v139, v140, v141);
  v147 = objc_msgSend_supportsAutoLineBreaks(self, v142, v143, v144, v145, v146);
  objc_msgSend_setSupportsAutoLineBreaks_(v4, v148, v147, v149, v150, v151);
  CharacterLevelPosition = objc_msgSend_lastCharacterLevelPosition(self, v152, v153, v154, v155, v156);
  objc_msgSend_setLastCharacterLevelPosition_(v4, v158, CharacterLevelPosition, v159, v160, v161);
  objc_msgSend_protectedCharacterIndexes(self, v162, v163, v164, v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtectedCharacterIndexes_(v4, v168, (uint64_t)v167, v169, v170, v171);

  return v4;
}

- (int64_t)absoluteLocationFromRelativeLocation:(int64_t)a3
{
  int64_t result;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    return self->_referenceSubstringRange.location + a3;
  return result;
}

- (int64_t)relativeLocationFromAbsoluteLocation:(int64_t)a3
{
  int64_t result;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    return a3 - self->_referenceSubstringRange.location;
  return result;
}

- (CGRect)characterRectForCharacterIndex:(int64_t)a3
{
  double x;
  double y;
  double width;
  double height;
  int64_t v7;
  CGRect *v8;
  CGRect result;

  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (v7 = a3 - self->_referenceSubstringRange.location, v7 >= 0))
  {
    if (v7 < self->_referenceSubstringRange.length)
    {
      v8 = &self->_characterRectsInReferenceSubstring[v7];
      x = v8->origin.x;
      y = v8->origin.y;
      width = v8->size.width;
      height = v8->size.height;
    }
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visualCharacterRectForCharacterIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char IsMember;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  char v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect result;

  objc_msgSend_characterRectForComposedCharacterAtIndex_(self, a2, a3, v3, v4, v5);
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  if (CGRectIsNull(v46))
    goto LABEL_11;
  if (qword_1EF567FF0 == -1)
  {
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_5;
    goto LABEL_4;
  }
  dispatch_once(&qword_1EF567FF0, &unk_1E77F2E08);
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
LABEL_4:
    v17 = a3 - self->_referenceSubstringRange.location;
LABEL_5:
  objc_msgSend_referenceSubstring(self, v12, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_characterAtIndex_(v18, v19, v17, v20, v21, v22);

  v24 = height * 0.25;
  IsMember = objc_msgSend_characterIsMember_((void *)qword_1EF567FD8, v25, v23, v26, v27, v28);
  v34 = 2.0;
  v35 = v24;
  if ((IsMember & 1) == 0)
  {
    v36 = objc_msgSend_characterIsMember_((void *)qword_1EF567FE0, v30, v23, v31, v32, v33, 2.0, v24);
    v34 = 3.0;
    v35 = v24;
    if ((v36 & 1) == 0)
    {
      v41 = objc_msgSend_characterIsMember_((void *)qword_1EF567FE8, v37, v23, v38, v39, v40, 3.0, v24);
      v34 = 4.0;
      if (v41)
        v34 = 3.0;
      v35 = 0.0;
    }
  }
  height = v24 * v34;
  y = y + v35;
LABEL_11:
  v42 = x;
  v43 = y;
  v44 = width;
  v45 = height;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (void)enumerateCharacterRectsInRange:(_NSRange)a3 block:(id)a4
{
  objc_msgSend_enumerateCharacterRectsInRange_reverse_block_(self, a2, a3.location, a3.length, 0, (uint64_t)a4);
}

- (void)enumerateCharacterRectsInRange:(_NSRange)a3 reverse:(BOOL)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  NSUInteger v20;
  char v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;

  length = a3.length;
  location = a3.location;
  v14 = a5;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
    v15 = location - self->_referenceSubstringRange.location;
  objc_msgSend_referenceSubstringRange(self, v9, v10, v11, v12, v13);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BE6A6394;
  v22[3] = &unk_1E77F2E30;
  v24 = v16;
  v22[4] = self;
  v17 = v14;
  v23 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B81A84](v22);
  v21 = 0;
  if (a4)
  {
    v19 = length + v15 - 1;
    do
    {
      if (v19 < v15)
        break;
      ((void (**)(_QWORD, uint64_t, char *))v18)[2](v18, v19--, &v21);
    }
    while (!v21);
  }
  else if (v15 < v15 + length)
  {
    v20 = length - 1;
    do
    {
      ((void (**)(_QWORD, uint64_t, char *))v18)[2](v18, v15, &v21);
      if (!v20)
        break;
      ++v15;
      --v20;
    }
    while (!v21);
  }

}

- (id)referenceSubstringInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSRange v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSRange v18;
  NSRange referenceSubstringRange;

  length = a3.length;
  location = a3.location;
  referenceSubstringRange = self->_referenceSubstringRange;
  v18.location = location;
  v18.length = length;
  v10 = NSIntersectionRange(v18, referenceSubstringRange);
  if (v10.length != length)
    return 0;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
    v11 = location - self->_referenceSubstringRange.location;
  objc_msgSend_referenceSubstring(self, (const char *)v10.length, v6, v7, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringWithRange_(v12, v13, v11, length, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (_NSRange)referenceSubstringRangeOfComposedCharacterAtIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (v7 = a3 - self->_referenceSubstringRange.location, v7 >= 0))
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v7 >= self->_referenceSubstringRange.length)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend_referenceSubstring(self, a2, a3, v3, v4, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v9, v10, v7, v11, v12, v13);
      v16 = v15;

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        v8 = self->_referenceSubstringRange.location + v14;
    }
  }
  else
  {
    v16 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v17 = v8;
  v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

- (CGRect)unionCharacterRects
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[5];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  CGRect result;

  v7 = objc_msgSend_referenceSubstringRange(self, a2, v2, v3, v4, v5);
  if (self)
  {
    v20 = 0;
    v21 = (double *)&v20;
    v22 = 0x4010000000;
    v23 = &unk_1BE94989A;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v24 = *MEMORY[0x1E0C9D628];
    v25 = v10;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1BE6A653C;
    v19[3] = &unk_1E77F2E58;
    v19[4] = &v20;
    objc_msgSend_enumerateCharacterRectsInRange_block_(self, v8, v7, (uint64_t)v8, (uint64_t)v19, v9);
    v12 = v21[4];
    v11 = v21[5];
    v14 = v21[6];
    v13 = v21[7];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v13 = 0.0;
    v14 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
  }
  v15 = v12;
  v16 = v11;
  v17 = v14;
  v18 = v13;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)characterRectForComposedCharacterAtIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[5];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  CGRect result;

  v7 = objc_msgSend_referenceSubstringRangeOfComposedCharacterAtIndex_(self, a2, a3, v3, v4, v5);
  if (self)
  {
    v20 = 0;
    v21 = (double *)&v20;
    v22 = 0x4010000000;
    v23 = &unk_1BE94989A;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v24 = *MEMORY[0x1E0C9D628];
    v25 = v10;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1BE6A653C;
    v19[3] = &unk_1E77F2E58;
    v19[4] = &v20;
    objc_msgSend_enumerateCharacterRectsInRange_block_(self, v8, v7, (uint64_t)v8, (uint64_t)v19, v9);
    v12 = v21[4];
    v11 = v21[5];
    v14 = v21[6];
    v13 = v21[7];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v13 = 0.0;
    v14 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
  }
  v15 = v12;
  v16 = v11;
  v17 = v14;
  v18 = v13;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CHTextInputTarget)textInputTarget
{
  return self->_textInputTarget;
}

- (int64_t)textContentLength
{
  return self->_textContentLength;
}

- (NSString)referenceSubstring
{
  return self->_referenceSubstring;
}

- (_NSRange)referenceSubstringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_referenceSubstringRange.length;
  location = self->_referenceSubstringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)strokeCoveredTextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_strokeCoveredTextRange.length;
  location = self->_strokeCoveredTextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)selectedTextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectedTextRange.length;
  location = self->_selectedTextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)isCursorStrong
{
  return self->_isCursorStrong;
}

- (BOOL)containsCommittedStrokes
{
  return self->_containsCommittedStrokes;
}

- (_NSRange)activePreviewRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_activePreviewRange.length;
  location = self->_activePreviewRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (int)baseWritingDirection
{
  return *(_QWORD *)&self->_isSingleLine;
}

- (BOOL)isSingleLine
{
  return self->_lastCharacterLevelPosition;
}

- (BOOL)supportsAutoLineBreaks
{
  return BYTE1(self->_lastCharacterLevelPosition);
}

- (int64_t)lastCharacterLevelPosition
{
  return (int64_t)self->_protectedCharacterIndexes;
}

- (CGRect)characterRectsInReferenceSubstring
{
  return self->_characterRectsInReferenceSubstring;
}

- (NSIndexSet)protectedCharacterIndexes
{
  return (NSIndexSet *)self[1].super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_referenceSubstring, 0);
  objc_storeStrong((id *)&self->_textInputTarget, 0);
}

@end
