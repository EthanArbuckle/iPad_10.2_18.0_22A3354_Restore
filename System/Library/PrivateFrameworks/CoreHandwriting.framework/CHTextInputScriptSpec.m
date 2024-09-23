@implementation CHTextInputScriptSpec

+ (BOOL)shouldCorrectionGesturesSnapToTokensForScriptCode:(int)a3
{
  char v3;

  v3 = a3 + 1;
  if ((a3 + 1) > 0x27)
    return 0;
  if (((1 << v3) & 0x80000C0003) != 0)
    return 0;
  return ((1 << v3) & 0x4000208) != 0;
}

+ (BOOL)isSkippableScriptCode:(int)a3
{
  return a3 < 2;
}

+ (int)singleScriptCodeForString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -1;
  v10 = objc_msgSend_length(v4, v5, v6, v7, v8, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BE699F20;
  v14[3] = &unk_1E77F2DA0;
  v14[4] = &v15;
  v14[5] = a1;
  objc_msgSend_enumerateCodepointsInRange_usingBlock_(v4, v11, 0, v10, (uint64_t)v14, v12);
  LODWORD(a1) = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return (int)a1;
}

+ (int)scriptCodeForCodepoint:(unsigned int)a3
{
  return uscript_getScript();
}

+ (BOOL)isCharacterFullWidth:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  UChar32 v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int32_t IntPropertyValue;
  uint64_t v18;
  uint64_t v19;

  v18 = 0;
  v19 = 0;
  v3 = a3;
  v7 = objc_msgSend_codepointAtIndex_outRange_(v3, v4, 0, (uint64_t)&v18, v5, v6);
  v8 = v19;
  v14 = objc_msgSend_length(v3, v9, v10, v11, v12, v13, v18);

  if (v8 != v14)
    return 0;
  IntPropertyValue = u_getIntPropertyValue(v7, UCHAR_EAST_ASIAN_WIDTH);
  return IntPropertyValue == 3 || IntPropertyValue == 5;
}

+ (BOOL)isCharacterCJKSymbolsPunctuations:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  UChar32 v18;
  UBlockCode Code;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char isCharacterFullWidth;
  _QWORD v26[2];

  v4 = a3;
  objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v4, v5, 0, v6, v7, v8);
  if (v16 != (const char *)objc_msgSend_length(v4, v16, v9, v10, v11, v12))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v17 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v26[0]) = 0;
      _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_FAULT, "Method can only be called on a single (composed) character string", (uint8_t *)v26, 2u);
    }

  }
  v26[0] = 0;
  v26[1] = 0;
  v18 = objc_msgSend_codepointAtIndex_outRange_(v4, v13, 0, (uint64_t)v26, v14, v15);
  Code = ublock_getCode(v18);
  if (Code == UBLOCK_CJK_SYMBOLS_AND_PUNCTUATION)
  {
    isCharacterFullWidth = 1;
  }
  else if (Code == UBLOCK_HALFWIDTH_AND_FULLWIDTH_FORMS)
  {
    isCharacterFullWidth = objc_msgSend_isCharacterFullWidth_(a1, v20, (uint64_t)v4, v21, v22, v23);
  }
  else
  {
    isCharacterFullWidth = 0;
  }

  return isCharacterFullWidth;
}

+ (BOOL)isRightToLeftScriptForCharacter:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint8_t v21[16];

  v3 = a3;
  objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v3, v4, 0, v5, v6, v7);
  if (v12 != (const char *)objc_msgSend_length(v3, v12, v8, v9, v10, v11))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_FAULT, "Method can only be called on a single (composed) character string", v21, 2u);
    }

  }
  v14 = (void *)objc_opt_class();
  objc_msgSend_singleScriptCodeForString_(v14, v15, (uint64_t)v3, v16, v17, v18);
  v19 = uscript_isRightToLeft() != 0;

  return v19;
}

+ (BOOL)shouldRelaxCharacterBoundsPercentageOverlapForScript:(int)a3
{
  BOOL result;

  result = 1;
  if ((a3 + 1) > 0x13 || ((1 << (a3 + 1)) & 0xC0001) == 0)
    return a3 == 105;
  return result;
}

+ (BOOL)isCharacterEmoji:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  UChar32 *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  unint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = v3;
  if (!v3
    || !objc_msgSend_length(v3, v4, v5, v6, v7, v8)
    || (objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v9, v10, 0, v11, v12, v13),
        v22 != (const char *)objc_msgSend_length(v9, v22, v14, v15, v16, v17)))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v29 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v62 = 134217984;
      v63 = objc_msgSend_length(v9, v49, v50, v51, v52, v53);
      _os_log_impl(&dword_1BE607000, v29, OS_LOG_TYPE_ERROR, "isCharacterEmoji: character string doesn't match expectation of being single character with length (%lu)\n", (uint8_t *)&v62, 0xCu);
    }
    goto LABEL_21;
  }
  objc_msgSend_dataUsingEncoding_(v9, v18, 2617245952, v19, v20, v21);
  v23 = objc_claimAutoreleasedReturnValue();
  v29 = v23;
  if (!v23 || !objc_msgSend_length(v23, v24, v25, v26, v27, v28))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v42 = (id)qword_1EF568E20;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v62 = 134217984;
    v63 = objc_msgSend_length(v9, v54, v55, v56, v57, v58);
    v48 = "isCharacterEmoji: encoded data is invalid, null or empty, from character of length (%lu)\n";
    goto LABEL_19;
  }
  v29 = objc_retainAutorelease(v29);
  v35 = (UChar32 *)objc_msgSend_bytes(v29, v30, v31, v32, v33, v34);
  v41 = objc_msgSend_length(v29, v36, v37, v38, v39, v40);
  if (v41 < 4)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v42 = (id)qword_1EF568E20;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v62 = 134217984;
    v63 = objc_msgSend_length(v9, v43, v44, v45, v46, v47);
    v48 = "isCharacterEmoji: codeCounts is 0 when data is encoded from character of length (%lu)\n";
LABEL_19:
    _os_log_impl(&dword_1BE607000, v42, OS_LOG_TYPE_ERROR, v48, (uint8_t *)&v62, 0xCu);
LABEL_20:

    goto LABEL_21;
  }
  v61 = v41;
  if (u_hasBinaryProperty(*v35, UCHAR_EMOJI) && *v35 > 0x238C)
  {
    v59 = 1;
    goto LABEL_22;
  }
  if (v61 >= 8)
  {
    v59 = u_hasBinaryProperty(*v35, UCHAR_EMOJI) != 0;
    goto LABEL_22;
  }
LABEL_21:
  v59 = 0;
LABEL_22:

  return v59;
}

+ (id)scriptHistogramForString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1BE69A690;
  v24 = sub_1BE69A6A0;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7, v8);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_length(v3, v9, v10, v11, v12, v13);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BE69A6A8;
  v19[3] = &unk_1E77F2DC8;
  v19[4] = &v20;
  objc_msgSend_enumerateCodepointsInRange_usingBlock_(v3, v15, 0, v14, (uint64_t)v19, v16);
  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

@end
