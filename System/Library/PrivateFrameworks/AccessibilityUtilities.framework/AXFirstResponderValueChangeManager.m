@implementation AXFirstResponderValueChangeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  return (id)sharedInstance_SharedInstance;
}

void __52__AXFirstResponderValueChangeManager_sharedInstance__block_invoke()
{
  AXFirstResponderValueChangeManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXFirstResponderValueChangeManager);
  v1 = (void *)sharedInstance_SharedInstance;
  sharedInstance_SharedInstance = (uint64_t)v0;

}

- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 shouldEchoDeletion:(BOOL)a6 isSingleInsert:(BOOL)a7 feedbackType:(unint64_t)a8 lastKeyboardKeyPress:(double)a9
{
  uint64_t v10;

  BYTE1(v10) = a7;
  LOBYTE(v10) = a6;
  return -[AXFirstResponderValueChangeManager outputValueChangeForNewValue:oldValue:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:isSingleInsert:feedbackType:lastKeyboardKeyPress:](self, "outputValueChangeForNewValue:oldValue:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:isSingleInsert:feedbackType:lastKeyboardKeyPress:", a3, a4, a5.location, a5.length, 0x7FFFFFFFLL, 0, a9, v10, a8);
}

- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 shouldEchoDeletion:(BOOL)a6 isSingleInsert:(BOOL)a7 feedbackType:(unint64_t)a8 lastKeyboardKeyPress:(double)a9 shouldOutputSingleCharactersOnly:(BOOL)a10
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  BYTE1(v13) = 1;
  LOBYTE(v13) = a10;
  LOWORD(v12) = a7;
  LOBYTE(v11) = a6;
  return -[AXFirstResponderValueChangeManager _outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:shouldOutputSingleCharactersOnly:processApostrophes:](self, "_outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:shouldOutputSingleCharactersOnly:processApostrophes:", a3, a4, 1, a5.location, a5.length, a9, 0x7FFFFFFFLL, 0, v11, 0, 0, 0, 0,
           v12,
           a8,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v13);
}

- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 oldSelectedTextRange:(_NSRange)a6 shouldEchoDeletion:(BOOL)a7 isSingleInsert:(BOOL)a8 feedbackType:(unint64_t)a9 lastKeyboardKeyPress:(double)a10
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  LOBYTE(v13) = 1;
  LOWORD(v12) = a8;
  LOBYTE(v11) = a7;
  return -[AXFirstResponderValueChangeManager outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:processApostrophes:](self, "outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:processApostrophes:", a3, a4, 1, a5.location, a5.length, a10, a6.location, a6.length, v11, 0, 0, 0, 0,
           v12,
           a9,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v13);
}

- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 isFirstResponderValid:(BOOL)a5 selectedTextRange:(_NSRange)a6 oldSelectedTextRange:(_NSRange)a7 shouldEchoDeletion:(BOOL)a8 optionalValueChangeType:(unint64_t)a9 derivedValueChangeType:(unint64_t *)a10 didHitBorder:(BOOL *)a11 isBreakSpaceCharacter:(BOOL *)a12 isSingleInsert:(BOOL)a13 selectionDeleted:(BOOL)a14 feedbackType:(unint64_t)a15 textOperationOccurred:(BOOL *)a16 lastKeyboardKeyPress:(double)a17 isSingleCharacterInsertOrDelete:(BOOL *)a18 singleInsertDeleteAttString:(id *)a19 singleInsertDeleteString:(id *)a20 isSingleCharacterUpdate:(BOOL *)a21 wordRangeToFindMisspelled:(_NSRange *)a22 pasteOperationSucceeded:(BOOL *)a23 processApostrophes:(BOOL)a24
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  BYTE1(v27) = a24;
  LOBYTE(v27) = 0;
  LOWORD(v26) = __PAIR16__(a14, a13);
  LOBYTE(v25) = a8;
  return -[AXFirstResponderValueChangeManager _outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:shouldOutputSingleCharactersOnly:processApostrophes:](self, "_outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:shouldOutputSingleCharactersOnly:processApostrophes:", a3, a4, a5, a6.location, a6.length, a17, a7.location, a7.length, v25, a9, a10, a11, a12,
           v26,
           a15,
           a16,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           v27);
}

- (id)_outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 isFirstResponderValid:(BOOL)a5 selectedTextRange:(_NSRange)a6 oldSelectedTextRange:(_NSRange)a7 shouldEchoDeletion:(BOOL)a8 optionalValueChangeType:(unint64_t)a9 derivedValueChangeType:(unint64_t *)a10 didHitBorder:(BOOL *)a11 isBreakSpaceCharacter:(BOOL *)a12 isSingleInsert:(BOOL)a13 selectionDeleted:(BOOL)a14 feedbackType:(unint64_t)a15 textOperationOccurred:(BOOL *)a16 lastKeyboardKeyPress:(double)a17 isSingleCharacterInsertOrDelete:(BOOL *)a18 singleInsertDeleteAttString:(id *)a19 singleInsertDeleteString:(id *)a20 isSingleCharacterUpdate:(BOOL *)a21 wordRangeToFindMisspelled:(_NSRange *)a22 pasteOperationSucceeded:(BOOL *)a23 shouldOutputSingleCharactersOnly:(BOOL)a24 processApostrophes:(BOOL)a25
{
  NSUInteger location;
  _BOOL4 v27;
  id v29;
  _BOOL4 v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __CFString *v42;
  uint64_t v43;
  _BOOL4 v45;
  int64_t v46;
  _BOOL4 v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  uint64_t v52;
  unsigned int v53;
  __CFString *v54;
  unint64_t v55;
  char v56;
  BOOL v57;
  int v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  BOOL v64;
  NSUInteger v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  int v76;
  NSUInteger v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v92;
  uint64_t v93;
  __CFString *v94;
  int v95;
  int v96;
  uint64_t v97;
  int v98;
  NSUInteger v99;
  int v100;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __CFString *v107;
  void *v109;
  void *v110;
  void *v111;
  NSUInteger v112;
  uint64_t v113;
  void *v114;
  __CFString *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  __CFString *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  NSUInteger v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  void *v136;
  char v137;
  void *v138;
  uint64_t v139;
  int v140;
  unint64_t v141;
  void *v142;
  void *v143;
  _QWORD *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  int v151;
  void *v152;
  char v153;
  __CFString *v154;
  __CFString *v155;
  __CFString *v156;
  uint64_t v157;
  uint64_t v158;
  NSUInteger v159;
  uint64_t v160;
  int v161;
  char v162;
  void *v163;
  _BOOL4 v164;
  _BOOL4 v165;
  BOOL v166;
  NSUInteger v167;
  unint64_t v168;
  __CFString *v169;
  __CFString *v170;
  int v171;
  BOOL v172;
  unint64_t v173;
  _BOOL4 v175;
  void *v176;
  __CFString *v177;
  void *v178;
  id v179;
  id v180;
  _QWORD v181[2];
  unsigned __int16 v182;
  uint64_t v183;
  uint64_t v184;

  location = a6.location;
  v27 = a5;
  v180 = a3;
  v29 = a4;
  if (a16)
    v175 = *a16;
  else
    v175 = 0;
  v30 = a24;
  objc_msgSend(MEMORY[0x1E0CF40C0], "string");
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v179 = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v29, "length");
  v33 = objc_msgSend(v180, "length");
  v177 = v31;
  v178 = v29;
  if (objc_msgSend(v180, "isAXAttributedString"))
  {
    v34 = location;
    v183 = 0;
    v184 = 0;
    objc_msgSend(v180, "attributesAtIndex:effectiveRange:", 0, &v183);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKey:", *MEMORY[0x1E0CF4268]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "BOOLValue");

    if ((v37 & 1) != 0)
    {
      +[AXValueChangeUtilities phoneNumberWithoutFormattingCharacters:](AXValueChangeUtilities, "phoneNumberWithoutFormattingCharacters:", v29);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "length");

      +[AXValueChangeUtilities phoneNumberWithoutFormattingCharacters:](AXValueChangeUtilities, "phoneNumberWithoutFormattingCharacters:", v180);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "length");

      v30 = a24;
      if (v39 <= v41)
      {
        if (v41 <= v39)
        {
          v168 = 0;
          v42 = &stru_1E24CAB08;
          goto LABEL_103;
        }
        +[AXValueChangeUtilities handleValueChangeForPhoneDeletionWithOldString:newString:](AXValueChangeUtilities, "handleValueChangeForPhoneDeletionWithOldString:newString:", v180, v29);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v43 = 1;
      }
      else
      {
        +[AXValueChangeUtilities handleValueChangeForPhoneDeletionWithOldString:newString:](AXValueChangeUtilities, "handleValueChangeForPhoneDeletionWithOldString:newString:", v29, v180);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v43 = 2;
      }
      v168 = v43;
LABEL_103:
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v42, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E24CAB08);
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_104:
      v57 = 0;
      v172 = 0;
LABEL_105:
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v166 = 0;
      goto LABEL_106;
    }

    v30 = a24;
    location = v34;
  }
  v45 = a9 == 2 || v32 > v33;
  if (a9 != 1 && v45 && a8)
  {
    if (a9 == 2)
    {
      if (v27)
        v46 = location;
      else
        v46 = 0;
    }
    else
    {
      v46 = +[AXValueChangeUtilities findLocationOfDifferenceInOldString:withNewString:](AXValueChangeUtilities, "findLocationOfDifferenceInOldString:withNewString:", v29, v180);
    }
    if (v46 >= v32)
    {
      v57 = 0;
    }
    else
    {
      v54 = &stru_1E24CAB08;
      if (objc_msgSend(&stru_1E24CAB08, "length"))
      {
        v57 = 0;
LABEL_61:
        v172 = -[__CFString length](v54, "length")
            && ((-[__CFString isEqualToString:](v54, "isEqualToString:", CFSTR(" ")) & 1) != 0
             || -[__CFString characterAtIndex:](v54, "characterAtIndex:", 0) == 160);
        if (-[__CFString length](v54, "length"))
        {
LABEL_67:
          v63 = 0;
          v64 = 0;
          v65 = 0;
          v166 = 0;
          v168 = 2;
LABEL_106:
          v77 = 0x7FFFFFFFLL;
          goto LABEL_153;
        }
        v65 = 0;
        v63 = 0;
        if (v32 < 1 || v33 < 1)
        {
          v168 = 2;
          v64 = 0;
          v166 = 0;
          goto LABEL_106;
        }
        if (v32 != v33)
        {
          if (v32 - v33 == 1)
          {
            objc_msgSend(v29, "substringFromIndex:", objc_msgSend(v29, "length") - 1);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "decomposedStringWithCanonicalMapping");
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v88, "rangeOfComposedCharacterSequenceAtIndex:", 0);
            objc_msgSend(v88, "substringFromIndex:", v89 - 1);
            v90 = objc_claimAutoreleasedReturnValue();

            v63 = 0;
            v65 = 0;
            v166 = 0;
            v168 = 2;
            v77 = 0x7FFFFFFFLL;
            v54 = (__CFString *)v90;
            v64 = 0;
            goto LABEL_153;
          }
          goto LABEL_67;
        }
        objc_msgSend(v29, "substringFromIndex:", objc_msgSend(v29, "length") - 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "decomposedStringWithCanonicalMapping");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v180, "substringFromIndex:", objc_msgSend(v180, "length") - 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "decomposedStringWithCanonicalMapping");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v67, "rangeOfComposedCharacterSequenceAtIndex:", 0);
        v71 = v70;
        objc_msgSend(v69, "rangeOfComposedCharacterSequenceAtIndex:", 0);
        if (v71 <= v72)
        {
          if ((objc_msgSend(v29, "isEqualToString:", v180) & 1) != 0)
          {
            v168 = 2;
LABEL_235:

            goto LABEL_105;
          }
          objc_msgSend(v29, "substringWithRange:", 0, objc_msgSend(v29, "length") - 1);
          v113 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "substringWithRange:", 0, objc_msgSend(v180, "length") - 1);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v114, "isEqualToString:", v113))
          {
            v115 = v69;

            v74 = 1;
            v54 = v115;
          }
          else
          {
            v74 = 2;
          }
          v73 = (uint64_t)v54;

          v54 = (__CFString *)v113;
        }
        else
        {
          objc_msgSend(v67, "substringFromIndex:", v71 - 1);
          v73 = objc_claimAutoreleasedReturnValue();
          v74 = 2;
        }
        v168 = v74;

        v54 = (__CFString *)v73;
        goto LABEL_235;
      }
      v78 = objc_msgSend(v180, "isEqualToString:", v29);
      if (v46)
        v57 = 0;
      else
        v57 = v78;
      if (v32 <= v33)
        v79 = v78 ^ 1u;
      else
        v79 = v32 - v33;
      if (v32 == v33)
        v80 = v78 ^ 1u;
      else
        v80 = v79;
      if (v80 + v46 <= (unint64_t)objc_msgSend(v29, "length"))
      {
        objc_msgSend(v29, "substringWithRange:", v46, v80);
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      }
    }
    v54 = &stru_1E24CAB08;
    goto LABEL_61;
  }
  v171 = v32 - v33;
  v48 = a9 == 1 || v32 < v33;
  if (a9 != 2 && v48)
  {
    v167 = location;
    v164 = v30;
    v49 = location - 1;
    if (location == 0x80000000 || (v50 = location - 1, v49 > objc_msgSend(v180, "length")))
      v50 = +[AXValueChangeUtilities findLocationOfDifferenceInOldString:withNewString:](AXValueChangeUtilities, "findLocationOfDifferenceInOldString:withNewString:", v180, v29);
    -[AXFirstResponderValueChangeManager wordBreakSet](self, "wordBreakSet");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v33 - v32;
    if ((int)v33 - (int)v32 >= 0)
      v53 = v33 - v32;
    else
      v53 = v32 - v33;
    if (v53 >= 2 && !a13 && !a14)
    {
      if ((uint64_t)v50 < v33)
      {
        v54 = &stru_1E24CAB08;
        v55 = v50;
        while ((objc_msgSend(v51, "characterIsMember:", objc_msgSend(v180, "characterAtIndex:", v55)) & 1) == 0)
        {
          if (v33 == ++v55)
          {
            v56 = 0;
            v162 = 0;
            v55 = v33;
            goto LABEL_118;
          }
        }
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v109, "characterIsMember:", objc_msgSend(v180, "characterAtIndex:", v55)) ^ 1;

        v162 = 0;
        goto LABEL_117;
      }
      goto LABEL_78;
    }
    if (!a13 && !a14)
    {
LABEL_78:
      v56 = 0;
      v162 = 0;
LABEL_116:
      v55 = v50;
LABEL_117:
      v54 = &stru_1E24CAB08;
      goto LABEL_118;
    }
    if ((v50 & 0x8000000000000000) != 0 || v50 >= objc_msgSend(v180, "length"))
    {
      v56 = 0;
      v162 = 0;
      v175 = 0;
      goto LABEL_116;
    }
    v182 = objc_msgSend(v180, "characterAtIndex:", v50);
    v176 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v182, 1);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "characterIsMember:", v182);

    v83 = 0;
    if (v82)
    {
      if (!v50)
        goto LABEL_262;
      v84 = objc_msgSend(v180, "rangeOfComposedCharacterSequenceAtIndex:", v50 - 1);
      objc_msgSend(v180, "substringWithRange:", v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v86, "length") == 1)
        v83 = objc_msgSend(v51, "characterIsMember:", objc_msgSend(v86, "characterAtIndex:", 0));
      else
        v83 = 0;

    }
    if ((a15 & 0xFFFFFFFFFFFFFFFDLL) != 1 && !v83)
    {
      v162 = 0;
      v54 = &stru_1E24CAB08;
      v142 = v176;
LABEL_268:

      v56 = 0;
      v175 = 0;
      v55 = v50;
LABEL_118:
      if ((uint64_t)v55 >= v33 && v33 > 0)
        v55 = v33 - 1;
      if (v55 < objc_msgSend(v180, "length") && v55 < objc_msgSend(v29, "length"))
      {
        v92 = objc_msgSend(v180, "length");
        if (v92 < objc_msgSend(v29, "length")
          && objc_msgSend(v180, "characterAtIndex:", v55) == 8230
          && objc_msgSend(v29, "characterAtIndex:", v55) == 46)
        {
          v93 = 0;
          v166 = 0;
          v94 = CFSTR("…");
LABEL_230:
          v30 = v164;
LABEL_231:

          v65 = 0;
          v77 = 0x7FFFFFFFLL;
          v54 = v94;
          goto LABEL_149;
        }
      }
      if ((v55 & 0x8000000000000000) == 0 && v55 < objc_msgSend(v180, "length"))
      {
        v95 = objc_msgSend(v51, "characterIsMember:", objc_msgSend(v180, "characterAtIndex:", v55));
        v96 = v171 >= 0 ? v171 : -v171;
        if (v95 && v96 == 1)
        {
          if (v55)
          {
            v97 = 0;
            v98 = 0;
            v30 = v164;
            v99 = v167;
            while (1)
            {
              v100 = objc_msgSend(v51, "characterIsMember:", objc_msgSend(v180, "characterAtIndex:", v55 + v97 - 1));
              if (v100 && v97 == 0)
                break;
              if ((v100 & v98 & 1) != 0)
              {
                v102 = v55 + v97 - 1;
                goto LABEL_224;
              }
              v98 |= v100 ^ 1;
              --v97;
              if ((uint64_t)(v55 + v97) <= 0)
              {
                v102 = -1;
                goto LABEL_224;
              }
            }
          }
          else
          {
            v102 = -1;
            v30 = v164;
            v99 = v167;
LABEL_224:
            if ((a15 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              v122 = v102 & ~(v102 >> 63);
              v65 = v55 - v122;
              objc_msgSend(v180, "substringWithRange:", v122);
              v123 = (__CFString *)objc_claimAutoreleasedReturnValue();

              if (v123)
              {
                if (objc_msgSend(v180, "isAXAttributedString"))
                {
                  objc_msgSend(v180, "attributeValueForKey:", *MEMORY[0x1E0CF40F8]);
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v124 = 0;
                }
                -[__CFString stringByTrimmingEmptySpaceEdges](v123, "stringByTrimmingEmptySpaceEdges");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v126 = objc_msgSend(v124, "length");
                v173 = v126 - objc_msgSend(v125, "length");
                -[__CFString string](v177, "string");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v127, "length") == 1)
                {
                  -[__CFString string](v177, "string");
                  v169 = v123;
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v128, "stringByTrimmingEmptySpaceEdges");
                  v129 = v122;
                  v130 = v99;
                  v131 = v125;
                  v132 = v124;
                  v133 = (void *)objc_claimAutoreleasedReturnValue();
                  v161 = objc_msgSend(v133, "isEqualToString:", &stru_1E24CAB08);

                  v124 = v132;
                  v125 = v131;
                  v99 = v130;
                  v122 = v129;

                  v123 = v169;
                }
                else
                {
                  v161 = 0;
                }

                if ((v173 & 0x8000000000000000) == 0 && v173 < objc_msgSend(v124, "length"))
                {
                  v170 = v123;
                  objc_msgSend(v124, "substringFromIndex:", v173);
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  v135 = objc_msgSend(v134, "isEqualToString:", v125);

                  if ((v161 & v135) == 1 && v99 - a7.location >= 2)
                  {
                    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
                    v136 = (void *)objc_claimAutoreleasedReturnValue();
                    v137 = objc_msgSend(v136, "voiceOverInlineTextCompletionInsertionFeedback");

                    objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v124);
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v137 & 2) != 0)
                    {
                      v123 = v170;
                    }
                    else
                    {

                      v123 = 0;
                    }
                    if ((v137 & 8) != 0)
                      objc_msgSend(v138, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF41C0]);
                    if ((v137 & 2) != 0)
                    {
                      v155 = v138;
                      v156 = v123;
                      v123 = v155;

                    }
                  }
                  else
                  {
                    v123 = v170;
                  }
                }

                v54 = v123;
              }
              else
              {
                v54 = 0;
              }
              v157 = -[__CFString length](v54, "length");
              if (v157)
              {
                v158 = v157;
                v159 = v122;
                v160 = 0;
                v94 = &stru_1E24CAB08;
                while ((objc_msgSend(v51, "characterIsMember:", -[__CFString characterAtIndex:](v54, "characterAtIndex:", v160)) & 1) != 0)
                {
                  if (v158 == ++v160)
                  {
                    v93 = 0;
                    v166 = 0;
                    goto LABEL_231;
                  }
                }
                v93 = 0;
                v166 = 0;
                v77 = v159;
                goto LABEL_149;
              }
              v93 = 0;
              v166 = 0;
              v94 = &stru_1E24CAB08;
              goto LABEL_231;
            }
          }
          v93 = 0;
          v166 = 0;
          v65 = 0;
          v77 = 0x7FFFFFFFLL;
LABEL_149:
          if (-[__CFString length](v54, "length") == 1)
            v103 = 1;
          else
            v103 = v93;
          v168 = v103;

          v57 = 0;
          v172 = 0;
          v63 = 0;
          v64 = v162;
          goto LABEL_153;
        }
      }
      if (a13 || -[__CFString length](v54, "length"))
        goto LABEL_147;
      if (v175)
      {
        if (v50 + v52 <= objc_msgSend(v180, "length"))
        {
          objc_msgSend(v180, "substringWithRange:", v50, v52);
          v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v93 = 0;
          v166 = 1;
          goto LABEL_230;
        }
LABEL_147:
        v93 = 0;
        v166 = 0;
        v65 = 0;
        v77 = 0x7FFFFFFFLL;
LABEL_148:
        v30 = v164;
        goto LABEL_149;
      }
      if (a15 - 1 > 2 || -[__CFString length](v54, "length") && CFAbsoluteTimeGetCurrent() - a17 >= 0.5)
      {
        v166 = 0;
        v93 = 0;
        if ((v56 & 1) == 0)
        {
          v94 = &stru_1E24CAB08;
          goto LABEL_230;
        }
        v77 = 0x7FFFFFFFLL;
        v65 = 0;
        goto LABEL_148;
      }
      v112 = a7.location;
      if (!v52 && v167 && v167 == a7.location)
      {
        v52 = 1;
        v30 = v164;
      }
      else
      {
        v30 = v164;
        if (a7.location != 0x7FFFFFFF)
          goto LABEL_275;
        v49 = v167 - v52;
        if (v167 < v52)
        {
          v166 = 0;
          v65 = 0;
          v77 = 0x7FFFFFFFLL;
LABEL_274:
          v93 = 1;
          goto LABEL_149;
        }
      }
      v77 = 0x7FFFFFFFLL;
      v112 = v49;
      if (v49 == 0x7FFFFFFF)
      {
        v166 = 0;
        v65 = 0;
        goto LABEL_274;
      }
LABEL_275:
      if (v52 >= 1 && v112 + v52 <= objc_msgSend(v180, "length"))
      {
        objc_msgSend(v180, "substringWithRange:", v112, v52);
        v94 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v94 = v54;
      }
      if (-[__CFString isEqualToString:](v94, "isEqualToString:", &stru_1E24CAB08))
      {
        if ((uint64_t)(v112 + 1) < 0 || v112 + 1 >= objc_msgSend(v180, "length"))
        {
          v54 = 0;
        }
        else
        {
          objc_msgSend(v180, "substringFromIndex:", v112 + 1);
          v54 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v54 = v94;
      }
      if (!-[__CFString isAXAttributedString](v54, "isAXAttributedString"))
        goto LABEL_294;
      -[__CFString attributeValueForKey:](v54, "attributeValueForKey:", *MEMORY[0x1E0CF4100]);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = -[__CFString isEqualToString:](v54, "isEqualToString:", v150);

      if (!v151)
        goto LABEL_294;
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend(v152, "voiceOverInlineTextCompletionAppearanceFeedback");

      if ((v153 & 2) != 0)
      {
        if ((v153 & 8) != 0)
        {
LABEL_290:
          -[__CFString setAttribute:forKey:](v54, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF4228]);
          if ((v153 & 2) != 0)
          {
LABEL_291:
            v54 = v54;

            v166 = 0;
            v93 = 1;
            v94 = v54;
            goto LABEL_231;
          }
LABEL_294:
          v166 = 0;
          v93 = 1;
          goto LABEL_231;
        }
      }
      else
      {

        v94 = 0;
        if ((v153 & 8) != 0)
          goto LABEL_290;
      }
      if ((v153 & 2) != 0)
        goto LABEL_291;
      goto LABEL_294;
    }
LABEL_262:
    if (objc_msgSend(v180, "isAXAttributedString"))
    {
      v183 = 0;
      v184 = 0;
      objc_msgSend(v180, "attributesAtIndex:effectiveRange:", v50, &v183);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v181[0] = 0;
      v181[1] = 0;
      v144 = (_QWORD *)MEMORY[0x1E0CF4208];
      objc_msgSend(v180, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CF4208], v50, v181);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      if (v163 && v50 != v181[0])
      {
        v145 = (void *)objc_msgSend(v143, "mutableCopy");
        objc_msgSend(v145, "removeObjectForKey:", *v144);
        objc_msgSend(v145, "removeObjectForKey:", *MEMORY[0x1E0CF4210]);
        v146 = objc_msgSend(v145, "copy");

        v143 = (void *)v146;
      }
      v142 = v176;
      objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v176);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setAttributes:", v143);
      v148 = v147;

      v54 = (__CFString *)v148;
      v162 = 1;
      v177 = v54;
    }
    else
    {
      v142 = v176;
      v149 = (void *)objc_msgSend(v176, "copy");

      v54 = v149;
      v162 = 1;
      v179 = v54;
    }
    goto LABEL_268;
  }
  v58 = objc_msgSend(v29, "isEqualToString:", v180);
  if ((a15 & 0xFFFFFFFFFFFFFFFDLL) != 1 || !v58 || v33 != 1 || location == a7.location)
  {
    v75 = objc_msgSend(v29, "isEqualToString:", v180);
    v65 = 0;
    v57 = 0;
    if (v33 > 0)
      v76 = v75;
    else
      v76 = 0;
    v54 = &stru_1E24CAB08;
    v77 = 0x7FFFFFFFLL;
    if ((a15 & 0xFFFFFFFFFFFFFFFDLL) != 1
      || v76
      || v32 != v33
      || v33 < 1
      || (v65 = 0, v57 = 0, v77 = 0x7FFFFFFFLL, !location)
      || location == 0x7FFFFFFF)
    {
      v172 = 0;
      v63 = 0;
      v64 = 0;
      v166 = 0;
      v168 = 0;
      goto LABEL_153;
    }
    if (objc_msgSend(v178, "length") >= location)
    {
      objc_msgSend(v178, "substringToIndex:", location);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v110 = 0;
    }
    v165 = v30;
    if (objc_msgSend(v180, "length") >= location)
    {
      objc_msgSend(v180, "substringToIndex:", location);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v116 = 0;
    }
    v117 = location - 1;
    if (objc_msgSend(v110, "length") >= location - 1)
    {
      objc_msgSend(v110, "substringFromIndex:", location - 1);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "substringToIndex:", location - 1);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v118 = 0;
      v119 = 0;
    }
    if (objc_msgSend(v116, "length") >= (unint64_t)v117)
    {
      objc_msgSend(v116, "substringFromIndex:", location - 1);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "substringToIndex:", location - 1);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v120 = 0;
      v121 = 0;
    }
    if (objc_msgSend(v119, "length")
      && objc_msgSend(v121, "length")
      && objc_msgSend(v118, "length")
      && objc_msgSend(v120, "length")
      && objc_msgSend(v119, "isEqualToString:", v121)
      && (objc_msgSend(v118, "isEqualToString:", v120) & 1) == 0)
    {
      v154 = v120;
    }
    else
    {
      if (!objc_msgSend(v118, "length")
        || !objc_msgSend(v120, "length")
        || (objc_msgSend(v118, "isEqualToString:", v120) & 1) != 0)
      {
        v168 = 0;
LABEL_222:
        v30 = v165;

        goto LABEL_104;
      }
      if ((v117 & 0x8000000000000000) == 0)
      {
        v117 = location;
        while (1)
        {
          v139 = v117 - 1;
          if (objc_msgSend(v180, "length") >= (unint64_t)(v117 - 1)
            && objc_msgSend(v178, "length") >= (unint64_t)v139)
          {
            v140 = objc_msgSend(v180, "characterAtIndex:", v117 - 1);
            if (v140 == objc_msgSend(v178, "characterAtIndex:", v117 - 1))
              break;
          }
          --v117;
          if (v139 <= 0)
          {
            v117 = -1;
            break;
          }
        }
      }
      if (objc_msgSend(v180, "length") < location || (v141 = v117 & ~(v117 >> 63), objc_msgSend(v180, "length") < v141))
      {
        v168 = 0;
        v54 = &stru_1E24CAB08;
        goto LABEL_222;
      }
      objc_msgSend(v180, "substringWithRange:", v117 & ~(v117 >> 63), location - v141);
      v154 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v54 = v154;
    v168 = 1;
    goto LABEL_222;
  }
  v59 = location - 1;
  if (location == 0x80000000 || v59 > objc_msgSend(v180, "length"))
    v59 = +[AXValueChangeUtilities findLocationOfDifferenceInOldString:withNewString:](AXValueChangeUtilities, "findLocationOfDifferenceInOldString:withNewString:", v180, v29);
  if ((v59 & 0x8000000000000000) == 0 && v59 < objc_msgSend(v180, "length"))
  {
    LOWORD(v181[0]) = objc_msgSend(v180, "characterAtIndex:", v59);
    v60 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v181, 1);
    if (objc_msgSend(v180, "isAXAttributedString"))
    {
      v183 = 0;
      v184 = 0;
      objc_msgSend(v180, "attributesAtIndex:effectiveRange:", v59, &v183);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setAttributes:", v61);
      v54 = v62;

      v177 = v54;
    }
    else
    {
      v111 = (void *)objc_msgSend(v60, "copy");

      v54 = v111;
      v179 = v54;
    }

    v57 = 0;
    v172 = 0;
    v64 = 0;
    v65 = 0;
    v166 = 0;
    v168 = 0;
    v63 = 1;
    goto LABEL_106;
  }
  v57 = 0;
  v172 = 0;
  v63 = 0;
  v64 = 0;
  v65 = 0;
  v166 = 0;
  v168 = 0;
  v77 = 0x7FFFFFFFLL;
  v54 = &stru_1E24CAB08;
LABEL_153:
  if (v30 && (AXLanguageIsSpeakableEmojiString(v54) & 1) == 0)
  {
    -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v54, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    if (v104 < -[__CFString length](v54, "length"))
    {

      v54 = 0;
    }
  }
  if (a25)
  {
    -[AXFirstResponderValueChangeManager _handleApostropheIfNeeded:](self, "_handleApostropheIfNeeded:", v54);
    v105 = objc_claimAutoreleasedReturnValue();

    -[AXFirstResponderValueChangeManager _handleApostropheIfNeeded:](self, "_handleApostropheIfNeeded:", v179);
    v106 = objc_claimAutoreleasedReturnValue();

    -[AXFirstResponderValueChangeManager _handleAttributedApostropheIfNeeded:](self, "_handleAttributedApostropheIfNeeded:", v177);
    v54 = (__CFString *)v105;
    v179 = (id)v106;
  }
  if (a11)
    *a11 = v57;
  if (a12)
    *a12 = v172;
  if (a16)
    *a16 = v175;
  if (a18)
    *a18 = v64;
  if (a21)
    *a21 = v63;
  if (a19)
    *a19 = objc_retainAutorelease(v177);
  if (a20)
    *a20 = objc_retainAutorelease(v179);
  if (a22)
  {
    a22->location = v77;
    a22->length = v65;
  }
  if (a23)
    *a23 = v166;
  if (a10)
    *a10 = v168;
  v107 = v54;

  return v107;
}

- (id)_handleApostropheIfNeeded:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v13;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("‘")) & 1) != 0)
  {
    v10 = CFSTR("typing.feedback.opening.single.quotation.mark");
LABEL_5:
    AXParameterizedLocalizedString(1, v10, v4, v5, v6, v7, v8, v9, v13);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v11;
    return v3;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("’")))
  {
    v10 = CFSTR("typing.feedback.closing.single.quotation.mark");
    goto LABEL_5;
  }
  return v3;
}

- (void)_handleAttributedApostropheIfNeeded:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceString:", -[AXFirstResponderValueChangeManager _handleApostropheIfNeeded:](self, "_handleApostropheIfNeeded:", v5));

}

- (id)wordBreakSet
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "wordBreakCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("'’"));
  return v3;
}

@end
