uint64_t BRLTSConnectionHasEntitlement(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.accessibility.BrailleTranslationService-access"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

uint64_t BRLTModeForFlags(int a1, int a2, int a3)
{
  uint64_t v3;

  v3 = 1;
  if (a1)
    v3 = 2;
  if (a2)
    v3 = 3;
  if (a3)
    return 4;
  else
    return v3;
}

uint64_t BRLTFlagsForMode(uint64_t result, _BYTE *a2, _BYTE *a3, char *a4)
{
  char v4;

  switch(result)
  {
    case 1:
      if (a2)
        *a2 = 0;
      goto LABEL_6;
    case 2:
      if (a2)
        *a2 = 1;
LABEL_6:
      if (a3)
        *a3 = 0;
      goto LABEL_12;
    case 3:
      if (a2)
        *a2 = 0;
      if (a3)
        *a3 = 1;
LABEL_12:
      if (!a4)
        return result;
      v4 = 0;
      break;
    case 4:
      if (a2)
        *a2 = 0;
      if (a3)
        *a3 = 0;
      if (!a4)
        return result;
      v4 = 1;
      break;
    default:
      return result;
  }
  *a4 = v4;
  return result;
}

const __CFString *BRLTModeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("?");
  else
    return off_24CBF0E78[a1 - 1];
}

unint64_t BRLTJUnicharIndexForIndex(void *a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1;
  if (a2 < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    while (v4 < objc_msgSend(v3, "length"))
    {
      v5 = objc_msgSend(v3, "rangeOfComposedCharacterSequenceAtIndex:", v4);
      v4 = v5 + v6;
      if (!--a2)
        goto LABEL_8;
    }
    v4 = objc_msgSend(v3, "length");
  }
LABEL_8:

  return v4;
}

unint64_t BRLTJUnicharRangeForRange(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  id v6;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = a1;
    v3 = BRLTJUnicharIndexForIndex(v6, a2);
    BRLTJUnicharIndexForIndex(v6, a2 + a3);

  }
  return v3;
}

uint64_t BRLTJIndexForUnicharIndex(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a1;
  v4 = v3;
  if (a2 < 0)
    goto LABEL_10;
  if (objc_msgSend(v3, "length") < (unint64_t)a2)
    a2 = objc_msgSend(v4, "length");
  if (a2 < 1)
  {
LABEL_10:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v4, "rangeOfComposedCharacterSequenceAtIndex:", v6);
      v6 = v7 + v8;
      if (v7 + v8 <= a2)
        ++v5;
    }
    while (v7 + v8 < a2);
  }

  return v5;
}

uint64_t BRLTJRangeForUnicharRange(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v6;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = a1;
    v3 = BRLTJIndexForUnicharIndex(v6, a2);
    BRLTJIndexForUnicharIndex(v6, a2 + a3);

  }
  return v3;
}

id BRLTTranslationServiceInterface()
{
  if (BRLTTranslationServiceInterface_onceToken != -1)
    dispatch_once(&BRLTTranslationServiceInterface_onceToken, &__block_literal_global);
  return (id)BRLTTranslationServiceInterface__Interface;
}

id BRLTTranslationServiceClientInterface()
{
  if (BRLTTranslationServiceClientInterface_onceToken != -1)
    dispatch_once(&BRLTTranslationServiceClientInterface_onceToken, &__block_literal_global_10);
  return (id)BRLTTranslationServiceClientInterface__Interface;
}

void sub_2114BCD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2114BDC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2114BDE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id BRLTLog()
{
  id v0;

  if (MEMORY[0x24BDFE440])
  {
    BRLLogTranslation();
    v0 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (BRLTLog_onceToken != -1)
      dispatch_once(&BRLTLog_onceToken, &__block_literal_global_1);
    v0 = (id)BRLTLog_Logger;
  }
  return v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t BRLTTranslatorClassIsValid(void *a1)
{
  char v2;
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  __int128 v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  _QWORD v15[10];

  v15[9] = *MEMORY[0x24BDAC8D0];
  v15[0] = sel_interfaceVersion;
  v15[1] = sel_setActiveTable_;
  v15[2] = sel_activeTable;
  v15[3] = sel_activeTableSupportsContractedBraille;
  v15[4] = sel_activeTableSupportsEightDotBraille;
  v15[5] = sel_activeTableSupportsTechnicalBraille;
  v15[6] = sel_activeTableSupportsIPA;
  v15[7] = sel_printBrailleForText_mode_locations_textPositionsRange_textFormattingRanges_;
  v15[8] = sel_textForPrintBraille_mode_locations_;
  v2 = objc_msgSend(a1, "conformsToProtocol:", &unk_254AB97A8);
  if ((v2 & 1) == 0)
  {
    BRLTLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      BRLTTranslatorClassIsValid_cold_1((uint64_t)a1, v4);

  }
  v5 = 0;
  *(_QWORD *)&v3 = 138412546;
  v10 = v3;
  do
  {
    v6 = (const char *)v15[v5];
    if ((objc_msgSend(a1, "instancesRespondToSelector:", v6, v10) & 1) == 0)
    {
      BRLTLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v10;
        v12 = a1;
        v13 = 2112;
        v14 = v8;
        _os_log_error_impl(&dword_2114B8000, v7, OS_LOG_TYPE_ERROR, "%@ doesn't implement %@", buf, 0x16u);

      }
      v2 = 0;
    }
    ++v5;
  }
  while (v5 != 9);
  return v2 & 1;
}

id BRLTFirstPreferredLocale()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredLocalizations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id BRLTLocalizedNameForLanguage(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  BRLTFirstPreferredLocale();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForLanguage:context:", v1, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id BRLTLocalizedStringForKey(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24CBF1330, CFSTR("BrailleTables"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_2114C5110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSUInteger _unionRangeIgnoringNotFound(NSRange a1, NSRange a2)
{
  if (a1.location != 0x7FFFFFFFFFFFFFFFLL && a2.location != 0x7FFFFFFFFFFFFFFFLL)
    return NSUnionRange(a1, a2).location;
  if (a1.location == 0x7FFFFFFFFFFFFFFFLL)
    a1.location = a2.location;
  return a1.location;
}

uint64_t sub_2114C7A88()
{
  return 0;
}

uint64_t sub_2114C7AC0()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1 | (*(_QWORD *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage) == *(_QWORD *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8));
}

unint64_t sub_2114C7AF4()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
    return 0;
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
  v2 = sub_2114E4FBC();
  result = sub_2114E4FBC();
  if (result >> 14 >= v2 >> 14)
  {
    v4 = sub_2114E5004();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    swift_bridgeObjectRelease();
    v1 = MEMORY[0x212BDAD78](v4, v6, v8, v10);
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_2114C7BF8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;
  char *v3;
  uint64_t v4;
  char v5;
  char v6;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
  if ((result & 1) != 0)
  {
    result = (*(uint64_t (**)(void))((*v1 & *v0) + 0x90))();
    v3 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
    *(_QWORD *)v3 = result;
    *((_QWORD *)v3 + 1) = v4;
    v6 = v5 & 1;
  }
  else
  {
    v3 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = 0;
    v6 = 1;
  }
  v3[16] = v6;
  return result;
}

uint64_t sub_2114C7C74()
{
  return MEMORY[0x24BEE4AF8];
}

id BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char *v18;
  char v20;

  v20 = a5 & 1;
  v14 = a5 & 1 | (a3 != a4);
  if (v14)
    v15 = 0;
  else
    v15 = a3;
  if (a5 & 1 | (a3 != a4))
    v16 = 0;
  else
    v16 = a4;
  v17 = a8 & 1;
  v18 = (char *)objc_allocWithZone((Class)type metadata accessor for BRLTJBrailleString())
      + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(_QWORD *)v18 = v15;
  *((_QWORD *)v18 + 1) = v16;
  v18[16] = v14;
  return BRLTJEditableString.init(string:selection:focus:suggestion:tokenRanges:)(a1, a2, a3, a4, v20, a6, a7, v17, a9, a10, a11 & 1, a12);
}

uint64_t type metadata accessor for BRLTJBrailleString()
{
  return objc_opt_self();
}

id BRLTJBrailleString.__allocating_init(editableString:)(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x78))();
  v29 = v4;
  v30 = v3;
  v5 = (*(uint64_t (**)(void))((*v2 & *a1) + 0x90))();
  v7 = v6;
  v9 = v8;
  v28 = v8 & 1;
  v10 = (*(uint64_t (**)(void))((*v2 & *a1) + 0xA8))();
  v26 = v11;
  v27 = v10;
  v13 = v12;
  v15 = (*(uint64_t (**)(void))((*v2 & *a1) + 0xC0))();
  v17 = v16;
  v18 = v9 | (v5 != v7);
  v19 = v9 & 1 | (v5 != v7);
  if ((v18 & 1) != 0)
    v20 = 0;
  else
    v20 = v5;
  if ((v18 & 1) != 0)
    v21 = 0;
  else
    v21 = v7;
  v22 = v14 & 1;
  v23 = (char *)objc_allocWithZone((Class)type metadata accessor for BRLTJBrailleString())
      + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(_QWORD *)v23 = v20;
  *((_QWORD *)v23 + 1) = v21;
  v23[16] = v19;
  v24 = BRLTJEditableString.init(string:selection:focus:suggestion:tokenRanges:)(v30, v29, v5, v7, v28, v27, v26, v13 & 1, v15, v17, v22, MEMORY[0x24BEE4AF8]);

  return v24;
}

uint64_t sub_2114C7EBC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;

  result = sub_2114D6F24(a1, a2, a3 & 1);
  v8 = v3 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(_QWORD *)v8 = 0;
  *(_QWORD *)(v8 + 8) = 0;
  *(_BYTE *)(v8 + 16) = 1;
  if ((a3 & 1) == 0 && a1 == a2)
  {
    *(_QWORD *)v8 = a1;
    *(_QWORD *)(v8 + 8) = a1;
    *(_BYTE *)(v8 + 16) = 0;
  }
  return result;
}

uint64_t sub_2114C7F1C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_2114D7054();
  v2 = v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(_QWORD *)v2 = 0;
  *(_QWORD *)(v2 + 8) = 0;
  *(_BYTE *)(v2 + 16) = 1;
  return result;
}

uint64_t sub_2114C7F48()
{
  _QWORD *v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  uint64_t v3;
  char v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;

  v1 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90);
  v2 = v1();
  if ((v4 & 1) == 0 && v2 != v3)
  {
    v5 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
    *(_QWORD *)v5 = v2;
    *((_QWORD *)v5 + 1) = v2;
    v5[16] = 0;
  }
  v6 = sub_2114D70D0();
  v7 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
  {
    result = ((uint64_t (*)(uint64_t))v1)(v6);
    v10 = result;
    v12 = v11 & 1;
LABEL_9:
    *(_QWORD *)v7 = v10;
    *((_QWORD *)v7 + 1) = v9;
    v7[16] = v12;
    return result;
  }
  v10 = *(_QWORD *)v7;
  v13 = *((_QWORD *)v7 + 1);
  result = sub_2114E4F98();
  v9 = v13 + result;
  if (__OFADD__(v13, result))
  {
    __break(1u);
  }
  else if (v9 >= v10)
  {
    v12 = 0;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_2114C8014()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
  if ((v3 & 1) != 0)
    return 0;
  v4 = v1;
  v5 = v2;
  result = sub_2114D7310();
  if ((result & 1) == 0)
    return 0;
  v7 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  if (v4 != v5)
  {
    *(_QWORD *)v7 = v4;
    *((_QWORD *)v7 + 1) = v4;
    v8 = v7 + 16;
LABEL_12:
    *v8 = 0;
    return 1;
  }
  if ((v7[16] & 1) != 0)
    return 1;
  v8 = v7 + 16;
  v9 = *((_QWORD *)v7 + 1);
  if (*(_QWORD *)v7 < v9)
  {
    v10 = v9 - 1;
LABEL_11:
    *((_QWORD *)v7 + 1) = v10;
    goto LABEL_12;
  }
  v11 = __OFSUB__(v9, 1);
  v12 = v9 - 1;
  if (!v11)
  {
    v10 = v12 & ~(v12 >> 63);
    *(_QWORD *)v7 = v10;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_2114C80CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char *v4;

  if ((sub_2114D7564() & 1) == 0)
    return 0;
  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
  if ((v3 & 1) != 0)
    return 0;
  v4 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(_QWORD *)v4 = v1;
  *((_QWORD *)v4 + 1) = v2;
  v4[16] = 0;
  return 1;
}

uint64_t sub_2114C8128()
{
  _QWORD *v0;
  uint64_t v1;
  void (*v2)(void);
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
    return 0;
  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage);
  v2 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78);
  v2();
  v2();
  swift_bridgeObjectRelease();
  v3 = sub_2114E4FBC();
  v4 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v2)(v4);
  v5 = swift_bridgeObjectRelease();
  if (v3 >= 0x4000)
  {
    ((void (*)(uint64_t))v2)(v5);
    v6 = sub_2114E4FB0();
    v7 = swift_bridgeObjectRelease();
    ((void (*)(uint64_t))v2)(v7);
    v8 = sub_2114E4FF8();
    v10 = v9;
    swift_bridgeObjectRelease();
    if (v8 == 8429794 && v10 == 0xA300000000000000)
    {
LABEL_13:
      swift_bridgeObjectRelease();
    }
    else
    {
      while (1)
      {
        v12 = sub_2114E516C();
        result = swift_bridgeObjectRelease();
        if ((v12 & 1) != 0)
          break;
        if (__OFSUB__(v1--, 1))
        {
          __break(1u);
          return result;
        }
        ((void (*)(uint64_t))v2)(result);
        v15 = swift_bridgeObjectRelease();
        if (v6 < 0x4000)
          return v1;
        ((void (*)(uint64_t))v2)(v15);
        v6 = sub_2114E4FB0();
        v16 = swift_bridgeObjectRelease();
        ((void (*)(uint64_t))v2)(v16);
        v17 = sub_2114E4FF8();
        v19 = v18;
        swift_bridgeObjectRelease();
        if (v17 == 8429794 && v19 == 0xA300000000000000)
          goto LABEL_13;
      }
    }
  }
  return v1;
}

uint64_t sub_2114C8314()
{
  _QWORD *v0;
  uint64_t v1;
  void (*v2)(void);
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
    return 0;
  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8);
  v2 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78);
  v2();
  v2();
  swift_bridgeObjectRelease();
  v3 = sub_2114E4FBC();
  v4 = swift_bridgeObjectRelease();
  while (1)
  {
    v5 = ((uint64_t (*)(uint64_t))v2)(v4);
    v7 = v6;
    v8 = swift_bridgeObjectRelease();
    v9 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0)
      v9 = v5 & 0xFFFFFFFFFFFFLL;
    if (v3 >> 14 == 4 * v9)
      return v1;
    ((void (*)(uint64_t))v2)(v8);
    v10 = sub_2114E4FF8();
    v12 = v11;
    swift_bridgeObjectRelease();
    if (v10 == 8429794 && v12 == 0xA300000000000000)
      goto LABEL_13;
    v13 = sub_2114E516C();
    v14 = swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
      return v1;
    ((void (*)(uint64_t))v2)(v14);
    v3 = sub_2114E4FA4();
    v4 = swift_bridgeObjectRelease();
    if (__OFADD__(v1++, 1))
    {
      __break(1u);
LABEL_13:
      swift_bridgeObjectRelease();
      return v1;
    }
  }
}

uint64_t sub_2114C84A8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v3)(void);
  uint64_t v4;
  uint64_t result;
  char v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
    return 0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78);
  v3();
  v3();
  v4 = swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(uint64_t))((*v2 & *v0) + 0x1B0))(v4);
  if ((v6 & 1) == 0)
  {
    v7 = sub_2114E4FBC();
    v8 = swift_bridgeObjectRelease();
    ((void (*)(uint64_t))v3)(v8);
    v3();
    swift_bridgeObjectRelease();
    v9 = sub_2114E4FBC();
    v10 = swift_bridgeObjectRelease();
    result = ((uint64_t (*)(uint64_t))v3)(v10);
    if (v9 >> 14 >= v7 >> 14)
    {
      v11 = sub_2114E5004();
      v13 = v12;
      v15 = v14;
      v17 = v16;
      swift_bridgeObjectRelease();
      v1 = MEMORY[0x212BDAD78](v11, v13, v15, v17);
      swift_bridgeObjectRelease();
      return v1;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2114C860C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v3)(void);
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
    return 0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78);
  v3();
  v3();
  swift_bridgeObjectRelease();
  v4 = sub_2114E4FBC();
  v5 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v3)(v5);
  v3();
  v6 = swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(uint64_t))((*v2 & *v0) + 0x1B8))(v6);
  if ((v8 & 1) == 0)
  {
    v9 = sub_2114E4FBC();
    v10 = swift_bridgeObjectRelease();
    result = ((uint64_t (*)(uint64_t))v3)(v10);
    if (v9 >> 14 >= v4 >> 14)
    {
      v11 = sub_2114E5004();
      v13 = v12;
      v15 = v14;
      v17 = v16;
      swift_bridgeObjectRelease();
      v1 = MEMORY[0x212BDAD78](v11, v13, v15, v17);
      swift_bridgeObjectRelease();
      return v1;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_2114C877C()
{
  _QWORD *v0;
  _QWORD *v1;
  char v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id result;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  id v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v2 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
  v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x78);
  v4 = v3();
  v6 = v5;
  if ((v2 & 1) != 0)
    return (id)v4;
  v3();
  v3();
  result = (id)swift_bridgeObjectRelease();
  v8 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
    goto LABEL_16;
  v9 = sub_2114E4FBC();
  v10 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v3)(v10);
  v63 = sub_2114E4FA4();
  v11 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v3)(v11);
  sub_2114E4FF8();
  swift_bridgeObjectRelease();
  v12 = objc_allocWithZone((Class)BRLTBrailleChar);
  v13 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithUnicode_, v13);

  if ((objc_msgSend(v14, sel_dot7) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    v61 = v14;
    result = objc_msgSend(v14, sel_bits);
    if (((((_DWORD)result + 64) >> 8) & 1) != 0)
    {
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    v15 = objc_msgSend(objc_allocWithZone((Class)BRLTBrailleChar), sel_initWithBits_, ((_BYTE)result + 64));
    v16 = objc_msgSend(v15, sel_unicode);

    sub_2114E4F5C();
    v3();
    v17 = sub_2114E5004();
    v19 = v18;
    v21 = v20;
    v60 = v8;
    v23 = v22;
    swift_bridgeObjectRelease();
    v24 = MEMORY[0x212BDAD78](v17, v19, v21, v23);
    v26 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2114E4FD4();
    swift_bridgeObjectRelease();
    v27 = swift_bridgeObjectRelease();
    v28 = v26;
    v29 = ((uint64_t (*)(uint64_t))v3)(v27);
    v31 = sub_2114C8CF8(v63, v29, v30);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    MEMORY[0x212BDAD78](v31, v33, v35, v37);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2114E4FD4();
    swift_bridgeObjectRelease();
    v8 = v60;
    swift_bridgeObjectRelease();
    v4 = v24;
    v6 = v28;
    v14 = v61;
  }
  v3();
  result = (id)swift_bridgeObjectRelease();
  if (v9 < 0x4000)
  {

    return (id)v4;
  }
  if ((v8[16] & 1) == 0)
  {
    v38 = sub_2114E4FBC();
    sub_2114E4FB0();
    sub_2114E4FF8();
    v39 = objc_allocWithZone((Class)BRLTBrailleChar);
    v40 = (void *)sub_2114E4F50();
    swift_bridgeObjectRelease();
    v41 = objc_msgSend(v39, sel_initWithUnicode_, v40);

    if ((objc_msgSend(v41, sel_dot8) & 1) != 0)
    {

      return (id)v4;
    }
    v62 = v14;
    v64 = v38;
    result = objc_msgSend(v41, sel_bits);
    if (((((_DWORD)result + 128) >> 8) & 1) == 0)
    {
      v42 = objc_msgSend(objc_allocWithZone((Class)BRLTBrailleChar), sel_initWithBits_, ((_BYTE)result + 0x80));
      v43 = objc_msgSend(v42, sel_unicode);

      sub_2114E4F5C();
      swift_bridgeObjectRetain();
      v44 = sub_2114E5004();
      v46 = v45;
      v48 = v47;
      v50 = v49;
      swift_bridgeObjectRelease();
      v51 = MEMORY[0x212BDAD78](v44, v46, v48, v50);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2114E4FD4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v52 = v51;
      v53 = sub_2114C8CF8(v64, v4, v6);
      v55 = v54;
      v57 = v56;
      v59 = v58;
      swift_bridgeObjectRelease();
      MEMORY[0x212BDAD78](v53, v55, v57, v59);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2114E4FD4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return (id)v52;
    }
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
  return result;
}

unint64_t sub_2114C8CF8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_2114E5004();
  __break(1u);
  return result;
}

uint64_t sub_2114C8D48(uint64_t a1)
{
  _QWORD *v1;
  char v2;
  _QWORD *v4;
  _BYTE v5[24];
  uint64_t v6;

  sub_2114C9608(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_2114C9690((uint64_t)v5);
    goto LABEL_5;
  }
  type metadata accessor for BRLTJBrailleString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v2 = 0;
    return v2 & 1;
  }
  v2 = _s18BrailleTranslation18BRLTJBrailleStringC2eeoiySbAC_ACtFZ_0(v1, v4);

  return v2 & 1;
}

id sub_2114C8EB8(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2114C8F10()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  sub_2114E50E8();
  v1 = sub_2114E4FD4();
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))(v1);
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  v3 = sub_2114E4FD4();
  (*(void (**)(uint64_t))((*v2 & *v0) + 0x90))(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3680);
  sub_2114E4F68();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  sub_2114E4FD4();
  sub_2114E4F68();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  return 0;
}

__n128 sub_2114C9088@<Q0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  objc_class *v26;
  char *v27;
  char *v28;
  char *v29;
  unsigned __int8 v30;
  __n128 *v31;
  __n128 result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;

  v2 = v1;
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v4 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x78))();
  v38 = v5;
  v39 = v4;
  v6 = (*(uint64_t (**)(void))((*v3 & *v1) + 0x90))();
  v8 = v7;
  v10 = v9;
  v37 = v9 & 1;
  v11 = (*(uint64_t (**)(void))((*v3 & *v1) + 0xA8))();
  v35 = v12;
  v36 = v11;
  v14 = v13;
  v15 = (*(uint64_t (**)(void))((*v3 & *v1) + 0xC0))();
  v33 = v16;
  v34 = v15;
  v18 = v17;
  v19 = (*(uint64_t (**)(void))((*v3 & *v1) + 0xD8))();
  v20 = v10 | (v6 != v8);
  v21 = v10 & 1 | (v6 != v8);
  if ((v20 & 1) != 0)
    v22 = 0;
  else
    v22 = v6;
  if ((v20 & 1) != 0)
    v23 = 0;
  else
    v23 = v8;
  v24 = v18 & 1;
  v25 = v14 & 1;
  v26 = (objc_class *)type metadata accessor for BRLTJBrailleString();
  v27 = (char *)objc_allocWithZone(v26);
  v28 = &v27[OBJC_IVAR___BRLTJBrailleStringInternal_stage];
  *(_QWORD *)v28 = v22;
  *((_QWORD *)v28 + 1) = v23;
  v28[16] = v21;
  v29 = (char *)BRLTJEditableString.init(string:selection:focus:suggestion:tokenRanges:)(v39, v38, v6, v8, v37, v36, v35, v25, v34, v33, v24, v19);
  v30 = *((_BYTE *)v2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16);
  v31 = (__n128 *)&v29[OBJC_IVAR___BRLTJBrailleStringInternal_stage];
  result = *(__n128 *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage);
  *v31 = result;
  v31[1].n128_u8[0] = v30;
  a1[3] = v26;
  *a1 = v29;
  return result;
}

id BRLTJBrailleString.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTJBrailleString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BRLTJBrailleString.NSStage.getter()
{
  uint64_t v0;

  return sub_2114DA4CC(*(_QWORD *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage), *(_QWORD *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8), *(_BYTE *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16));
}

uint64_t _s18BrailleTranslation18BRLTJBrailleStringC2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v61;
  uint64_t (*v62)(uint64_t);
  uint64_t v63;
  uint64_t v64;

  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x78))();
  v7 = v6;
  v9 = v5 == (*(uint64_t (**)(void))((*v4 & *a2) + 0x78))() && v7 == v8;
  if (v9)
  {
    v11 = swift_bridgeObjectRelease_n();
  }
  else
  {
    v10 = sub_2114E516C();
    swift_bridgeObjectRelease();
    v11 = swift_bridgeObjectRelease();
    v12 = 0;
    if ((v10 & 1) == 0)
      return v12;
  }
  v13 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0x90))(v11);
  v15 = v14;
  v17 = v16;
  v18 = (*(uint64_t (**)(void))((*v4 & *a2) + 0x90))();
  if ((v17 & 1) != 0)
  {
    if ((v20 & 1) == 0)
      return 0;
  }
  else
  {
    if ((v20 & 1) != 0)
      return 0;
    if (v13 != v18 || v15 != v19)
      return 0;
  }
  v22 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xA8))(v18);
  v24 = v23;
  v26 = v25;
  v27 = (*(uint64_t (**)(void))((*v4 & *a2) + 0xA8))();
  if ((v26 & 1) != 0)
  {
    if ((v29 & 1) == 0)
      return 0;
  }
  else
  {
    if ((v29 & 1) != 0)
      return 0;
    if (v22 != v27 || v24 != v28)
      return 0;
  }
  v31 = (_QWORD *)((char *)a1 + OBJC_IVAR___BRLTJBrailleStringInternal_stage);
  v32 = (_QWORD *)((char *)a2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage);
  if ((*((_BYTE *)a1 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
  {
    if ((*((_BYTE *)a2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0)
      goto LABEL_30;
    return 0;
  }
  v12 = 0;
  if ((*((_BYTE *)a2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0 || *v31 != *v32 || v31[1] != v32[1])
    return v12;
LABEL_30:
  v33 = *(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xD8);
  v34 = *(_QWORD *)(v33(v27) + 16);
  v35 = swift_bridgeObjectRelease();
  v62 = *(uint64_t (**)(uint64_t))((*v4 & *a2) + 0xD8);
  v36 = *(_QWORD *)(v62(v35) + 16);
  v37 = swift_bridgeObjectRelease();
  if (v34 != v36)
    return 0;
  v38 = *(_QWORD *)(v33(v37) + 16);
  v39 = swift_bridgeObjectRelease();
  v61 = v38;
  if (!v38)
    return 1;
  result = v33(v39);
  if (*(_QWORD *)(result + 16))
  {
    v42 = *(_QWORD *)(result + 32);
    v41 = *(_QWORD *)(result + 40);
    v43 = *(_QWORD *)(result + 48);
    v44 = swift_bridgeObjectRelease();
    result = v62(v44);
    if (*(_QWORD *)(result + 16))
    {
      v46 = *(_QWORD *)(result + 32);
      v45 = *(_QWORD *)(result + 40);
      v47 = *(_QWORD *)(result + 48);
      v48 = swift_bridgeObjectRelease();
      v12 = 0;
      if (v42 == v46 && v41 == v45 && v43 == v47)
      {
        v49 = 0;
        v50 = 1;
        while (1)
        {
          v12 = v61 == v50;
          if (v61 == v50)
            break;
          result = v33(v48);
          if (v50 >= *(_QWORD *)(result + 16))
          {
            __break(1u);
LABEL_53:
            __break(1u);
            goto LABEL_54;
          }
          ++v50;
          v52 = *(_QWORD *)(result + v49 + 56);
          v51 = *(_QWORD *)(result + v49 + 64);
          v53 = *(_QWORD *)(result + v49 + 72);
          v54 = swift_bridgeObjectRelease();
          result = v62(v54);
          if (v50 - 1 >= *(_QWORD *)(result + 16))
            goto LABEL_53;
          v55 = v49 + 24;
          v56 = result + v49;
          v57 = *(_QWORD *)(result + v49 + 56);
          v63 = *(_QWORD *)(v56 + 64);
          v64 = v55;
          v58 = *(_QWORD *)(v56 + 72);
          v48 = swift_bridgeObjectRelease();
          v9 = v52 == v57;
          v49 = v64;
          if (!v9 || v51 != v63 || v53 != v58)
            return v12;
        }
      }
      return v12;
    }
  }
  else
  {
LABEL_54:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2114C9608(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3678);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BDB558]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2114C9690(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3678);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for BRLTJBrailleString()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTJBrailleString.isStageEmpty.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of BRLTJBrailleString.stageString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of BRLTJBrailleString.resetStage()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of BRLTJBrailleString.stageSignalledString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_2114C9790()
{
  swift_deletedMethodError();
  __break(1u);
}

_QWORD *sub_2114C97A0()
{
  _QWORD *result;
  uint64_t v1;

  result = (_QWORD *)swift_allocObject();
  result[2] = &unk_24CBF0BE8;
  result[3] = &unk_24CBF0BB8;
  v1 = MEMORY[0x24BEE4AF8];
  result[4] = 0;
  result[5] = v1;
  return result;
}

_QWORD *sub_2114C97E0()
{
  _QWORD *v0;
  _QWORD *result;
  uint64_t v2;

  result = v0;
  v0[2] = &unk_24CBF0C48;
  v0[3] = &unk_24CBF0C18;
  v2 = MEMORY[0x24BEE4AF8];
  v0[4] = 0;
  v0[5] = v2;
  return result;
}

unint64_t sub_2114C9808(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  _QWORD *v64;
  char *v65;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t *v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  _QWORD *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v5 = v4;
  v7 = *a1;
  v8 = a1[1];
  v9 = a1[2];
  v10 = a1[3];
  v95 = v5;
  if ((a4 & 1) == 0)
  {
    v12 = sub_2114CA3A4(a2, v9, v10, 1);
    sub_2114CB2B8(v12, v13);
    if (sub_2114E4F98() < v14)
      sub_2114E4F98();
    v15 = sub_2114E4FBC();
    result = sub_2114E4FBC();
    if (result >> 14 < v15 >> 14)
      goto LABEL_36;
    v17 = sub_2114E5004();
    v18 = MEMORY[0x212BDAD78](v17);
    v20 = v19;
    swift_bridgeObjectRelease();
    v98 = v18;
    v99 = v20;
    v96 = a2;
    v21 = sub_2114E4F14();
    v22 = v10;
    v23 = *(_QWORD *)(v21 - 8);
    v24 = *(_QWORD *)(v23 + 64);
    MEMORY[0x24BDAC7A8](v21);
    sub_2114E4F08();
    v92 = sub_2114CA788();
    v25 = sub_2114E50AC();
    v27 = v26;
    v28 = *(uint64_t **)(v23 + 8);
    v93 = v21;
    v91 = v28;
    ((void (*)(char *, uint64_t))v28)((char *)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3688);
    v29 = swift_allocObject();
    v90 = xmmword_2114E7C40;
    *(_OWORD *)(v29 + 16) = xmmword_2114E7C40;
    *(_QWORD *)(v29 + 32) = v25;
    *(_QWORD *)(v29 + 40) = v27;
    v5[3] = v29;
    swift_bridgeObjectRelease();
    sub_2114CA3A4(v96, v9, v22, 0);
    if (sub_2114E4F98() < v30)
      sub_2114E4F98();
    v31 = sub_2114E4FBC();
    result = sub_2114E4FBC();
    if (result >> 14 < v31 >> 14)
      goto LABEL_37;
    v32 = sub_2114E5004();
    v33 = MEMORY[0x212BDAD78](v32);
    v35 = v34;
    v36 = swift_bridgeObjectRelease();
    v98 = v33;
    v99 = v35;
    MEMORY[0x24BDAC7A8](v36);
    sub_2114E4F08();
    v37 = sub_2114E50AC();
    v39 = v38;
    ((void (*)(char *, uint64_t))v91)((char *)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v93);
    swift_bridgeObjectRelease();
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = v90;
    *(_QWORD *)(v40 + 32) = v37;
    *(_QWORD *)(v40 + 40) = v39;
    v5 = v95;
    v95[2] = v40;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v41 = MEMORY[0x24BEE4AF8];
  v5[3] = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v5[2] = v41;
  swift_bridgeObjectRelease();
  if (sub_2114E4F98() < 1 || (v42 = v10, v43 = sub_2114CA3A4(0, v9, v10, 1), v43 == v44))
  {
LABEL_11:
    if (!*(_QWORD *)(v5[3] + 16))
    {
      v5[3] = &unk_24CBF0B88;
      swift_bridgeObjectRelease();
      v5[2] = &unk_24CBF0B58;
      swift_bridgeObjectRelease();
    }
    v5[4] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3688);
    result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_2114E7C40;
    if (*(_QWORD *)(v5[3] + 16))
    {
      v45 = result;
      swift_bridgeObjectRetain();
      v46 = sub_2114CA648();
      v48 = v47;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v45 + 32) = v46;
      *(_QWORD *)(v45 + 40) = v48;
      v5[5] = v45;
      return swift_bridgeObjectRelease();
    }
    goto LABEL_35;
  }
  v49 = v44;
  v50 = 0;
  v97 = v9;
  v93 = v7;
  v94 = v42;
  v91 = a1;
  v92 = v8;
  while (1)
  {
    sub_2114CB2B8(v43, v49);
    if (sub_2114E4F98() < v51)
      sub_2114E4F98();
    v52 = sub_2114E4FBC();
    result = sub_2114E4FBC();
    if (result >> 14 < v52 >> 14)
      break;
    v53 = sub_2114E5004();
    v54 = MEMORY[0x212BDAD78](v53);
    v56 = v55;
    swift_bridgeObjectRelease();
    v98 = v54;
    v99 = v56;
    v57 = sub_2114E4F14();
    v58 = *(_QWORD *)(v57 - 8);
    v59 = *(_QWORD *)(v58 + 64);
    ((void (*)(void))MEMORY[0x24BDAC7A8])();
    sub_2114E4F08();
    v96 = sub_2114CA788();
    v60 = sub_2114E50AC();
    v62 = v61;
    v63 = *(void (**)(char *, uint64_t))(v58 + 8);
    v63((char *)&v90 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0), v57);
    swift_bridgeObjectRelease();
    v64 = v5;
    v65 = (char *)v5[3];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v64[3] = v65;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v65 = sub_2114CA2A4(0, *((_QWORD *)v65 + 2) + 1, 1, v65);
      v95[3] = v65;
    }
    v68 = *((_QWORD *)v65 + 2);
    v67 = *((_QWORD *)v65 + 3);
    if (v68 >= v67 >> 1)
    {
      v65 = sub_2114CA2A4((char *)(v67 > 1), v68 + 1, 1, v65);
      v95[3] = v65;
    }
    *((_QWORD *)v65 + 2) = v68 + 1;
    v69 = &v65[16 * v68];
    *((_QWORD *)v69 + 4) = v60;
    *((_QWORD *)v69 + 5) = v62;
    v70 = v50;
    v71 = v94;
    sub_2114CA3A4(v70, v97, v94, 0);
    if (sub_2114E4F98() < v72)
      sub_2114E4F98();
    v73 = sub_2114E4FBC();
    result = sub_2114E4FBC();
    if (result >> 14 < v73 >> 14)
      goto LABEL_34;
    v74 = sub_2114E5004();
    v75 = MEMORY[0x212BDAD78](v74);
    v77 = v76;
    v78 = swift_bridgeObjectRelease();
    v98 = v75;
    v99 = v77;
    MEMORY[0x24BDAC7A8](v78);
    v79 = (char *)&v90 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2114E4F08();
    v80 = sub_2114E50AC();
    v82 = v81;
    v63(v79, v57);
    swift_bridgeObjectRelease();
    v5 = v95;
    v83 = (char *)v95[2];
    v84 = swift_isUniquelyReferenced_nonNull_native();
    v5[2] = v83;
    if ((v84 & 1) == 0)
    {
      v83 = sub_2114CA2A4(0, *((_QWORD *)v83 + 2) + 1, 1, v83);
      v5[2] = v83;
    }
    v86 = *((_QWORD *)v83 + 2);
    v85 = *((_QWORD *)v83 + 3);
    if (v86 >= v85 >> 1)
    {
      v83 = sub_2114CA2A4((char *)(v85 > 1), v86 + 1, 1, v83);
      v5[2] = v83;
    }
    *((_QWORD *)v83 + 2) = v86 + 1;
    v87 = &v83[16 * v86];
    *((_QWORD *)v87 + 4) = v80;
    *((_QWORD *)v87 + 5) = v82;
    v88 = v97;
    if (v49 < sub_2114E4F98())
    {
      v43 = sub_2114CA3A4(v49, v88, v71, 1);
      v50 = v49;
      v49 = v89;
      if (v43 != v89)
        continue;
    }
    goto LABEL_11;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

BOOL sub_2114C9FD4()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  _BOOL8 result;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (!v2)
    return v3 < *(_QWORD *)(*(_QWORD *)(v0 + 24) + 16);
  __break(1u);
  return result;
}

BOOL sub_2114C9FF8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32) > 0;
}

uint64_t sub_2114CA008()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;

  result = (*(uint64_t (**)(void))(*v1 + 224))();
  if ((result & 1) == 0)
    return result;
  v5 = v1[4];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v1[4] = v7;
  if (v7 != *(_QWORD *)(v1[5] + 16))
    return result;
  if (v7 >= *(_QWORD *)(v1[3] + 16))
    goto LABEL_11;
  swift_bridgeObjectRetain();
  v0 = sub_2114CA648();
  v2 = v8;
  swift_bridgeObjectRelease();
  v3 = v1[5];
  result = swift_isUniquelyReferenced_nonNull_native();
  v1[5] = v3;
  if ((result & 1) == 0)
  {
LABEL_12:
    result = (uint64_t)sub_2114CA2A4(0, *(_QWORD *)(v3 + 16) + 1, 1, (char *)v3);
    v3 = result;
    v1[5] = result;
  }
  v9 = *(_QWORD *)(v3 + 16);
  v10 = *(_QWORD *)(v3 + 24);
  v11 = v9 + 1;
  if (v9 >= v10 >> 1)
  {
    v15 = v9 + 1;
    v13 = (char *)v3;
    v14 = *(_QWORD *)(v3 + 16);
    result = (uint64_t)sub_2114CA2A4((char *)(v10 > 1), v9 + 1, 1, v13);
    v9 = v14;
    v11 = v15;
    v3 = result;
    v1[5] = result;
  }
  *(_QWORD *)(v3 + 16) = v11;
  v12 = v3 + 16 * v9;
  *(_QWORD *)(v12 + 32) = v0;
  *(_QWORD *)(v12 + 40) = v2;
  return result;
}

uint64_t sub_2114CA12C()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(*v0 + 232))();
  if ((result & 1) != 0)
  {
    v2 = v0[4];
    v3 = __OFSUB__(v2, 1);
    v4 = v2 - 1;
    if (v3)
      __break(1u);
    else
      v0[4] = v4;
  }
  return result;
}

void sub_2114CA160()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = v0[4];
  if ((int64_t)v1 >= *(_QWORD *)(v0[5] + 16))
  {
    if (v1 < *(_QWORD *)(v0[3] + 16))
    {
      swift_bridgeObjectRetain();
      sub_2114CA648();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    if ((v1 & 0x8000000000000000) == 0)
    {
      swift_bridgeObjectRetain();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2114CA1F4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 32);
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 16);
    if (v1 < *(_QWORD *)(v2 + 16))
    {
      v3 = *(_QWORD *)(v2 + 16 * v1 + 32);
      swift_bridgeObjectRetain();
      return v3;
    }
  }
  __break(1u);
  return result;
}

uint64_t BRLTWordDescriptionManager.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BRLTWordDescriptionManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

char *sub_2114CA2A4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3688);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_2114CA3A4(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  unint64_t result;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  char v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;

  result = sub_2114E4FBC();
  v9 = result;
  v10 = a1;
  if (result >= 0x4000)
  {
    v11 = sub_2114E4FB0();
    v13 = sub_2114E4FF8() == 8429794 && v12 == 0xA300000000000000;
    v10 = a1;
    if (v13)
    {
LABEL_13:
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v14 = sub_2114E516C();
      result = swift_bridgeObjectRelease();
      v10 = a1;
      if ((v14 & 1) == 0)
      {
        v10 = a1;
        while (1)
        {
          v16 = __OFSUB__(v10--, 1);
          if (v16)
            break;
          if (v11 < 0x4000)
            goto LABEL_14;
          v11 = sub_2114E4FB0();
          if (sub_2114E4FF8() == 8429794 && v17 == 0xA300000000000000)
            goto LABEL_13;
          v15 = sub_2114E516C();
          result = swift_bridgeObjectRelease();
          if ((v15 & 1) != 0)
            goto LABEL_14;
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }
  }
LABEL_14:
  v18 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v18 = a2 & 0xFFFFFFFFFFFFLL;
  v19 = 4 * v18;
  while (v19 != v9 >> 14)
  {
    if (sub_2114E4FF8() == 8429794 && v20 == 0xA300000000000000)
      goto LABEL_24;
    v21 = sub_2114E516C();
    result = swift_bridgeObjectRelease();
    if ((v21 & 1) != 0)
      goto LABEL_25;
    result = sub_2114E4FA4();
    v9 = result;
    v16 = __OFADD__(a1++, 1);
    if (v16)
    {
      __break(1u);
LABEL_24:
      result = swift_bridgeObjectRelease();
LABEL_25:
      if ((a4 & 1) != 0)
      {
        while (v19 != v9 >> 14)
        {
          if (sub_2114E4FF8() == 8429794 && v23 == 0xA300000000000000)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v22 = sub_2114E516C();
            result = swift_bridgeObjectRelease();
            if ((v22 & 1) == 0)
              goto LABEL_33;
          }
          result = sub_2114E4FA4();
          v9 = result;
          v16 = __OFADD__(a1++, 1);
          if (v16)
          {
            __break(1u);
            goto LABEL_36;
          }
        }
      }
      break;
    }
  }
LABEL_33:
  if (a1 >= v10)
    return v10;
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2114CA648()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = (void *)sub_2114E4F50();
  v2 = (void *)sub_2114E4F50();
  v3 = objc_msgSend(v0, sel_descriptionOfWord_forLanguage_, v1, v2);

  if (v3)
  {
    sub_2114E4F5C();

  }
  v4 = objc_msgSend(objc_allocWithZone((Class)BRLTJJapaneseProcessor), sel_init);
  v5 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_spacedYomiOfWordDescription_, v5);

  v7 = sub_2114E4F5C();
  return v7;
}

unint64_t sub_2114CA788()
{
  unint64_t result;

  result = qword_254AB3690;
  if (!qword_254AB3690)
  {
    result = MEMORY[0x212BDB564](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254AB3690);
  }
  return result;
}

uint64_t type metadata accessor for BRLTWordDescriptionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for BRLTWordDescriptionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2114CA7FC()
{
  return 0;
}

uint64_t sub_2114CA804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  void *v5;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  char *v21;
  _BYTE v23[40];
  __int128 v24;
  __int128 v25;

  v11 = (void *)sub_2114E4F50();
  v12 = objc_msgSend(v5, sel__translate_isTechnical_textFormattingRanges_, v11, a3 & 1, a4);

  v13 = sub_2114E4F44();
  sub_2114E50DC();
  if (*(_QWORD *)(v13 + 16) && (v14 = sub_2114CB820((uint64_t)v23), (v15 & 1) != 0))
  {
    sub_2114CBBF0(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v24);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  sub_2114CB850((uint64_t)v23);
  if (!*((_QWORD *)&v25 + 1))
  {
    sub_2114C9690((uint64_t)&v24);
    goto LABEL_9;
  }
  if (!swift_dynamicCast())
  {
LABEL_9:
    v16 = 0;
    v17 = 0xE000000000000000;
    goto LABEL_10;
  }
  v16 = 0x656C6C69617262;
  v17 = 0xE700000000000000;
LABEL_10:
  sub_2114E50DC();
  if (*(_QWORD *)(v13 + 16) && (v18 = sub_2114CB820((uint64_t)v23), (v19 & 1) != 0))
  {
    sub_2114CBBF0(*(_QWORD *)(v13 + 56) + 32 * v18, (uint64_t)&v24);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2114CB850((uint64_t)v23);
  if (!*((_QWORD *)&v25 + 1))
  {
    sub_2114C9690((uint64_t)&v24);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3698);
  if (!swift_dynamicCast())
  {
LABEL_18:
    v21 = (char *)sub_2114E4F98();
    v20 = (uint64_t)sub_2114CBB54(v21);
    goto LABEL_19;
  }
  v20 = 0x6E6F697461636F6CLL;
LABEL_19:
  *a5 = a1;
  a5[1] = a2;
  a5[2] = v16;
  a5[3] = v17;
  a5[4] = v20;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2114CAA3C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t sub_2114CAA4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v3;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  char *v17;
  char *v18;
  _BYTE v20[40];
  __int128 v21;
  __int128 v22;

  v7 = (void *)sub_2114E4F50();
  v8 = objc_msgSend(v3, sel__backTranslate_, v7);

  v9 = sub_2114E4F44();
  sub_2114E50DC();
  if (*(_QWORD *)(v9 + 16) && (v10 = sub_2114CB820((uint64_t)v20), (v11 & 1) != 0))
  {
    sub_2114CBBF0(*(_QWORD *)(v9 + 56) + 32 * v10, (uint64_t)&v21);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }
  sub_2114CB850((uint64_t)v20);
  if (!*((_QWORD *)&v22 + 1))
  {
    sub_2114C9690((uint64_t)&v21);
    goto LABEL_9;
  }
  if (!swift_dynamicCast())
  {
LABEL_9:
    v12 = 0;
    v13 = 0xE000000000000000;
    goto LABEL_10;
  }
  v12 = 1954047348;
  v13 = 0xE400000000000000;
LABEL_10:
  sub_2114E50DC();
  if (*(_QWORD *)(v9 + 16) && (v14 = sub_2114CB820((uint64_t)v20), (v15 & 1) != 0))
  {
    sub_2114CBBF0(*(_QWORD *)(v9 + 56) + 32 * v14, (uint64_t)&v21);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2114CB850((uint64_t)v20);
  if (*((_QWORD *)&v22 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3698);
    if (swift_dynamicCast())
    {
      v16 = 0x6E6F697461636F6CLL;
      if (!MEMORY[0x6E6F697461636F7C])
        goto LABEL_20;
      goto LABEL_21;
    }
  }
  else
  {
    sub_2114C9690((uint64_t)&v21);
  }
  v17 = (char *)sub_2114E4F98();
  v16 = (uint64_t)sub_2114CBB54(v17);
  if (!*(_QWORD *)(v16 + 16))
  {
LABEL_20:
    swift_bridgeObjectRelease();
    v18 = (char *)sub_2114E4F98();
    v16 = (uint64_t)sub_2114CBB54(v18);
  }
LABEL_21:
  *a3 = a1;
  a3[1] = a2;
  a3[2] = v12;
  a3[3] = v13;
  a3[4] = v16;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2114CAC8C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;

  v3 = a1;
  sub_2114CA804(*(_QWORD *)(a1 + OBJC_IVAR___BRLTEditStringInternal_string), *(_QWORD *)(a1 + OBJC_IVAR___BRLTEditStringInternal_string + 8), a2, *(_QWORD *)(a1 + OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges), &v65);
  v52 = v66;
  v53 = v65;
  v64 = v67;
  v55 = v68;
  v4 = (uint64_t *)(v3 + OBJC_IVAR___BRLTEditStringInternal_selection);
  v51 = *(_BYTE *)(v3 + OBJC_IVAR___BRLTEditStringInternal_selection + 16);
  if ((v51 & 1) != 0)
  {
    v50 = 0;
    v47 = 0;
  }
  else
  {
    v5 = v4[1];
    v6 = sub_2114CB570(*v4);
    result = sub_2114CB570(v5);
    v50 = v6;
    if (result < v6)
      goto LABEL_67;
    v47 = result;
  }
  v8 = (uint64_t *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus);
  v49 = *(_BYTE *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
  if ((v49 & 1) != 0)
  {
    v48 = 0;
    v46 = 0;
  }
  else
  {
    v9 = v8[1];
    v10 = sub_2114CB570(*v8);
    result = sub_2114CB570(v9);
    v48 = v10;
    if (result < v10)
      goto LABEL_68;
    v46 = result;
  }
  v11 = *(_QWORD *)(v3 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
  v58 = *(_QWORD *)(v11 + 16);
  if (!v58)
  {
    v13 = MEMORY[0x24BEE4AF8];
    goto LABEL_56;
  }
  v45 = v3;
  v57 = v11 + 32;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  v13 = MEMORY[0x24BEE4AF8];
  v56 = v11;
  do
  {
    if (v12 >= *(_QWORD *)(v11 + 16))
      goto LABEL_65;
    v61 = v13;
    v60 = v12;
    v14 = (uint64_t *)(v57 + 24 * v12);
    v16 = *v14;
    v15 = v14[1];
    v59 = v14[2];
    result = sub_2114E4F98();
    if (result >= 1)
    {
      v17 = result;
      v18 = 0;
      v19 = *((_QWORD *)&v68 + 1);
      v21 = v65;
      v20 = v66;
      v62 = *((_QWORD *)&v68 + 1) + 32;
      while (1)
      {
        v23 = v18 + v17;
        if (__OFADD__(v18, v17))
        {
          __break(1u);
LABEL_62:
          __break(1u);
LABEL_63:
          __break(1u);
LABEL_64:
          __break(1u);
LABEL_65:
          __break(1u);
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
LABEL_68:
          __break(1u);
LABEL_69:
          __break(1u);
          return result;
        }
        v24 = v23 >= 0 ? v18 + v17 : v23 + 1;
        v22 = v24 >> 1;
        if (v23 > -2)
        {
          result = sub_2114DA570(v64, v55, v24 >> 1);
          if (result >= *(_QWORD *)(v19 + 16))
            goto LABEL_26;
          if (result < 0)
            goto LABEL_63;
          result = sub_2114DA550(v21, v20, *(_QWORD *)(v62 + 8 * result));
          if ((result & 0x8000000000000000) == 0)
            break;
        }
        if (v16 > 0)
          goto LABEL_15;
LABEL_16:
        v17 = v22;
        if (v18 >= v22)
          goto LABEL_30;
      }
      v25 = result;
      result = sub_2114E4F98();
      if (result < v25)
      {
LABEL_26:
        result = sub_2114E4F98();
        v25 = result;
      }
      if (v25 >= v16)
        goto LABEL_16;
LABEL_15:
      v18 = v22 + 1;
      v22 = v17;
      goto LABEL_16;
    }
    v18 = 0;
LABEL_30:
    result = sub_2114E4F98();
    if (result >= 1)
    {
      v26 = result;
      v27 = 0;
      v28 = *((_QWORD *)&v68 + 1);
      v30 = v65;
      v29 = v66;
      v63 = *((_QWORD *)&v68 + 1) + 32;
      while (1)
      {
        v32 = v27 + v26;
        if (__OFADD__(v27, v26))
          goto LABEL_62;
        v33 = v32 >= 0 ? v27 + v26 : v32 + 1;
        v31 = v33 >> 1;
        if (v32 > -2)
        {
          result = sub_2114DA570(v64, v55, v33 >> 1);
          if (result >= *(_QWORD *)(v28 + 16))
            goto LABEL_44;
          if (result < 0)
            goto LABEL_64;
          result = sub_2114DA550(v30, v29, *(_QWORD *)(v63 + 8 * result));
          if ((result & 0x8000000000000000) == 0)
            break;
        }
        if (v15 > 0)
          goto LABEL_33;
LABEL_34:
        v26 = v31;
        if (v27 >= v31)
          goto LABEL_48;
      }
      v34 = result;
      result = sub_2114E4F98();
      if (result < v34)
      {
LABEL_44:
        result = sub_2114E4F98();
        v34 = result;
      }
      if (v34 >= v15)
        goto LABEL_34;
LABEL_33:
      v27 = v31 + 1;
      v31 = v26;
      goto LABEL_34;
    }
    v27 = 0;
LABEL_48:
    if (v27 < v18)
      goto LABEL_66;
    v13 = v61;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_2114CBA40(0, *(_QWORD *)(v61 + 16) + 1, 1, (char *)v61);
      v13 = result;
    }
    v11 = v56;
    v36 = *(_QWORD *)(v13 + 16);
    v35 = *(_QWORD *)(v13 + 24);
    if (v36 >= v35 >> 1)
    {
      result = (uint64_t)sub_2114CBA40((char *)(v35 > 1), v36 + 1, 1, (char *)v13);
      v13 = result;
    }
    v12 = v60 + 1;
    *(_QWORD *)(v13 + 16) = v36 + 1;
    v37 = (_QWORD *)(v13 + 24 * v36);
    v37[4] = v18;
    v37[5] = v27;
    v37[6] = v59;
  }
  while (v60 + 1 != v58);
  swift_bridgeObjectRelease();
  v3 = v45;
LABEL_56:
  v38 = (uint64_t *)(v3 + OBJC_IVAR___BRLTEditStringInternal_suggestion);
  v39 = *(_BYTE *)(v3 + OBJC_IVAR___BRLTEditStringInternal_suggestion + 16);
  if ((v39 & 1) != 0)
  {
    v40 = 0;
    v41 = 0;
  }
  else
  {
    v42 = v38[1];
    v40 = sub_2114CB570(*v38);
    result = sub_2114CB570(v42);
    if (result < v40)
      goto LABEL_69;
    v41 = result;
  }
  type metadata accessor for BRLTEditString();
  v43 = v67;
  v44 = v68;
  swift_bridgeObjectRetain();
  result = (uint64_t)sub_2114CC000(v43, v44, v50, v47, v51, v48, v46, v49, v13, v40, v41, v39, 0);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v53;
  *(_QWORD *)(a3 + 16) = v52;
  *(_QWORD *)(a3 + 24) = v64;
  *(_OWORD *)(a3 + 32) = v55;
  return result;
}

uint64_t sub_2114CB16C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_2114CB570(a1);
  result = sub_2114CB570(a2);
  if (result >= v3)
    return v3;
  __break(1u);
  return result;
}

uint64_t sub_2114CB1B4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2114CB1E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2114CB20C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2114CB214(uint64_t a1)
{
  uint64_t *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1 < 0)
    return 0;
  result = sub_2114DA570(v1[2], v1[3], a1);
  v3 = v1[4];
  if (result >= *(_QWORD *)(v3 + 16))
    return sub_2114E4F98();
  if ((result & 0x8000000000000000) == 0)
  {
    v4 = sub_2114DA550(*v1, v1[1], *(_QWORD *)(v3 + 8 * result + 32));
    if ((v4 & 0x8000000000000000) == 0)
    {
      v5 = v4;
      if (sub_2114E4F98() < v4)
        return sub_2114E4F98();
      return v5;
    }
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_2114CB2B8(uint64_t result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = result;
  if (result < 0)
    goto LABEL_7;
  result = sub_2114DA570(v2[2], v2[3], result);
  v5 = v2[4];
  if (result >= *(_QWORD *)(v5 + 16))
    goto LABEL_10;
  if (result < 0)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  result = sub_2114DA550(*v2, v2[1], *(_QWORD *)(v5 + 8 * result + 32));
  if (result < 0)
  {
LABEL_7:
    v6 = 0;
  }
  else
  {
    v6 = result;
    result = sub_2114E4F98();
    if (result < v6)
    {
LABEL_10:
      result = sub_2114E4F98();
      v6 = result;
      if (v4 == a2)
        goto LABEL_12;
LABEL_11:
      v7 = v2[2];
      v8 = v2[3];
      result = sub_2114E4F98();
      v4 = a2;
      if (result <= a2)
        goto LABEL_12;
      while (1)
      {
        v11 = v4 - 1;
        if (__OFSUB__(v4, 1))
          goto LABEL_46;
        if ((v11 & 0x8000000000000000) == 0)
        {
          result = sub_2114DA570(v7, v8, v11);
          v12 = v2[4];
          if (result >= *(_QWORD *)(v12 + 16))
            goto LABEL_30;
          if (result < 0)
            goto LABEL_47;
          v13 = sub_2114DA550(*v2, v2[1], *(_QWORD *)(v12 + 8 * result + 32));
          if ((v13 & 0x8000000000000000) == 0)
            break;
        }
        if (v4 < 0)
          goto LABEL_20;
        v14 = 0;
LABEL_32:
        result = sub_2114DA570(v7, v8, v4);
        v15 = v2[4];
        if (result >= *(_QWORD *)(v15 + 16))
          goto LABEL_36;
        if (result < 0)
          goto LABEL_48;
        v16 = sub_2114DA550(*v2, v2[1], *(_QWORD *)(v15 + 8 * result + 32));
        if ((v16 & 0x8000000000000000) == 0)
        {
          v17 = v16;
          if (sub_2114E4F98() < v16)
LABEL_36:
            v17 = sub_2114E4F98();
          if (v14 < v17)
            goto LABEL_14;
          goto LABEL_20;
        }
        if (v14 < 0)
          goto LABEL_14;
LABEL_20:
        ++v4;
        result = sub_2114E4F98();
        if (v4 >= result)
          goto LABEL_12;
      }
      v14 = v13;
      result = sub_2114E4F98();
      if (result < v14)
      {
LABEL_30:
        result = sub_2114E4F98();
        v14 = result;
      }
      if (v4 < 0)
      {
        if (v14 < 0)
          goto LABEL_41;
        goto LABEL_20;
      }
      goto LABEL_32;
    }
  }
  if (v4 != a2)
    goto LABEL_11;
LABEL_12:
  if (v4 < 0)
    goto LABEL_41;
  v7 = v2[2];
  v8 = v2[3];
LABEL_14:
  result = sub_2114DA570(v7, v8, v4);
  v9 = v2[4];
  if (result >= *(_QWORD *)(v9 + 16))
  {
LABEL_44:
    result = sub_2114E4F98();
    if (result < v6)
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
    return v6;
  }
  if ((result & 0x8000000000000000) == 0)
  {
    result = sub_2114DA550(*v2, v2[1], *(_QWORD *)(v9 + 8 * result + 32));
    if ((result & 0x8000000000000000) == 0)
    {
      v10 = result;
      result = sub_2114E4F98();
      if (result < v10)
        goto LABEL_44;
LABEL_42:
      if (v10 < v6)
        goto LABEL_45;
      return v6;
    }
LABEL_41:
    v10 = 0;
    goto LABEL_42;
  }
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_2114CB570(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = v1[2];
  v4 = v1[3];
  result = sub_2114E4F98();
  if (result < 1)
    return 0;
  v6 = result;
  v7 = 0;
  while (1)
  {
    v9 = v7 + v6;
    if (__OFADD__(v7, v6))
      break;
    if (v9 >= 0)
      v10 = v7 + v6;
    else
      v10 = v9 + 1;
    v8 = v10 >> 1;
    if (v9 > -2)
    {
      result = sub_2114DA570(v3, v4, v10 >> 1);
      v11 = v1[4];
      if (result >= *(_QWORD *)(v11 + 16))
        goto LABEL_15;
      if (result < 0)
        goto LABEL_21;
      result = sub_2114DA550(*v1, v1[1], *(_QWORD *)(v11 + 8 * result + 32));
      if ((result & 0x8000000000000000) == 0)
      {
        v12 = result;
        result = sub_2114E4F98();
        if (result < v12)
        {
LABEL_15:
          result = sub_2114E4F98();
          v12 = result;
        }
        if (v12 >= a1)
          goto LABEL_5;
LABEL_4:
        v7 = v8 + 1;
        v8 = v6;
        goto LABEL_5;
      }
    }
    if (a1 > 0)
      goto LABEL_4;
LABEL_5:
    v6 = v8;
    if (v7 >= v8)
      return v7;
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_2114CB694@<X0>(uint64_t a1@<X0>, char **a2@<X8>)
{
  char **v2;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;

  v5 = v2[1];
  v24 = *v2;
  v25 = v5;
  swift_bridgeObjectRetain();
  sub_2114E4FD4();
  v6 = v24;
  v7 = v5;
  v8 = v2[3];
  v24 = v2[2];
  v25 = v8;
  swift_bridgeObjectRetain();
  sub_2114E4FD4();
  v9 = v24;
  v10 = v25;
  v11 = v2[4];
  v24 = v11;
  v12 = *(_QWORD *)(a1 + 32);
  v26 = v12;
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v22 = v9;
    v23 = v6;
    v14 = (uint64_t *)(v12 + 32);
    sub_2114CBC2C((uint64_t)&v24);
    sub_2114CBC2C((uint64_t)&v26);
    while (1)
    {
      v15 = *v14++;
      result = sub_2114E4F98();
      v17 = result + v15;
      if (__OFADD__(result, v15))
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v11 = sub_2114CB948(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
      v19 = *((_QWORD *)v11 + 2);
      v18 = *((_QWORD *)v11 + 3);
      if (v19 >= v18 >> 1)
        v11 = sub_2114CB948((char *)(v18 > 1), v19 + 1, 1, v11);
      *((_QWORD *)v11 + 2) = v19 + 1;
      *(_QWORD *)&v11[8 * v19 + 32] = v17;
      if (!--v13)
      {
        result = sub_2114CBC54((uint64_t)&v26);
        v7 = v5;
        v6 = v23;
        v20 = v22;
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  else
  {
    v21 = v9;
    result = swift_bridgeObjectRetain();
    v20 = v21;
LABEL_11:
    *a2 = v6;
    a2[1] = v7;
    a2[2] = v20;
    a2[3] = v10;
    a2[4] = v11;
  }
  return result;
}

unint64_t sub_2114CB820(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2114E50C4();
  return sub_2114CB884(a1, v2);
}

uint64_t sub_2114CB850(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_2114CB884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_2114CBEBC(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x212BDAED4](v9, a1);
      sub_2114CB850((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

char *sub_2114CB948(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB36A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2114CBA40(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB36A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 24 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2114CBB54(char *result)
{
  char *v1;
  char *v2;
  unint64_t v3;
  unint64_t v4;

  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v1 = (char *)MEMORY[0x24BEE4AF8];
    v2 = result;
    if (result)
    {
      v1 = sub_2114CB948(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v3 = *((_QWORD *)v1 + 2);
      do
      {
        v4 = *((_QWORD *)v1 + 3);
        if (v3 >= v4 >> 1)
          v1 = sub_2114CB948((char *)(v4 > 1), v3 + 1, 1, v1);
        *((_QWORD *)v1 + 2) = v3 + 1;
        *(_QWORD *)&v1[8 * v3++ + 32] = 0;
        --v2;
      }
      while (v2);
    }
    return v1;
  }
  return result;
}

uint64_t sub_2114CBBF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2114CBC2C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2114CBC54(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for BRLTTranslationResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BRLTTranslationResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for BRLTTranslationResult(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for BRLTTranslationResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BRLTTranslationResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BRLTTranslationResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BRLTTranslationResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BRLTTranslationResult()
{
  return &type metadata for BRLTTranslationResult;
}

uint64_t sub_2114CBEBC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t BRLTEditString.string.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_string);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2114CBF7C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_selection);
}

uint64_t sub_2114CBF94()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_focus);
}

uint64_t sub_2114CBFAC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2114CBFBC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_suggestion);
}

void *sub_2114CBFD4()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges);
  v2 = v1;
  return v1;
}

id sub_2114CC000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13)
{
  objc_class *v13;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  objc_super v28;

  v21 = (char *)objc_allocWithZone(v13);
  v22 = &v21[OBJC_IVAR___BRLTEditStringInternal_string];
  *(_QWORD *)v22 = a1;
  *((_QWORD *)v22 + 1) = a2;
  v23 = &v21[OBJC_IVAR___BRLTEditStringInternal_selection];
  *(_QWORD *)v23 = a3;
  *((_QWORD *)v23 + 1) = a4;
  v23[16] = a5 & 1;
  v24 = &v21[OBJC_IVAR___BRLTEditStringInternal_focus];
  *(_QWORD *)v24 = a6;
  *((_QWORD *)v24 + 1) = a7;
  v24[16] = a8 & 1;
  *(_QWORD *)&v21[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = a9;
  v25 = &v21[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  *(_QWORD *)v25 = a10;
  *((_QWORD *)v25 + 1) = a11;
  v25[16] = a12 & 1;
  *(_QWORD *)&v21[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = a13;
  v28.receiver = v21;
  v28.super_class = v13;
  return objc_msgSendSuper2(&v28, sel_init);
}

id sub_2114CC118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13)
{
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  objc_super v19;

  v14 = &v13[OBJC_IVAR___BRLTEditStringInternal_string];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR___BRLTEditStringInternal_selection];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v15[16] = a5 & 1;
  v16 = &v13[OBJC_IVAR___BRLTEditStringInternal_focus];
  *(_QWORD *)v16 = a6;
  *((_QWORD *)v16 + 1) = a7;
  v16[16] = a8 & 1;
  *(_QWORD *)&v13[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = a9;
  v17 = &v13[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  *(_QWORD *)v17 = a10;
  *((_QWORD *)v17 + 1) = a11;
  v17[16] = a12 & 1;
  *(_QWORD *)&v13[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = a13;
  v19.receiver = v13;
  v19.super_class = (Class)type metadata accessor for BRLTEditString();
  return objc_msgSendSuper2(&v19, sel_init);
}

uint64_t type metadata accessor for BRLTEditString()
{
  return objc_opt_self();
}

uint64_t sub_2114CC1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t v9;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, char, _QWORD))(v9 + 128))(a1, a2, a3, a4, a5 & 1, a6, a7, a8 & 1, a9, 0, 0, 1, 0);
}

uint64_t sub_2114CC228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, char, _QWORD))(v5 + 128))(a1, a2, a3, a4, a5 & 1, 0, 0, 1, MEMORY[0x24BEE4AF8], 0, 0, 1, 0);
}

uint64_t sub_2114CC274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v5;

  v5 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, char, _QWORD))(v3 + 128))(a1, a2, a3, a3, 0, 0, 0, 1, MEMORY[0x24BEE4AF8], 0, 0, v5, 0);
}

unint64_t sub_2114CC2C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  BOOL v10;
  unint64_t result;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_selection);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 8);
  if ((*(_BYTE *)(v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) != 0)
    return v1;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_string);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_string + 8);
  v5 = sub_2114E4FBC();
  v6 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v6 = v3 & 0xFFFFFFFFFFFFLL;
  v7 = 4 * v6;
  while (v7 != v5 >> 14)
  {
    if (sub_2114E4FF8() == 8429794 && v8 == 0xA300000000000000)
      goto LABEL_12;
    v9 = sub_2114E516C();
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
      break;
    v5 = sub_2114E4FA4();
    v10 = __OFADD__(v2++, 1);
    if (v10)
    {
      __break(1u);
LABEL_12:
      swift_bridgeObjectRelease();
      break;
    }
  }
  result = sub_2114E4FBC();
  if (result >= 0x4000)
  {
    v12 = sub_2114E4FB0();
    if (sub_2114E4FF8() == 8429794 && v13 == 0xA300000000000000)
    {
LABEL_16:
      result = swift_bridgeObjectRelease();
    }
    else
    {
      while (1)
      {
        v14 = sub_2114E516C();
        result = swift_bridgeObjectRelease();
        if ((v14 & 1) != 0)
          break;
        v10 = __OFSUB__(v1--, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_26;
        }
        if (v12 < 0x4000)
          break;
        v12 = sub_2114E4FB0();
        if (sub_2114E4FF8() == 8429794 && v15 == 0xA300000000000000)
          goto LABEL_16;
      }
    }
  }
  if (v2 >= v1)
    return v1;
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2114CC4D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  BOOL v4;
  _QWORD *v5;
  char v6;
  _QWORD *v7;
  void *v8;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0)
  {
    if (v1 < 1 || v1 != *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 8))
      return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
    sub_2114E4FBC();
    v4 = sub_2114E4FF8() == 8429794 && v3 == 0xA300000000000000;
    v5 = (_QWORD *)MEMORY[0x24BEE4EA0];
    if (v4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = sub_2114E516C();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
      {
        v7 = v0;
LABEL_15:
        v8 = v7;
        v1 = (*(uint64_t (**)(void))((*v5 & *v7) + 0x88))();

        return v1;
      }
    }
    v7 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, _QWORD))((*v5 & *v0) + 0xA8))(v1 - 1, v1, 0, 12558562, 0xA300000000000000, v1, v1, 0);
    goto LABEL_15;
  }
  return v1;
}

uint64_t sub_2114CC648()
{
  _QWORD *v0;
  char v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  char v16;

  v1 = 0;
  v2 = (_QWORD *)((char *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0 && *v2 >= 1)
  {
    v3 = v2[1];
    v4 = *v2 - (*v2 == v3);
    v5 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8);
    v5(v4, v3);
    v6 = sub_2114E4FE0();
    if (v7)
    {
      v8 = v7;
      do
      {
        if (v6 == 8429794 && v8 == 0xA300000000000000)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          v9 = sub_2114E516C();
          swift_bridgeObjectRelease();
          if ((v9 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            v1 = 0;
            return v1 & 1;
          }
        }
        v6 = sub_2114E4FE0();
        v8 = v10;
      }
      while (v10);
    }
    swift_bridgeObjectRelease();
    if (v4 >= 1)
    {
      if (((uint64_t (*)(uint64_t, uint64_t))v5)(v4 - 1, v4) != 8429794 || v11 != 0xA300000000000000)
      {
        v13 = sub_2114E516C();
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
      swift_bridgeObjectRelease();
    }
    v13 = 1;
LABEL_18:
    if (v3 < sub_2114E4F98())
    {
      if (((uint64_t (*)(uint64_t, uint64_t))v5)(v3, v3 + 1) != 8429794 || v14 != 0xA300000000000000)
      {
        v16 = sub_2114E516C();
        swift_bridgeObjectRelease();
        v1 = v16 | v13;
        return v1 & 1;
      }
      swift_bridgeObjectRelease();
    }
    v1 = 1;
  }
  return v1 & 1;
}

uint64_t sub_2114CC850(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return 0;
  for (i = v2 + 48; ; i += 24)
  {
    v5 = *(_QWORD *)(i - 8);
    if (*(_QWORD *)(i - 16) <= a1)
    {
      v8 = __OFSUB__(v5, a1);
      v6 = v5 == a1;
      v7 = v5 - a1 < 0;
    }
    else
    {
      v8 = 0;
      v6 = 1;
      v7 = 0;
    }
    if (!(v7 ^ v8 | v6))
      break;
    if (!--v3)
      return 0;
  }
  return *(_QWORD *)i;
}

id sub_2114CC8B8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  uint64_t v48;
  uint64_t v49;
  objc_class *v50;
  char *v51;
  uint64_t *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  objc_class *v61;
  char *v62;
  uint64_t *v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  objc_super v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  objc_super v79;

  v12 = *(_QWORD *)(v8 + OBJC_IVAR___BRLTEditStringInternal_string);
  v11 = *(_QWORD *)(v8 + OBJC_IVAR___BRLTEditStringInternal_string + 8);
  if ((a3 & 1) != 0)
  {
    v57 = *(_QWORD *)(v8 + OBJC_IVAR___BRLTEditStringInternal_focus);
    v58 = *(_QWORD *)(v8 + OBJC_IVAR___BRLTEditStringInternal_focus + 8);
    v59 = *(_BYTE *)(v8 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
    v60 = *(_QWORD *)(v8 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
    v61 = (objc_class *)type metadata accessor for BRLTEditString();
    v62 = (char *)objc_allocWithZone(v61);
    v63 = (uint64_t *)&v62[OBJC_IVAR___BRLTEditStringInternal_string];
    *v63 = v12;
    v63[1] = v11;
    v64 = &v62[OBJC_IVAR___BRLTEditStringInternal_selection];
    *(_QWORD *)v64 = a6;
    *((_QWORD *)v64 + 1) = a7;
    v64[16] = a8 & 1;
    v65 = &v62[OBJC_IVAR___BRLTEditStringInternal_focus];
    *(_QWORD *)v65 = v57;
    *((_QWORD *)v65 + 1) = v58;
    v65[16] = v59;
    *(_QWORD *)&v62[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = v60;
    v66 = &v62[OBJC_IVAR___BRLTEditStringInternal_suggestion];
    *(_QWORD *)v66 = a1;
    *((_QWORD *)v66 + 1) = a2;
    v66[16] = 1;
    *(_QWORD *)&v62[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = 0;
    v79.receiver = v62;
    v79.super_class = v61;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return objc_msgSendSuper2(&v79, sel_init);
  }
  else
  {
    sub_2114E4FBC();
    v13 = sub_2114E4FBC();
    swift_bridgeObjectRetain();
    v14 = sub_2114E5004();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v21 = sub_2114C8CF8(v13, v12, v11);
    v67 = v22;
    v68 = v21;
    v24 = v23;
    v26 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27 = MEMORY[0x212BDAD78](v14, v16, v18, v20);
    v29 = v28;
    swift_bridgeObjectRelease();
    sub_2114E4FC8();
    v30 = MEMORY[0x212BDAE8C](v27, v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v73 = v68;
    v74 = v24;
    v75 = v67;
    v76 = v26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37 = MEMORY[0x212BDAD78](v30, v32, v34, v36);
    v39 = v38;
    swift_bridgeObjectRelease();
    v77 = v37;
    v78 = v39;
    sub_2114CCC50();
    sub_2114E4FC8();
    v40 = MEMORY[0x212BDAE8C](v37, v39);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v47 = MEMORY[0x212BDAD78](v40, v42, v44, v46);
    v49 = v48;
    swift_bridgeObjectRelease();
    v50 = (objc_class *)type metadata accessor for BRLTEditString();
    v51 = (char *)objc_allocWithZone(v50);
    v52 = (uint64_t *)&v51[OBJC_IVAR___BRLTEditStringInternal_string];
    *v52 = v47;
    v52[1] = v49;
    v53 = &v51[OBJC_IVAR___BRLTEditStringInternal_selection];
    *(_QWORD *)v53 = a6;
    *((_QWORD *)v53 + 1) = a7;
    v53[16] = a8 & 1;
    v54 = &v51[OBJC_IVAR___BRLTEditStringInternal_focus];
    *(_QWORD *)v54 = 0;
    *((_QWORD *)v54 + 1) = 0;
    v54[16] = 1;
    *(_QWORD *)&v51[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = MEMORY[0x24BEE4AF8];
    v55 = &v51[OBJC_IVAR___BRLTEditStringInternal_suggestion];
    *(_QWORD *)v55 = 0;
    *((_QWORD *)v55 + 1) = 0;
    v55[16] = 1;
    *(_QWORD *)&v51[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = 0;
    v72.receiver = v51;
    v72.super_class = v50;
    return objc_msgSendSuper2(&v72, sel_init);
  }
}

unint64_t sub_2114CCC50()
{
  unint64_t result;

  result = qword_254AB36E0;
  if (!qword_254AB36E0)
  {
    result = MEMORY[0x212BDB564](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_254AB36E0);
  }
  return result;
}

uint64_t sub_2114CCC94(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v6) + 0xA8))(a1, a2, a3 & 1, a4, a5, a6, a6, 0);
}

id sub_2114CCCBC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  objc_class *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  objc_super v20;

  v8 = *(_QWORD *)(v3 + OBJC_IVAR___BRLTEditStringInternal_string);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR___BRLTEditStringInternal_string + 8);
  v10 = *(_QWORD *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus);
  v9 = *(_QWORD *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus + 8);
  v11 = *(_BYTE *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
  v12 = *(_QWORD *)(v3 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
  v13 = (objc_class *)type metadata accessor for BRLTEditString();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = &v14[OBJC_IVAR___BRLTEditStringInternal_string];
  *(_QWORD *)v15 = v8;
  *((_QWORD *)v15 + 1) = v7;
  v16 = &v14[OBJC_IVAR___BRLTEditStringInternal_selection];
  *(_QWORD *)v16 = a1;
  *((_QWORD *)v16 + 1) = a2;
  v16[16] = a3 & 1;
  v17 = &v14[OBJC_IVAR___BRLTEditStringInternal_focus];
  *(_QWORD *)v17 = v10;
  *((_QWORD *)v17 + 1) = v9;
  v17[16] = v11;
  *(_QWORD *)&v14[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = v12;
  v18 = &v14[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 1;
  *(_QWORD *)&v14[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = 0;
  v20.receiver = v14;
  v20.super_class = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t sub_2114CCDD8(uint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v1) + 0xB8))(a1, a1, 0);
}

void sub_2114CCDFC(_BYTE *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  void *v47;
  id v48;
  __objc2_class **p_superclass;
  void *v50;
  id v51;
  uint64_t v52;
  char **v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  id v70;
  unint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  objc_class *v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char v86;
  char v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  uint64_t v94;
  _BYTE *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  objc_super v99;

  v2 = v1;
  v3 = a1;
  v4 = *(_QWORD *)&a1[OBJC_IVAR___BRLTEditStringInternal_string + 8];
  v97 = *(_QWORD *)&v1[OBJC_IVAR___BRLTEditStringInternal_string];
  v98 = *(_QWORD *)&v1[OBJC_IVAR___BRLTEditStringInternal_string + 8];
  swift_bridgeObjectRetain();
  sub_2114E4FD4();
  v5 = (uint64_t *)&v3[OBJC_IVAR___BRLTEditStringInternal_focus];
  if ((v3[OBJC_IVAR___BRLTEditStringInternal_focus + 16] & 1) != 0)
  {
    v6 = *(_QWORD *)&v1[OBJC_IVAR___BRLTEditStringInternal_focus];
    v90 = *(_QWORD *)&v1[OBJC_IVAR___BRLTEditStringInternal_focus + 8];
    v89 = v1[OBJC_IVAR___BRLTEditStringInternal_focus + 16];
    goto LABEL_7;
  }
  v8 = *v5;
  v7 = v5[1];
  v9 = sub_2114E4F98();
  v6 = v9 + v8;
  if (__OFADD__(v9, v8))
  {
    __break(1u);
    goto LABEL_76;
  }
  v10 = sub_2114E4F98();
  if (__OFADD__(v10, v7))
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  if (v10 + v7 < v6)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  v90 = v10 + v7;
  v89 = 0;
LABEL_7:
  v11 = (uint64_t *)&v3[OBJC_IVAR___BRLTEditStringInternal_selection];
  if ((v3[OBJC_IVAR___BRLTEditStringInternal_selection + 16] & 1) != 0)
  {
    v94 = *(_QWORD *)&v2[OBJC_IVAR___BRLTEditStringInternal_selection];
    v12 = *(_QWORD *)&v2[OBJC_IVAR___BRLTEditStringInternal_selection + 8];
    v87 = v2[OBJC_IVAR___BRLTEditStringInternal_selection + 16];
    goto LABEL_13;
  }
  v14 = *v11;
  v13 = v11[1];
  v15 = sub_2114E4F98();
  v94 = v15 + v14;
  if (__OFADD__(v15, v14))
    goto LABEL_78;
  v16 = sub_2114E4F98();
  v12 = v16 + v13;
  if (__OFADD__(v16, v13))
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  if (v12 < v94)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  v87 = 0;
LABEL_13:
  v88 = v12;
  v95 = v2;
  v17 = *(char **)&v2[OBJC_IVAR___BRLTEditStringInternal_tokenRanges];
  v18 = *(_QWORD *)&v3[OBJC_IVAR___BRLTEditStringInternal_tokenRanges];
  v19 = *(_QWORD *)(v18 + 16);
  v92 = v6;
  if (v19)
  {
    v93 = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v91 = v18;
    v20 = (uint64_t *)(v18 + 48);
    do
    {
      v22 = *(v20 - 2);
      v21 = *(v20 - 1);
      v23 = *v20;
      v24 = sub_2114E4F98();
      v25 = __OFADD__(v24, v22);
      v26 = v24 + v22;
      if (v25)
      {
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      v27 = sub_2114E4F98();
      v25 = __OFADD__(v27, v21);
      v28 = v27 + v21;
      if (v25)
        goto LABEL_64;
      if (v28 < v26)
        goto LABEL_65;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_2114CBA40(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
      v30 = *((_QWORD *)v17 + 2);
      v29 = *((_QWORD *)v17 + 3);
      v4 = v30 + 1;
      if (v30 >= v29 >> 1)
        v17 = sub_2114CBA40((char *)(v29 > 1), v30 + 1, 1, v17);
      v20 += 3;
      *((_QWORD *)v17 + 2) = v4;
      v31 = &v17[24 * v30];
      *((_QWORD *)v31 + 4) = v26;
      *((_QWORD *)v31 + 5) = v28;
      *((_QWORD *)v31 + 6) = v23;
      --v19;
    }
    while (v19);
    swift_bridgeObjectRelease();
    v6 = v92;
    v3 = v93;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v32 = (uint64_t *)&v3[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  if ((v3[OBJC_IVAR___BRLTEditStringInternal_suggestion + 16] & 1) == 0)
  {
    v37 = *v32;
    v36 = v32[1];
    v38 = sub_2114E4F98();
    v25 = __OFADD__(v38, v37);
    v39 = v38 + v37;
    if (!v25)
    {
      v40 = sub_2114E4F98();
      v35 = v40 + v36;
      if (!__OFADD__(v40, v36))
      {
        if (v35 >= v39)
        {
          v34 = v39;
          v86 = 0;
          v33 = v95;
          goto LABEL_31;
        }
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
        goto LABEL_85;
      }
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  v33 = v95;
  v34 = *(_QWORD *)&v95[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  v35 = *(_QWORD *)&v95[OBJC_IVAR___BRLTEditStringInternal_suggestion + 8];
  v86 = v95[OBJC_IVAR___BRLTEditStringInternal_suggestion + 16];
LABEL_31:
  v41 = objc_msgSend(objc_allocWithZone((Class)BRLTTextFormattingRanges), sel_init);
  v42 = OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges;
  v43 = *(void **)&v33[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges];
  v91 = v35;
  if (v43)
  {
    v44 = v34;
    v45 = v6;
    v46 = v3;
    v47 = v41;
    v48 = v43;
    objc_msgSend(v48, sel_copy);
    sub_2114E50B8();

    swift_unknownObjectRelease();
    v3 = v46;
    v6 = v45;
    v34 = v44;
    v35 = v91;
    sub_2114CE0DC(0, &qword_254AB36F0);
    swift_dynamicCast();
    v41 = v96;
    v42 = OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges;
  }
  p_superclass = (__objc2_class **)(&OBJC_METACLASS____TtC18BrailleTranslation26BRLTWordDescriptionManager + 8);
  v50 = *(void **)&v3[v42];
  if (!v50)
  {
LABEL_62:
    v79 = (objc_class *)type metadata accessor for BRLTEditString();
    v80 = (char *)objc_allocWithZone(v79);
    v81 = &v80[OBJC_IVAR___BRLTEditStringInternal_string];
    *(_QWORD *)v81 = v97;
    *((_QWORD *)v81 + 1) = v98;
    v82 = &v80[OBJC_IVAR___BRLTEditStringInternal_selection];
    *(_QWORD *)v82 = v94;
    *((_QWORD *)v82 + 1) = v88;
    v82[16] = v87;
    v83 = &v80[OBJC_IVAR___BRLTEditStringInternal_focus];
    *(_QWORD *)v83 = v6;
    *((_QWORD *)v83 + 1) = v90;
    v83[16] = v89;
    *(_QWORD *)&v80[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = v17;
    v84 = (char *)p_superclass[218] + (_QWORD)v80;
    *(_QWORD *)v84 = v34;
    *((_QWORD *)v84 + 1) = v35;
    v84[16] = v86;
    *(_QWORD *)&v80[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = v41;
    v99.receiver = v80;
    v99.super_class = v79;
    objc_msgSendSuper2(&v99, sel_init);
    return;
  }
  v93 = v50;
  v51 = objc_msgSend(v93, sel_boldRanges);
  sub_2114CE0DC(0, &qword_254AB36E8);
  v4 = sub_2114E501C();

  v85 = v34;
  v95 = v41;
  if ((unint64_t)v4 >> 62)
    goto LABEL_69;
  v52 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v53 = &selRef_brailleSelection;
  if (v52)
    goto LABEL_36;
LABEL_43:
  while (1)
  {
    swift_bridgeObjectRelease();
    v61 = objc_msgSend(v93, sel_italicRanges);
    v4 = sub_2114E501C();

    if ((unint64_t)v4 >> 62)
      break;
    v62 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v62)
      goto LABEL_45;
LABEL_52:
    swift_bridgeObjectRelease();
    v70 = objc_msgSend(v93, sel_underlineRanges);
    v71 = sub_2114E501C();

    if (v71 >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_2114E513C();
      swift_bridgeObjectRelease();
      if (!v4)
      {
LABEL_61:

        swift_bridgeObjectRelease();
        v35 = v91;
        v6 = v92;
        p_superclass = &OBJC_METACLASS____TtC18BrailleTranslation26BRLTWordDescriptionManager.superclass;
        v34 = v85;
        v41 = v95;
        goto LABEL_62;
      }
    }
    else
    {
      v4 = *(_QWORD *)((v71 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v4)
        goto LABEL_61;
    }
    if (v4 < 1)
      goto LABEL_86;
    v72 = 0;
    while (1)
    {
      v73 = (v71 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x212BDAF04](v72, v71)
          : *(id *)(v71 + 8 * v72 + 32);
      v74 = v73;
      v75 = sub_2114E4F98();
      v76 = (char *)objc_msgSend(v74, v53[180]);
      v25 = __OFADD__(v75, v76);
      v77 = &v76[v75];
      if (v25)
        break;
      ++v72;
      objc_msgSend(v74, v53[180]);
      objc_msgSend(v95, sel_addUnderlineRange_, v77, v78);

      if (v4 == v72)
        goto LABEL_61;
    }
    while (1)
    {
      __break(1u);
LABEL_69:
      swift_bridgeObjectRetain();
      v52 = sub_2114E513C();
      swift_bridgeObjectRelease();
      v53 = &selRef_brailleSelection;
      if (!v52)
        break;
LABEL_36:
      if (v52 < 1)
        goto LABEL_84;
      v54 = 0;
      while (1)
      {
        v55 = (v4 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x212BDAF04](v54, v4)
            : *(id *)(v4 + 8 * v54 + 32);
        v56 = v55;
        v57 = sub_2114E4F98();
        v58 = (char *)objc_msgSend(v56, v53[180]);
        v25 = __OFADD__(v57, v58);
        v59 = &v58[v57];
        if (v25)
          break;
        ++v54;
        objc_msgSend(v56, v53[180]);
        objc_msgSend(v95, sel_addBoldRange_, v59, v60);

        if (v52 == v54)
          goto LABEL_43;
      }
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
    }
  }
  swift_bridgeObjectRetain();
  v62 = sub_2114E513C();
  swift_bridgeObjectRelease();
  if (!v62)
    goto LABEL_52;
LABEL_45:
  if (v62 >= 1)
  {
    v63 = 0;
    while (1)
    {
      v64 = (v4 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x212BDAF04](v63, v4)
          : *(id *)(v4 + 8 * v63 + 32);
      v65 = v64;
      v66 = sub_2114E4F98();
      v67 = (char *)objc_msgSend(v65, v53[180]);
      v25 = __OFADD__(v66, v67);
      v68 = &v67[v66];
      if (v25)
        goto LABEL_67;
      ++v63;
      objc_msgSend(v65, v53[180]);
      objc_msgSend(v95, sel_addItalicRange_, v68, v69);

      if (v62 == v63)
        goto LABEL_52;
    }
  }
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
}

id sub_2114CD630()
{
  objc_class *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  objc_super v7;
  uint64_t v8;
  unint64_t v9;

  v8 = 0x80A0E2BFA0E2;
  v9 = 0xA600000000000000;
  sub_2114E4FD4();
  swift_bridgeObjectRetain();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  v0 = (objc_class *)type metadata accessor for BRLTEditString();
  v1 = (char *)objc_allocWithZone(v0);
  v2 = &v1[OBJC_IVAR___BRLTEditStringInternal_string];
  *(_QWORD *)v2 = 0x80A0E2BFA0E2;
  *((_QWORD *)v2 + 1) = 0xA600000000000000;
  v3 = &v1[OBJC_IVAR___BRLTEditStringInternal_selection];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  v4 = &v1[OBJC_IVAR___BRLTEditStringInternal_focus];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  *(_QWORD *)&v1[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = MEMORY[0x24BEE4AF8];
  v5 = &v1[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  *(_QWORD *)&v1[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = 0;
  v7.receiver = v1;
  v7.super_class = v0;
  return objc_msgSendSuper2(&v7, sel_init);
}

unint64_t sub_2114CD744()
{
  unint64_t v0;
  unint64_t result;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_2114E4FBC();
  result = sub_2114E4FBC();
  if (result >> 14 < v0 >> 14)
  {
    __break(1u);
  }
  else
  {
    v2 = sub_2114E5004();
    v3 = MEMORY[0x212BDAD78](v2);
    swift_bridgeObjectRelease();
    return v3;
  }
  return result;
}

uint64_t sub_2114CD7EC(uint64_t a1)
{
  uint64_t v1;
  char v2;
  void *v4;
  _BYTE v5[24];
  uint64_t v6;

  sub_2114C9608(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_2114C9690((uint64_t)v5);
    goto LABEL_5;
  }
  type metadata accessor for BRLTEditString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v2 = 0;
    return v2 & 1;
  }
  v2 = sub_2114CE114(v1, (uint64_t)v4);

  return v2 & 1;
}

uint64_t sub_2114CD9A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_2114E50E8();
  sub_2114E4FD4();
  swift_bridgeObjectRetain();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  sub_2114E4FD4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3680);
  sub_2114E4F68();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  sub_2114E4FD4();
  sub_2114E4F68();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  sub_2114E4FD4();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
  swift_bridgeObjectRetain();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AB36F8);
  MEMORY[0x212BDAE2C](v1, v2);
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2114E4FD4();
  sub_2114E4F68();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  return 0;
}

id BRLTEditString.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BRLTEditString.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BRLTEditString.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTEditString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BRLTEditString.NSSelection.getter()
{
  return sub_2114CDD38(&OBJC_IVAR___BRLTEditStringInternal_selection);
}

uint64_t BRLTEditString.NSFocus.getter()
{
  return sub_2114CDD38(&OBJC_IVAR___BRLTEditStringInternal_focus);
}

uint64_t sub_2114CDD18(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return sub_2114DA4CC(*(_QWORD *)(a1 + *a3), *(_QWORD *)(a1 + *a3 + 8), *(_BYTE *)(a1 + *a3 + 16));
}

uint64_t BRLTEditString.NSSuggestion.getter()
{
  return sub_2114CDD38(&OBJC_IVAR___BRLTEditStringInternal_suggestion);
}

uint64_t sub_2114CDD38(_QWORD *a1)
{
  uint64_t v1;

  return sub_2114DA4CC(*(_QWORD *)(v1 + *a1), *(_QWORD *)(v1 + *a1 + 8), *(_BYTE *)(v1 + *a1 + 16));
}

id BRLTEditString.__allocating_init(string:NSSelection:NSFocus:token:NSSuggestion:textFormattingRanges:)(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_class *v10;
  id v16;
  void *v17;
  id v18;

  v16 = objc_allocWithZone(v10);
  v17 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_initWithString_NSSelection_NSFocus_token_NSSuggestion_textFormattingRanges_, v17, a3, a4, a5, a6, a7, a8, a9, a10);

  return v18;
}

uint64_t BRLTEditString.init(string:NSSelection:NSFocus:token:NSSuggestion:textFormattingRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t ObjectType;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v18 = v10;
  v19 = sub_2114DA4F8(a3, a4);
  v38 = v20;
  v39 = v19;
  v22 = v21;
  v23 = sub_2114DA4F8(a5, a6);
  v36 = v24;
  v37 = v23;
  v26 = v25;
  v27 = sub_2114DA4F8(a8, a9);
  v29 = v28;
  v31 = v30;
  ObjectType = swift_getObjectType();

  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB36A8);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_2114E7C40;
  result = sub_2114E4F98();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v33 + 32) = 0;
    *(_QWORD *)(v33 + 40) = result;
    *(_QWORD *)(v33 + 48) = a7;
    v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _BYTE, uint64_t))(ObjectType + 128))(a1, a2, v39, v38, v22 & 1, v37, v36, v26 & 1, v33, v27, v29, v31 & 1, a10);
    swift_deallocPartialClassInstance();
    return v35;
  }
  return result;
}

uint64_t sub_2114CE0DC(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2114CE114(uint64_t a1, uint64_t a2)
{
  char v5;
  uint64_t result;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  unsigned int v15;

  if (*(_QWORD *)(a1 + OBJC_IVAR___BRLTEditStringInternal_string) != *(_QWORD *)(a2
                                                                                + OBJC_IVAR___BRLTEditStringInternal_string)
    || *(_QWORD *)(a1 + OBJC_IVAR___BRLTEditStringInternal_string + 8) != *(_QWORD *)(a2
                                                                                    + OBJC_IVAR___BRLTEditStringInternal_string
                                                                                    + 8))
  {
    v5 = sub_2114E516C();
    result = 0;
    if ((v5 & 1) == 0)
      return result;
  }
  v7 = (uint64_t *)(a1 + OBJC_IVAR___BRLTEditStringInternal_selection);
  v8 = (uint64_t *)(a2 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if ((*(_BYTE *)(a1 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) != 0)
      goto LABEL_15;
    return 0;
  }
  if ((*(_BYTE *)(a2 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) != 0)
    return 0;
  v10 = *v7;
  v9 = v7[1];
  v12 = *v8;
  v11 = v8[1];
  if (v10 != v12 || v9 != v11)
    return 0;
LABEL_15:
  v14 = *(unsigned __int8 *)(a1 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
  v15 = *(unsigned __int8 *)(a2 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
  result = v14 & v15;
  if ((v14 & 1) == 0 && (v15 & 1) == 0)
    return *(_QWORD *)(a1 + OBJC_IVAR___BRLTEditStringInternal_focus) == *(_QWORD *)(a2
                                                                                   + OBJC_IVAR___BRLTEditStringInternal_focus)
        && *(_QWORD *)(a1 + OBJC_IVAR___BRLTEditStringInternal_focus + 8) == *(_QWORD *)(a2
                                                                                       + OBJC_IVAR___BRLTEditStringInternal_focus
                                                                                       + 8);
  return result;
}

uint64_t method lookup function for BRLTEditString()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTEditString.tokenFor(location:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of BRLTEditString.appending(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t sub_2114CE22C()
{
  return 0;
}

uint64_t sub_2114CE27C()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_2114CE328(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_2114CE378@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x160))();
  *a2 = result;
  return result;
}

uint64_t sub_2114CE3B8(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0x168);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_2114CE3F8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2114CE480()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2114CE50C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_2114CE554@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x190))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2114CE598(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **a2) + 0x198))(*a1);
}

uint64_t (*sub_2114CE5D4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2114CE618()
{
  return 1;
}

uint64_t sub_2114CE664()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_technicalMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2114CE6F0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_technicalMode);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_2114CE738@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x1D8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2114CE77C(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **a2) + 0x1E0))(*a1);
}

uint64_t (*sub_2114CE7B8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2114CE844()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_editable);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2114CE8D0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editable);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_2114CE918@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x220))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2114CE95C(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **a2) + 0x228))(*a1);
}

uint64_t (*sub_2114CE998())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2114CEA20()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2114CEAAC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_2114CEAF4@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x280))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2114CEB38(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

void sub_2114CEB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unsigned __int8 v14;

  v5 = objc_allocWithZone((Class)BRLTTranslator);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithDelegate_tableIdentifier_, a3, v6);

  swift_unknownObjectRelease();
  v8 = *(void **)(v3 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
  *(_QWORD *)(v3 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator) = v7;

  v9 = objc_allocWithZone((Class)BRLTTable);
  swift_bridgeObjectRetain();
  v10 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithIdentifier_, v10);

  v12 = objc_msgSend(v11, sel_candidateSelectionLanguage);
  sub_2114E4F5C();

  v13 = sub_2114E4F98();
  swift_bridgeObjectRelease();
  if (v13 <= 0)
    v14 = objc_msgSend(v11, sel_supportsTranslationByCell);
  else
    v14 = 1;

  *(_BYTE *)(v3 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) = v14;
}

void sub_2114CECFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = objc_allocWithZone((Class)BRLTTranslator);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithDelegate_tableIdentifier_, a3, v6);

  swift_unknownObjectRelease();
  v8 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator);
  *(_QWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator) = v7;

  v9 = objc_allocWithZone((Class)BRLTTable);
  swift_bridgeObjectRetain();
  v10 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v9, sel_initWithIdentifier_, v10);

  v11 = objc_msgSend(v16, sel_candidateSelectionLanguage);
  v12 = sub_2114E4F5C();
  v14 = v13;

  sub_2114D28C0(v12, v14, 0);
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v16, sel_supportsTranslationByCell);
  (*(void (**)(id))((*MEMORY[0x24BEE4EA0] & *v3) + 0x198))(v15);

}

uint64_t sub_2114CEE78(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v8 = sub_2114E4F5C();
  v10 = v9;
  swift_unknownObjectRetain();
  v11 = a1;
  a5(v8, v10, a4);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_2114CEEEC()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator);
  if (result)
  {
    if (*(_QWORD *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator))
      return objc_msgSend(result, sel_isEqualTable_);
    else
      return 0;
  }
  return result;
}

BOOL sub_2114CEF34()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager) != 0;
}

uint64_t sub_2114CEF4C()
{
  _QWORD *v0;

  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x368))() & 1) != 0)
    return *((unsigned __int8 *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editScript);
  else
    return 1;
}

uint64_t sub_2114CEFFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (!v1)
    return 0;
  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 136);
  v3 = swift_retain();
  LOBYTE(v2) = v2(v3);
  swift_release();
  return v2 & 1;
}

id sub_2114CF080()
{
  uint64_t v0;
  uint64_t *v1;

  if (*(_BYTE *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert))
    v1 = &OBJC_IVAR___BRLTBrailleModelInternal_alertScript;
  else
    v1 = &OBJC_IVAR___BRLTBrailleModelInternal_script;
  return *(id *)(v0 + *v1);
}

_QWORD *sub_2114CF0E0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v2)(void);
  _QWORD *v3;
  uint64_t v4;

  if (*(_BYTE *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert) == 1)
  {
    v1 = *(_QWORD **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_alertBraille);
  }
  else
  {
    v1 = *(_QWORD **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    if (*(_BYTE *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) == 1)
    {
      v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0xD0);
      v3 = v1;
      v4 = v2();

      return (_QWORD *)v4;
    }
  }
  return v1;
}

void sub_2114CF1CC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void (*v7)(uint64_t, uint64_t);
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);

  v1 = (uint64_t *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
  if ((*(_BYTE *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
  {
    v5 = *v1;
    v4 = v1[1];
    v6 = *(_QWORD **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    v7 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v6) + 0xD8);
    v8 = v6;
    v7(v5, v4);
    goto LABEL_6;
  }
  v2 = (uint64_t *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
  if ((*(_BYTE *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) == 0)
  {
    v3 = *(_QWORD **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    if ((*((_BYTE *)v3 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0)
    {
      v9 = *v2;
      v10 = *(_QWORD *)((char *)v3 + OBJC_IVAR___BRLTEditStringInternal_selection + 8);
      if (v10 < *v2)
      {
        __break(1u);
        return;
      }
      v11 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0xD8);
      v8 = v3;
      v11(v9, v10);
LABEL_6:

    }
  }
}

uint64_t sub_2114CF2E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v5 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
  v7 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  v8 = v5;
  v9 = v6;
  sub_2114D299C((uint64_t)&v7);
  sub_2114D299C((uint64_t)&v8);
  sub_2114CBC2C((uint64_t)&v9);
  v3 = sub_2114CB214(a1);
  sub_2114D29C4((uint64_t)&v7);
  sub_2114D29C4((uint64_t)&v8);
  sub_2114CBC54((uint64_t)&v9);
  return v3;
}

id sub_2114CF418()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BRLTBrailleModel()), sel_init);
  qword_254AB3A78 = (uint64_t)result;
  return result;
}

uint64_t *sub_2114CF444()
{
  if (qword_254AB3A70 != -1)
    swift_once();
  return &qword_254AB3A78;
}

id static BRLTBrailleModel.shared.getter()
{
  if (qword_254AB3A70 != -1)
    swift_once();
  return (id)qword_254AB3A78;
}

id sub_2114CF504()
{
  _BYTE *v0;
  char *v1;
  char *v2;
  char *v3;
  _QWORD *v4;
  _BYTE *v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  id v9;
  objc_super v11;
  _OWORD v12[2];
  uint64_t v13;

  *(_QWORD *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_delegate] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_candidateManager] = 0;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell] = 0;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_backTranslateLocally] = 1;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_editScript] = 0;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_technicalMode] = 0;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_editable] = 0;
  v1 = &v0[OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v1[16] = 1;
  v2 = &v0[OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v2[16] = 1;
  v3 = &v0[OBJC_IVAR___BRLTBrailleModelInternal_stageRange];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  v4 = &v0[OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage];
  *v4 = 0;
  v4[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_brailleCache] = 0;
  type metadata accessor for BRLTEditString();
  v5 = v0;
  *(_QWORD *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_script] = sub_2114CC228(0, 0xE000000000000000, 0, 0, 1);
  *(_QWORD *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_braille] = sub_2114CC228(0, 0xE000000000000000, 0, 0, 1);
  v6 = MEMORY[0x24BEE4AF8];
  sub_2114CAA3C(0, 0xE000000000000000, 0, 0xE000000000000000, MEMORY[0x24BEE4AF8], v12);
  v7 = &v5[OBJC_IVAR___BRLTBrailleModelInternal_translationResult];
  v8 = v12[1];
  *(_OWORD *)v7 = v12[0];
  *((_OWORD *)v7 + 1) = v8;
  *((_QWORD *)v7 + 4) = v13;
  v5[OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty] = 0;
  v5[OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty] = 0;
  v5[OBJC_IVAR___BRLTBrailleModelInternal_showingAlert] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_alertScript] = sub_2114CC1E8(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, v6);
  *(_QWORD *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_alertBraille] = sub_2114CC1E8(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, v6);
  v5[OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput] = 0;
  v5[OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive] = 0;
  type metadata accessor for BRLTWordDescriptionManager();
  *(_QWORD *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager] = sub_2114C97A0();
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  *(_QWORD *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_contentLock] = v9;
  *(_QWORD *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory] = v6;
  *(_QWORD *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_lastScriptOutputTime] = 0;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for BRLTBrailleModel();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_2114CF7AC()
{
  return 0;
}

id sub_2114CF7D8(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  int v4;
  _QWORD *v5;
  id result;
  uint64_t v7;
  id v8;
  char v9;
  _QWORD *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v2 = v1;
  v4 = *((unsigned __int8 *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert);
  *((_BYTE *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert) = 0;
  v5 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x380))() & 1) != 0
    || ((*(uint64_t (**)(void))((*v5 & *v1) + 0x548))() & 1) != 0)
  {
    return (id)sub_2114D46A8();
  }
  type metadata accessor for BRLTEditString();
  v7 = OBJC_IVAR___BRLTBrailleModelInternal_script;
  v8 = *(id *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_script);
  v9 = sub_2114CD7E8((uint64_t)v8, (uint64_t)a1);

  if ((v9 & 1) != 0)
  {
    v10 = (_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory);
    swift_beginAccess();
    *v10 = MEMORY[0x24BEE4AF8];
    return (id)swift_bridgeObjectRelease();
  }
  if (CFAbsoluteTimeGetCurrent() - *(double *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_lastScriptOutputTime) >= 5.0)
    goto LABEL_11;
  v11 = (_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory);
  swift_beginAccess();
  v12 = *v11;
  swift_bridgeObjectRetain();
  sub_2114CFA1C((uint64_t)a1, v12);
  v14 = v13;
  v16 = v15;
  result = (id)swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
  {
LABEL_11:
    v17 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
    objc_msgSend(v17, sel_lock);
    v18 = *(void **)((char *)v2 + v7);
    *(_QWORD *)((char *)v2 + v7) = a1;
    v19 = a1;

    *((_BYTE *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) = 0;
    if (!v4 || ((*(uint64_t (**)(void))((*v5 & *v2) + 0x280))() & 1) == 0)
      sub_2114D1FE0();
    sub_2114D46A8();
    return objc_msgSend(v17, sel_unlock);
  }
  else
  {
    if (__OFADD__(v14, 1))
    {
      __break(1u);
    }
    else if (((v14 + 1) & 0x8000000000000000) == 0)
    {
      swift_beginAccess();
      sub_2114D4FA0(0, v14 + 1);
      return (id)swift_endAccess();
    }
    __break(1u);
  }
  return result;
}

void sub_2114CFA1C(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  uint64_t i;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x212BDAF04](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v4 = *(id *)(a2 + 32);
      }
      v5 = v4;
      type metadata accessor for BRLTEditString();
      v6 = sub_2114E5070();

      if ((v6 & 1) == 0)
      {
        for (i = 0; ; ++i)
        {
          v11 = i + 1;
          if (__OFADD__(i, 1))
            break;
          if (v11 == v3)
            return;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v8 = (id)MEMORY[0x212BDAF04](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0)
              goto LABEL_18;
            if (v11 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_19;
            v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          v9 = v8;
          v10 = sub_2114E5070();

          if ((v10 & 1) != 0)
            return;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        v3 = sub_2114E513C();
        swift_bridgeObjectRelease();
        if (v3)
          continue;
      }
      return;
    }
  }
}

void sub_2114CFBF8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v2 = v1;
  v3 = *(void **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
  if (v3)
  {
    v5 = *(void **)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_alertScript);
    *(_QWORD *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_alertScript) = a1;
    v10 = v3;
    v6 = a1;

    v7 = sub_2114CA7FC() & 1;
    sub_2114CAC8C((uint64_t)v6, v7, (uint64_t)&v11);
    v8 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9 = *(void **)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_alertBraille);
    *(_QWORD *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_alertBraille) = v8;

    *(_BYTE *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert) = 1;
    sub_2114D46A8();

  }
}

uint64_t sub_2114CFD2C(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_script);
  *(_QWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_script) = a1;
  v3 = a1;

  *(_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) = 1;
  sub_2114D1FE0();
  return sub_2114D46A8();
}

uint64_t sub_2114CFDF0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;
  void *v3;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x370))();
  if ((result & 1) == 0)
  {
    if (((*(uint64_t (**)(void))((*v1 & *v0) + 0x280))() & 1) != 0
      || *((_BYTE *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) == 1)
    {
      v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
      objc_msgSend(v3, sel_lock);
      if (*((_BYTE *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1)
        sub_2114D1AD8();
      else
        sub_2114D1804();
      objc_msgSend(v3, sel_unlock);
    }
    return sub_2114D46A8();
  }
  return result;
}

void sub_2114CFEE0(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v5)(void);
  void *v6;
  void *v7;
  uint64_t (*v8)(void);
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;

  v2 = v1;
  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x548);
  if ((v5() & 1) == 0)
  {
    v8 = *(uint64_t (**)(void))((*v4 & *v1) + 0x370);
    if ((v8() & 1) != 0 && (sub_2114D02C4(a1) & 1) != 0)
      return;
    v9 = *(uint64_t (**)(void))((*v4 & *v1) + 0x220);
    v10 = v9();
    if ((v10 & 1) == 0)
    {
      v11 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
      if (*(_BYTE *)(*(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
                    + OBJC_IVAR___BRLTEditStringInternal_selection
                    + 16) == 1)
      {
        type metadata accessor for BRLTEditString();
        v12 = sub_2114CC1E8(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, MEMORY[0x24BEE4AF8]);
        v13 = *(void **)((char *)v1 + v11);
        *(_QWORD *)((char *)v1 + v11) = v12;

        v14 = (char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
        v14[16] = 0;
        *(_QWORD *)v14 = 0;
        *((_QWORD *)v14 + 1) = 0;
        v15 = (char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange;
        v15[16] = 0;
        *(_QWORD *)v15 = 0;
        *((_QWORD *)v15 + 1) = 0;
        v10 = (*(uint64_t (**)(void))((*v4 & *v1) + 0x378))();
        if ((v10 & 1) != 0)
        {
          v16 = (char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
          *(_QWORD *)v16 = 0;
          *((_QWORD *)v16 + 1) = 0;
          v16[16] = 0;
        }
      }
    }
    v17 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
        + OBJC_IVAR___BRLTEditStringInternal_selection;
    if ((*(_BYTE *)(v17 + 16) & 1) == 0
      && *(_QWORD *)v17 != *(_QWORD *)(*(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
                                     + OBJC_IVAR___BRLTEditStringInternal_selection
                                     + 8))
    {
      v10 = sub_2114D05D8(objc_msgSend(a1, sel_bits) != 0, 1);
    }
    if ((((uint64_t (*)(uint64_t))v8)(v10) & 1) != 0)
    {
      if (objc_msgSend(a1, sel_bits))
      {
        sub_2114D03C0(a1);
LABEL_28:
        sub_2114D46A8();
        return;
      }
      v19 = sub_2114D38CC();
      sub_2114D03C0(a1);
      if ((v19 & 1) != 0)
        goto LABEL_28;
      v18 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
      objc_msgSend(v18, sel_lock);
      if ((*((_BYTE *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) & 1) == 0)
        goto LABEL_26;
    }
    else
    {
      sub_2114D03C0(a1);
      if (objc_msgSend(a1, sel_bits)
        && (((*(uint64_t (**)(void))((*v4 & *v1) + 0x190))() & 1) == 0 || (v9() & 1) == 0))
      {
        goto LABEL_28;
      }
      v18 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
      objc_msgSend(v18, sel_lock);
      if (*((_BYTE *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) != 1)
      {
LABEL_26:
        sub_2114D1804();
        goto LABEL_27;
      }
    }
    sub_2114D1AD8();
LABEL_27:
    objc_msgSend(v18, sel_unlock);
    goto LABEL_28;
  }
  if ((v5() & 1) != 0)
  {
    (*(void (**)(_QWORD))((*v4 & *v1) + 0x550))(0);
    v6 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
    if (v6)
    {
      v7 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
      *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v6;
      v20 = v6;

      sub_2114D46A8();
      return;
    }
    sub_2114D1FE0();
    goto LABEL_28;
  }
}

uint64_t sub_2114D02C4(void *a1)
{
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char v7;
  unsigned int v8;
  void (*v9)(void);
  BOOL v10;

  v2 = (_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
  if ((*((_BYTE *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0)
    return 0;
  v4 = *v2;
  v5 = v2[1];
  v6 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v7 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x380))();
  v8 = objc_msgSend(a1, sel_bits);
  if ((v7 & 1) == 0)
  {
    if (v8)
      v10 = 1;
    else
      v10 = v4 == v5;
    if (!v10 && (sub_2114D38CC() & 1) == 0)
    {
      sub_2114D29EC();
      return 1;
    }
    return 0;
  }
  if (v8 == 1)
  {
    v9 = *(void (**)(void))((*v6 & *v1) + 0x520);
  }
  else
  {
    if (objc_msgSend(a1, sel_bits) != 8 && objc_msgSend(a1, sel_bits))
      return 1;
    v9 = *(void (**)(void))((*v6 & *v1) + 0x518);
  }
  v9();
  return 1;
}

void sub_2114D03C0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
  v3 = *(char **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
  v4 = &v3[OBJC_IVAR___BRLTEditStringInternal_selection];
  if ((v3[OBJC_IVAR___BRLTEditStringInternal_selection + 16] & 1) == 0)
  {
    v5 = v1;
    v6 = (uint64_t *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
    if ((*(_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) == 0)
    {
      v7 = *(_QWORD *)v4;
      v8 = *(_QWORD *)v4 + 1;
      if (__OFADD__(*(_QWORD *)v4, 1))
      {
        __break(1u);
      }
      else
      {
        v10 = *((_QWORD *)v4 + 1);
        v24 = *v6;
        v25 = v6[1];
        v11 = v3;
        v12 = objc_msgSend(a1, sel_unicode);
        v13 = sub_2114E4F5C();
        v15 = v14;

        v16 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v11) + 0xA8))(v7, v10, 0, v13, v15, v8, v8, 0);
        swift_bridgeObjectRelease();
        v17 = *(void **)(v5 + v2);
        *(_QWORD *)(v5 + v2) = v16;

        v18 = v25 + 1;
        if (!__OFADD__(v25, 1))
        {
          if (v18 >= v24)
          {
            *v6 = v24;
            v6[1] = v18;
            *((_BYTE *)v6 + 16) = 0;
            v19 = (_BYTE *)(v5 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty);
            swift_beginAccess();
            *v19 = 1;
            *(_BYTE *)(v5 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 1;
            v20 = v5 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
            if ((*(_BYTE *)(v5 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0)
            {
LABEL_10:
              sub_2114D46A8();
              return;
            }
            v21 = *(_QWORD *)(v20 + 8);
            v22 = __OFADD__(v21, 1);
            v23 = v21 + 1;
            if (!v22)
            {
              if (v23 >= *(_QWORD *)v20)
              {
                *(_QWORD *)(v20 + 8) = v23;
                *(_BYTE *)(v20 + 16) = 0;
                goto LABEL_10;
              }
LABEL_16:
              __break(1u);
              return;
            }
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
LABEL_14:
          __break(1u);
          goto LABEL_15;
        }
      }
      __break(1u);
      goto LABEL_14;
    }
  }
}

uint64_t sub_2114D0590(char a1)
{
  return sub_2114D05D8(0, a1);
}

uint64_t sub_2114D05D8(char a1, char a2)
{
  _QWORD *v2;
  _QWORD *v5;
  uint64_t (*v6)(void);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v5 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v6 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x548);
  if ((v6() & 1) != 0)
  {
    if ((v6() & 1) != 0)
    {
      (*(void (**)(_QWORD))((*v5 & *v2) + 0x550))(0);
      v7 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      if (v7)
      {
        v8 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
        *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v7;
        v9 = v7;

        sub_2114D46A8();
      }
      else
      {
        sub_2114D1FE0();
        sub_2114D46A8();
      }
    }
    return 1;
  }
  if (((*(uint64_t (**)(void))((*v5 & *v2) + 0x380))() & 1) != 0)
  {
    sub_2114D32C8();
    return 1;
  }
  if (*((_BYTE *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) != 1)
    return sub_2114D0764(a1 & 1, a2 & 1);
  v10 = *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_script)
      + OBJC_IVAR___BRLTEditStringInternal_selection;
  if ((*(_BYTE *)(v10 + 16) & 1) != 0)
    return sub_2114D0764(a1 & 1, a2 & 1);
  v11 = *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
      + OBJC_IVAR___BRLTEditStringInternal_selection;
  if ((*(_BYTE *)(v11 + 16) & 1) != 0)
    return sub_2114D0764(a1 & 1, a2 & 1);
  if (*(_QWORD *)v10 == *(_QWORD *)(v10 + 8)
    && ((*((_BYTE *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0
     || (*(_QWORD *)v11 == *(_QWORD *)(v11 + 8)
       ? (v12 = *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) == *(_QWORD *)v11)
       : (v12 = 0),
         !v12)))
  {
    return sub_2114D0764(a1 & 1, a2 & 1);
  }
  else
  {
    return sub_2114D0BA0();
  }
}

uint64_t sub_2114D0764(int a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  _QWORD *v11;
  uint64_t (*v12)(void);
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _QWORD *v18;
  uint64_t (*v19)(void);
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  void (*v30)(uint64_t, uint64_t);
  _QWORD *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  _QWORD *v36;
  uint64_t (*v37)(uint64_t, uint64_t, _QWORD, _QWORD, unint64_t, uint64_t);
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  uint64_t (*v42)(void);
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  char *v49;
  _BYTE *v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[3];

  v3 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
  v4 = *(_QWORD **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
  v5 = (_QWORD *)((char *)v4 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if ((*((_BYTE *)v4 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) != 0)
    return 0;
  v6 = *v5;
  v7 = v5[1];
  if (*v5 <= 0 && v6 == v7)
    return 0;
  v9 = v2;
  HIDWORD(v52) = a1;
  v11 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v12 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v4) + 0x90);
  v13 = v4;
  v14 = v12();
  v16 = v15;
  LOBYTE(v12) = v17;

  if ((v12 & 1) != 0)
    return 0;
  v18 = *(_QWORD **)((char *)v9 + v3);
  v19 = *(uint64_t (**)(void))((*v11 & *v18) + 0x98);
  v20 = v18;
  LODWORD(v52) = v19();

  v21 = (char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult;
  v55 = *(_OWORD *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
  v56 = *(_QWORD *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
  v57 = *(_OWORD *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  v58 = v55;
  v59 = v56;
  sub_2114D299C((uint64_t)&v57);
  sub_2114D299C((uint64_t)&v58);
  sub_2114CBC2C((uint64_t)&v59);
  v22 = sub_2114CB214(v14);
  sub_2114D29C4((uint64_t)&v57);
  sub_2114D29C4((uint64_t)&v58);
  sub_2114CBC54((uint64_t)&v59);
  v23 = sub_2114D0E1C(v16);
  v53 = *((_OWORD *)v21 + 1);
  v54 = *((_QWORD *)v21 + 4);
  v60 = *(_OWORD *)v21;
  v61 = v53;
  v62[0] = v54;
  sub_2114D299C((uint64_t)&v60);
  sub_2114D299C((uint64_t)&v61);
  sub_2114CBC2C((uint64_t)v62);
  v24 = sub_2114CB214(v23);
  sub_2114D29C4((uint64_t)&v60);
  sub_2114D29C4((uint64_t)&v61);
  result = sub_2114CBC54((uint64_t)v62);
  if (v24 < v22)
  {
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v26 = (char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange;
  *(_QWORD *)v26 = v22;
  *((_QWORD *)v26 + 1) = v24;
  v26[16] = 0;
  if (v6 != v7)
  {
    v27 = v6;
    goto LABEL_16;
  }
  v27 = v6 - 1;
  if (__OFSUB__(v6, 1))
    goto LABEL_30;
  if (v6 < v27)
  {
LABEL_31:
    __break(1u);
    return result;
  }
  if ((a2 & 1) == 0)
  {
    v29 = *(_QWORD **)((char *)v9 + v3);
    v30 = *(void (**)(uint64_t, uint64_t))((*v11 & *v29) + 0xD8);
    v31 = v29;
    v30(v6 - 1, v6);

    v32 = objc_allocWithZone((Class)BRLTBrailleChar);
    v33 = (void *)sub_2114E4F50();
    v28 = v11;
    swift_bridgeObjectRelease();
    v34 = objc_msgSend(v32, sel_initWithUnicode_, v33);

    v35 = (void *)(*(uint64_t (**)(void))((*v11 & *v9) + 0x160))();
    if (v35)
    {
      objc_msgSend(v35, sel_didDeleteBrailleChar_, v34);

      swift_unknownObjectRelease();
    }
    else
    {

    }
    v7 = v6;
    goto LABEL_21;
  }
  v7 = v6;
LABEL_16:
  v28 = (_QWORD *)MEMORY[0x24BEE4EA0];
LABEL_21:
  v36 = *(_QWORD **)((char *)v9 + v3);
  v37 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, unint64_t, uint64_t))((*v28 & *v36) + 0xB0);
  v38 = v36;
  v39 = v37(v27, v7, 0, 0, 0xE000000000000000, v27);

  v40 = *(void **)((char *)v9 + v3);
  *(_QWORD *)((char *)v9 + v3) = v39;

  v41 = *(_QWORD **)((char *)v9 + v3);
  v42 = *(uint64_t (**)(void))((*v28 & *v41) + 0x88);
  v43 = v41;
  v44 = v42();
  v46 = v45;
  v48 = v47;

  v49 = (char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
  *(_QWORD *)v49 = v44;
  *((_QWORD *)v49 + 1) = v46;
  v49[16] = v48 & 1;
  v50 = (char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
  swift_beginAccess();
  *v50 = 1;
  *((_BYTE *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 1;
  sub_2114D0D8C(v27, v7);
  if ((v52 & 0x100000000) == 0 && (v49[16] & 1) == 0 && (*(_QWORD *)v49 == *((_QWORD *)v49 + 1)) | v52 & 1)
  {
    v51 = *(void **)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
    objc_msgSend(v51, sel_lock);
    if (*((_BYTE *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1)
      sub_2114D1AD8();
    else
      sub_2114D1804();
    objc_msgSend(v51, sel_unlock, v52);
  }
  sub_2114D46A8();
  return 1;
}

uint64_t sub_2114D0BA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t (*v22)(uint64_t, uint64_t, _QWORD, _QWORD, unint64_t, uint64_t);
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;

  v1 = OBJC_IVAR___BRLTBrailleModelInternal_script;
  v2 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_script);
  v3 = (uint64_t *)(v2 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if ((*(_BYTE *)(v2 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) != 0)
    return 0;
  v5 = v0;
  v6 = *v3;
  v7 = v3[1];
  if (*v3 == v7)
  {
    if (v6 < 1)
      return 0;
    v7 = *v3;
    --v6;
  }
  v8 = (uint64_t *)(v2 + OBJC_IVAR___BRLTEditStringInternal_string);
  v9 = *v8;
  v10 = v8[1];
  swift_bridgeObjectRetain();
  v11 = sub_2114DA570(v9, v10, v7);
  swift_bridgeObjectRelease();
  v12 = (uint64_t *)(*(_QWORD *)((char *)v5 + v1) + OBJC_IVAR___BRLTEditStringInternal_string);
  v13 = *v12;
  v14 = v12[1];
  swift_bridgeObjectRetain();
  v15 = sub_2114DA570(v13, v14, v6);
  result = swift_bridgeObjectRelease();
  v16 = v7 - v6;
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_13;
  }
  result = v11 - v16;
  if (__OFSUB__(v11, v16))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v11 < result)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  v17 = sub_2114DA4CC(result, v11, 0);
  v19 = v18;
  v20 = *(_QWORD **)((char *)v5 + v1);
  v21 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v22 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, unint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v20)
                                                                                              + 0xB0);
  v23 = v20;
  v24 = v22(v6, v7, 0, 0, 0xE000000000000000, v6);

  v25 = *(void **)((char *)v5 + v1);
  *(_QWORD *)((char *)v5 + v1) = v24;

  v26 = (*(uint64_t (**)(void))((*v21 & *v5) + 0x160))();
  if (v26)
  {
    v27 = (void *)v26;
    v28 = (void *)sub_2114E4F50();
    objc_msgSend(v27, sel_didReplaceScriptStringRange_withScriptString_cursorLocation_, v17, v19, v28, v15);

    swift_unknownObjectRelease();
  }
  sub_2114D1FE0();
  sub_2114D46A8();
  return 1;
}

uint64_t sub_2114D0D8C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v3 = v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
  if ((*(_BYTE *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
  {
    v4 = *(_QWORD *)(v3 + 8);
    if (*(_QWORD *)v3 >= result)
      goto LABEL_8;
    if (v4 > a2)
    {
      v5 = a2 - result;
      if (__OFSUB__(a2, result))
      {
        __break(1u);
      }
      else
      {
        result = v4 - v5;
        if (!__OFSUB__(v4, v5))
        {
          if (result < *(_QWORD *)v3)
          {
            __break(1u);
LABEL_8:
            v6 = result;
            if (v4 <= a2)
            {
LABEL_12:
              *(_QWORD *)v3 = result;
              result = v6;
              goto LABEL_13;
            }
            v7 = a2 - result;
            if (!__OFSUB__(a2, result))
            {
              v8 = __OFSUB__(v4, v7);
              v6 = v4 - v7;
              if (!v8)
              {
                if (v6 >= result)
                  goto LABEL_12;
LABEL_19:
                __break(1u);
                return result;
              }
LABEL_18:
              __break(1u);
              goto LABEL_19;
            }
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
          goto LABEL_13;
        }
      }
      __break(1u);
      goto LABEL_17;
    }
LABEL_13:
    *(_QWORD *)(v3 + 8) = result;
    *(_BYTE *)(v3 + 16) = 0;
  }
  return result;
}

uint64_t sub_2114D0E1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v2 = (uint64_t *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
  if ((*(_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) != 0)
    return 0;
  v3 = (uint64_t *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange);
  if ((*(_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange + 16) & 1) != 0)
    return 0;
  v6 = *v2;
  v7 = v2[1];
  v9 = *v3;
  v8 = v3[1];
  v17 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
  v18 = *(_QWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
  v19 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  v20 = v17;
  v21 = v18;
  sub_2114D299C((uint64_t)&v19);
  sub_2114D299C((uint64_t)&v20);
  sub_2114CBC2C((uint64_t)&v21);
  v10 = sub_2114CB16C(v9, v8);
  v12 = v11;
  sub_2114D29C4((uint64_t)&v19);
  sub_2114D29C4((uint64_t)&v20);
  result = sub_2114CBC54((uint64_t)&v21);
  v13 = v7 - v6;
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_10;
  }
  v14 = __OFSUB__(a1, v13);
  v15 = a1 - v13;
  if (v14)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v16 = v12 - v10;
  if (__OFSUB__(v12, v10))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  result = v15 + v16;
  if (__OFADD__(v15, v16))
LABEL_12:
    __break(1u);
  return result;
}

uint64_t sub_2114D0F24(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = sub_2114DA4F8(a1, a2);
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0x458))(v3);
}

uint64_t sub_2114D0FC0(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v7;
  uint64_t (*v9)(void);
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v7 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0x380))() & 1) != 0)
    return 0;
  if (((*(uint64_t (**)(void))((*v7 & *v3) + 0x220))() & 1) != 0)
  {
    if (((*(uint64_t (**)(void))((*v7 & *v3) + 0x370))() & 1) != 0
      && (*((_BYTE *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0
      && *(_QWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) != *(_QWORD *)((char *)v3
                                                                                                + OBJC_IVAR___BRLTBrailleModelInternal_stageRange
                                                                                                + 8))
    {
      v14 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
      objc_msgSend(v14, sel_lock);
      if (*((_BYTE *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1)
        sub_2114D1AD8();
      else
        sub_2114D1804();
      objc_msgSend(v14, sel_unlock);
      sub_2114D46A8();
      return 0;
    }
    v9 = *(uint64_t (**)(void))((*v7 & *v3) + 0x548);
    if ((v9() & 1) != 0)
    {
      if ((v9() & 1) != 0)
      {
        (*(void (**)(_QWORD))((*v7 & *v3) + 0x550))(0);
        v10 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
        if (v10)
        {
          v11 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          *(_QWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v10;
          v12 = v10;

          sub_2114D46A8();
        }
        else
        {
          sub_2114D1FE0();
          sub_2114D46A8();
        }
      }
      return 0;
    }
    v13 = a3 & 1;
    if (*((_BYTE *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))((*v7 & *v3) + 0x460))(a1, a2, v13);
      return 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))((*v7 & *v3) + 0x468))(a1, a2, v13);
  }
  return 1;
}

uint64_t sub_2114D118C(uint64_t result, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  _QWORD *v15;
  uint64_t (*v16)(uint64_t, uint64_t, _QWORD);
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;

  if ((a3 & 1) == 0)
  {
    v4 = v3;
    v5 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
    v6 = *(_QWORD **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    v7 = (_QWORD *)((char *)v6 + OBJC_IVAR___BRLTEditStringInternal_selection);
    if ((*((_BYTE *)v6 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0)
    {
      v8 = a2;
      v9 = result;
      v10 = *v7;
      v11 = v7[1];
      if (*v7 == result && v11 == a2 && result == a2)
      {
        swift_bridgeObjectRetain();
        v14 = sub_2114E4F98();
        swift_bridgeObjectRelease();
        if (v14 <= v9)
          v8 = v9;
        else
          v8 = v9 + 1;
        v6 = *(_QWORD **)((char *)v4 + v5);
        v9 = v8;
      }
      v15 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v16 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v6) + 0xB8);
      v17 = v6;
      v18 = v16(v9, v8, 0);

      v19 = *(void **)((char *)v4 + v5);
      *(_QWORD *)((char *)v4 + v5) = v18;

      if (v9 != v10 || v8 != v11)
        *((_BYTE *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 1;
      if (((*(uint64_t (**)(void))((*v15 & *v4) + 0x280))() & 1) != 0
        || ((*(uint64_t (**)(void))((*v15 & *v4) + 0x378))() & 1) == 0
        || (*((_BYTE *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0
        || *(_QWORD *)((char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) != *(_QWORD *)((char *)v4
                                                                                                  + OBJC_IVAR___BRLTBrailleModelInternal_stageRange
                                                                                                  + 8))
      {
        v21 = (*(uint64_t (**)(void))((*v15 & *v4) + 0x368))();
        if ((v21 & 1) != 0)
          v22 = OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
        else
          v22 = OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
        if ((*((_BYTE *)v4 + v22 + 16) & 1) == 0
          && (v9 < *(_QWORD *)((char *)v4 + v22) || *(_QWORD *)((char *)v4 + v22 + 8) < v8))
        {
          v23 = *(void **)((char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
          objc_msgSend(v23, sel_lock);
          if (*((_BYTE *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1)
            sub_2114D1AD8();
          else
            sub_2114D1804();
          v21 = (uint64_t)objc_msgSend(v23, sel_unlock);
        }
      }
      else
      {
        sub_2114D217C();
      }
      if (((*(uint64_t (**)(uint64_t))((*v15 & *v4) + 0x378))(v21) & 1) != 0 && v9 == v8)
      {
        v24 = (char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
        if (*((_BYTE *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) == 1)
        {
          *(_QWORD *)v24 = v8;
          *((_QWORD *)v24 + 1) = v8;
          v24[16] = 0;
        }
      }
      return sub_2114D46A8();
    }
  }
  return result;
}

uint64_t sub_2114D141C(uint64_t result, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  char v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t (*v28)(uint64_t, uint64_t, _QWORD);
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[2];

  if ((a3 & 1) == 0)
  {
    v4 = v3;
    v5 = *(_QWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_script)
       + OBJC_IVAR___BRLTEditStringInternal_selection;
    if ((*(_BYTE *)(v5 + 16) & 1) == 0)
    {
      v7 = result;
      v8 = *(_QWORD *)v5;
      v9 = *(_QWORD *)(v5 + 8);
      v10 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0x280);
      v11 = v10();
      if ((v10() & 1) != 0)
      {
        v12 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
        objc_msgSend(v12, sel_lock);
        if (*((_BYTE *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1)
          sub_2114D1AD8();
        else
          sub_2114D1804();
        objc_msgSend(v12, sel_unlock);
      }
      v13 = (char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult;
      v39 = *(_OWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
      v40 = *(_QWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
      v41 = *(_OWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
      v42 = v39;
      v43 = v40;
      sub_2114D299C((uint64_t)&v41);
      sub_2114D299C((uint64_t)&v42);
      sub_2114CBC2C((uint64_t)&v43);
      v14 = sub_2114CB2B8(v7, a2);
      v16 = v15;
      sub_2114D29C4((uint64_t)&v41);
      sub_2114D29C4((uint64_t)&v42);
      sub_2114CBC54((uint64_t)&v43);
      if ((v11 & 1) == 0)
      {
        v17 = v14 == v8 && v16 == v9;
        if (v17 && v14 == v16)
        {
          swift_bridgeObjectRetain();
          v19 = sub_2114E4F98();
          swift_bridgeObjectRelease();
          if (v8 >= v19)
          {
LABEL_24:
            v16 = v8;
            v14 = v8;
          }
          else
          {
            v37 = *((_OWORD *)v13 + 1);
            v38 = *((_QWORD *)v13 + 4);
            v44 = *(_OWORD *)v13;
            v45 = v37;
            v46 = v38;
            sub_2114D299C((uint64_t)&v44);
            sub_2114D299C((uint64_t)&v45);
            sub_2114CBC2C((uint64_t)&v46);
            v20 = sub_2114CB570(v8);
            sub_2114D29C4((uint64_t)&v44);
            sub_2114D29C4((uint64_t)&v45);
            sub_2114CBC54((uint64_t)&v46);
            swift_bridgeObjectRetain();
            v21 = sub_2114E4F98();
            result = swift_bridgeObjectRelease();
            if (v21 < v20)
            {
              __break(1u);
              return result;
            }
            while (1)
            {
              v36 = *((_QWORD *)v13 + 4);
              v35 = *((_OWORD *)v13 + 1);
              v47 = *(_OWORD *)v13;
              v48 = v35;
              v49 = v36;
              sub_2114D299C((uint64_t)&v47);
              sub_2114D299C((uint64_t)&v48);
              sub_2114CBC2C((uint64_t)&v49);
              v16 = sub_2114CB214(v20);
              sub_2114D29C4((uint64_t)&v47);
              sub_2114D29C4((uint64_t)&v48);
              sub_2114CBC54((uint64_t)&v49);
              if (v8 < v16)
                break;
              if (v21 == v20)
                goto LABEL_24;
              if (__OFADD__(v20++, 1))
              {
                __break(1u);
                goto LABEL_24;
              }
            }
            v14 = v16;
          }
        }
      }
      sub_2114D41F0(0, 0, 1, 0, 0xE000000000000000, v14, v16, 0);
      v33 = *((_OWORD *)v13 + 1);
      v34 = *((_QWORD *)v13 + 4);
      v50 = *(_OWORD *)v13;
      v51 = v33;
      v52[0] = v34;
      sub_2114D299C((uint64_t)&v50);
      sub_2114D299C((uint64_t)&v51);
      sub_2114CBC2C((uint64_t)v52);
      v23 = sub_2114CB16C(v14, v16);
      v25 = v24;
      sub_2114D29C4((uint64_t)&v50);
      sub_2114D29C4((uint64_t)&v51);
      sub_2114CBC54((uint64_t)v52);
      v26 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
      v27 = *(_QWORD **)((char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
      v28 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v27) + 0xB8);
      v29 = v27;
      v30 = v28(v23, v25, 0);

      v31 = *(void **)((char *)v4 + v26);
      *(_QWORD *)((char *)v4 + v26) = v30;

      if (v23 == v25)
      {
        v32 = (char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
        *(_QWORD *)v32 = v23;
        *((_QWORD *)v32 + 1) = v23;
        v32[16] = 0;
      }
      *((_BYTE *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 0;
      return sub_2114D46A8();
    }
  }
  return result;
}

void sub_2114D1804()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
     + OBJC_IVAR___BRLTEditStringInternal_selection;
  if ((*(_BYTE *)(v1 + 16) & 1) == 0)
  {
    v2 = (_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
    if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) == 0)
    {
      v3 = (_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange);
      if ((*((_BYTE *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange + 16) & 1) == 0)
      {
        v5 = *(_QWORD *)v1;
        v4 = *(_QWORD *)(v1 + 8);
        v6 = *v2;
        v7 = v2[1];
        v8 = *v3;
        v9 = v3[1];
        sub_2114D1C54((uint64_t)&v13);
        if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))() & 1) != 0)
        {
          v10 = sub_2114D1968(v5, v6, v7, (uint64_t)v0, v8, v9);
          v11 = sub_2114D1968(v4, v6, v7, (uint64_t)v0, v8, v9);
          if (v11 < v10)
          {
            __break(1u);
            return;
          }
          v12 = v11;
        }
        else
        {
          v12 = 0;
          v10 = 0;
        }
        sub_2114D41F0(v8, v9, 0, v14, v15, v10, v12, 0);
        v18 = v13;
        sub_2114D29C4((uint64_t)&v18);
        swift_bridgeObjectRelease();
        v17 = v16;
        sub_2114CBC54((uint64_t)&v17);
        sub_2114D1FE0();
      }
    }
  }
}

uint64_t sub_2114D1968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v7 = a1;
  if (a1 < a2)
  {
    v15 = *(_OWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
    v17 = *(_QWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
    v19 = *(_OWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
    v20 = v15;
    v21 = v17;
    sub_2114D299C((uint64_t)&v19);
    sub_2114D299C((uint64_t)&v20);
    sub_2114CBC2C((uint64_t)&v21);
    v7 = sub_2114CB214(v7);
    sub_2114D29C4((uint64_t)&v19);
    sub_2114D29C4((uint64_t)&v20);
    sub_2114CBC54((uint64_t)&v21);
    return v7;
  }
  if (a3 < a1)
  {
    result = sub_2114E4F98();
    v11 = a6 - a5;
    if (__OFSUB__(a6, a5))
    {
      __break(1u);
    }
    else
    {
      a5 = result - v11;
      if (!__OFSUB__(result, v11))
      {
        v12 = sub_2114D0E1C(v7);
        v16 = *(_OWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
        v18 = *(_QWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
        v19 = *(_OWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
        v20 = v16;
        v21 = v18;
        sub_2114D299C((uint64_t)&v19);
        sub_2114D299C((uint64_t)&v20);
        sub_2114CBC2C((uint64_t)&v21);
        v13 = sub_2114CB214(v12);
        sub_2114D29C4((uint64_t)&v19);
        sub_2114D29C4((uint64_t)&v20);
        sub_2114CBC54((uint64_t)&v21);
        v14 = __OFADD__(v13, a5);
        v7 = v13 + a5;
        if (!v14)
          return v7;
        __break(1u);
        goto LABEL_9;
      }
    }
    __break(1u);
    goto LABEL_14;
  }
LABEL_9:
  result = v7 - a2;
  if (__OFSUB__(v7, a2))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  result = sub_2114CB570(result);
  v7 = a5 + result;
  if (!__OFADD__(a5, result))
    return v7;
LABEL_15:
  __break(1u);
  return result;
}

void sub_2114D1AD8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
  if ((*(_BYTE *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
  {
    v2 = v0;
    v3 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator);
    if (v3)
    {
      v4 = *v1;
      v5 = v1[1];
      v6 = *(_QWORD *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_script) + OBJC_IVAR___BRLTEditStringInternal_selection;
      if (*(_BYTE *)(v6 + 16))
        v7 = 0;
      else
        v7 = *(_QWORD *)(v6 + 8);
      if ((*(_BYTE *)(v6 + 16) & 1) != 0 || *(_QWORD *)v6 == *(_QWORD *)(v6 + 8))
      {
        v8 = *(_QWORD **)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
        v9 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v8) + 0xD8);
        v10 = v3;
        v11 = v8;
        v12 = v9(v4, v5);
        v14 = v13;

        sub_2114CAA4C(v12, v14, &v18);
        swift_bridgeObjectRelease();
        v15 = v19;
        v16 = v20;
        v23 = v18;
        sub_2114D29C4((uint64_t)&v23);
        v22 = v21;
        sub_2114CBC54((uint64_t)&v22);
        v17 = sub_2114E4F98();
        if (__OFADD__(v7, v17))
        {
          __break(1u);
        }
        else
        {
          sub_2114D41F0(v7, v7, 0, v15, v16, v7 + v17, v7 + v17, 0);
          swift_bridgeObjectRelease();
          sub_2114D1FE0();

        }
      }
    }
  }
}

void sub_2114D1C54(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  _QWORD *v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  id v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  _OWORD v46[2];
  uint64_t v47;
  _OWORD v48[2];
  uint64_t v49;
  _OWORD v50[2];
  uint64_t v51;
  _OWORD v52[2];
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;

  v3 = (uint64_t *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
  if ((*(_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) != 0
    || (v4 = v1, (v5 = *(void **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator)) == 0)
    || (v6 = *(void **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator)) == 0)
  {
    sub_2114CAA3C(0, 0xE000000000000000, 0, 0xE000000000000000, MEMORY[0x24BEE4AF8], &v54);
    goto LABEL_12;
  }
  v7 = *v3;
  v8 = v3[1];
  v9 = (uint64_t *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
  if ((*(_BYTE *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0
    || (v11 = *v9, v10 = v9[1], *v9 == v10))
  {
    v35 = *(_QWORD **)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    v36 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v35) + 0xD8);
    v37 = v5;
    v38 = v6;
    v39 = v35;
    v40 = v36(v7, v8);
    v42 = v41;

    sub_2114CAA4C(v40, v42, &v54);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v12 = v11 < v7 || v8 < v10;
  v45 = v8;
  if (!v12)
  {
    v13 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
    v14 = *(_QWORD **)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    v15 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v14) + 0xD8);
    v44 = v5;
    v43 = v6;
    v16 = v14;
    v17 = v15(v7, v11);
    v19 = v18;

    sub_2114CAA4C(v17, v19, v46);
    swift_bridgeObjectRelease();
    v20 = *(_QWORD **)(v4 + v13);
    v21 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v22 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v20) + 0xD8);
    v23 = v20;
    v24 = v22(v11, v10);
    v26 = v25;

    sub_2114CAA4C(v24, v26, v48);
    swift_bridgeObjectRelease();
    v27 = *(_QWORD **)(v4 + v13);
    v28 = *(uint64_t (**)(uint64_t, uint64_t))((*v21 & *v27) + 0xD8);
    v29 = v27;
    v30 = v28(v10, v45);
    v32 = v31;

    sub_2114CAA4C(v30, v32, v50);
    swift_bridgeObjectRelease();
    sub_2114CB694((uint64_t)v48, (char **)v52);
    v68 = v46[0];
    sub_2114D29C4((uint64_t)&v68);
    v67 = v46[1];
    sub_2114D29C4((uint64_t)&v67);
    v66 = v47;
    sub_2114CBC54((uint64_t)&v66);
    v65 = v48[0];
    sub_2114D29C4((uint64_t)&v65);
    v64 = v48[1];
    sub_2114D29C4((uint64_t)&v64);
    v63 = v49;
    sub_2114CBC54((uint64_t)&v63);
    sub_2114CB694((uint64_t)v50, (char **)&v54);
    v62 = v52[0];
    sub_2114D29C4((uint64_t)&v62);
    v61 = v52[1];
    sub_2114D29C4((uint64_t)&v61);
    v60 = v53;
    sub_2114CBC54((uint64_t)&v60);
    v59 = v50[0];
    sub_2114D29C4((uint64_t)&v59);
    v58 = v50[1];
    sub_2114D29C4((uint64_t)&v58);
    v57 = v51;
    sub_2114CBC54((uint64_t)&v57);

LABEL_12:
    v33 = v55;
    v34 = v56;
    *(_OWORD *)a1 = v54;
    *(_QWORD *)(a1 + 16) = v33;
    *(_OWORD *)(a1 + 24) = v34;
    return;
  }
  __break(1u);
}

void sub_2114D1FE0()
{
  _QWORD *v0;
  void *v1;
  _QWORD *v2;
  void *v3;
  uint64_t (*v4)(void);
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  _BYTE *v14;
  char *v15;
  char *v16;
  char *v17;
  __int128 v18;
  _QWORD v19[4];
  __int128 v20;

  v1 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
  if (v1)
  {
    v2 = v0;
    v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_script);
    v4 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x1D8);
    v5 = v1;
    v6 = v3;
    v7 = v4();
    sub_2114CAC8C((uint64_t)v6, v7 & 1, (uint64_t)v19);
    v8 = v19[0];
    v9 = v19[1];
    v10 = v19[2];
    v11 = v19[3];
    v18 = v20;

    v12 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v8;

    v13 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult;
    *(_QWORD *)v13 = v9;
    *((_QWORD *)v13 + 1) = v10;
    *((_QWORD *)v13 + 2) = v11;
    *(_OWORD *)(v13 + 24) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
    swift_beginAccess();
    *v14 = 0;
    *((_BYTE *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 0;
    v15 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
    *(_QWORD *)v15 = 0;
    *((_QWORD *)v15 + 1) = 0;
    v15[16] = 1;
    v16 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    v16[16] = 1;
    v17 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
    *(_QWORD *)v17 = 0;
    *((_QWORD *)v17 + 1) = 0;
    v17[16] = 1;
    sub_2114D217C();

  }
}

void sub_2114D217C()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v1 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
  if ((*((_BYTE *)v1 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0)
  {
    v2 = v0;
    v18 = *(_OWORD *)((char *)v1 + OBJC_IVAR___BRLTEditStringInternal_selection);
    v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v4 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x88);
    v5 = v1;
    v6 = v4();
    v8 = v7;
    v10 = v9;

    v11 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
    *(_QWORD *)v11 = v6;
    *((_QWORD *)v11 + 1) = v8;
    v11[16] = v10 & 1;
    v19 = *(_OWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
    v20 = *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
    if ((v10 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v21 = *(_OWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
      v22 = v19;
      v23 = v20;
      sub_2114D299C((uint64_t)&v21);
      sub_2114D299C((uint64_t)&v22);
      sub_2114CBC2C((uint64_t)&v23);
      v12 = sub_2114CB2B8(v6, v8);
      v14 = v13;
      sub_2114D29C4((uint64_t)&v21);
      sub_2114D29C4((uint64_t)&v22);
      v15 = sub_2114CBC54((uint64_t)&v23);
      v16 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange;
      *(_QWORD *)v16 = v12;
      *((_QWORD *)v16 + 1) = v14;
      v16[16] = 0;
      if (((*(uint64_t (**)(uint64_t))((*v3 & *v2) + 0x378))(v15) & 1) != 0)
      {
        v17 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
        *(_OWORD *)v17 = v18;
        v17[16] = 0;
      }
    }
  }
}

uint64_t sub_2114D22F0()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t (*v9)(void);
  void *v10;
  void *v11;
  id v12;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380);
  if ((v3() & 1) != 0)
  {
    v4 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
    if (v4)
    {
      v5 = swift_retain();
      if ((((uint64_t (*)(uint64_t))v3)(v5) & 1) != 0)
      {
        (*(void (**)(void))(*(_QWORD *)v4 + 320))();
        v6 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
        if (v6)
        {
          v7 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v6;
          v8 = v6;

        }
        else
        {
          sub_2114D1FE0();
        }
        sub_2114D46A8();
      }
      swift_release();
    }
  }
  else
  {
    v9 = *(uint64_t (**)(void))((*v2 & *v0) + 0x548);
    if ((v9() & 1) == 0)
    {
      (*(void (**)(void))((*v2 & *v0) + 0x3C0))();
      return 0;
    }
    if ((v9() & 1) != 0)
    {
      (*(void (**)(_QWORD))((*v2 & *v0) + 0x550))(0);
      v10 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      if (v10)
      {
        v11 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
        *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v10;
        v12 = v10;

        sub_2114D46A8();
      }
      else
      {
        sub_2114D1FE0();
        sub_2114D46A8();
      }
    }
  }
  return 1;
}

uint64_t sub_2114D2494()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(void);
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380))() & 1) != 0)
  {
    (*(void (**)(void))((*v1 & *v0) + 0x528))();
    return 1;
  }
  if (((*(uint64_t (**)(void))((*v1 & *v0) + 0x370))() & 1) != 0
    && (*((_BYTE *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0
    && *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) != *(_QWORD *)((char *)v0
                                                                                              + OBJC_IVAR___BRLTBrailleModelInternal_stageRange
                                                                                              + 8))
  {
    v7 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
    objc_msgSend(v7, sel_lock);
    if (*((_BYTE *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1)
      sub_2114D1AD8();
    else
      sub_2114D1804();
    objc_msgSend(v7, sel_unlock);
    goto LABEL_17;
  }
  v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x548);
  if ((v3() & 1) != 0)
  {
    if ((v3() & 1) == 0)
      return 1;
    (*(void (**)(_QWORD))((*v1 & *v0) + 0x550))(0);
    v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
    if (v4)
    {
      v5 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
      *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v4;
      v6 = v4;

      sub_2114D46A8();
      return 1;
    }
    sub_2114D1FE0();
LABEL_17:
    sub_2114D46A8();
    return 1;
  }
  (*(void (**)(void))((*v1 & *v0) + 0x3C0))();
  return 0;
}

void sub_2114D2634()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v2)(void);
  void *v3;
  void *v4;
  id v5;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x370))() & 1) != 0)
  {
    v2 = *(uint64_t (**)(void))((*v1 & *v0) + 0x548);
    if ((v2() & 1) != 0)
    {
      if ((v2() & 1) != 0)
      {
        (*(void (**)(_QWORD))((*v1 & *v0) + 0x550))(0);
        v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
        if (v3)
        {
          v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v3;
          v5 = v3;

          sub_2114D46A8();
        }
        else
        {
          sub_2114D1FE0();
          sub_2114D46A8();
        }
      }
    }
    else
    {
      sub_2114D3C84();
    }
  }
}

uint64_t sub_2114D2760(uint64_t a1)
{
  uint64_t v1;
  __int128 *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v3 = (__int128 *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  v11 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
  v12 = *(_QWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
  v13 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  v14 = v11;
  v15 = v12;
  sub_2114D299C((uint64_t)&v13);
  sub_2114D299C((uint64_t)&v14);
  sub_2114CBC2C((uint64_t)&v15);
  v4 = sub_2114CB570(a1);
  sub_2114D29C4((uint64_t)&v13);
  sub_2114D29C4((uint64_t)&v14);
  result = sub_2114CBC54((uint64_t)&v15);
  v9 = v3[1];
  v10 = *((_QWORD *)v3 + 4);
  v16 = *v3;
  v17 = v9;
  v18 = v10;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else if (v4 + 1 >= v4)
  {
    sub_2114D299C((uint64_t)&v16);
    sub_2114D299C((uint64_t)&v17);
    sub_2114CBC2C((uint64_t)&v18);
    v6 = sub_2114CB2B8(v4, v4 + 1);
    v8 = v7;
    sub_2114D29C4((uint64_t)&v16);
    sub_2114D29C4((uint64_t)&v17);
    sub_2114CBC54((uint64_t)&v18);
    return sub_2114DA4CC(v6, v8, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_2114D28C0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;

  v4 = v3;
  v8 = (_QWORD *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage);
  *v8 = a1;
  v8[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a2 && (a1 == 7237738 && a2 == 0xE300000000000000 || (sub_2114E516C() & 1) != 0))
  {
    type metadata accessor for BRLTCandidateManager();
    *(_QWORD *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager) = sub_2114DAA88(a3 & 1);
  }
  else
  {
    *(_QWORD *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager) = 0;
  }
  return swift_release();
}

uint64_t sub_2114D299C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2114D29C4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2114D29EC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD *v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint8_t *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;

  v1 = v0;
  v2 = sub_2114E4F38();
  v3 = *(_QWORD *)(v2 - 8);
  result = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v7)
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v9 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380);
    v10 = swift_retain();
    if ((v9(v10) & 1) != 0)
      return swift_release();
    v11 = (_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
    if (*((_BYTE *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) == 1)
      return swift_release();
    v12 = *v11;
    v13 = v11[1];
    if (*v11 == v13)
      return swift_release();
    v14 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator);
    if (!v14)
    {
      return swift_release();
    }
    else
    {
      v15 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
      v16 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
      v33 = *(id *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache) = v16;
      v34 = v14;
      v17 = v16;

      v18 = *(_QWORD **)((char *)v1 + v15);
      v19 = *(uint64_t (**)(uint64_t, uint64_t))((*v8 & *v18) + 0xD8);
      v20 = v18;
      v21 = v19(v12, v13);
      v23 = v22;

      sub_2114CAA4C(v21, v23, &v37);
      swift_bridgeObjectRelease();
      v24 = v38;
      v25 = v39;
      v42 = v37;
      sub_2114D29C4((uint64_t)&v42);
      v41 = v40;
      sub_2114CBC54((uint64_t)&v41);
      (*(void (**)(void *, unint64_t))(*(_QWORD *)v7 + 312))(v24, v25);
      sub_2114D3384();
      v26 = sub_2114D5FC8();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v26, v2);
      swift_bridgeObjectRetain();
      v27 = sub_2114E4F20();
      v28 = sub_2114E5058();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = swift_slowAlloc();
        v33 = v24;
        v30 = (uint8_t *)v29;
        v31 = swift_slowAlloc();
        v36 = v31;
        *(_DWORD *)v30 = 136315138;
        v32 = v30 + 4;
        swift_bridgeObjectRetain();
        v35 = sub_2114D48F8((uint64_t)v33, v25, &v36);
        sub_2114E5094();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2114B8000, v27, v28, "Start candidate selection with stageScript = %s", v30, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x212BDB5C4](v31, -1, -1);
        MEMORY[0x212BDB5C4](v30, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

void sub_2114D2D40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380);
    v3 = swift_retain();
    if ((v2(v3) & 1) != 0 && ((*(uint64_t (**)(void))(*(_QWORD *)v1 + 328))() & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)v1 + 336))();
      sub_2114D3384();
    }
    swift_release();
  }
}

void sub_2114D2E10()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380);
    v3 = swift_retain();
    if ((v2(v3) & 1) != 0 && ((*(uint64_t (**)(void))(*(_QWORD *)v1 + 344))() & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)v1 + 352))();
      sub_2114D3384();
    }
    swift_release();
  }
}

void sub_2114D2EE0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  id v25;
  char v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    v2 = v0;
    v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v4 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380);
    v5 = swift_retain();
    if ((v4(v5) & 1) == 0
      || (v6 = OBJC_IVAR___BRLTBrailleModelInternal_script,
          v7 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_script)
             + OBJC_IVAR___BRLTEditStringInternal_selection,
          (*(_BYTE *)(v7 + 16) & 1) != 0)
      || (v8 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator)) == 0)
    {
      swift_release();
      return;
    }
    v9 = *(_QWORD *)v7;
    v10 = *(_QWORD *)(v7 + 8);
    v11 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 376);
    v41 = v8;
    v12 = v11();
    v14 = v13;
    v15 = sub_2114E4F98();
    if (__OFADD__(v9, v15))
    {
      __break(1u);
    }
    else
    {
      sub_2114D41F0(v9, v10, 0, v12, v14, v9 + v15, v9 + v15, 0);
      v16 = swift_bridgeObjectRelease();
      v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 384))(v16);
      v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 400))(v17);
      if (v18)
        v20 = 0;
      else
        v20 = v19 == 0xE000000000000000;
      if (v20 || (v21 = v18, v22 = v19, (sub_2114E516C() & 1) != 0))
      {
        swift_bridgeObjectRelease();
        v23 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
        *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache) = 0;

        (*(void (**)(void))(*(_QWORD *)v1 + 320))();
        sub_2114D1FE0();
        sub_2114D46A8();
        swift_release();

        return;
      }
      v24 = sub_2114CA7FC();
      sub_2114CA804(v21, v22, v24 & 1, 0, &v43);
      v38 = v44;
      v40 = v45;
      v48 = v43;
      sub_2114D29C4((uint64_t)&v48);
      v47 = v46;
      sub_2114CBC54((uint64_t)&v47);
      v25 = *(id *)((char *)v2 + v6);
      v26 = sub_2114CA7FC();
      sub_2114CAC8C((uint64_t)v25, v26 & 1, (uint64_t)&v42);
      v39 = v42;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v27 = OBJC_IVAR___BRLTBrailleModelInternal_brailleCache;
      v28 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache) = v39;

      v29 = *(_BYTE **)((char *)v2 + v27);
      if (!v29 || (v29[OBJC_IVAR___BRLTEditStringInternal_selection + 16] & 1) != 0)
      {
        swift_bridgeObjectRelease();
LABEL_22:
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 312))(v21, v22);
        swift_bridgeObjectRelease();
        sub_2114D3384();
        swift_release();

        return;
      }
      v30 = *(_QWORD *)&v29[OBJC_IVAR___BRLTEditStringInternal_selection];
      v31 = v29;
      v32 = sub_2114E4F98();
      if (!__OFADD__(v30, v32))
      {
        v33 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))((*v3 & *v31) + 0xB0))(v30, v30, 0, v38, v40, v30 + v32);

        v34 = *(void **)((char *)v2 + v27);
        *(_QWORD *)((char *)v2 + v27) = v33;

        v35 = sub_2114E4F98();
        swift_bridgeObjectRelease();
        v36 = v30 + v35;
        if (!__OFADD__(v30, v35))
        {
          if (v36 >= v30)
          {
            v37 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
            *(_QWORD *)v37 = v30;
            *((_QWORD *)v37 + 1) = v36;
            v37[16] = 0;
            goto LABEL_22;
          }
LABEL_27:
          __break(1u);
          return;
        }
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
    }
    __break(1u);
    goto LABEL_26;
  }
}

void sub_2114D32C8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    v2 = v0;
    v3 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380);
    v4 = swift_retain();
    if ((v3(v4) & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)v1 + 320))();
      v5 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      if (v5)
      {
        v6 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
        *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v5;
        v7 = v5;

      }
      else
      {
        sub_2114D1FE0();
      }
      sub_2114D46A8();
    }
    swift_release();
  }
}

uint64_t sub_2114D3384()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  _OWORD v44[2];
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;

  v1 = v0;
  v2 = sub_2114E4F38();
  v3 = *(_QWORD *)(v2 - 8);
  result = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v7)
  {
    if (*(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage + 8))
    {
      v8 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
      if (v8)
      {
        v9 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage);
        v10 = *(uint64_t (**)(void))(*(_QWORD *)v7 + 184);
        swift_retain();
        swift_bridgeObjectRetain();
        v11 = v8;
        result = v10();
        if (__OFADD__(result, 1))
        {
          __break(1u);
        }
        else
        {
          v39 = v9;
          v12 = v2;
          *(_QWORD *)&v46 = result + 1;
          v13 = sub_2114E5154();
          v15 = v14;
          v16 = sub_2114CA7FC();
          sub_2114CA804(v13, v15, v16 & 1, 0, v44);
          swift_bridgeObjectRelease();
          v51 = v44[0];
          v52 = v44[1];
          sub_2114D29C4((uint64_t)&v51);
          v50 = v45;
          v17 = sub_2114CBC54((uint64_t)&v50);
          v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 368))(v17);
          v20 = v19;
          v21 = sub_2114CA7FC();
          v40 = v11;
          sub_2114CA804(v18, v20, v21 & 1, 0, &v46);
          swift_bridgeObjectRelease();
          v49 = v46;
          sub_2114D29C4((uint64_t)&v49);
          v48 = v47;
          sub_2114CBC54((uint64_t)&v48);
          v43 = v52;
          swift_bridgeObjectRetain();
          sub_2114E4FD4();
          sub_2114D29C4((uint64_t)&v52);
          swift_bridgeObjectRetain();
          sub_2114E4FD4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_2114E4FD4();
          swift_bridgeObjectRelease();
          v22 = v43;
          type metadata accessor for BRLTEditString();
          swift_bridgeObjectRetain();
          v23 = sub_2114CC1E8(v22, *((uint64_t *)&v22 + 1), 0, 0, 1, 0, 0, 0, MEMORY[0x24BEE4AF8]);
          v24 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v23;

          v25 = sub_2114D46A8();
          v26 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x160))(v25);
          if (v26)
          {
            v27 = (void *)v26;
            (*(void (**)(void))(*(_QWORD *)v7 + 360))();
            v28 = (void *)sub_2114E4F50();
            swift_bridgeObjectRelease();
            v29 = (void *)sub_2114E4F50();
            swift_bridgeObjectRelease();
            objc_msgSend(v27, sel_requestSpeech_language_, v28, v29);

            swift_unknownObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          v30 = sub_2114D5FC8();
          swift_beginAccess();
          v31 = v12;
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v30, v12);
          swift_bridgeObjectRetain();
          v32 = sub_2114E4F20();
          v33 = sub_2114E5058();
          if (os_log_type_enabled(v32, v33))
          {
            v38 = v22;
            v34 = (uint8_t *)swift_slowAlloc();
            v35 = swift_slowAlloc();
            v39 = v31;
            v36 = v35;
            v42 = v35;
            *(_DWORD *)v34 = 136315138;
            swift_bridgeObjectRetain();
            v41 = sub_2114D48F8(v38, *((unint64_t *)&v22 + 1), &v42);
            sub_2114E5094();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2114B8000, v32, v33, "Show current candidate description: %s", v34, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x212BDB5C4](v36, -1, -1);
            MEMORY[0x212BDB5C4](v34, -1, -1);

            swift_release();
            return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v39);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_release();
            return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v12);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2114D38CC()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  char v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void (*v8)(uint64_t, uint64_t);
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage) == 7237738
      && v1 == 0xE300000000000000;
    if (v2 || (v3 = 0, (sub_2114E516C() & 1) != 0))
    {
      v3 = 0;
      v4 = (uint64_t *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
      if ((*(_BYTE *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
      {
        v5 = *v4;
        v6 = v4[1];
        if (*v4 != v6)
        {
          v7 = *(_QWORD **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          v8 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v7) + 0xD8);
          v9 = v7;
          v8(v5, v6);

          v10 = sub_2114E4FE0();
          if (v11)
          {
            v12 = v10;
            v13 = v11;
            v3 = 0;
            do
            {
              if (v12 == 10920162 && v13 == 0xA300000000000000 || (sub_2114E516C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v3 = 1;
              }
              else if (v12 == 11837666 && v13 == 0xA300000000000000)
              {
                swift_bridgeObjectRelease();
                v3 = 0;
              }
              else
              {
                v15 = sub_2114E516C();
                swift_bridgeObjectRelease();
                v3 &= v15 ^ 1;
              }
              v12 = sub_2114E4FE0();
              v13 = v14;
            }
            while (v14);
          }
          else
          {
            v3 = 0;
          }
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_2114D3AEC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2114D3B78(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_2114D3BC0@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x548))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2114D3C04(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **a2) + 0x550))(*a1);
}

uint64_t (*sub_2114D3C40())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_2114D3C84()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_OWORD *, uint64_t, uint64_t, uint64_t);
  _OWORD v14[2];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x370))() & 1) != 0
    && ((*(uint64_t (**)(void))((*v2 & *v0) + 0x380))() & 1) == 0
    && ((*((_BYTE *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0
     || *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) == *(_QWORD *)((char *)v0
                                                                                               + OBJC_IVAR___BRLTBrailleModelInternal_stageRange
                                                                                               + 8))
    && ((*(uint64_t (**)(void))((*v2 & *v0) + 0x548))() & 1) == 0)
  {
    (*(void (**)(uint64_t))((*v2 & *v0) + 0x550))(1);
    v3 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
    v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    v5 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
    *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache) = v4;
    v6 = v4;

    v7 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager);
    v15 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
    v8 = *(_OWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
    v14[0] = *(_OWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
    v14[1] = v8;
    v16 = v14[0];
    v17 = v8;
    v18 = v15;
    v9 = *(_QWORD *)((char *)v1 + v3) + OBJC_IVAR___BRLTEditStringInternal_selection;
    v10 = *(_QWORD *)v9;
    v11 = *(_QWORD *)(v9 + 8);
    v12 = *(unsigned __int8 *)(v9 + 16);
    v13 = *(void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 216);
    swift_retain();
    sub_2114D299C((uint64_t)&v16);
    sub_2114D299C((uint64_t)&v17);
    sub_2114CBC2C((uint64_t)&v18);
    v13(v14, v10, v11, v12);
    sub_2114D29C4((uint64_t)&v16);
    sub_2114D29C4((uint64_t)&v17);
    sub_2114CBC54((uint64_t)&v18);
    swift_release();
    sub_2114D3FD0();
  }
}

void sub_2114D3E20()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x548))() & 1) != 0)
  {
    v1 = OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager;
    v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)v0
                                                         + OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager)
                                           + 224);
    v3 = swift_retain();
    LOBYTE(v2) = v2(v3);
    swift_release();
    if ((v2 & 1) != 0)
    {
      v4 = *(void (**)(uint64_t))(**(_QWORD **)((char *)v0 + v1) + 240);
      v5 = swift_retain();
      v4(v5);
      swift_release();
      sub_2114D3FD0();
    }
  }
}

void sub_2114D3EF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x548))() & 1) != 0)
  {
    v1 = OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager;
    v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)v0
                                                         + OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager)
                                           + 232);
    v3 = swift_retain();
    LOBYTE(v2) = v2(v3);
    swift_release();
    if ((v2 & 1) != 0)
    {
      v4 = *(void (**)(uint64_t))(**(_QWORD **)((char *)v0 + v1) + 248);
      v5 = swift_retain();
      v4(v5);
      swift_release();
      sub_2114D3FD0();
    }
  }
}

void sub_2114D3FD0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;

  v1 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
  if (v1)
  {
    type metadata accessor for BRLTEditString();
    v2 = OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager;
    v3 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0
                                                         + OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager)
                                           + 256);
    v4 = v1;
    v5 = swift_retain();
    v6 = v3(v5);
    v8 = v7;
    swift_release();
    v9 = (void *)sub_2114CC228(v6, v8, 0, 0, 1);
    v10 = sub_2114CA7FC();
    sub_2114CAC8C((uint64_t)v9, v10 & 1, (uint64_t)&v19);
    v18 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v11 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + v2) + 264);
    v12 = swift_retain();
    v13 = v11(v12);
    v15 = v14;
    swift_release();
    v19 = (void *)v13;
    v20 = v15;
    swift_bridgeObjectRetain();
    sub_2114E4FD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2114E4FD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2114E4FD4();
    swift_bridgeObjectRelease();
    v16 = sub_2114CC1E8((uint64_t)v19, v20, 0, 0, 1, 0, 0, 0, MEMORY[0x24BEE4AF8]);
    v17 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    *(_QWORD *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v16;

    sub_2114D46A8();
  }
}

uint64_t sub_2114D41F0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t result;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;

  v9 = v8;
  v17 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v8) + 0x220))() & 1) != 0)
  {
    v58 = a8 & 1;
    v18 = a1;
    v59 = a1;
    v19 = a3 & 1;
    v57 = a7;
    v20 = OBJC_IVAR___BRLTBrailleModelInternal_script;
    v21 = (uint64_t *)(*(_QWORD *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_script)
                    + OBJC_IVAR___BRLTEditStringInternal_string);
    v23 = *v21;
    v22 = v21[1];
    swift_bridgeObjectRetain();
    v24 = v18;
    v25 = a2;
    v26 = sub_2114DA5C0(v23, v22, v24, a2, v19);
    v28 = v27;
    v30 = v29;
    swift_bridgeObjectRelease();
    v31 = sub_2114DA4CC(v26, v28, v30 & 1);
    v55 = v32;
    v56 = v31;
    v33 = *(_QWORD **)((char *)v9 + v20);
    v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v33) + 0xA8);
    v35 = v33;
    v36 = v59;
    v60 = a4;
    v37 = v34(v36, v25, v19, a4, a5, a6, v57, v58);

    v38 = *(void **)((char *)v9 + v20);
    *(_QWORD *)((char *)v9 + v20) = v37;

    v39 = (_QWORD *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory);
    swift_beginAccess();
    if (*v39 >> 62)
    {
      swift_bridgeObjectRetain();
      v54 = sub_2114E513C();
      swift_bridgeObjectRelease();
      if (v54 < 6)
        goto LABEL_5;
    }
    else if (*(uint64_t *)((*v39 & 0xFFFFFFFFFFFFF8) + 0x10) < 6)
    {
LABEL_5:
      v41 = *(void **)((char *)v9 + v20);
      swift_beginAccess();
      v42 = v41;
      MEMORY[0x212BDAE14]();
      if (*(_QWORD *)((*v39 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2114E5040();
      sub_2114E504C();
      sub_2114E5034();
      swift_endAccess();
      *(CFAbsoluteTime *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_lastScriptOutputTime) = CFAbsoluteTimeGetCurrent();
      swift_bridgeObjectRetain();
      v43 = sub_2114E4F98();
      swift_bridgeObjectRelease();
      if (!v58)
        v43 = a6;
      v44 = (uint64_t *)(*(_QWORD *)((char *)v9 + v20) + OBJC_IVAR___BRLTEditStringInternal_string);
      v45 = *v44;
      v46 = v44[1];
      swift_bridgeObjectRetain();
      v47 = sub_2114DA570(v45, v46, v43);
      v48 = swift_bridgeObjectRelease();
      v49 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v9) + 0x160))(v48);
      result = v60;
      if (v49)
      {
        v51 = (void *)sub_2114E4F50();
        objc_msgSend(v49, sel_didReplaceScriptStringRange_withScriptString_cursorLocation_, v56, v55, v51, v47);

        return swift_unknownObjectRelease();
      }
      return result;
    }
    swift_beginAccess();
    v40 = (void *)sub_2114D45C8(0);
    swift_endAccess();

    goto LABEL_5;
  }
  result = (*(uint64_t (**)(void))((*v17 & *v8) + 0x160))();
  if (result)
  {
    v52 = (void *)result;
    v53 = (void *)sub_2114E4F50();
    objc_msgSend(v52, sel_didInsertScriptString_, v53);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2114D45C8(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_2114D4F38(v3);
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      sub_2114E5034();
      return v10;
    }
  }
  result = sub_2114E5148();
  __break(1u);
  return result;
}

uint64_t sub_2114D46A8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;
  void *v3;
  uint64_t (*v4)(void);
  void *v5;
  void *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
  if (result)
  {
    v3 = (void *)result;
    v4 = *(uint64_t (**)(void))((*v1 & *v0) + 0x390);
    v5 = (void *)v4();
    swift_bridgeObjectRetain();

    v6 = (void *)sub_2114E4F50();
    v7 = swift_bridgeObjectRelease();
    v8 = (_BYTE *)((uint64_t (*)(uint64_t))v4)(v7);
    v9 = *(_QWORD *)&v8[OBJC_IVAR___BRLTEditStringInternal_selection];
    v10 = *(_QWORD *)&v8[OBJC_IVAR___BRLTEditStringInternal_selection + 8];
    v11 = v8[OBJC_IVAR___BRLTEditStringInternal_selection + 16];

    v12 = sub_2114DA4CC(v9, v10, v11);
    objc_msgSend(v3, sel_didChangeBrailleString_brailleSelection_, v6, v12, v13);

    return swift_unknownObjectRelease();
  }
  return result;
}

id BRLTBrailleModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTBrailleModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2114D48F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2114D49C8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2114CBBF0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2114CBBF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2114D49C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2114E50A0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2114D4B80(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2114E5118();
  if (!v8)
  {
    sub_2114E5130();
    __break(1u);
LABEL_17:
    result = sub_2114E5148();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2114D4B80(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2114D4C14(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2114D4DEC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2114D4DEC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2114D4C14(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2114D4D88(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2114E50F4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2114E5130();
      __break(1u);
LABEL_10:
      v2 = sub_2114E4FEC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2114E5148();
    __break(1u);
LABEL_14:
    result = sub_2114E5130();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2114D4D88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3840);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2114D4DEC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3840);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2114E5148();
  __break(1u);
  return result;
}

void sub_2114D4F38(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2114E513C();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x212BDAF10);
}

uint64_t sub_2114D4FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    v5 = *v3;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v19 = sub_2114E513C();
  swift_bridgeObjectRelease();
  if (v19 < v2)
    goto LABEL_31;
LABEL_4:
  v7 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v6 = v4 - v2;
  if (__OFSUB__(0, v7))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v8 = sub_2114E513C();
    swift_bridgeObjectRelease();
    v9 = v8 + v6;
    if (!__OFADD__(v8, v6))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_2114E513C();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v5 = *v3;
  if (*v3 >> 62)
    goto LABEL_34;
  v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = v8 - v7;
  if (__OFADD__(v8, v6))
    goto LABEL_36;
LABEL_8:
  v5 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v5;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    v11 = v5 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v8 = 1;
  }
  if (v5 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9)
    v12 = v9;
  swift_bridgeObjectRetain();
  v5 = MEMORY[0x212BDAF10](v8, v12, 1, v5);
  swift_bridgeObjectRelease();
  *v3 = v5;
  v11 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  type metadata accessor for BRLTEditString();
  swift_arrayDestroy();
  if (!v6)
    return sub_2114E5034();
  if (!(v5 >> 62))
  {
    v13 = *(_QWORD *)(v11 + 16);
    v14 = v13 - v2;
    if (!__OFSUB__(v13, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v20 = sub_2114E513C();
  swift_bridgeObjectRelease();
  v14 = v20 - v2;
  if (__OFSUB__(v20, v2))
    goto LABEL_40;
LABEL_21:
  if ((v14 & 0x8000000000000000) == 0)
  {
    v15 = (const void *)(v11 + 32 + 8 * v2);
    if (v4 != v2 || v11 + 32 + 8 * v4 >= (unint64_t)v15 + 8 * v14)
      memmove((void *)(v11 + 32 + 8 * v4), v15, 8 * v14);
    if (!(v5 >> 62))
    {
      v16 = *(_QWORD *)(v11 + 16);
      v17 = v16 + v6;
      if (!__OFADD__(v16, v6))
      {
LABEL_27:
        *(_QWORD *)(v11 + 16) = v17;
        return sub_2114E5034();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v21 = sub_2114E513C();
    swift_bridgeObjectRelease();
    v17 = v21 + v6;
    if (!__OFADD__(v21, v6))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_2114E5148();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BRLTBrailleModel()
{
  return objc_opt_self();
}

uint64_t method lookup function for BRLTBrailleModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTBrailleModel.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of BRLTBrailleModel.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of BRLTBrailleModel.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of BRLTBrailleModel.backTranslateByCell.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of BRLTBrailleModel.backTranslateByCell.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of BRLTBrailleModel.backTranslateByCell.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.technicalMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.technicalMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.technicalMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.editable.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of BRLTBrailleModel.editable.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of BRLTBrailleModel.editable.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of BRLTBrailleModel.brailleStringDirty.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setOutputTableIdentifier(_:manager:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setInputTableIdentifier(_:manager:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x360))();
}

uint64_t dispatch thunk of BRLTBrailleModel.isCandidateSelectionActive.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of BRLTBrailleModel.displayedScript.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of BRLTBrailleModel.displayedBraille.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of BRLTBrailleModel.bufferBrailleString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of BRLTBrailleModel.scriptLocation(forBrailleLocation:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setScript(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setAlert(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setTerminalOutput(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.forceTranslate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleBrailleDotPress(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleDelete(silently:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleBrailleSelection(NSSelection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x450))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleEscape()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4B8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleReturn()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4C0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleWordDescriptionCommand()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4C8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.scriptRangeOfBrailleCellRepresentingCharacter(at:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4D0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.showNextCandidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x518))();
}

uint64_t dispatch thunk of BRLTBrailleModel.showPreviousCandidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x520))();
}

uint64_t dispatch thunk of BRLTBrailleModel.selectCandidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x528))();
}

uint64_t dispatch thunk of BRLTBrailleModel.isWordDescriptionActive.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x548))();
}

uint64_t dispatch thunk of BRLTBrailleModel.isWordDescriptionActive.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x550))();
}

uint64_t dispatch thunk of BRLTBrailleModel.isWordDescriptionActive.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x558))();
}

uint64_t dispatch thunk of BRLTBrailleModel.showNextWordDescription()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x588))();
}

uint64_t dispatch thunk of BRLTBrailleModel.showPreviousWordDescription()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x590))();
}

_QWORD *sub_2114D56E0()
{
  _QWORD *result;
  uint64_t v1;

  result = (_QWORD *)swift_allocObject();
  result[2] = &unk_24CBF0D08;
  result[3] = &unk_24CBF0CD8;
  v1 = MEMORY[0x24BEE4AF8];
  result[4] = 0;
  result[5] = v1;
  return result;
}

_QWORD *sub_2114D5720()
{
  _QWORD *v0;
  _QWORD *result;
  uint64_t v2;

  result = v0;
  v0[2] = &unk_24CBF0D68;
  v0[3] = &unk_24CBF0D38;
  v2 = MEMORY[0x24BEE4AF8];
  v0[4] = 0;
  v0[5] = v2;
  return result;
}

uint64_t sub_2114D5748(_QWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(_QWORD *);
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t result;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  char *v76;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v78;
  unint64_t v79;
  char *v80;
  _QWORD *v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char v94;
  unint64_t v95;
  unint64_t v96;
  char *v97;
  _QWORD *v98;
  uint64_t (*v99)(_QWORD *);
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  _QWORD *v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t (*v111)(unint64_t, uint64_t);
  _QWORD *v112;
  __int128 v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t (*v116)(_QWORD *);
  uint64_t v117;
  uint64_t v118;

  v5 = v4;
  v8 = a1;
  v9 = (_QWORD *)MEMORY[0x24BEE4EA0];
  *(_QWORD *)&v113 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0xB8);
  v10 = (_QWORD *)((uint64_t (*)(void))v113)();
  v11 = (_QWORD *)(*(uint64_t (**)(void))((*v9 & *v8) + 0xD0))();
  v12 = v11;
  v114 = v5;
  v107 = v11;
  v108 = v10;
  if ((a4 & 1) != 0)
  {
    v44 = MEMORY[0x24BEE4AF8];
    v5[3] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    v5[2] = v44;
    swift_bridgeObjectRelease();
    v45 = *(void (**)(_QWORD *))((*v9 & *v12) + 0x78);
    v46 = v12;
    v45(v46);

    v47 = sub_2114E4F98();
    swift_bridgeObjectRelease();
    if (v47 >= 1)
    {
      v48 = v46;
      v49 = ((uint64_t (*)(_QWORD *))v45)(v48);
      v51 = v50;
      v112 = v48;

      v52 = sub_2114CA3A4(0, v49, v51, 1);
      v54 = v53;
      swift_bridgeObjectRelease();
      if (v52 != v54)
      {
        v111 = *(uint64_t (**)(unint64_t, uint64_t))((*v9 & *v112) + 0x168);
        v109 = v8;
        v110 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
        v61 = 0;
        v116 = (uint64_t (*)(_QWORD *))v45;
        do
        {
          v117 = (uint64_t)v8;
          v115 = v54;
          v62 = BRLTJTranslationResultProtocol.sourceRangeFor(targetRange:)(v52, v54, v110, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
          v64 = v63;
          v65 = (_QWORD *)((uint64_t (*)(uint64_t))v113)(v62);
          v66 = (*(uint64_t (**)(uint64_t, uint64_t))((*v9 & *v65) + 0x168))(v62, v64);
          v68 = v67;

          v117 = v66;
          v118 = v68;
          v69 = sub_2114E4F14();
          v70 = *(_QWORD *)(v69 - 8);
          v71 = *(_QWORD *)(v70 + 64);
          MEMORY[0x24BDAC7A8](v69);
          sub_2114E4F08();
          sub_2114CA788();
          v72 = sub_2114E50AC();
          v74 = v73;
          v75 = *(void (**)(char *, uint64_t))(v70 + 8);
          v75((char *)&v107 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0), v69);
          swift_bridgeObjectRelease();
          v76 = (char *)v5[3];
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v5[3] = v76;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v76 = sub_2114CA2A4(0, *((_QWORD *)v76 + 2) + 1, 1, v76);
            v5[3] = v76;
          }
          v79 = *((_QWORD *)v76 + 2);
          v78 = *((_QWORD *)v76 + 3);
          if (v79 >= v78 >> 1)
          {
            v76 = sub_2114CA2A4((char *)(v78 > 1), v79 + 1, 1, v76);
            v114[3] = v76;
          }
          *((_QWORD *)v76 + 2) = v79 + 1;
          v80 = &v76[16 * v79];
          *((_QWORD *)v80 + 4) = v72;
          *((_QWORD *)v80 + 5) = v74;
          v81 = v112;
          v82 = v116(v81);
          v84 = v83;

          v85 = sub_2114CA3A4(v61, v82, v84, 0);
          v87 = v86;
          swift_bridgeObjectRelease();
          v117 = v111(v85, v87);
          v118 = v88;
          MEMORY[0x24BDAC7A8](v117);
          v89 = (char *)&v107 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_2114E4F08();
          v90 = sub_2114E50AC();
          v92 = v91;
          v75(v89, v69);
          swift_bridgeObjectRelease();
          v5 = v114;
          v93 = (char *)v114[2];
          v94 = swift_isUniquelyReferenced_nonNull_native();
          v5[2] = v93;
          if ((v94 & 1) == 0)
          {
            v93 = sub_2114CA2A4(0, *((_QWORD *)v93 + 2) + 1, 1, v93);
            v5[2] = v93;
          }
          v9 = (_QWORD *)MEMORY[0x24BEE4EA0];
          v8 = v109;
          v96 = *((_QWORD *)v93 + 2);
          v95 = *((_QWORD *)v93 + 3);
          if (v96 >= v95 >> 1)
          {
            v93 = sub_2114CA2A4((char *)(v95 > 1), v96 + 1, 1, v93);
            v5[2] = v93;
          }
          *((_QWORD *)v93 + 2) = v96 + 1;
          v97 = &v93[16 * v96];
          *((_QWORD *)v97 + 4) = v90;
          *((_QWORD *)v97 + 5) = v92;
          v98 = v81;
          v99 = v116;
          v116(v98);

          v100 = sub_2114E4F98();
          swift_bridgeObjectRelease();
          v61 = v115;
          if (v115 >= v100)
            break;
          v101 = v98;
          v102 = v99(v101);
          v104 = v103;

          v52 = sub_2114CA3A4(v61, v102, v104, 1);
          v106 = v105;
          swift_bridgeObjectRelease();
          v54 = v106;
        }
        while (v52 != v106);
      }
    }
  }
  else
  {
    v116 = *(uint64_t (**)(_QWORD *))((*v9 & *v11) + 0x78);
    v13 = v11;
    v14 = v116(v13);
    v16 = v15;

    v17 = sub_2114CA3A4(a2, v14, v16, 1);
    v115 = a2;
    v19 = v18;
    swift_bridgeObjectRelease();
    v117 = (uint64_t)v8;
    v20 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
    v21 = BRLTJTranslationResultProtocol.sourceRangeFor(targetRange:)(v17, v19, v20, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
    v117 = (*(uint64_t (**)(uint64_t))((*v9 & *v10) + 0x168))(v21);
    v118 = v22;
    v23 = sub_2114E4F14();
    v24 = *(_QWORD *)(v23 - 8);
    v25 = *(_QWORD *)(v24 + 64);
    MEMORY[0x24BDAC7A8](v23);
    v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_2114E4F08();
    sub_2114CA788();
    v27 = sub_2114E50AC();
    v29 = v28;
    v30 = *(void (**)(char *, uint64_t))(v24 + 8);
    v30((char *)&v107 - v26, v23);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3688);
    v31 = swift_allocObject();
    v113 = xmmword_2114E7C40;
    *(_OWORD *)(v31 + 16) = xmmword_2114E7C40;
    *(_QWORD *)(v31 + 32) = v27;
    *(_QWORD *)(v31 + 40) = v29;
    v114[3] = v31;
    swift_bridgeObjectRelease();
    v32 = v13;
    v33 = v116(v32);
    v35 = v34;

    v36 = sub_2114CA3A4(v115, v33, v35, 0);
    v38 = v37;
    swift_bridgeObjectRelease();
    v117 = (*(uint64_t (**)(unint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v32) + 0x168))(v36, v38);
    v118 = v39;
    MEMORY[0x24BDAC7A8](v117);
    sub_2114E4F08();
    v40 = sub_2114E50AC();
    v42 = v41;
    v30((char *)&v107 - v26, v23);
    swift_bridgeObjectRelease();
    v5 = v114;
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = v113;
    *(_QWORD *)(v43 + 32) = v40;
    *(_QWORD *)(v43 + 40) = v42;
    v5[2] = v43;
    swift_bridgeObjectRelease();
  }
  if (!*(_QWORD *)(v5[3] + 16))
  {
    v5[3] = &unk_24CBF0CA8;
    swift_bridgeObjectRelease();
    v5[2] = &unk_24CBF0C78;
    swift_bridgeObjectRelease();
  }
  v5[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3688);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_2114E7C40;
  v56 = v108;
  if (*(_QWORD *)(v5[3] + 16))
  {
    v57 = result;
    swift_bridgeObjectRetain();
    v58 = sub_2114CA648();
    v60 = v59;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v57 + 32) = v58;
    *(_QWORD *)(v57 + 40) = v60;
    v5[5] = v57;

    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t BRLTJWordDescriptionManager.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BRLTJWordDescriptionManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BRLTJWordDescriptionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for BRLTJWordDescriptionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2114D5FBC(uint64_t a1)
{
  return sub_2114D60B8(a1, qword_254AB3A88);
}

uint64_t sub_2114D5FC8()
{
  return sub_2114D6154(&qword_254AB3A80, (uint64_t)qword_254AB3A88);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t BRLTJLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2114D61B0(&qword_254AB3A80, (uint64_t)qword_254AB3A88, a1);
}

uint64_t BRLTJLog.setter(uint64_t a1)
{
  return sub_2114D6254(a1, &qword_254AB3A80, (uint64_t)qword_254AB3A88);
}

uint64_t (*BRLTJLog.modify())()
{
  uint64_t v0;

  if (qword_254AB3A80 != -1)
    swift_once();
  v0 = sub_2114E4F38();
  __swift_project_value_buffer(v0, (uint64_t)qword_254AB3A88);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2114D60AC(uint64_t a1)
{
  return sub_2114D60B8(a1, qword_254AB3AA8);
}

uint64_t sub_2114D60B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2114E4F38();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2114E4F2C();
}

uint64_t sub_2114D6138()
{
  return sub_2114D6154(&qword_254AB3AA0, (uint64_t)qword_254AB3AA8);
}

uint64_t sub_2114D6154(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_2114E4F38();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t BRLTJLogEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2114D61B0(&qword_254AB3AA0, (uint64_t)qword_254AB3AA8, a1);
}

uint64_t sub_2114D61B0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_2114E4F38();
  v6 = __swift_project_value_buffer(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t BRLTJLogEvent.setter(uint64_t a1)
{
  return sub_2114D6254(a1, &qword_254AB3AA0, (uint64_t)qword_254AB3AA8);
}

uint64_t sub_2114D6254(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*a2 != -1)
    swift_once();
  v5 = sub_2114E4F38();
  v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  v7 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*BRLTJLogEvent.modify())()
{
  uint64_t v0;

  if (qword_254AB3AA0 != -1)
    swift_once();
  v0 = sub_2114E4F38();
  __swift_project_value_buffer(v0, (uint64_t)qword_254AB3AA8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

Swift::Int __swiftcall BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:)(Swift::Int targetLocation)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v6;
  Swift::Int v8;

  v3 = v2;
  v4 = v1;
  (*(void (**)())(v2 + 16))();
  v6 = sub_2114E4F98();
  swift_bridgeObjectRelease();
  if (v6 > targetLocation)
    return (*(uint64_t (**)(Swift::Int, uint64_t, uint64_t))(v3 + 24))(targetLocation, v4, v3);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v3);
  v8 = sub_2114E4F98();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t BRLTJTranslationResultProtocol.sourceRangeFor(targetRange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D6528(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:));
}

Swift::Int __swiftcall BRLTJTranslationResultProtocol.targetLocationFor(sourceLocation:)(Swift::Int sourceLocation)
{
  uint64_t v1;
  uint64_t v3;
  Swift::Int result;
  Swift::Int v5;

  (*(void (**)())(v1 + 16))();
  v3 = sub_2114E4F98();
  result = swift_bridgeObjectRelease();
  if (v3 < 1)
  {
    return 0;
  }
  else
  {
    v5 = 0;
    while (!__OFADD__(v5, v3))
    {
      result = BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:)((v5 + v3) / 2);
      if (result < sourceLocation)
        v5 = (v5 + v3) / 2 + 1;
      else
        v3 = (v5 + v3) / 2;
      if (v5 >= v3)
        return v5;
    }
    __break(1u);
  }
  return result;
}

uint64_t BRLTJTranslationResultProtocol.targetRangeFor(sourceRange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D6528(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))BRLTJTranslationResultProtocol.targetLocationFor(sourceLocation:));
}

uint64_t sub_2114D6528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t result;

  v9 = a5(a1, a3, a4);
  result = a5(a2, a3, a4);
  if (result >= v9)
    return v9;
  __break(1u);
  return result;
}

uint64_t dispatch thunk of BRLTJTranslationResultProtocol.source.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of BRLTJTranslationResultProtocol.target.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BRLTJTranslationResultProtocol.sourceLocation(forTargetLocation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_2114D6614()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___BRLTJEditableStringInternal_string);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2114D66D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___BRLTJEditableStringInternal_string);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2114D672C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x78))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2114D676C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR___BRLTJEditableStringInternal_string);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2114D67D4@<X0>(_QWORD **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x90))();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_2114D681C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D6900(a1, a2, a3, a4, &OBJC_IVAR___BRLTJEditableStringInternal_selection);
}

uint64_t sub_2114D6828()
{
  return sub_2114D6964(&OBJC_IVAR___BRLTJEditableStringInternal_selection);
}

uint64_t sub_2114D6834(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2114D69B4(a1, a2, a3, &OBJC_IVAR___BRLTJEditableStringInternal_selection);
}

uint64_t sub_2114D6840@<X0>(_QWORD **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xA8))();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_2114D6888(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D6900(a1, a2, a3, a4, &OBJC_IVAR___BRLTJEditableStringInternal_focus);
}

uint64_t sub_2114D6894()
{
  return sub_2114D6964(&OBJC_IVAR___BRLTJEditableStringInternal_focus);
}

uint64_t sub_2114D68A0(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2114D69B4(a1, a2, a3, &OBJC_IVAR___BRLTJEditableStringInternal_focus);
}

uint64_t sub_2114D68AC@<X0>(_QWORD **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xC0))();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_2114D68F4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D6900(a1, a2, a3, a4, &OBJC_IVAR___BRLTJEditableStringInternal_suggestion);
}

uint64_t sub_2114D6900(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a1;
  v6 = a1[1];
  v7 = *((_BYTE *)a1 + 16);
  v8 = *a2 + *a5;
  result = swift_beginAccess();
  *(_QWORD *)v8 = v5;
  *(_QWORD *)(v8 + 8) = v6;
  *(_BYTE *)(v8 + 16) = v7;
  return result;
}

uint64_t sub_2114D6958()
{
  return sub_2114D6964(&OBJC_IVAR___BRLTJEditableStringInternal_suggestion);
}

uint64_t sub_2114D6964(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return *(_QWORD *)v2;
}

uint64_t sub_2114D69A8(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2114D69B4(a1, a2, a3, &OBJC_IVAR___BRLTJEditableStringInternal_suggestion);
}

uint64_t sub_2114D69B4(uint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t result;

  v8 = v4 + *a4;
  result = swift_beginAccess();
  *(_QWORD *)v8 = a1;
  *(_QWORD *)(v8 + 8) = a2;
  *(_BYTE *)(v8 + 16) = a3 & 1;
  return result;
}

uint64_t sub_2114D6A10@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xD8))();
  *a2 = result;
  return result;
}

uint64_t sub_2114D6A50(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2114D6AB8()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2114D6B00(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

BOOL sub_2114D6B50()
{
  _QWORD *v0;
  char v1;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
  return (v1 & 1) == 0;
}

uint64_t sub_2114D6B84()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;
  uint64_t v3;
  char v4;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))() & 1) == 0)
    return 0;
  result = (*(uint64_t (**)(void))((*v1 & *v0) + 0x90))();
  if ((v4 & 1) == 0)
    return result == v3;
  __break(1u);
  return result;
}

id BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  objc_class *v12;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  objc_super v27;

  v18 = (char *)objc_allocWithZone(v12);
  v19 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_selection];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v19[16] = 1;
  v20 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_focus];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  v20[16] = 1;
  v21 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_suggestion];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0;
  v21[16] = 1;
  v22 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_string];
  *(_QWORD *)v22 = a1;
  *((_QWORD *)v22 + 1) = a2;
  swift_beginAccess();
  *(_QWORD *)v19 = a3;
  *((_QWORD *)v19 + 1) = a4;
  v19[16] = a5 & 1;
  swift_beginAccess();
  *(_QWORD *)v20 = a6;
  *((_QWORD *)v20 + 1) = a7;
  v20[16] = a8 & 1;
  swift_beginAccess();
  *(_QWORD *)v21 = a9;
  *((_QWORD *)v21 + 1) = a10;
  v21[16] = a11 & 1;
  *(_QWORD *)&v18[OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges] = a12;
  v27.receiver = v18;
  v27.super_class = v12;
  return objc_msgSendSuper2(&v27, sel_init);
}

id BRLTJEditableString.init(string:selection:focus:suggestion:tokenRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  char *v12;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  objc_super v24;

  v18 = &v12[OBJC_IVAR___BRLTJEditableStringInternal_selection];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 1;
  v19 = &v12[OBJC_IVAR___BRLTJEditableStringInternal_focus];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v19[16] = 1;
  v20 = &v12[OBJC_IVAR___BRLTJEditableStringInternal_suggestion];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  v20[16] = 1;
  v21 = &v12[OBJC_IVAR___BRLTJEditableStringInternal_string];
  *(_QWORD *)v21 = a1;
  *((_QWORD *)v21 + 1) = a2;
  swift_beginAccess();
  *(_QWORD *)v18 = a3;
  *((_QWORD *)v18 + 1) = a4;
  v18[16] = a5 & 1;
  swift_beginAccess();
  *(_QWORD *)v19 = a6;
  *((_QWORD *)v19 + 1) = a7;
  v19[16] = a8 & 1;
  swift_beginAccess();
  *(_QWORD *)v20 = a9;
  *((_QWORD *)v20 + 1) = a10;
  v20[16] = a11 & 1;
  *(_QWORD *)&v12[OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges] = a12;
  v24.receiver = v12;
  v24.super_class = (Class)type metadata accessor for BRLTJEditableString();
  return objc_msgSendSuper2(&v24, sel_init);
}

uint64_t type metadata accessor for BRLTJEditableString()
{
  return objc_opt_self();
}

uint64_t BRLTJEditableString.__allocating_init(string:cursor:focus:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, char, _QWORD))(v6 + 256))(a1, a2, a3, a3, 0, a4, a5, a6 & 1, 0, 0, 1, MEMORY[0x24BEE4AF8]);
}

uint64_t sub_2114D6F24(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  char *v7;
  uint64_t result;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((a3 & 1) != 0)
  {
    v7 = (char *)v3 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
    result = swift_beginAccess();
    *(_QWORD *)v7 = a1;
LABEL_10:
    *((_QWORD *)v7 + 1) = a2;
    v7[16] = a3 & 1;
    return result;
  }
  v9 = a1 & ~(a1 >> 63);
  v10 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0x78);
  v10();
  v11 = sub_2114E4F98();
  v12 = swift_bridgeObjectRelease();
  if (v11 >= v9)
    v11 = v9;
  ((void (*)(uint64_t))v10)(v12);
  v13 = sub_2114E4F98();
  result = swift_bridgeObjectRelease();
  if (v13 >= (a2 & ~(a2 >> 63)))
    a2 &= ~(a2 >> 63);
  else
    a2 = v13;
  if (a2 >= v11)
  {
    v7 = (char *)v3 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
    result = swift_beginAccess();
    *(_QWORD *)v7 = v11;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2114D7030(uint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v1) + 0x108))(a1, a1, 0);
}

uint64_t sub_2114D7054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = v0 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
  result = swift_beginAccess();
  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = 0;
  *(_BYTE *)(v1 + 16) = 1;
  return result;
}

uint64_t sub_2114D70A0()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t sub_2114D70D0()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t result;
  char v4;
  uint64_t v5;
  void (*v6)(void);
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
  if ((v4 & 1) == 0)
  {
    v5 = result;
    v6 = *(void (**)(void))((*v2 & *v0) + 0x78);
    v6();
    v6();
    swift_bridgeObjectRelease();
    v7 = sub_2114E4FBC();
    v8 = swift_bridgeObjectRelease();
    ((void (*)(uint64_t))v6)(v8);
    v6();
    swift_bridgeObjectRelease();
    v9 = sub_2114E4FBC();
    result = swift_bridgeObjectRelease();
    if (v9 >> 14 < v7 >> 14)
    {
      __break(1u);
    }
    else
    {
      swift_beginAccess();
      sub_2114D7268();
      sub_2114E4F80();
      swift_endAccess();
      result = sub_2114E4F98();
      v10 = v5 + result;
      if (!__OFADD__(v5, result))
      {
        v11 = (char *)v1 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
        result = swift_beginAccess();
        *(_QWORD *)v11 = v10;
        *((_QWORD *)v11 + 1) = v10;
        v11[16] = 0;
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_2114D7268()
{
  unint64_t result;

  result = qword_254AB3870;
  if (!qword_254AB3870)
  {
    result = MEMORY[0x212BDB564](MEMORY[0x24BEE0D40], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254AB3870);
  }
  return result;
}

uint64_t sub_2114D72AC()
{
  _QWORD *v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90);
  v2 = v1();
  if ((v4 & 1) != 0)
    return ((uint64_t (*)(uint64_t))v1)(v2);
  if (v2 != v3 || v2 < 1)
    return ((uint64_t (*)(uint64_t))v1)(v2);
  else
    return v2 - 1;
}

uint64_t sub_2114D7310()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void (*v8)(void);
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  char *v13;
  uint64_t v14;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
  if ((v4 & 1) != 0)
    return 0;
  v5 = v3;
  if (((*(uint64_t (**)(void))((*v2 & *v0) + 0xF8))() & 1) == 0)
  {
    (*(void (**)(_QWORD, unint64_t))((*v2 & *v0) + 0x128))(0, 0xE000000000000000);
    return 1;
  }
  v6 = v5 < 1;
  v7 = v5 - 1;
  if (v6)
    return 0;
  v8 = *(void (**)(void))((*v2 & *v0) + 0x78);
  v8();
  v8();
  swift_bridgeObjectRelease();
  v9 = sub_2114E4FBC();
  v10 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v8)(v10);
  v11 = sub_2114E4FA4();
  result = swift_bridgeObjectRelease();
  if (v11 >> 14 >= v9 >> 14)
  {
    swift_beginAccess();
    sub_2114D7268();
    sub_2114E4F80();
    swift_endAccess();
    v13 = (char *)v1 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
    v14 = 1;
    swift_beginAccess();
    *(_QWORD *)v13 = v7;
    *((_QWORD *)v13 + 1) = v7;
    v13[16] = 0;
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_2114D74C4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90);
  v3 = v2();
  if ((v5 & 1) != 0)
    return ((uint64_t (*)(uint64_t))v2)(v3);
  v6 = v4;
  if (v3 != v4)
    return ((uint64_t (*)(uint64_t))v2)(v3);
  (*(void (**)(void))((*v1 & *v0) + 0x78))();
  v7 = sub_2114E4F98();
  v3 = swift_bridgeObjectRelease();
  if (v6 >= v7)
    return ((uint64_t (*)(_QWORD))v2)(v3);
  return v6;
}

uint64_t sub_2114D7564()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v2 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
  if ((v3 & 1) != 0)
    return 0;
  v4 = v2;
  if (((*(uint64_t (**)(void))((*v1 & *v0) + 0xF8))() & 1) == 0)
  {
    (*(void (**)(_QWORD, unint64_t))((*v1 & *v0) + 0x128))(0, 0xE000000000000000);
    return 1;
  }
  v5 = *(void (**)(void))((*v1 & *v0) + 0x78);
  v5();
  v6 = sub_2114E4F98();
  v7 = swift_bridgeObjectRelease();
  if (v4 >= v6)
    return 0;
  ((void (*)(uint64_t))v5)(v7);
  v5();
  swift_bridgeObjectRelease();
  v8 = sub_2114E4FBC();
  v9 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v5)(v9);
  v10 = sub_2114E4FA4();
  result = swift_bridgeObjectRelease();
  if (v10 >> 14 < v8 >> 14)
  {
    __break(1u);
    return result;
  }
  swift_beginAccess();
  sub_2114D7268();
  sub_2114E4F80();
  swift_endAccess();
  return 1;
}

uint64_t sub_2114D76E0(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(void);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t *v58;

  v2 = v1;
  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0xA8))();
  if ((v7 & 1) == 0)
  {
    v8 = v5;
    v9 = v6;
    v10 = *(void (**)(void))((*v4 & *v1) + 0x78);
    v10();
    v11 = sub_2114E4F98();
    result = swift_bridgeObjectRelease();
    v13 = v11 + v8;
    if (__OFADD__(v11, v8))
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    ((void (*)(uint64_t))v10)(result);
    v14 = sub_2114E4F98();
    result = swift_bridgeObjectRelease();
    v15 = v14 + v9;
    if (__OFADD__(v14, v9))
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    if (v15 < v13)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    v16 = (char *)v1 + OBJC_IVAR___BRLTJEditableStringInternal_focus;
    v5 = swift_beginAccess();
    *(_QWORD *)v16 = v13;
    *((_QWORD *)v16 + 1) = v15;
    v16[16] = 0;
  }
  v17 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0x90))(v5);
  if ((v19 & 1) == 0)
  {
    v20 = v17;
    v21 = v18;
    v22 = *(void (**)(void))((*v4 & *v2) + 0x78);
    v22();
    v23 = sub_2114E4F98();
    result = swift_bridgeObjectRelease();
    v24 = v23 + v20;
    if (__OFADD__(v23, v20))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    ((void (*)(uint64_t))v22)(result);
    v25 = sub_2114E4F98();
    result = swift_bridgeObjectRelease();
    v26 = v25 + v21;
    if (__OFADD__(v25, v21))
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v26 < v24)
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    v27 = (char *)v2 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
    v17 = swift_beginAccess();
    *(_QWORD *)v27 = v24;
    *((_QWORD *)v27 + 1) = v26;
    v27[16] = 0;
  }
  v28 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xC0))(v17);
  if ((v30 & 1) != 0)
  {
LABEL_16:
    v56 = a1;
    v57 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xD8))(v28);
    v39 = *(_QWORD *)(v57 + 16);
    if (!v39)
    {
LABEL_26:
      v55 = swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v56) + 0x78))(v55);
      swift_beginAccess();
      sub_2114E4FD4();
      swift_endAccess();
      return swift_bridgeObjectRelease();
    }
    v40 = *(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0x78);
    v58 = (_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges);
    isUniquelyReferenced_nonNull_native = swift_beginAccess();
    v42 = (uint64_t *)(v57 + 48);
    while (1)
    {
      v43 = *(v42 - 2);
      v44 = *(v42 - 1);
      v45 = *v42;
      v40(isUniquelyReferenced_nonNull_native);
      v46 = sub_2114E4F98();
      result = swift_bridgeObjectRelease();
      v47 = v46 + v43;
      if (__OFADD__(v46, v43))
        break;
      v40(result);
      v48 = sub_2114E4F98();
      result = swift_bridgeObjectRelease();
      v49 = __OFADD__(v48, v44);
      v50 = v48 + v44;
      if (v49)
        goto LABEL_28;
      if (v50 < v47)
        goto LABEL_29;
      v51 = *v58;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v58 = v51;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2114CBA40(0, *(_QWORD *)(v51 + 16) + 1, 1, (char *)v51);
        v51 = isUniquelyReferenced_nonNull_native;
        *v58 = isUniquelyReferenced_nonNull_native;
      }
      v53 = *(_QWORD *)(v51 + 16);
      v52 = *(_QWORD *)(v51 + 24);
      if (v53 >= v52 >> 1)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2114CBA40((char *)(v52 > 1), v53 + 1, 1, (char *)v51);
        v51 = isUniquelyReferenced_nonNull_native;
        *v58 = isUniquelyReferenced_nonNull_native;
      }
      v42 += 3;
      *(_QWORD *)(v51 + 16) = v53 + 1;
      v54 = (_QWORD *)(v51 + 24 * v53);
      v54[4] = v47;
      v54[5] = v50;
      v54[6] = v45;
      if (!--v39)
        goto LABEL_26;
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v31 = v28;
  v32 = v29;
  v33 = *(void (**)(void))((*v4 & *v2) + 0x78);
  v33();
  v34 = sub_2114E4F98();
  result = swift_bridgeObjectRelease();
  v35 = v34 + v31;
  if (__OFADD__(v34, v31))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  ((void (*)(uint64_t))v33)(result);
  v36 = sub_2114E4F98();
  result = swift_bridgeObjectRelease();
  v37 = v36 + v32;
  if (__OFADD__(v36, v32))
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v37 >= v35)
  {
    v38 = (char *)v2 + OBJC_IVAR___BRLTJEditableStringInternal_suggestion;
    v28 = swift_beginAccess();
    *(_QWORD *)v38 = v35;
    *((_QWORD *)v38 + 1) = v37;
    v38[16] = 0;
    goto LABEL_16;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2114D7B84(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v7;

  v3 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0xD8))();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = (uint64_t *)(v3 + 48);
    while (*(v5 - 2) > a1 || *(v5 - 1) <= a1)
    {
      v5 += 3;
      if (!--v4)
        goto LABEL_9;
    }
    v7 = *v5;
  }
  else
  {
LABEL_9:
    v7 = 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_2114D7C34(uint64_t a1)
{
  _QWORD *v1;
  char v2;
  _QWORD *v4;
  _BYTE v5[24];
  uint64_t v6;

  sub_2114C9608(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_2114C9690((uint64_t)v5);
    goto LABEL_5;
  }
  type metadata accessor for BRLTJEditableString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v2 = 0;
    return v2 & 1;
  }
  v2 = _s18BrailleTranslation19BRLTJEditableStringC2eeoiySbAC_ACtFZ_0(v1, v4);

  return v2 & 1;
}

uint64_t sub_2114D7DEC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2114E50E8();
  v1 = sub_2114E4FD4();
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))(v1);
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  v3 = sub_2114E4FD4();
  (*(void (**)(uint64_t))((*v2 & *v0) + 0x90))(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3680);
  sub_2114E4F68();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  v4 = sub_2114E4FD4();
  (*(void (**)(uint64_t))((*v2 & *v0) + 0xA8))(v4);
  sub_2114E4F68();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  v5 = sub_2114E4FD4();
  (*(void (**)(uint64_t))((*v2 & *v0) + 0xC0))(v5);
  sub_2114E4F68();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  v6 = sub_2114E4FD4();
  v7 = (*(uint64_t (**)(uint64_t))((*v2 & *v0) + 0xD8))(v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AB36F8);
  MEMORY[0x212BDAE2C](v7, v8);
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

id sub_2114D8054@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  objc_class *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;
  id result;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x78))();
  v5 = v4;
  v6 = (*(uint64_t (**)(void))((*v2 & *v1) + 0x90))();
  v8 = v7;
  v24 = v9;
  v10 = (*(uint64_t (**)(void))((*v2 & *v1) + 0xA8))();
  v26 = v11;
  v27 = v10;
  v25 = v12;
  v13 = (*(uint64_t (**)(void))((*v2 & *v1) + 0xC0))();
  v29 = v14;
  v30 = v13;
  v28 = v15;
  v16 = (*(uint64_t (**)(void))((*v2 & *v1) + 0xD8))();
  v17 = (objc_class *)type metadata accessor for BRLTJEditableString();
  v18 = (char *)objc_allocWithZone(v17);
  v19 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_selection];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v19[16] = 1;
  v20 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_focus];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  v20[16] = 1;
  v21 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_suggestion];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0;
  v21[16] = 1;
  v22 = (uint64_t *)&v18[OBJC_IVAR___BRLTJEditableStringInternal_string];
  *v22 = v3;
  v22[1] = v5;
  swift_beginAccess();
  *(_QWORD *)v19 = v6;
  *((_QWORD *)v19 + 1) = v8;
  v19[16] = v24 & 1;
  swift_beginAccess();
  *(_QWORD *)v20 = v27;
  *((_QWORD *)v20 + 1) = v26;
  v20[16] = v25 & 1;
  swift_beginAccess();
  *(_QWORD *)v21 = v30;
  *((_QWORD *)v21 + 1) = v29;
  v21[16] = v28 & 1;
  *(_QWORD *)&v18[OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges] = v16;
  v32.receiver = v18;
  v32.super_class = v17;
  result = objc_msgSendSuper2(&v32, sel_init);
  a1[3] = v17;
  *a1 = result;
  return result;
}

uint64_t sub_2114D8290(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  void (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x78);
  v4();
  v5 = sub_2114E4F98();
  v6 = swift_bridgeObjectRelease();
  if (v5 < a2)
  {
    ((void (*)(uint64_t))v4)(v6);
    sub_2114E4F98();
    v6 = swift_bridgeObjectRelease();
  }
  ((void (*)(uint64_t))v4)(v6);
  v4();
  swift_bridgeObjectRelease();
  v7 = sub_2114E4FBC();
  v8 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v4)(v8);
  v4();
  swift_bridgeObjectRelease();
  v9 = sub_2114E4FBC();
  v10 = swift_bridgeObjectRelease();
  result = ((uint64_t (*)(uint64_t))v4)(v10);
  if (v9 >> 14 < v7 >> 14)
  {
    __break(1u);
  }
  else
  {
    v12 = sub_2114E5004();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    swift_bridgeObjectRelease();
    v19 = MEMORY[0x212BDAD78](v12, v14, v16, v18);
    swift_bridgeObjectRelease();
    return v19;
  }
  return result;
}

id BRLTJEditableString.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BRLTJEditableString.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BRLTJEditableString.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTJEditableString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BRLTJEditableString.NSSelection.getter()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
  return sub_2114DA4CC(v1, v3, v2 & 1);
}

uint64_t BRLTJEditableString.NSFocus.getter()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
  return sub_2114DA4CC(v1, v3, v2 & 1);
}

uint64_t BRLTJEditableString.NSSuggestion.getter()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
  return sub_2114DA4CC(v1, v3, v2 & 1);
}

id BRLTJEditableString.__allocating_init(string:selection:focus:token:suggestion:)(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v16;
  void *v17;
  id v18;

  v16 = objc_allocWithZone(v9);
  v17 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_initWithString_selection_focus_token_suggestion_, v17, a3, a4, a5, a6, a7, a8, a9);

  return v18;
}

uint64_t BRLTJEditableString.init(string:selection:focus:token:suggestion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t ObjectType;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v17 = v9;
  v18 = sub_2114DA4F8(a3, a4);
  v37 = v19;
  v38 = v18;
  v21 = v20;
  v22 = sub_2114DA4F8(a5, a6);
  v35 = v23;
  v36 = v22;
  v25 = v24;
  v26 = sub_2114DA4F8(a8, a9);
  v28 = v27;
  v30 = v29;
  ObjectType = swift_getObjectType();

  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB36A8);
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_2114E7C40;
  result = sub_2114E4F98();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v32 + 32) = 0;
    *(_QWORD *)(v32 + 40) = result;
    *(_QWORD *)(v32 + 48) = a7;
    v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _BYTE, uint64_t))(ObjectType + 256))(a1, a2, v38, v37, v21 & 1, v36, v35, v25 & 1, v26, v28, v30 & 1, v32);
    swift_deallocPartialClassInstance();
    return v34;
  }
  return result;
}

uint64_t _s18BrailleTranslation19BRLTJEditableStringC2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v68;
  uint64_t (*v69)(uint64_t);
  uint64_t v70;
  uint64_t v71;

  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x78))();
  v7 = v6;
  v9 = v5 == (*(uint64_t (**)(void))((*v4 & *a2) + 0x78))() && v7 == v8;
  if (v9)
  {
    v11 = swift_bridgeObjectRelease_n();
  }
  else
  {
    v10 = sub_2114E516C();
    swift_bridgeObjectRelease();
    v11 = swift_bridgeObjectRelease();
    v12 = 0;
    if ((v10 & 1) == 0)
      return v12;
  }
  v13 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0x90))(v11);
  v15 = v14;
  v17 = v16;
  v18 = (*(uint64_t (**)(void))((*v4 & *a2) + 0x90))();
  if ((v17 & 1) != 0)
  {
    if ((v20 & 1) == 0)
      return 0;
  }
  else
  {
    if ((v20 & 1) != 0)
      return 0;
    if (v13 != v18 || v15 != v19)
      return 0;
  }
  v22 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xA8))(v18);
  v24 = v23;
  v26 = v25;
  v27 = (*(uint64_t (**)(void))((*v4 & *a2) + 0xA8))();
  if ((v26 & 1) != 0)
  {
    if ((v29 & 1) == 0)
      return 0;
  }
  else
  {
    if ((v29 & 1) != 0)
      return 0;
    if (v22 != v27 || v24 != v28)
      return 0;
  }
  v31 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xC0))(v27);
  v33 = v32;
  v35 = v34;
  v36 = (*(uint64_t (**)(void))((*v4 & *a2) + 0xC0))();
  if ((v35 & 1) != 0)
  {
    if ((v38 & 1) != 0)
      goto LABEL_33;
    return 0;
  }
  if ((v38 & 1) != 0)
    return 0;
  if (v31 != v36 || v33 != v37)
    return 0;
LABEL_33:
  v40 = *(uint64_t (**)(void))((*v4 & *a1) + 0xD8);
  v41 = *(_QWORD *)(v40() + 16);
  v42 = swift_bridgeObjectRelease();
  v69 = *(uint64_t (**)(uint64_t))((*v4 & *a2) + 0xD8);
  v43 = *(_QWORD *)(v69(v42) + 16);
  v44 = swift_bridgeObjectRelease();
  if (v41 != v43)
    return 0;
  v45 = *(_QWORD *)(((uint64_t (*)(uint64_t))v40)(v44) + 16);
  v46 = swift_bridgeObjectRelease();
  v68 = v45;
  if (!v45)
    return 1;
  result = ((uint64_t (*)(uint64_t))v40)(v46);
  if (*(_QWORD *)(result + 16))
  {
    v49 = *(_QWORD *)(result + 32);
    v48 = *(_QWORD *)(result + 40);
    v50 = *(_QWORD *)(result + 48);
    v51 = swift_bridgeObjectRelease();
    result = v69(v51);
    if (*(_QWORD *)(result + 16))
    {
      v53 = *(_QWORD *)(result + 32);
      v52 = *(_QWORD *)(result + 40);
      v54 = *(_QWORD *)(result + 48);
      v55 = swift_bridgeObjectRelease();
      v12 = 0;
      if (v49 == v53 && v48 == v52 && v50 == v54)
      {
        v56 = 0;
        v57 = 1;
        while (1)
        {
          v12 = v68 == v57;
          if (v68 == v57)
            break;
          result = ((uint64_t (*)(uint64_t))v40)(v55);
          if (v57 >= *(_QWORD *)(result + 16))
          {
            __break(1u);
LABEL_56:
            __break(1u);
            goto LABEL_57;
          }
          ++v57;
          v59 = *(_QWORD *)(result + v56 + 56);
          v58 = *(_QWORD *)(result + v56 + 64);
          v60 = *(_QWORD *)(result + v56 + 72);
          v61 = swift_bridgeObjectRelease();
          result = v69(v61);
          if (v57 - 1 >= *(_QWORD *)(result + 16))
            goto LABEL_56;
          v62 = v56 + 24;
          v63 = result + v56;
          v64 = *(_QWORD *)(result + v56 + 56);
          v70 = *(_QWORD *)(v63 + 64);
          v71 = v62;
          v65 = *(_QWORD *)(v63 + 72);
          v55 = swift_bridgeObjectRelease();
          v9 = v59 == v64;
          v56 = v71;
          if (!v9 || v58 != v70 || v60 != v65)
            return v12;
        }
      }
      return v12;
    }
  }
  else
  {
LABEL_57:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t method lookup function for BRLTJEditableString()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTJEditableString.string.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of BRLTJEditableString.selection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of BRLTJEditableString.focus.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of BRLTJEditableString.suggestion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of BRLTJEditableString.tokenRanges.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of BRLTJEditableString.isEditing.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of BRLTJEditableString.isCursor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 256))(a1, a2, a3, a4, a5 & 1, a6, a7, a8 & 1, a9, a10);
}

uint64_t dispatch thunk of BRLTJEditableString.select(_:)(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v3) + 0x108))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of BRLTJEditableString.setCursor(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of BRLTJEditableString.unselect()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of BRLTJEditableString.toInsertRange.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of BRLTJEditableString.insert(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of BRLTJEditableString.toDeleteRange.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of BRLTJEditableString.delete()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of BRLTJEditableString.toForwardDeleteRange.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of BRLTJEditableString.forwardDelete()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of BRLTJEditableString.append(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of BRLTJEditableString.tokenFor(location:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of BRLTJEditableString.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of BRLTJEditableString.substringAt(range:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

id sub_2114D9054(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR____TtC18BrailleTranslation15BRLTJTranslator_translationDelegate] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id sub_2114D90A0(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR____TtC18BrailleTranslation15BRLTJTranslator_translationDelegate] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BRLTJTranslator();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for BRLTJTranslator()
{
  return objc_opt_self();
}

uint64_t sub_2114D90FC(uint64_t a1, uint64_t a2)
{
  return sub_2114D9134(a1, a2, (SEL *)&selRef_brailleForText_, 0x656C6C69617262);
}

uint64_t sub_2114D911C(uint64_t a1, uint64_t a2)
{
  return sub_2114D9134(a1, a2, (SEL *)&selRef_textForBraille_, 1954047348);
}

uint64_t sub_2114D9134(uint64_t a1, uint64_t a2, SEL *a3, uint64_t a4)
{
  uint64_t v4;
  void *v6;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  _BYTE v17[40];
  __int128 v18;
  __int128 v19;

  v6 = *(void **)(v4 + OBJC_IVAR____TtC18BrailleTranslation15BRLTJTranslator_translationDelegate);
  if (v6)
  {
    v8 = (void *)sub_2114E4F50();
    v9 = objc_msgSend(v6, *a3, v8);

    v10 = sub_2114E4F44();
  }
  else
  {
    v10 = MEMORY[0x24BEE4B00];
  }
  sub_2114E50DC();
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_2114CB820((uint64_t)v17), (v12 & 1) != 0))
  {
    sub_2114CBBF0(*(_QWORD *)(v10 + 56) + 32 * v11, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_2114CB850((uint64_t)v17);
  if (!*((_QWORD *)&v19 + 1))
  {
    sub_2114C9690((uint64_t)&v18);
    goto LABEL_12;
  }
  if (!swift_dynamicCast())
  {
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  v13 = a4;
LABEL_13:
  sub_2114E50DC();
  if (*(_QWORD *)(v10 + 16) && (v14 = sub_2114CB820((uint64_t)v17), (v15 & 1) != 0))
  {
    sub_2114CBBF0(*(_QWORD *)(v10 + 56) + 32 * v14, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2114CB850((uint64_t)v17);
  if (*((_QWORD *)&v19 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3698);
    swift_dynamicCast();
  }
  else
  {
    sub_2114C9690((uint64_t)&v18);
  }
  return v13;
}

void BRLTJTranslator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BRLTJTranslator.__deallocating_deinit()
{
  return sub_2114D9EB8(type metadata accessor for BRLTJTranslator);
}

uint64_t sub_2114D93B8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D9BCC(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_source);
}

uint64_t sub_2114D93C4()
{
  return sub_2114D9C3C(&OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_source);
}

uint64_t sub_2114D93D0(uint64_t a1, uint64_t a2)
{
  return sub_2114D9C98(a1, a2, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_source);
}

uint64_t sub_2114D93E0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D9BCC(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target);
}

uint64_t sub_2114D93EC()
{
  return sub_2114D9C3C(&OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target);
}

uint64_t sub_2114D93F8(uint64_t a1, uint64_t a2)
{
  return sub_2114D9C98(a1, a2, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target);
}

id sub_2114D9404(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_2114DA000(a1, a2, a3);

  return v8;
}

id sub_2114D9458(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = sub_2114DA000(a1, a2, a3);

  return v4;
}

uint64_t sub_2114D9484(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  if (a1 < 0)
    return 0;
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x80))();
  v4 = sub_2114E4F98();
  v5 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))((*v3 & *v1) + 0x68))(v5);
  if (v4 <= a1)
  {
    v9 = sub_2114E4F98();
    swift_bridgeObjectRelease();
    return v9;
  }
  v6 = (void *)sub_2114E4F50();
  result = swift_bridgeObjectRelease();
  v8 = *(_QWORD *)((char *)v1
                 + OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_unicharLocations);
  if (*(_QWORD *)(v8 + 16) > (unint64_t)a1)
  {
    v9 = BRLTJIndexForUnicharIndex(v6, *(_QWORD *)(v8 + 8 * a1 + 32));

    return v9;
  }
  __break(1u);
  return result;
}

void BRLTJBrailleForTextTranslationResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BRLTJBrailleForTextTranslationResult.__deallocating_deinit()
{
  return sub_2114D9EB8(type metadata accessor for BRLTJBrailleForTextTranslationResult);
}

uint64_t sub_2114D95E8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

void sub_2114D9628(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2114D96D0(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_script);
}

id sub_2114D9634()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_script);
  swift_beginAccess();
  return *v1;
}

void sub_2114D9678(void *a1)
{
  sub_2114D977C(a1, &OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_script);
}

uint64_t sub_2114D9684@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xD0))();
  *a2 = result;
  return result;
}

void sub_2114D96C4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2114D96D0(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille);
}

void sub_2114D96D0(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v5;
  void **v6;
  void *v7;
  id v8;

  v5 = *a1;
  v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  v7 = *v6;
  *v6 = v5;
  v8 = v5;

}

id sub_2114D972C()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille);
  swift_beginAccess();
  return *v1;
}

void sub_2114D9770(void *a1)
{
  sub_2114D977C(a1, &OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille);
}

void sub_2114D977C(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

_QWORD *sub_2114D97C8(_QWORD *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_2114D9808(a1, a2);
}

_QWORD *sub_2114D9808(_QWORD *a1, void *a2)
{
  char *v2;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v9)(void);
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t (*v14)(void);
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(void);
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void **v41;
  void *v42;
  uint64_t v44;
  char v45;

  *(_QWORD *)&v2[OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_script] = a2;
  type metadata accessor for BRLTJBrailleString();
  v5 = v2;
  v6 = a2;
  v7 = sub_2114C7C74();
  *(_QWORD *)&v5[OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille] = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v7);

  v8 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v9 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v6) + 0x78);
  v10 = a1;
  v11 = v9();
  v13 = sub_2114DA000(a1, v11, v12);

  v14 = *(uint64_t (**)(void))((*v8 & *v6) + 0x90);
  v15 = v13;
  v16 = v14();
  v18 = 0;
  v19 = 0;
  v45 = v20 & 1;
  if ((v20 & 1) == 0)
  {
    v21 = v16;
    v22 = v17;
    v23 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
    v16 = BRLTJTranslationResultProtocol.targetRangeFor(sourceRange:)(v21, v22, v23, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
    v18 = v16;
    v19 = v24;
  }
  v25 = (*(uint64_t (**)(uint64_t))((*v8 & *v6) + 0xC0))(v16);
  v28 = v27 & 1;
  if ((v27 & 1) != 0)
  {
    v32 = 0;
    v34 = 0;
  }
  else
  {
    v29 = v25;
    v30 = v26;
    v31 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
    v32 = BRLTJTranslationResultProtocol.targetRangeFor(sourceRange:)(v29, v30, v31, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
    v34 = v33;
  }
  v35 = *(uint64_t (**)(void))((*v8 & *v15) + 0x80);
  v36 = v15;
  v37 = v35();
  v39 = v38;

  v44 = sub_2114C7C74();
  v40 = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(v37, v39, v18, v19, v45, 0, 0, 1, v32, v34, v28, v44);

  v41 = (void **)((char *)v36 + OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille);
  swift_beginAccess();
  v42 = *v41;
  *v41 = v40;

  return v36;
}

void sub_2114D9A80()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2114D9AAC()
{
  uint64_t v0;

}

id BRLTJBrailleForScriptTranslationResult.__deallocating_deinit()
{
  return sub_2114D9EB8(type metadata accessor for BRLTJBrailleForScriptTranslationResult);
}

uint64_t sub_2114D9B1C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x68))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2114D9B5C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D9BCC(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_source);
}

uint64_t sub_2114D9B68()
{
  return sub_2114D9C3C(&OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_source);
}

uint64_t sub_2114D9B74(uint64_t a1, uint64_t a2)
{
  return sub_2114D9C98(a1, a2, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_source);
}

uint64_t sub_2114D9B80@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x80))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2114D9BC0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2114D9BCC(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target);
}

uint64_t sub_2114D9BCC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a1;
  v5 = a1[1];
  v7 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2114D9C30()
{
  return sub_2114D9C3C(&OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target);
}

uint64_t sub_2114D9C3C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_2114D9C8C(uint64_t a1, uint64_t a2)
{
  return sub_2114D9C98(a1, a2, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target);
}

uint64_t sub_2114D9C98(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

id sub_2114D9CF0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_2114DA1EC(a1, a2, a3);

  return v8;
}

id sub_2114D9D44(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = sub_2114DA1EC(a1, a2, a3);

  return v4;
}

uint64_t sub_2114D9D70(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  if (a1 < 0)
    return 0;
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x80))();
  v4 = sub_2114E4F98();
  result = swift_bridgeObjectRelease();
  if (v4 <= a1)
  {
    (*(void (**)(uint64_t))((*v3 & *v1) + 0x68))(result);
    v7 = sub_2114E4F98();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    v6 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_locations);
    if (*(_QWORD *)(v6 + 16) <= (unint64_t)a1)
      __break(1u);
    else
      return *(_QWORD *)(v6 + 8 * a1 + 32);
  }
  return result;
}

id BRLTJTextForBrailleTranslationResult.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BRLTJTextForBrailleTranslationResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BRLTJTextForBrailleTranslationResult.__deallocating_deinit()
{
  return sub_2114D9EB8(type metadata accessor for BRLTJTextForBrailleTranslationResult);
}

id sub_2114D9EB8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_2114D9F04()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2114D9F58()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x68))();
}

uint64_t sub_2114D9F90()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x80))();
}

uint64_t sub_2114D9FC8()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0xA0))();
}

id sub_2114DA000(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t *v15;
  id result;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  objc_super v22;

  v4 = v3;
  v7 = &v4[OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_source];
  *(_QWORD *)v7 = a2;
  *((_QWORD *)v7 + 1) = a3;
  if (a1)
  {
    v8 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *a1) + 0x60);
    swift_bridgeObjectRetain();
    v9 = v4;
    v10 = v8(a2, a3);
    v12 = v11;
    v14 = v13;
    swift_bridgeObjectRelease();
    v15 = (uint64_t *)&v9[OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target];
    *v15 = v10;
    v15[1] = v12;
LABEL_3:
    *(_QWORD *)&v9[OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_unicharLocations] = v14;

    v22.receiver = v4;
    v22.super_class = (Class)type metadata accessor for BRLTJBrailleForTextTranslationResult();
    return objc_msgSendSuper2(&v22, sel_init);
  }
  v17 = &v4[OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target];
  *(_QWORD *)v17 = a2;
  *((_QWORD *)v17 + 1) = a3;
  swift_bridgeObjectRetain_n();
  v9 = v4;
  v18 = sub_2114E4F98();
  result = (id)swift_bridgeObjectRelease();
  if ((v18 & 0x8000000000000000) == 0)
  {
    if (v18)
    {
      v14 = sub_2114CB948(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v19 = 0;
      v20 = *((_QWORD *)v14 + 2);
      do
      {
        v21 = *((_QWORD *)v14 + 3);
        if (v20 >= v21 >> 1)
          v14 = sub_2114CB948((char *)(v21 > 1), v20 + 1, 1, v14);
        *((_QWORD *)v14 + 2) = v20 + 1;
        *(_QWORD *)&v14[8 * v20++ + 32] = v19++;
      }
      while (v18 != v19);
    }
    else
    {
      v14 = (char *)MEMORY[0x24BEE4AF8];
    }
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BRLTJBrailleForTextTranslationResult()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for BRLTJBrailleForScriptTranslationResult()
{
  return objc_opt_self();
}

id sub_2114DA1EC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t *v15;
  id result;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  objc_super v22;

  v4 = v3;
  v7 = &v4[OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_source];
  *(_QWORD *)v7 = a2;
  *((_QWORD *)v7 + 1) = a3;
  if (a1)
  {
    v8 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *a1) + 0x68);
    swift_bridgeObjectRetain();
    v9 = v4;
    v10 = v8(a2, a3);
    v12 = v11;
    v14 = v13;
    swift_bridgeObjectRelease();
    v15 = (uint64_t *)&v9[OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target];
    *v15 = v10;
    v15[1] = v12;
LABEL_3:
    *(_QWORD *)&v9[OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_locations] = v14;

    v22.receiver = v4;
    v22.super_class = (Class)type metadata accessor for BRLTJTextForBrailleTranslationResult();
    return objc_msgSendSuper2(&v22, sel_init);
  }
  v17 = &v4[OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target];
  *(_QWORD *)v17 = a2;
  *((_QWORD *)v17 + 1) = a3;
  swift_bridgeObjectRetain_n();
  v9 = v4;
  v18 = sub_2114E4F98();
  result = (id)swift_bridgeObjectRelease();
  if ((v18 & 0x8000000000000000) == 0)
  {
    if (v18)
    {
      v14 = sub_2114CB948(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v19 = 0;
      v20 = *((_QWORD *)v14 + 2);
      do
      {
        v21 = *((_QWORD *)v14 + 3);
        if (v20 >= v21 >> 1)
          v14 = sub_2114CB948((char *)(v21 > 1), v20 + 1, 1, v14);
        *((_QWORD *)v14 + 2) = v20 + 1;
        *(_QWORD *)&v14[8 * v20++ + 32] = v19++;
      }
      while (v18 != v19);
    }
    else
    {
      v14 = (char *)MEMORY[0x24BEE4AF8];
    }
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BRLTJTextForBrailleTranslationResult()
{
  return objc_opt_self();
}

uint64_t method lookup function for BRLTJTranslator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTJTranslator.braille(forText:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of BRLTJTranslator.text(forBraille:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t method lookup function for BRLTJBrailleForTextTranslationResult()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for BRLTJBrailleForScriptTranslationResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTJBrailleForScriptTranslationResult.script.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of BRLTJBrailleForScriptTranslationResult.braille.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t method lookup function for BRLTJTextForBrailleTranslationResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTJTextForBrailleTranslationResult.source.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of BRLTJTextForBrailleTranslationResult.target.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of BRLTJTextForBrailleTranslationResult.sourceLocation(forTargetLocation:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t sub_2114DA4CC(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return sub_2114E4EFC();
  if (__OFSUB__(a2, result))
    __break(1u);
  return result;
}

uint64_t sub_2114DA4F8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = sub_2114E4EFC();
  if (result == a1)
    return 0;
  v5 = a1;
  if (a2 + a1 >= a1)
    return v5;
  __break(1u);
  return result;
}

uint64_t sub_2114DA550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2114DA57C(a1, a2, a3, BRLTJIndexForUnicharIndex);
}

uint64_t sub_2114DA55C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_2114DA5D4(a1, a2, a3, a4, a5, BRLTJIndexForUnicharIndex, "Unichar Range %s -> Char Range %s");
}

uint64_t sub_2114DA570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2114DA57C(a1, a2, a3, (uint64_t (*)(void *, uint64_t))BRLTJUnicharIndexForIndex);
}

uint64_t sub_2114DA57C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t))
{
  void *v6;
  uint64_t v7;

  v6 = (void *)sub_2114E4F50();
  v7 = a4(v6, a3);

  return v7;
}

uint64_t sub_2114DA5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_2114DA5D4(a1, a2, a3, a4, a5, (uint64_t (*)(void *, uint64_t))BRLTJUnicharIndexForIndex, "Char Range %s -> Unichar Range %s");
}

uint64_t sub_2114DA5D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t (*a6)(void *, uint64_t), const char *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  os_log_t v21;
  int v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  int v27;
  os_log_t v28;
  const char *v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v12 = sub_2114E4F38();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a5 & 1) != 0)
    return a3;
  v29 = a7;
  v30 = a5;
  v16 = (void *)sub_2114E4F50();
  v17 = a6(v16, a3);

  v18 = (void *)sub_2114E4F50();
  v19 = a6(v18, a4);

  v20 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v20, v12);
  v21 = (os_log_t)sub_2114E4F20();
  v22 = sub_2114E5064();
  if (!os_log_type_enabled(v21, (os_log_type_t)v22))
  {
LABEL_5:

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    if (v19 >= v17)
      return v17;
    __break(1u);
    return a3;
  }
  v27 = v22;
  v28 = v21;
  v23 = swift_slowAlloc();
  v26 = swift_slowAlloc();
  v34 = a3;
  v35 = v26;
  *(_DWORD *)v23 = 136315394;
  v31 = 0;
  v32 = 0xE000000000000000;
  v33 = a4;
  sub_2114E5124();
  sub_2114E4FD4();
  sub_2114E5124();
  v31 = sub_2114D48F8(v31, v32, &v35);
  sub_2114E5094();
  result = swift_bridgeObjectRelease();
  *(_WORD *)(v23 + 12) = 2080;
  if (v19 >= v17)
  {
    v33 = v19;
    v34 = v17;
    v31 = 0;
    v32 = 0xE000000000000000;
    sub_2114E5124();
    sub_2114E4FD4();
    sub_2114E5124();
    v31 = sub_2114D48F8(v31, v32, &v35);
    sub_2114E5094();
    swift_bridgeObjectRelease();
    v21 = v28;
    _os_log_impl(&dword_2114B8000, v28, (os_log_type_t)v27, v29, (uint8_t *)v23, 0x16u);
    a3 = v26;
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](a3, -1, -1);
    MEMORY[0x212BDB5C4](v23, -1, -1);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_2114DA918()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_2114DA948(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_2114DA984()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2114DA9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2114DAA1C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 40);
}

uint64_t sub_2114DAA4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t sub_2114DAA88(char a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_allocObject();
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = 0xE000000000000000;
  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 56) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 64) = v3;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_BYTE *)(result + 16) = 0;
  *(_BYTE *)(result + 72) = a1;
  return result;
}

uint64_t sub_2114DAAD4(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 32) = 0xE000000000000000;
  v2 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 40) = 0;
  *(_QWORD *)(v1 + 48) = 0;
  *(_BYTE *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 72) = a1;
  return v1;
}

void *sub_2114DAAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  char **v7;
  uint64_t v8;
  char **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *result;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  char v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;

  swift_beginAccess();
  *(_BYTE *)(v2 + 16) = 1;
  v5 = objc_msgSend(objc_allocWithZone((Class)BRLTJMecabraWrapper), sel_initWithUnitTesting_, *(unsigned __int8 *)(v2 + 72));
  v6 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = v5;

  v7 = (char **)(v2 + 56);
  swift_beginAccess();
  v8 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v9 = (char **)(v2 + 64);
  swift_beginAccess();
  *(_QWORD *)(v2 + 64) = v8;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v2 + 40) = 0;
  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (sub_2114E4F98() < 33)
  {
    result = (void *)swift_bridgeObjectRetain();
  }
  else
  {
    sub_2114E4FBC();
    swift_bridgeObjectRetain();
    v10 = sub_2114E5004();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    swift_bridgeObjectRelease();
    MEMORY[0x212BDAD78](v10, v12, v14, v16);
    result = (void *)swift_bridgeObjectRelease();
  }
  v18 = *(void **)(v2 + 48);
  if (!v18)
  {
    __break(1u);
    goto LABEL_29;
  }
  v19 = v18;
  v20 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_analyzeString_, v20);

  result = *(void **)(v2 + 48);
  if (!result)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (!objc_msgSend(result, sel_moveToNextCandidate))
  {
    swift_beginAccess();
    v39 = *v7;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v39;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v39 = sub_2114CA2A4(0, *((_QWORD *)v39 + 2) + 1, 1, v39);
      *v7 = v39;
    }
    v42 = *((_QWORD *)v39 + 2);
    v41 = *((_QWORD *)v39 + 3);
    if (v42 >= v41 >> 1)
    {
      v39 = sub_2114CA2A4((char *)(v41 > 1), v42 + 1, 1, v39);
      *v7 = v39;
    }
    *((_QWORD *)v39 + 2) = v42 + 1;
    v43 = &v39[16 * v42];
    *((_QWORD *)v43 + 4) = 0;
    *((_QWORD *)v43 + 5) = 0xE000000000000000;
    swift_endAccess();
    swift_beginAccess();
    v44 = *v9;
    swift_bridgeObjectRetain();
    v45 = swift_isUniquelyReferenced_nonNull_native();
    *v9 = v44;
    if ((v45 & 1) == 0)
    {
      v44 = sub_2114CA2A4(0, *((_QWORD *)v44 + 2) + 1, 1, v44);
      *v9 = v44;
    }
    v47 = *((_QWORD *)v44 + 2);
    v46 = *((_QWORD *)v44 + 3);
    if (v47 >= v46 >> 1)
    {
      v44 = sub_2114CA2A4((char *)(v46 > 1), v47 + 1, 1, v44);
      *v9 = v44;
    }
    *((_QWORD *)v44 + 2) = v47 + 1;
    v48 = &v44[16 * v47];
    *((_QWORD *)v48 + 4) = a1;
    *((_QWORD *)v48 + 5) = a2;
    return (void *)swift_endAccess();
  }
  result = *(void **)(v2 + 48);
  if (!result)
    goto LABEL_30;
  v21 = objc_msgSend(result, sel_getCurrentCandidateSurface);
  v22 = sub_2114E4F5C();
  v24 = v23;

  swift_beginAccess();
  v25 = *v7;
  v26 = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v25;
  if ((v26 & 1) == 0)
  {
    v25 = sub_2114CA2A4(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
    *v7 = v25;
  }
  v28 = *((_QWORD *)v25 + 2);
  v27 = *((_QWORD *)v25 + 3);
  if (v28 >= v27 >> 1)
  {
    v25 = sub_2114CA2A4((char *)(v27 > 1), v28 + 1, 1, v25);
    *v7 = v25;
  }
  *((_QWORD *)v25 + 2) = v28 + 1;
  v29 = &v25[16 * v28];
  *((_QWORD *)v29 + 4) = v22;
  *((_QWORD *)v29 + 5) = v24;
  swift_endAccess();
  result = *(void **)(v2 + 48);
  if (result)
  {
    v30 = objc_msgSend(result, sel_getCurrentCandidateAnalysisString);
    v31 = sub_2114E4F5C();
    v33 = v32;

    swift_beginAccess();
    v34 = *v9;
    v35 = swift_isUniquelyReferenced_nonNull_native();
    *v9 = v34;
    if ((v35 & 1) == 0)
    {
      v34 = sub_2114CA2A4(0, *((_QWORD *)v34 + 2) + 1, 1, v34);
      *v9 = v34;
    }
    v37 = *((_QWORD *)v34 + 2);
    v36 = *((_QWORD *)v34 + 3);
    if (v37 >= v36 >> 1)
    {
      v34 = sub_2114CA2A4((char *)(v36 > 1), v37 + 1, 1, v34);
      *v9 = v34;
    }
    *((_QWORD *)v34 + 2) = v37 + 1;
    v38 = &v34[16 * v37];
    *((_QWORD *)v38 + 4) = v31;
    *((_QWORD *)v38 + 5) = v33;
    return (void *)swift_endAccess();
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_2114DAFDC()
{
  uint64_t v0;
  void *v1;

  swift_beginAccess();
  *(_BYTE *)(v0 + 16) = 0;
  v1 = *(void **)(v0 + 48);
  *(_QWORD *)(v0 + 48) = 0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0xE000000000000000;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2114DB03C()
{
  char **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char **v7;
  char *v8;
  uint64_t result;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char **v24;
  char *v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;

  v1 = sub_2114E4F38();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (*((uint64_t (**)(uint64_t))*v0 + 23))(v3);
  v7 = v0 + 7;
  swift_beginAccess();
  if (v6 != *((_QWORD *)v0[7] + 2) - 1)
    return 1;
  v8 = v0[6];
  if (v8 && objc_msgSend(v8, sel_moveToNextCandidate))
  {
    result = (uint64_t)v0[6];
    if (result)
    {
      v10 = objc_msgSend((id)result, sel_getCurrentCandidateSurface);
      v11 = sub_2114E4F5C();
      v13 = v12;

      swift_beginAccess();
      v14 = *v7;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v7 = v14;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v14 = sub_2114CA2A4(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
        *v7 = v14;
      }
      v17 = *((_QWORD *)v14 + 2);
      v16 = *((_QWORD *)v14 + 3);
      v18 = v17 + 1;
      if (v17 >= v16 >> 1)
      {
        v36 = v17 + 1;
        v34 = sub_2114CA2A4((char *)(v16 > 1), v17 + 1, 1, v14);
        v18 = v36;
        v14 = v34;
        *v7 = v34;
      }
      *((_QWORD *)v14 + 2) = v18;
      v19 = &v14[16 * v17];
      *((_QWORD *)v19 + 4) = v11;
      *((_QWORD *)v19 + 5) = v13;
      swift_endAccess();
      result = (uint64_t)v0[6];
      if (result)
      {
        v20 = objc_msgSend((id)result, sel_getCurrentCandidateAnalysisString);
        v21 = sub_2114E4F5C();
        v23 = v22;

        v24 = v0 + 8;
        swift_beginAccess();
        v25 = v0[8];
        v26 = swift_isUniquelyReferenced_nonNull_native();
        v0[8] = v25;
        if ((v26 & 1) == 0)
        {
          v25 = sub_2114CA2A4(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
          *v24 = v25;
        }
        v28 = *((_QWORD *)v25 + 2);
        v27 = *((_QWORD *)v25 + 3);
        if (v28 >= v27 >> 1)
        {
          v25 = sub_2114CA2A4((char *)(v27 > 1), v28 + 1, 1, v25);
          *v24 = v25;
        }
        *((_QWORD *)v25 + 2) = v28 + 1;
        v29 = &v25[16 * v28];
        *((_QWORD *)v29 + 4) = v21;
        *((_QWORD *)v29 + 5) = v23;
        swift_endAccess();
        return 1;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    v30 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v30, v1);
    v31 = sub_2114E4F20();
    v32 = sub_2114E5064();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_2114B8000, v31, v32, "Candidate Manager: no more candidates", v33, 2u);
      MEMORY[0x212BDB5C4](v33, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  return result;
}

uint64_t sub_2114DB34C()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(*v0 + 328))();
  if ((result & 1) != 0)
  {
    result = swift_beginAccess();
    v2 = v0[5];
    v3 = __OFADD__(v2, 1);
    v4 = v2 + 1;
    if (v3)
      __break(1u);
    else
      v0[5] = v4;
  }
  return result;
}

BOOL sub_2114DB3A8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))() > 0;
}

uint64_t sub_2114DB3CC()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(*v0 + 344))();
  if ((result & 1) != 0)
  {
    result = swift_beginAccess();
    v2 = v0[5];
    v3 = __OFSUB__(v2, 1);
    v4 = v2 - 1;
    if (v3)
      __break(1u);
    else
      v0[5] = v4;
  }
  return result;
}

uint64_t sub_2114DB428()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  (*(void (**)(void))(*(_QWORD *)v0 + 376))();
  v2 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_2114E4F50();
  v4 = objc_msgSend(v1, sel_descriptionOfWord_forLanguage_, v2, v3);

  if (!v4)
    return 0;
  v5 = sub_2114E4F5C();

  return v5;
}

uint64_t sub_2114DB500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = sub_2114E4F38();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(objc_allocWithZone((Class)BRLTJJapaneseProcessor), sel_init);
  (*(void (**)(void))(*(_QWORD *)v0 + 360))();
  v6 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_spacedYomiOfWordDescription_, v6);

  v8 = sub_2114E4F5C();
  v10 = v9;

  v11 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v11, v1);
  swift_bridgeObjectRetain_n();
  v12 = sub_2114E4F20();
  v13 = sub_2114E5064();
  if (os_log_type_enabled(v12, v13))
  {
    v20 = v1;
    v14 = swift_slowAlloc();
    v19 = v5;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v22 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    v21 = sub_2114D48F8(v8, v10, &v22);
    sub_2114E5094();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2114B8000, v12, v13, "Candidate Manager: current description = '%s'", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v16, -1, -1);
    MEMORY[0x212BDB5C4](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v8;
}

uint64_t sub_2114DB778()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = sub_2114E4F38();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (*(uint64_t (**)(uint64_t))(*v0 + 184))(v3);
  result = swift_beginAccess();
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v8 = v0[7];
  if (v6 >= *(_QWORD *)(v8 + 16))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v9 = v8 + 16 * v6;
  v10 = *(_QWORD *)(v9 + 32);
  v11 = *(_QWORD *)(v9 + 40);
  swift_bridgeObjectRetain();
  v12 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v12, v1);
  swift_bridgeObjectRetain_n();
  v13 = sub_2114E4F20();
  v14 = sub_2114E5064();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v19 = v1;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v21 = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    v20 = sub_2114D48F8(v10, v11, &v21);
    sub_2114E5094();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2114B8000, v13, v14, "Candidate Manager: current candidate = '%s'", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v17, -1, -1);
    MEMORY[0x212BDB5C4](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v19);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return v10;
}

void sub_2114DB9B4()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(void);
  id v3;
  id v4;

  v1 = (void *)v0[6];
  if (v1)
  {
    v2 = *(void (**)(void))(*v0 + 376);
    v3 = v1;
    v2();
    v4 = (id)sub_2114E4F50();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_learnCandidate_, v4);

  }
}

uint64_t sub_2114DBA3C()
{
  _QWORD *v0;
  void (*v1)(void);
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(void (**)(void))(*v0 + 160);
  v1();
  v1();
  v2 = swift_bridgeObjectRelease();
  v3 = (*(uint64_t (**)(uint64_t))(*v0 + 184))(v2);
  result = swift_beginAccess();
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(_QWORD *)(v0[8] + 16))
  {
    swift_bridgeObjectRetain();
    sub_2114E4F98();
    swift_bridgeObjectRelease();
    v5 = sub_2114E4FBC();
    v6 = swift_bridgeObjectRelease();
    v7 = ((uint64_t (*)(uint64_t))v1)(v6);
    v9 = sub_2114C8CF8(v5, v7, v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    swift_bridgeObjectRelease();
    v16 = MEMORY[0x212BDAD78](v9, v11, v13, v15);
    swift_bridgeObjectRelease();
    return v16;
  }
  __break(1u);
  return result;
}

uint64_t sub_2114DBB74()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2114DBBA8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BRLTCandidateManager()
{
  return objc_opt_self();
}

uint64_t sub_2114DBC04(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2114E5148();
  __break(1u);
  return result;
}

uint64_t sub_2114DBCF4@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x150))();
  *a2 = result;
  return result;
}

uint64_t sub_2114DBD34(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & **a2) + 0x158);
  v4 = *a1;
  return v3(v2);
}

void *sub_2114DBD80()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_translator);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_2114DBDCC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_translator);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_2114DBE1C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_2114DBE60()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  objc_super v23;

  v1 = v0;
  v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier;
  *(_QWORD *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier] = 0;
  v3 = (id *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_translator];
  *(_QWORD *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_translator] = 0;
  v4 = &v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateSelectionLanguage];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache;
  *(_QWORD *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_outputMode] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_inputMode] = 1;
  type metadata accessor for BRLTJEditableString();
  v6 = v0;
  v7 = sub_2114C7C74();
  v8 = BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v7);
  v9 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  *(_QWORD *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_script] = v8;
  type metadata accessor for BRLTJBrailleString();
  v10 = sub_2114C7C74();
  *(_QWORD *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille] = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v10);
  *(_QWORD *)&v0[v2] = 0;
  swift_release();
  type metadata accessor for BRLTJBrailleForScriptTranslationResult();
  swift_beginAccess();
  v11 = *v3;
  v12 = *(void **)&v6[v9];
  v13 = *v3;
  *(_QWORD *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult] = sub_2114D97C8(v11, v12);
  v14 = type metadata accessor for BRLTJCandidateManager();
  v15 = BRLTJCandidateManager.__allocating_init()();
  v16 = &v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateManager];
  *((_QWORD *)v16 + 3) = v14;
  *((_QWORD *)v16 + 4) = &protocol witness table for BRLTJCandidateManager;
  *(_QWORD *)v16 = v15;
  v17 = *(void **)&v1[v5];
  *(_QWORD *)&v1[v5] = 0;

  v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive] = 0;
  type metadata accessor for BRLTJWordDescriptionManager();
  *(_QWORD *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager] = sub_2114D56E0();
  v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert] = 0;
  v18 = sub_2114C7C74();
  *(_QWORD *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript] = BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v18);
  v19 = sub_2114C7C74();
  *(_QWORD *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille] = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v19);
  type metadata accessor for BRLTJTextForBrailleTranslationResult();
  v20 = *v3;
  v21 = v20;
  *(_QWORD *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_stageScriptForStageResult] = sub_2114D9CF0(v20, 0, 0xE000000000000000);
  v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput] = 0;

  v23.receiver = v6;
  v23.super_class = (Class)type metadata accessor for BRLTJBrailleStateManager();
  return objc_msgSendSuper2(&v23, sel_init);
}

id static BRLTJBrailleStateManager.manager.getter()
{
  id result;
  id v1;
  void *v2;

  result = (id)qword_254AB3AC0;
  if (qword_254AB3AC0)
    return result;
  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BRLTJBrailleStateManager()), sel_init);
  v2 = (void *)qword_254AB3AC0;
  qword_254AB3AC0 = (uint64_t)v1;

  result = (id)qword_254AB3AC0;
  if (qword_254AB3AC0)
    return result;
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BRLTJBrailleStateManager()
{
  return objc_opt_self();
}

uint64_t sub_2114DC250()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v5)(void);
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v8)(void);
  _QWORD *v9;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))() & 1) != 0)
    return 1;
  v4 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  v5 = *(uint64_t (**)(void))((*v2 & *v4) + 0xF0);
  v6 = v4;
  LOBYTE(v5) = v5();

  if ((v5 & 1) == 0)
    return 0;
  v7 = *(_QWORD **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
  v8 = *(uint64_t (**)(void))((*v2 & *v7) + 0xF0);
  v9 = v7;
  LOBYTE(v8) = v8();

  return v8 & 1;
}

void sub_2114DC30C(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t (*v22)(void);
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  NSObject *v38;

  v2 = v1;
  v4 = sub_2114E4F38();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v34 - v10;
  v12 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x288))(v9) & 1) != 0)
  {
    v13 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v13, v4);
    v14 = a1;
    v15 = sub_2114E4F20();
    v16 = sub_2114E5058();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v37 = v2;
      v38 = v14;
      v35 = (_QWORD *)v18;
      v36 = v4;
      *(_DWORD *)v17 = 138412290;
      v19 = v14;
      v4 = v36;
      sub_2114E5094();
      v20 = v35;
      *v35 = v14;

      _os_log_impl(&dword_2114B8000, v15, v16, "Set alert: \"%@\"", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254AB38D8);
      swift_arrayDestroy();
      MEMORY[0x212BDB5C4](v20, -1, -1);
      MEMORY[0x212BDB5C4](v17, -1, -1);
    }
    else
    {

      v15 = v14;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    sub_2114E04B4(v14);
  }
  else
  {
    v21 = *(_QWORD **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
    v22 = *(uint64_t (**)(void))((*v12 & *v21) + 0x190);
    v23 = v21;
    LOBYTE(v22) = v22();

    if ((v22 & 1) != 0 && ((*(uint64_t (**)(void))((*v12 & *v2) + 0x220))() & 1) == 0)
    {
      v24 = sub_2114D5FC8();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v24, v4);
      v25 = a1;
      v26 = sub_2114E4F20();
      v27 = sub_2114E5058();
      if (os_log_type_enabled(v26, v27))
      {
        v37 = v2;
        v28 = (uint8_t *)swift_slowAlloc();
        v35 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v28 = 138412290;
        v38 = v25;
        v29 = v25;
        v36 = v5;
        v30 = v29;
        v2 = v37;
        sub_2114E5094();
        v31 = v35;
        *v35 = v25;

        v5 = v36;
        _os_log_impl(&dword_2114B8000, v26, v27, "Set script: \"%@\"", v28, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254AB38D8);
        swift_arrayDestroy();
        MEMORY[0x212BDB5C4](v31, -1, -1);
        MEMORY[0x212BDB5C4](v28, -1, -1);
      }
      else
      {

        v26 = v25;
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      v32 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
      *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script) = v25;
      v33 = v25;

      sub_2114E1C7C();
    }
  }
}

void sub_2114DC76C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t (*v54)(void);
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  int v62;
  _QWORD *v63;
  uint64_t (*v64)(void);
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t (*v70)(void);
  _QWORD *v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  unint64_t v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void (*v83)(void);
  id v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t (*v93)(void);
  _QWORD *v94;
  _QWORD *v95;
  uint64_t (*v96)(void);
  _QWORD *v97;
  uint64_t v98;
  char *v99;
  NSObject *v100;
  os_log_type_t v101;
  uint8_t *v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  NSObject *v110;
  os_log_type_t v111;
  uint8_t *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  NSObject *v116;
  os_log_type_t v117;
  uint8_t *v118;
  unsigned int v119;
  uint64_t v120;
  char *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD v128[3];
  uint64_t v129;
  uint64_t v130;

  v2 = v1;
  v126 = a1;
  v3 = sub_2114E4F38();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v123 = (char *)&v120 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v121 = (char *)&v120 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v122 = (char *)&v120 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v120 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v120 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v120 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v120 - v24;
  v26 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x2F0))(v23) & 1) != 0)
  {
    sub_2114E13E0();
    return;
  }
  v124 = v3;
  v125 = v4;
  (*(void (**)(_QWORD *__return_ptr))((*v26 & *v1) + 0x208))(v128);
  v27 = v129;
  v28 = v130;
  __swift_project_boxed_opaque_existential_0(v128, v129);
  v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 16))(v27, v28);
  v30 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v128);
  if ((v29 & 1) != 0)
  {
    v31 = v124;
    if (!v126 || v126 == 8)
    {
      v85 = sub_2114D5FC8();
      swift_beginAccess();
      v86 = v125;
      (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v22, v85, v31);
      v87 = sub_2114E4F20();
      v88 = sub_2114E5058();
      if (os_log_type_enabled(v87, v88))
      {
        v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v89 = 0;
        _os_log_impl(&dword_2114B8000, v87, v88, "Insert: candidate on; dot-4 pressed", v89, 2u);
        MEMORY[0x212BDB5C4](v89, -1, -1);
      }

      v90 = (*(uint64_t (**)(char *, uint64_t))(v86 + 8))(v22, v31);
      (*(void (**)(uint64_t))((*v26 & *v2) + 0x260))(v90);
    }
    else
    {
      v32 = v125;
      if (v126 == 1)
      {
        v33 = sub_2114D5FC8();
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v25, v33, v31);
        v34 = sub_2114E4F20();
        v35 = sub_2114E5058();
        if (os_log_type_enabled(v34, v35))
        {
          v36 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_2114B8000, v34, v35, "Insert: candidate on; dot-1 pressed", v36, 2u);
          MEMORY[0x212BDB5C4](v36, -1, -1);
        }

        v37 = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v25, v31);
        (*(void (**)(uint64_t))((*v26 & *v2) + 0x268))(v37);
      }
      else
      {
        v103 = sub_2114D5FC8();
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v19, v103, v31);
        v104 = sub_2114E4F20();
        v105 = sub_2114E5058();
        if (os_log_type_enabled(v104, v105))
        {
          v106 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v106 = 0;
          _os_log_impl(&dword_2114B8000, v104, v105, "Insert: candidate on; invalid input", v106, 2u);
          MEMORY[0x212BDB5C4](v106, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v31);
      }
    }
    return;
  }
  v38 = (*(uint64_t (**)(uint64_t))((*v26 & *v2) + 0x180))(v30);
  v39 = v124;
  if ((v38 & 1) == 0)
  {
    v40 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v16, v40, v39);
    v41 = sub_2114E4F20();
    v42 = sub_2114E5058();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_2114B8000, v41, v42, "Insert: not editing - created empty script/braille", v43, 2u);
      MEMORY[0x212BDB5C4](v43, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v125 + 8))(v16, v39);
    type metadata accessor for BRLTJEditableString();
    v44 = BRLTJEditableString.__allocating_init(string:cursor:focus:)(0, 0xE000000000000000, 0, 0, 0, 1);
    v45 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script) = v44;

    type metadata accessor for BRLTJBrailleString();
    v46 = BRLTJEditableString.__allocating_init(string:cursor:focus:)(0, 0xE000000000000000, 0, 0, 0, 1);
    v47 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
    *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille) = v46;

  }
  if (v126)
    goto LABEL_15;
  v91 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  v92 = *(_QWORD **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  v93 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v92) + 0x190);
  v94 = v92;
  LOBYTE(v93) = v93();

  if ((v93 & 1) != 0 || (sub_2114E1A84() & 1) != 0)
  {
    v95 = *(_QWORD **)((char *)v2 + v91);
    v96 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v95) + 0x190);
    v97 = v95;
    LOBYTE(v96) = v96();

    if ((v96 & 1) != 0)
    {
      v98 = sub_2114D5FC8();
      swift_beginAccess();
      v99 = v123;
      (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v123, v98, v39);
      v100 = sub_2114E4F20();
      v101 = sub_2114E5058();
      if (os_log_type_enabled(v100, v101))
      {
        v102 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v102 = 0;
        _os_log_impl(&dword_2114B8000, v100, v101, "Insert: space while stage empty", v102, 2u);
        MEMORY[0x212BDB5C4](v102, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v125 + 8))(v99, v39);
      sub_2114DDFF4();
      goto LABEL_31;
    }
LABEL_15:
    v48 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v7, v48, v39);
    v49 = sub_2114E4F20();
    v50 = sub_2114E5058();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v51 = 134217984;
      v39 = v124;
      v127 = v126;
      sub_2114E5094();
      _os_log_impl(&dword_2114B8000, v49, v50, "Insert: braille char %ld", v51, 0xCu);
      MEMORY[0x212BDB5C4](v51, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v125 + 8))(v7, v39);
    v52 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
    v53 = *(_QWORD **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    v54 = *(uint64_t (**)(void))((*v26 & *v53) + 0x90);
    v55 = v53;
    v56 = v54();
    v58 = v57;
    v60 = v59;

    if ((v60 & 1) == 0 && v56 != v58)
    {
      v63 = *(_QWORD **)((char *)v2 + v52);
      v64 = *(uint64_t (**)(void))((*v26 & *v63) + 0x78);
      v65 = v63;
      v66 = v64();
      v68 = v67;

      v69 = *(_QWORD **)((char *)v2 + v52);
      v70 = *(uint64_t (**)(void))((*v26 & *v69) + 0x138);
      v71 = v69;
      LOBYTE(v70) = v70();

      if ((v70 & 1) != 0)
      {
        v72 = *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
        if (v72)
        {
          v73 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v72 + 112);
          swift_retain();
          v73(v66, v68, v56, v58);
          swift_release();
        }
      }
      swift_bridgeObjectRelease();
    }
    v74 = 10240;
    v75 = v126 + 10240;
    if (__OFADD__(v126, 10240))
    {
      __break(1u);
    }
    else
    {
      v74 = HIDWORD(v75);
      if (!HIDWORD(v75))
      {
        v74 = v75 >> 11;
        if ((_DWORD)v74 == 27)
        {
LABEL_60:
          __break(1u);
          goto LABEL_61;
        }
        v61 = WORD1(v75);
        if (WORD1(v75) <= 0x10u)
        {
          v74 = *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
          if ((v75 & 0xFFFFFF80) == 0)
          {
            if (v75 <= 0xFF)
            {
              v76 = (v126 + 1);
LABEL_30:
              v77 = __clz(v76);
              v78 = 4 - (v77 >> 3);
              v127 = (v76 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (v77 >> 3)) & 7)));
              v79 = (id)v74;
              v80 = MEMORY[0x212BDAD90](&v127, v78);
              (*(void (**)(uint64_t))((*v26 & *v79) + 0x128))(v80);

              swift_bridgeObjectRelease();
LABEL_31:
              v81 = *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
              if (v81)
              {
                v82 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
                v83 = *(void (**)(void))(*(_QWORD *)v81 + 96);
                swift_retain();
                v84 = v82;
                v83();
                swift_release();

              }
              return;
            }
            __break(1u);
            goto LABEL_60;
          }
LABEL_57:
          v62 = (v75 & 0x3F) << 8;
          if (v75 < 0x800)
          {
            v76 = (v62 | (v75 >> 6)) + 33217;
            goto LABEL_30;
          }
LABEL_61:
          v119 = (v62 | (v75 >> 6) & 0x3F) << 8;
          if (v61)
            v76 = (((v119 | (v75 >> 12) & 0x3F) << 8) | (v75 >> 18)) - 2122219023;
          else
            v76 = (v119 | (v75 >> 12)) + 8487393;
          goto LABEL_30;
        }
LABEL_56:
        __break(1u);
        goto LABEL_57;
      }
    }
    __break(1u);
    goto LABEL_56;
  }
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x1E8))();
  if (v107)
  {
    swift_bridgeObjectRelease();
    v108 = sub_2114D5FC8();
    swift_beginAccess();
    v109 = v122;
    (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v122, v108, v39);
    v110 = sub_2114E4F20();
    v111 = sub_2114E5058();
    if (os_log_type_enabled(v110, v111))
    {
      v112 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v112 = 0;
      _os_log_impl(&dword_2114B8000, v110, v111, "Insert: candidate off; turn on candidate mode", v112, 2u);
      MEMORY[0x212BDB5C4](v112, -1, -1);
    }

    v113 = (*(uint64_t (**)(char *, uint64_t))(v125 + 8))(v109, v39);
    (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0x258))(v113);
  }
  else
  {
    v114 = sub_2114D5FC8();
    swift_beginAccess();
    v115 = v121;
    (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v121, v114, v39);
    v116 = sub_2114E4F20();
    v117 = sub_2114E5058();
    if (os_log_type_enabled(v116, v117))
    {
      v118 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v118 = 0;
      _os_log_impl(&dword_2114B8000, v116, v117, "Insert: commit stage to script", v118, 2u);
      MEMORY[0x212BDB5C4](v118, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v125 + 8))(v115, v39);
    sub_2114DE168();
    sub_2114DDFF4();
  }
}

uint64_t sub_2114DD37C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t (*v25)(void);
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t (*v33)(void);
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t (*v39)(void);
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  _QWORD *v46;
  uint64_t (*v47)(void);
  _QWORD *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v51;
  NSObject *v52;
  os_log_type_t v53;
  int v54;
  uint64_t v55;
  uint8_t *v56;
  _QWORD *v57;
  uint64_t (*v58)(void);
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  os_log_t v66;
  uint8_t *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t (*v70)(void);
  _QWORD *v71;
  uint64_t v72;
  void *v73;
  void (*v74)(void);
  id v75;
  uint64_t v77;
  _QWORD *v78;
  uint8_t *v79;
  uint8_t *v80;
  int v81;
  uint64_t v82;
  os_log_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD v86[3];
  uint64_t v87;
  uint64_t v88;

  v1 = v0;
  v2 = sub_2114E4F38();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v77 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v77 - v11;
  v13 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))(v10) & 1) != 0)
  {
    (*(void (**)(_QWORD *__return_ptr))((*v13 & *v0) + 0x208))(v86);
    v14 = v87;
    v15 = v88;
    __swift_project_boxed_opaque_existential_0(v86, v87);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
    v17 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v86);
    if ((v16 & 1) != 0)
    {
      sub_2114DFAA4();
      v18 = 1;
    }
    else if (((*(uint64_t (**)(uint64_t))((*v13 & *v1) + 0x2F0))(v17) & 1) != 0)
    {
      sub_2114E13E0();
      v18 = 1;
    }
    else
    {
      v23 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
      v24 = *(_QWORD **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
      v25 = *(uint64_t (**)(void))((*v13 & *v24) + 0x190);
      v26 = v24;
      LOBYTE(v25) = v25();

      v27 = sub_2114D5FC8();
      if ((v25 & 1) != 0)
      {
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v27, v2);
        v28 = sub_2114E4F20();
        v29 = sub_2114E5058();
        if (os_log_type_enabled(v28, v29))
        {
          v30 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_2114B8000, v28, v29, "Delete: stage empty", v30, 2u);
          MEMORY[0x212BDB5C4](v30, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
        v31 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
        v32 = *(_QWORD **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
        v33 = *(uint64_t (**)(void))((*v13 & *v32) + 0x78);
        v34 = v32;
        v35 = v33();
        v37 = v36;

        v38 = *(_QWORD **)((char *)v1 + v31);
        v39 = *(uint64_t (**)(void))((*v13 & *v38) + 0x130);
        v40 = v38;
        v41 = v39();
        v43 = v42;
        v45 = v44;

        v46 = *(_QWORD **)((char *)v1 + v31);
        v47 = *(uint64_t (**)(void))((*v13 & *v46) + 0x138);
        v48 = v46;
        v18 = v47();

        if ((v45 & 1) == 0)
        {
          v49 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
          if (v49)
          {
            v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v49 + 112);
            swift_retain();
            v50(v35, v37, v41, v43);
            swift_release();
          }
        }
        swift_bridgeObjectRelease();
        sub_2114E1C7C();
      }
      else
      {
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v27, v2);
        v51 = v1;
        v52 = sub_2114E4F20();
        v53 = sub_2114E5058();
        v54 = v53;
        if (os_log_type_enabled(v52, v53))
        {
          v83 = v52;
          v55 = swift_slowAlloc();
          v81 = v54;
          v56 = (uint8_t *)v55;
          v82 = swift_slowAlloc();
          v85 = v82;
          *(_DWORD *)v56 = 136315138;
          v79 = v56 + 4;
          v80 = v56;
          v57 = *(_QWORD **)((char *)v1 + v23);
          v58 = *(uint64_t (**)(void))((*v13 & *v57) + 0x198);
          v59 = v57;
          v60 = v58();
          v78 = v51;
          v61 = v23;
          v62 = v60;
          v64 = v63;

          v65 = v62;
          v23 = v61;
          v51 = v78;
          v84 = sub_2114D48F8(v65, v64, &v85);
          sub_2114E5094();

          swift_bridgeObjectRelease();
          v66 = v83;
          v67 = v80;
          _os_log_impl(&dword_2114B8000, v83, (os_log_type_t)v81, "Delete: stage nonempty: %s", v80, 0xCu);
          v68 = v82;
          swift_arrayDestroy();
          MEMORY[0x212BDB5C4](v68, -1, -1);
          MEMORY[0x212BDB5C4](v67, -1, -1);

        }
        else
        {

        }
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        v69 = *(_QWORD **)((char *)v1 + v23);
        v70 = *(uint64_t (**)(void))((*v13 & *v69) + 0x138);
        v71 = v69;
        v18 = v70();

        v72 = *(_QWORD *)((char *)v51 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
        if (v72)
        {
          v73 = *(void **)((char *)v1 + v23);
          v74 = *(void (**)(void))(*(_QWORD *)v72 + 96);
          swift_retain();
          v75 = v73;
          v74();
          swift_release();

        }
      }
    }
  }
  else
  {
    v19 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v19, v2);
    v20 = sub_2114E4F20();
    v21 = sub_2114E5058();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_2114B8000, v20, v21, "Delete: ignored (not editing)", v22, 2u);
      MEMORY[0x212BDB5C4](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_2114DD97C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  char v15;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t (*v23)(void);
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t (*v29)(void);
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  _QWORD *v36;
  uint64_t (*v37)(void);
  _QWORD *v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;

  v1 = v0;
  v2 = sub_2114E4F38();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v41 - v8;
  v10 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))(v7) & 1) == 0
    || ((*(uint64_t (**)(void))((*v10 & *v0) + 0x220))() & 1) != 0
    || ((*(uint64_t (**)(void))((*v10 & *v0) + 0x2F0))() & 1) != 0)
  {
    sub_2114E13E0();
    v11 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v11, v2);
    v12 = sub_2114E4F20();
    v13 = sub_2114E5058();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2114B8000, v12, v13, "Forward delete: ignored (not editing or candidate on or word description on)", v14, 2u);
      MEMORY[0x212BDB5C4](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v15 = 0;
  }
  else
  {
    v17 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v17, v2);
    v18 = sub_2114E4F20();
    v19 = sub_2114E5058();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_2114B8000, v18, v19, "Forward delete: executed", v20, 2u);
      MEMORY[0x212BDB5C4](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    v21 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
    v22 = *(_QWORD **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    v23 = *(uint64_t (**)(void))((*v10 & *v22) + 0x78);
    v24 = v22;
    v25 = v23();
    v27 = v26;

    v28 = *(_QWORD **)((char *)v1 + v21);
    v29 = *(uint64_t (**)(void))((*v10 & *v28) + 0x140);
    v30 = v28;
    v31 = v29();
    v33 = v32;
    v35 = v34;

    v36 = *(_QWORD **)((char *)v1 + v21);
    v37 = *(uint64_t (**)(void))((*v10 & *v36) + 0x148);
    v38 = v36;
    v15 = v37();

    if ((v35 & 1) == 0)
    {
      v39 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
      if (v39)
      {
        v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v39 + 112);
        swift_retain();
        v40(v25, v27, v31, v33);
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    sub_2114E1C7C();
  }
  return v15 & 1;
}

void sub_2114DDCE4()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v3)(void);
  _QWORD *v4;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))() & 1) != 0)
  {
    sub_2114DFAA4();
  }
  else if (((*(uint64_t (**)(void))((*v1 & *v0) + 0x2F0))() & 1) != 0)
  {
    sub_2114E13E0();
  }
  else
  {
    v2 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
    v3 = *(uint64_t (**)(void))((*v1 & *v2) + 0x190);
    v4 = v2;
    LOBYTE(v3) = v3();

    if ((v3 & 1) == 0)
      sub_2114DE168();
  }
}

uint64_t sub_2114DDDDC()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))() & 1) != 0)
  {
    (*(void (**)(void))((*v2 & *v0) + 0x270))();
    return 1;
  }
  if (((*(uint64_t (**)(void))((*v2 & *v0) + 0x2F0))() & 1) != 0)
  {
    sub_2114E13E0();
    return 1;
  }
  v3 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  v4 = *(uint64_t (**)(void))((*v2 & *v3) + 0x190);
  v5 = v3;
  LOBYTE(v4) = v4();

  if ((v4 & 1) == 0)
  {
    sub_2114DE168();
    (*(void (**)(void))((*v2 & *v1) + 0x1E8))();
    if (v6)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return 0;
}

void sub_2114DDEF0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
  if (v2)
  {
    v3 = swift_bridgeObjectRelease();
    if (((*(uint64_t (**)(uint64_t))((*v1 & *v0) + 0x2F0))(v3) & 1) != 0)
      sub_2114E13E0();
    else
      sub_2114E0F04();
  }
}

void sub_2114DDFF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v11)(void);
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  _QWORD *v18;
  void (*v19)(uint64_t, unint64_t);
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t (*v23)(void);
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = v0;
  v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  v3 = *(_QWORD **)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0x78);
  v6 = v3;
  v7 = v5();
  v9 = v8;

  v10 = *(_QWORD **)(v1 + v2);
  v11 = *(uint64_t (**)(void))((*v4 & *v10) + 0x120);
  v12 = v10;
  v13 = v11();
  v15 = v14;
  v17 = v16;

  v18 = *(_QWORD **)(v1 + v2);
  v19 = *(void (**)(uint64_t, unint64_t))((*v4 & *v18) + 0x128);
  v20 = v18;
  v19(32, 0xE100000000000000);

  v21 = *(_QWORD *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v21)
  {
    v22 = *(_QWORD **)(v1 + v2);
    v23 = *(uint64_t (**)(void))((*v4 & *v22) + 0x78);
    swift_retain();
    v24 = v22;
    v25 = v23();
    v27 = v26;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, unint64_t))(*(_QWORD *)v21 + 104))(v25, v27, v7, v9, v13, v15, v17 & 1, 32, 0xE100000000000000);
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_2114E1C7C();
}

void sub_2114DE168()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v10)(void);
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t (*v18)(void);
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  void (*v27)(uint64_t, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t (*v32)(void);
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;

  v1 = v0;
  v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  v3 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0x78);
  v6 = v3;
  v39 = v5();
  v8 = v7;

  v9 = *(_QWORD **)((char *)v1 + v2);
  v10 = *(uint64_t (**)(void))((*v4 & *v9) + 0x90);
  v11 = v9;
  v12 = v10();
  v37 = v13;
  v38 = v12;
  v15 = v14;

  type metadata accessor for BRLTJTextForBrailleTranslationResult();
  v16 = (_QWORD *)(*(uint64_t (**)(void))((*v4 & *v1) + 0x150))();
  v17 = *(_QWORD **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  v18 = *(uint64_t (**)(void))((*v4 & *v17) + 0x198);
  v19 = v17;
  v20 = v18();
  v22 = v21;

  v40 = sub_2114D9CF0(v16, v20, v22);
  v23 = (*(uint64_t (**)(void))((*v4 & *v40) + 0x80))();
  v25 = v24;
  v26 = *(_QWORD **)((char *)v1 + v2);
  v27 = *(void (**)(uint64_t, uint64_t))((*v4 & *v26) + 0x128);
  v28 = v26;
  v27(v23, v25);

  v29 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v29)
  {
    v30 = v15 & 1;
    v31 = *(_QWORD **)((char *)v1 + v2);
    v32 = *(uint64_t (**)(void))((*v4 & *v31) + 0x78);
    swift_retain();
    v33 = v31;
    v34 = v32();
    v36 = v35;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v29 + 104))(v34, v36, v39, v8, v38, v37, v30, v23, v25);
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2114E1C7C();

}

void sub_2114DE378(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t (*v23)(void);
  _QWORD *v24;
  char v25;
  _QWORD *v26;
  void (*v27)(void);
  _QWORD *v28;
  _QWORD *v29;
  void (*v30)(void);
  _QWORD *v31;
  _QWORD *v32;
  uint64_t (*v33)(void);
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char v39;
  char v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  _QWORD *v51;
  void (*v52)(void);
  _QWORD *v53;
  uint64_t v54;
  Swift::Int v55;
  _QWORD *v56;
  void (*v57)(void);
  _QWORD *v58;
  uint64_t v59;
  Swift::Int v60;
  _QWORD *v62;
  void (*v63)(uint64_t, uint64_t, _QWORD);
  _QWORD *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void (*v69)(void);
  id v70;
  uint8_t *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;

  v4 = v3;
  v75 = a1;
  v7 = sub_2114E4F38();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = sub_2114E4F20();
  v13 = sub_2114E5058();
  v14 = os_log_type_enabled(v12, v13);
  v73 = a2;
  LODWORD(v74) = a3;
  if (v14)
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v72 = v4;
    *(_DWORD *)v15 = 136315138;
    v79 = v16;
    v71 = v15 + 4;
    v76 = v75;
    v77 = a2;
    v78 = a3 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3680);
    v17 = sub_2114E4F68();
    v76 = sub_2114D48F8(v17, v18, &v79);
    v4 = v72;
    sub_2114E5094();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2114B8000, v12, v13, "Set Braille selection: \"%s\"", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v16, -1, -1);
    MEMORY[0x212BDB5C4](v15, -1, -1);
  }

  v19 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v20 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v4) + 0x220))(v19) & 1) == 0)
  {
    v21 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
    v22 = *(_QWORD **)((char *)v4 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
    v23 = *(uint64_t (**)(void))((*v20 & *v22) + 0x190);
    v24 = v22;
    v25 = v23();

    if ((v25 & 1) == 0)
    {
      (*(void (**)(void))((*v20 & *v4) + 0x1A8))();
      return;
    }
    if (((*(uint64_t (**)(void))((*v20 & *v4) + 0x2F0))() & 1) != 0)
    {
      sub_2114E13E0();
      return;
    }
    if ((v74 & 1) != 0)
    {
      v26 = *(_QWORD **)((char *)v4 + v21);
      v27 = *(void (**)(void))((*v20 & *v26) + 0x118);
      v28 = v26;
      v27();

      v29 = *(_QWORD **)((char *)v4 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
      v30 = *(void (**)(void))((*v20 & *v29) + 0x118);
      v31 = v29;
      v30();
      goto LABEL_32;
    }
    v74 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
    v32 = *(_QWORD **)((char *)v4 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    v33 = *(uint64_t (**)(void))((*v20 & *v32) + 0x90);
    v34 = v32;
    v35 = v33();
    v37 = v36;
    v38 = v4;
    v40 = v39;

    v41 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
    v42 = v38;
    v76 = *(_QWORD *)((char *)v38 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
    v43 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
    v44 = v75;
    v75 = v43;
    v45 = BRLTJTranslationResultProtocol.sourceRangeFor(targetRange:)(v44, v73, v43, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
    v47 = v45;
    v48 = v46;
    if ((v40 & 1) == 0)
    {
      v49 = v35 == v45 && v37 == v46;
      if (v49 && v45 == v46)
      {
        v4 = v42;
        v51 = *(_QWORD **)((char *)v42 + v74);
        v52 = *(void (**)(void))((*v20 & *v51) + 0x78);
        v53 = v51;
        v52();

        v54 = sub_2114E4F98();
        swift_bridgeObjectRelease();
        if (v47 >= v54)
        {
LABEL_27:
          v48 = v47;
LABEL_31:
          v62 = *(_QWORD **)((char *)v4 + v74);
          v63 = *(void (**)(uint64_t, uint64_t, _QWORD))((*v20 & *v62) + 0x108);
          v64 = v62;
          v63(v47, v48, 0);

          v65 = *(void **)((char *)v4 + v21);
          v76 = *(_QWORD *)((char *)v4 + v41);
          v31 = v65;
          v66 = BRLTJTranslationResultProtocol.targetRangeFor(sourceRange:)(v47, v48, v75, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
          (*(void (**)(uint64_t))((*v20 & *v31) + 0x108))(v66);
LABEL_32:

          v67 = *(_QWORD *)((char *)v4 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
          if (v67)
          {
            v68 = *(void **)((char *)v4 + v21);
            v69 = *(void (**)(void))(*(_QWORD *)v67 + 96);
            swift_retain();
            v70 = v68;
            v69();
            swift_release();

          }
          return;
        }
        v76 = *(_QWORD *)((char *)v42 + v41);
        v55 = BRLTJTranslationResultProtocol.targetLocationFor(sourceLocation:)(v47);
        v56 = *(_QWORD **)((char *)v42 + v21);
        v57 = *(void (**)(void))((*v20 & *v56) + 0x78);
        v58 = v56;
        v57();

        v59 = sub_2114E4F98();
        swift_bridgeObjectRelease();
        if (v59 < v55)
        {
          __break(1u);
          return;
        }
        v4 = &protocol witness table for BRLTJBrailleForTextTranslationResult;
        while (1)
        {
          v76 = *(_QWORD *)((char *)v42 + v41);
          v60 = BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:)(v55);
          if (v47 < v60)
          {
            v48 = v60;
            v47 = v60;
            goto LABEL_30;
          }
          if (v59 == v55)
            break;
          if (__OFADD__(v55++, 1))
          {
            __break(1u);
            goto LABEL_27;
          }
        }
        v48 = v47;
      }
    }
LABEL_30:
    v4 = v42;
    goto LABEL_31;
  }
}

uint64_t sub_2114DE8CC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = sub_2114DA4F8(a1, a2);
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0x1D0))(v3);
}

uint64_t sub_2114DE964(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  Swift::Int v7;
  _QWORD *v8;
  uint64_t (*v9)(void);
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  _QWORD v20[4];

  v3 = sub_2114E4F38();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(_QWORD *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
  type metadata accessor for BRLTJBrailleForScriptTranslationResult();
  v7 = BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:)(a1);
  v8 = *(_QWORD **)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
  v9 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v8) + 0x78);
  v10 = v8;
  v11 = v9();
  v13 = v12;

  v14 = sub_2114DA570(v11, v13, v7);
  swift_bridgeObjectRelease();
  v15 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
  v16 = sub_2114E4F20();
  v17 = sub_2114E5064();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    *(_DWORD *)v18 = 134218240;
    v20[0] = v14;
    sub_2114E5094();
    *(_WORD *)(v18 + 12) = 2048;
    v20[0] = a1;
    sub_2114E5094();
    _os_log_impl(&dword_2114B8000, v16, v17, "Script location %ld for Braille location %ld", (uint8_t *)v18, 0x16u);
    MEMORY[0x212BDB5C4](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v14;
}

uint64_t sub_2114DEBA0@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x1E8))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2114DEBE0(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0x1F0);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_2114DEC34()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateSelectionLanguage);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2114DEC88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateSelectionLanguage);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2114DECE4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2114DED28(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x208))();
}

uint64_t sub_2114DED60(uint64_t a1, _QWORD **a2)
{
  _BYTE v4[40];

  sub_2114E22CC(a1, (uint64_t)v4);
  return (*(uint64_t (**)(_BYTE *))((*MEMORY[0x24BEE4EA0] & **a2) + 0x210))(v4);
}

uint64_t sub_2114DEDB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateManager;
  swift_beginAccess();
  return sub_2114E22CC(v3, a1);
}

uint64_t sub_2114DEE00(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateManager;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0(v3);
  sub_2114E2310(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_2114DEE60())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2114DEF30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))(v4);
  v1 = v5;
  v2 = v6;
  __swift_project_boxed_opaque_existential_0(v4, v5);
  LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v1 & 1;
}

void sub_2114DEFAC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v9)(void);
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t (*v16)(void);
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t (*v25)(void);
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[3];
  uint64_t v44;
  uint64_t v45;

  v1 = v0;
  v2 = sub_2114E4F38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  v7 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  v8 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v9 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v7) + 0x190);
  v10 = v7;
  LOBYTE(v9) = v9();

  if ((v9 & 1) == 0
    && ((*(uint64_t (**)(void))((*v8 & *v1) + 0x220))() & 1) == 0
    && ((*(uint64_t (**)(void))((*v8 & *v1) + 0x2F0))() & 1) == 0)
  {
    v11 = *(void **)((char *)v1 + v6);
    v12 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
    *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache) = v11;
    v13 = v11;

    type metadata accessor for BRLTJTextForBrailleTranslationResult();
    v14 = (_QWORD *)(*(uint64_t (**)(void))((*v8 & *v1) + 0x150))();
    v15 = *(_QWORD **)((char *)v1 + v6);
    v16 = *(uint64_t (**)(void))((*v8 & *v15) + 0x198);
    v17 = v15;
    v18 = v16();
    v20 = v19;

    v21 = sub_2114D9CF0(v14, v18, v20);
    v22 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_stageScriptForStageResult;
    v23 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_stageScriptForStageResult);
    *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_stageScriptForStageResult) = v21;

    v24 = *(_QWORD **)((char *)v1 + v22);
    v25 = *(uint64_t (**)(void))((*v8 & *v24) + 0x80);
    v26 = v24;
    v27 = v25();
    v29 = v28;

    v30 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v30, v2);
    swift_bridgeObjectRetain_n();
    v31 = sub_2114E4F20();
    v32 = sub_2114E5058();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v41 = v27;
      v35 = v34;
      v43[0] = v34;
      *(_DWORD *)v33 = 136315138;
      v40[1] = v33 + 4;
      swift_bridgeObjectRetain();
      v42 = sub_2114D48F8(v41, v29, v43);
      v8 = (_QWORD *)MEMORY[0x24BEE4EA0];
      sub_2114E5094();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2114B8000, v31, v32, "Start candidate selection with stageScript = %s", v33, 0xCu);
      swift_arrayDestroy();
      v36 = v35;
      v27 = v41;
      MEMORY[0x212BDB5C4](v36, -1, -1);
      MEMORY[0x212BDB5C4](v33, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v37 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(uint64_t *__return_ptr, uint64_t))((*v8 & *v1) + 0x208))(v43, v37);
    v38 = v44;
    v39 = v45;
    __swift_project_boxed_opaque_existential_0(v43, v44);
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v39 + 32))(v27, v29, v38, v39);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
    sub_2114DFBE0();
  }
}

uint64_t sub_2114DF364()
{
  _QWORD *v0;
  void (*v1)(_QWORD *__return_ptr);
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v1 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208);
  v1(v11);
  v2 = v12;
  v3 = v13;
  __swift_project_boxed_opaque_existential_0(v11, v12);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if ((v4 & 1) != 0)
  {
    ((void (*)(_QWORD *__return_ptr, uint64_t))v1)(v11, result);
    v6 = v12;
    v7 = v13;
    __swift_project_boxed_opaque_existential_0(v11, v12);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 48))(v6, v7);
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    if ((v8 & 1) != 0)
    {
      ((void (*)(_QWORD *__return_ptr, uint64_t))v1)(v11, result);
      v9 = v12;
      v10 = v13;
      __swift_project_boxed_opaque_existential_0(v11, v12);
      (*(void (**)(uint64_t, uint64_t))(v10 + 56))(v9, v10);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
      return sub_2114DFBE0();
    }
  }
  return result;
}

uint64_t sub_2114DF4A0()
{
  _QWORD *v0;
  void (*v1)(_QWORD *__return_ptr);
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v1 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208);
  v1(v11);
  v2 = v12;
  v3 = v13;
  __swift_project_boxed_opaque_existential_0(v11, v12);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if ((v4 & 1) != 0)
  {
    ((void (*)(_QWORD *__return_ptr, uint64_t))v1)(v11, result);
    v6 = v12;
    v7 = v13;
    __swift_project_boxed_opaque_existential_0(v11, v12);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    if ((v8 & 1) != 0)
    {
      ((void (*)(_QWORD *__return_ptr, uint64_t))v1)(v11, result);
      v9 = v12;
      v10 = v13;
      __swift_project_boxed_opaque_existential_0(v11, v12);
      (*(void (**)(uint64_t, uint64_t))(v10 + 72))(v9, v10);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
      return sub_2114DFBE0();
    }
  }
  return result;
}

void sub_2114DF5DC()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  void (*v3)(_QWORD *__return_ptr);
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v15)(void);
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t (*v20)(void);
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  _QWORD *v26;
  void (*v27)(uint64_t, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t (*v31)(void);
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(void);
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  void *v57;
  _QWORD *v58;
  uint64_t (*v59)(void);
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  _QWORD *v64;
  void (*v65)(uint64_t, uint64_t);
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(_QWORD *__return_ptr);
  _QWORD v75[3];
  uint64_t v76;
  uint64_t v77;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208);
  v3(v75);
  v4 = v76;
  v5 = v77;
  __swift_project_boxed_opaque_existential_0(v75, v76);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  v7 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
  if ((v6 & 1) != 0)
  {
    v74 = v3;
    ((void (*)(_QWORD *__return_ptr, uint64_t))v3)(v75, v7);
    v8 = v76;
    v9 = v77;
    __swift_project_boxed_opaque_existential_0(v75, v76);
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 96))(v8, v9);
    v12 = v11;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
    v13 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
    v14 = *(_QWORD **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    v15 = *(uint64_t (**)(void))((*v2 & *v14) + 0x78);
    v16 = v14;
    v72 = v15();
    v18 = v17;

    v19 = *(_QWORD **)((char *)v1 + v13);
    v20 = *(uint64_t (**)(void))((*v2 & *v19) + 0x90);
    v21 = v19;
    v22 = v20();
    v70 = v23;
    v71 = v22;
    v25 = v24;

    v26 = *(_QWORD **)((char *)v1 + v13);
    v27 = *(void (**)(uint64_t, uint64_t))((*v2 & *v26) + 0x128);
    v28 = v26;
    v27(v10, v12);

    v29 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
    if (v29)
    {
      v30 = *(_QWORD **)((char *)v1 + v13);
      v31 = *(uint64_t (**)(void))((*v2 & *v30) + 0x78);
      swift_retain();
      v32 = v30;
      v33 = v31();
      v35 = v34;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v29 + 104))(v33, v35, v72, v18, v71, v70, v25 & 1, v10, v12);
      swift_release();
      v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v36 = swift_bridgeObjectRelease();
    ((void (*)(_QWORD *__return_ptr, uint64_t))v74)(v75, v36);
    v37 = v76;
    v38 = v77;
    __swift_project_boxed_opaque_existential_0(v75, v76);
    (*(void (**)(uint64_t, uint64_t))(v38 + 104))(v37, v38);
    v39 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
    ((void (*)(_QWORD *__return_ptr, uint64_t))v74)(v75, v39);
    v40 = v76;
    v41 = v77;
    __swift_project_boxed_opaque_existential_0(v75, v76);
    v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 112))(v40, v41);
    v44 = v43;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
    if (!v42 && v44 == 0xE000000000000000 || (sub_2114E516C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v45 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
      *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache) = 0;

      v74(v75);
      v46 = v76;
      v47 = v77;
      __swift_project_boxed_opaque_existential_0(v75, v76);
      (*(void (**)(uint64_t, uint64_t))(v47 + 40))(v46, v47);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
      sub_2114E1C7C();
    }
    else
    {
      type metadata accessor for BRLTJBrailleForTextTranslationResult();
      v48 = *(uint64_t (**)(void))((*v2 & *v1) + 0x150);
      v49 = (_QWORD *)v48();
      swift_bridgeObjectRetain();
      v50 = sub_2114D9404(v49, v42, v44);
      v73 = (*(uint64_t (**)(void))((*v2 & *v50) + 0x80))();
      v52 = v51;

      type metadata accessor for BRLTJBrailleForScriptTranslationResult();
      v53 = v2;
      v54 = (_QWORD *)v48();
      v55 = sub_2114D97C8(v54, *(id *)((char *)v1 + v13));
      v56 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
      v57 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
      *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult) = v55;

      v58 = *(_QWORD **)((char *)v1 + v56);
      v59 = *(uint64_t (**)(void))((*v2 & *v58) + 0xD0);
      v60 = v58;
      v61 = v59();

      v62 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache;
      v63 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
      *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache) = v61;

      v64 = *(_QWORD **)((char *)v1 + v62);
      if (v64)
      {
        v65 = *(void (**)(uint64_t, uint64_t))((*v53 & *v64) + 0x128);
        v66 = v64;
        v65(v73, v52);

        v67 = swift_bridgeObjectRelease();
        ((void (*)(_QWORD *__return_ptr, uint64_t))v74)(v75, v67);
        v68 = v76;
        v69 = v77;
        __swift_project_boxed_opaque_existential_0(v75, v76);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 32))(v42, v44, v68, v69);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
        sub_2114DFBE0();
      }
      else
      {
        __break(1u);
      }
    }
  }
}

void sub_2114DFAA4()
{
  _QWORD *v0;
  _QWORD *v1;
  void (*v2)(_QWORD *__return_ptr);
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void (*v15)(void);
  id v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208);
  v2(v17);
  v3 = v18;
  v4 = v19;
  __swift_project_boxed_opaque_existential_0(v17, v18);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  v6 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  if ((v5 & 1) != 0)
  {
    ((void (*)(_QWORD *__return_ptr, uint64_t))v2)(v17, v6);
    v7 = v18;
    v8 = v19;
    __swift_project_boxed_opaque_existential_0(v17, v18);
    (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v7, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
    v9 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
    if (v9)
    {
      v10 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
      v11 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
      *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille) = v9;
      v12 = v9;

      v13 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
      if (v13)
      {
        v14 = *(void **)((char *)v1 + v10);
        v15 = *(void (**)(void))(*(_QWORD *)v13 + 96);
        swift_retain();
        v16 = v14;
        v15();
        swift_release();

      }
    }
    else
    {
      sub_2114E1C7C();
    }
  }
}

uint64_t sub_2114DFBE0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)(void);
  _QWORD *v9;
  void (*v10)(uint64_t *__return_ptr);
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void (*v25)(uint64_t *__return_ptr);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  NSObject *v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  _QWORD *v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  void *v59;
  void (*v60)(void);
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  void (*v73)(uint64_t *__return_ptr);
  char *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t);
  uint64_t v78;
  unint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v1 = v0;
  v2 = sub_2114E4F38();
  v83 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v82 = (char *)&v73 - v6;
  type metadata accessor for BRLTJBrailleForTextTranslationResult();
  v7 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v8 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v0) + 0x150);
  v9 = (_QWORD *)v8();
  v10 = *(void (**)(uint64_t *__return_ptr))((*v7 & *(_QWORD *)v0) + 0x208);
  v10(&v86);
  v11 = v88;
  v12 = v89;
  __swift_project_boxed_opaque_existential_0(&v86, v88);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
  v14 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    v80 = v5;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v86);
    v86 = v14;
    v15 = sub_2114E5154();
    v17 = sub_2114D9404(v9, v15, v16);
    v18 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v17) + 0x80))();
    v20 = v19;

    v86 = v18;
    v87 = v20;
    swift_bridgeObjectRetain();
    sub_2114E4FD4();
    v21 = swift_bridgeObjectRelease();
    v81 = v2;
    v23 = v86;
    v22 = v87;
    v24 = (_QWORD *)((uint64_t (*)(uint64_t))v8)(v21);
    v25 = v10;
    v10(&v86);
    v26 = v88;
    v27 = v89;
    __swift_project_boxed_opaque_existential_0(&v86, v88);
    v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 88))(v26, v27);
    v30 = sub_2114D9404(v24, v28, v29);
    v31 = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v86);
    (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v30) + 0x80))(v31);

    v86 = v23;
    v87 = v22;
    v32 = v81;
    swift_bridgeObjectRetain();
    sub_2114E4FD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2114E4FD4();
    swift_bridgeObjectRelease();
    v34 = v86;
    v33 = v87;
    type metadata accessor for BRLTJBrailleString();
    swift_bridgeObjectRetain();
    v35 = sub_2114C7C74();
    v75 = v34;
    v79 = v33;
    v36 = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(v34, v33, 0, 0, 1, 0, 0, 0, 0, 0, 1, v35);
    v37 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
    v38 = *(void **)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille];
    *(_QWORD *)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille] = v36;

    v39 = sub_2114D5FC8();
    swift_beginAccess();
    v41 = v82;
    v40 = v83;
    v77 = *(void (**)(char *, uint64_t, uint64_t))(v83 + 16);
    v78 = v39;
    v77(v82, v39, v32);
    v42 = v1;
    v43 = sub_2114E4F20();
    v44 = sub_2114E5058();
    v45 = os_log_type_enabled(v43, v44);
    v76 = v37;
    if (v45)
    {
      v46 = swift_slowAlloc();
      v74 = v1;
      v47 = v37;
      v48 = v46;
      v49 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v48 = 138412546;
      v50 = *(Class *)((char *)&v42->isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
      v73 = v25;
      v86 = (uint64_t)v50;
      v51 = v50;
      sub_2114E5094();
      *v49 = v50;

      *(_WORD *)(v48 + 12) = 2112;
      v52 = *(void **)&v74[v47];
      v1 = v74;
      v86 = (uint64_t)v52;
      v53 = v52;
      v40 = v83;
      v25 = v73;
      sub_2114E5094();
      v49[1] = v52;

      _os_log_impl(&dword_2114B8000, v43, v44, "Translate: \"%@\" -> \"%@\"", (uint8_t *)v48, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254AB38D8);
      swift_arrayDestroy();
      v54 = v49;
      v41 = v82;
      MEMORY[0x212BDB5C4](v54, -1, -1);
      v32 = v81;
      MEMORY[0x212BDB5C4](v48, -1, -1);
    }
    else
    {

      v43 = v42;
    }

    v55 = *(void (**)(char *, uint64_t))(v40 + 8);
    v55(v41, v32);
    v56 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier;
    v57 = *(uint64_t *)((char *)&v42->isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
    v58 = v80;
    if (v57)
    {
      v59 = *(void **)&v1[v76];
      v60 = *(void (**)(void))(*(_QWORD *)v57 + 96);
      swift_retain();
      v61 = v59;
      v60();
      swift_release();

      v62 = *(uint64_t *)((char *)&v42->isa + v56);
      if (v62)
      {
        v63 = swift_retain();
        ((void (*)(uint64_t *__return_ptr, uint64_t))v25)(&v86, v63);
        v64 = v88;
        v65 = v89;
        __swift_project_boxed_opaque_existential_0(&v86, v88);
        v66 = (*(uint64_t (**)(uint64_t, uint64_t))(v65 + 80))(v64, v65);
        (*(void (**)(uint64_t))(*(_QWORD *)v62 + 120))(v66);
        swift_bridgeObjectRelease();
        swift_release();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v86);
      }
    }
    v67 = v78;
    swift_beginAccess();
    v77(v58, v67, v32);
    v68 = v79;
    swift_bridgeObjectRetain();
    v69 = sub_2114E4F20();
    v70 = sub_2114E5058();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      v72 = swift_slowAlloc();
      v85 = v72;
      *(_DWORD *)v71 = 136315138;
      swift_bridgeObjectRetain();
      v84 = sub_2114D48F8(v75, v68, &v85);
      sub_2114E5094();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2114B8000, v69, v70, "Show current candidate description: %s", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BDB5C4](v72, -1, -1);
      MEMORY[0x212BDB5C4](v71, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return ((uint64_t (*)(char *, uint64_t))v55)(v58, v32);
  }
  return result;
}

uint64_t sub_2114E031C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2114E03A8(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_2114E03F0@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x288))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2114E0434(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **a2) + 0x290))(*a1);
}

uint64_t (*sub_2114E0470())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_2114E04B4(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void (*v11)(void);
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  uint64_t (*v29)(void);
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void (*v35)(_QWORD *, uint64_t, uint64_t);
  NSObject *v36;
  NSObject *v37;
  os_log_type_t v38;
  int v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  _QWORD *v49;
  uint64_t v50;
  void (*v51)(_QWORD *, uint64_t);
  NSObject *v52;
  NSObject *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  uint8_t *v56;
  void (*v57)(_QWORD *, uint64_t);
  void *v58;
  id v59;
  _QWORD *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void (*v64)(void);
  id v65;
  _BYTE v66[12];
  int v67;
  void (*v68)(_QWORD *, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  _QWORD *v75;
  _BYTE *v76;
  void *v77;
  void *v78;

  v2 = v1;
  v4 = sub_2114E4F38();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v76 = &v66[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v75 = &v66[-v8];
  v9 = objc_msgSend(objc_allocWithZone((Class)BRLTJJapaneseProcessor), sel_init);
  v10 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v11 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x78);
  v11();
  v12 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v9, sel_isWordDescriptionLike_, v12);

  v73 = v9;
  if (v13)
  {
    type metadata accessor for BRLTJEditableString();
    v11();
    v14 = (void *)sub_2114E4F50();
    swift_bridgeObjectRelease();
    v15 = objc_msgSend(v9, sel_spacedYomiOfWordDescription_, v14);

    v16 = sub_2114E4F5C();
    v18 = v17;

    v19 = sub_2114C7C74();
    v20 = BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(v16, v18, 0, 0, 1, 0, 0, 1, 0, 0, 1, v19);
    v21 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript);
    *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript) = v20;
  }
  else
  {
    v21 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript);
    *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript) = a1;
    v22 = a1;
  }

  type metadata accessor for BRLTJBrailleForScriptTranslationResult();
  v23 = (_QWORD *)(*(uint64_t (**)(void))((*v10 & *v2) + 0x150))();
  v24 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript;
  v25 = sub_2114D97C8(v23, *(id *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript));
  v26 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
  v27 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
  *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult) = v25;

  v28 = *(_QWORD **)((char *)v2 + v26);
  v29 = *(uint64_t (**)(void))((*v10 & *v28) + 0xD0);
  v30 = v28;
  v31 = v29();

  v32 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille;
  v33 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille);
  *(_QWORD *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille) = v31;

  v34 = sub_2114D5FC8();
  swift_beginAccess();
  v72 = v5;
  v35 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v5 + 16);
  v35(v75, v34, v4);
  v36 = v2;
  v37 = sub_2114E4F20();
  v38 = sub_2114E5058();
  v39 = v38;
  v40 = os_log_type_enabled(v37, v38);
  v74 = v32;
  if (v40)
  {
    v41 = swift_slowAlloc();
    v70 = v4;
    v42 = v41;
    v43 = swift_slowAlloc();
    v69 = v34;
    v44 = (_QWORD *)v43;
    *(_DWORD *)v42 = 138412546;
    v68 = v35;
    v67 = v39;
    v45 = *(void **)((char *)v2 + v24);
    v78 = v45;
    v46 = v45;
    sub_2114E5094();
    *v44 = v45;

    *(_WORD *)(v42 + 12) = 2112;
    v47 = *(void **)((char *)v2 + v32);
    v78 = v47;
    v48 = v47;
    v35 = v68;
    sub_2114E5094();
    v44[1] = v47;

    _os_log_impl(&dword_2114B8000, v37, (os_log_type_t)v67, "Translate alert: \"%@\" -> \"%@\"", (uint8_t *)v42, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB38D8);
    swift_arrayDestroy();
    v49 = v44;
    v34 = v69;
    MEMORY[0x212BDB5C4](v49, -1, -1);
    v50 = v42;
    v4 = v70;
    MEMORY[0x212BDB5C4](v50, -1, -1);
  }
  else
  {

    v37 = v36;
  }

  v51 = *(void (**)(_QWORD *, uint64_t))(v72 + 8);
  v51(v75, v4);
  swift_beginAccess();
  v35(v76, v34, v4);
  v52 = v36;
  v53 = sub_2114E4F20();
  v54 = sub_2114E5058();
  v55 = os_log_type_enabled(v53, v54);
  v71 = v2;
  if (v55)
  {
    v56 = (uint8_t *)swift_slowAlloc();
    v75 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v56 = 138412290;
    v57 = v51;
    v58 = *(void **)((char *)v2 + v74);
    v77 = v58;
    v59 = v58;
    sub_2114E5094();
    v60 = v75;
    *v75 = v58;
    v51 = v57;

    _os_log_impl(&dword_2114B8000, v53, v54, "Refresh Braille display with alert: %@", v56, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB38D8);
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v60, -1, -1);
    MEMORY[0x212BDB5C4](v56, -1, -1);
  }
  else
  {

    v53 = v52;
  }
  v61 = v73;

  v51(v76, v4);
  v62 = *(uint64_t *)((char *)&v52->isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v62)
  {
    v63 = *(void **)((char *)v71 + v74);
    v64 = *(void (**)(void))(*(_QWORD *)v62 + 96);
    swift_retain();
    v65 = v63;
    v64();
    swift_release();

  }
}

uint64_t sub_2114E0AB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;

  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x288))() & 1) != 0)
    v1 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript;
  else
    v1 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  objc_msgSend(*(id *)((char *)v0 + v1), sel_copy);
  sub_2114E50B8();
  swift_unknownObjectRelease();
  type metadata accessor for BRLTJEditableString();
  swift_dynamicCast();
  return v3;
}

id sub_2114E0B88()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  void (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x288))() & 1) != 0)
  {
    v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille;
  }
  else
  {
    if (((*(uint64_t (**)(void))((*v1 & *v0) + 0x348))() & 1) != 0)
    {
      v3 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
      v4 = *(void (**)(void))((*v1 & *v3) + 0x78);
      v5 = v3;
      v4();

      sub_2114E4FD4();
      swift_bridgeObjectRelease();
      type metadata accessor for BRLTJBrailleString();
      swift_bridgeObjectRetain();
      sub_2114E4FD4();
      swift_bridgeObjectRelease();
      v6 = sub_2114C7C74();
      return BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0x80A0E2BFA0E2, 0xA600000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v6);
    }
    v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  }
  objc_msgSend(*(id *)((char *)v0 + v2), sel_copy);
  sub_2114E50B8();
  swift_unknownObjectRelease();
  type metadata accessor for BRLTJBrailleString();
  swift_dynamicCast();
  return (id)v8;
}

uint64_t sub_2114E0D6C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2114E0DF8(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_2114E0E40@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x2F0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2114E0E84(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **a2) + 0x2F8))(*a1);
}

uint64_t (*sub_2114E0EC0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_2114E0F04()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v9)(void);
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t (*v17)(void);
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  uint64_t (*v32)(void);
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint8_t *v36;
  _QWORD *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;

  v1 = v0;
  v2 = sub_2114E4F38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  v7 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  v8 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v9 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v7) + 0x190);
  v10 = v7;
  LOBYTE(v9) = v9();

  if ((v9 & 1) != 0
    && ((*(uint64_t (**)(void))((*v8 & *v1) + 0x220))() & 1) == 0
    && ((*(uint64_t (**)(void))((*v8 & *v1) + 0x2F0))() & 1) == 0)
  {
    (*(void (**)(uint64_t))((*v8 & *v1) + 0x2F8))(1);
    v11 = *(void **)((char *)v1 + v6);
    v12 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
    *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache) = v11;
    v13 = v11;

    v14 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager);
    v38 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
    v15 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
    v16 = *(_QWORD **)((char *)v1 + v6);
    v17 = *(uint64_t (**)(void))((*v8 & *v16) + 0x90);
    swift_retain();
    v39 = v15;
    v18 = v16;
    v19 = v17();
    v21 = v20;
    v23 = v22;

    v24 = v23 & 1;
    v25 = v39;
    (*(void (**)(NSObject *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 216))(v39, v19, v21, v24);
    swift_release();

    sub_2114E14DC();
    v26 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v26, v2);
    v27 = v1;
    v28 = sub_2114E4F20();
    v29 = sub_2114E5058();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v37 = (_QWORD *)swift_slowAlloc();
      v39 = v27;
      *(_DWORD *)v30 = 138412290;
      v36 = v30 + 4;
      v31 = *(_QWORD **)((char *)v1 + v38);
      v32 = *(uint64_t (**)(void))((*v8 & *v31) + 0xB8);
      v33 = v31;
      v34 = v32();

      v40 = v34;
      sub_2114E5094();
      v35 = v37;
      *v37 = v34;

      _os_log_impl(&dword_2114B8000, v28, v29, "Start word description with stage = %@", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254AB38D8);
      swift_arrayDestroy();
      MEMORY[0x212BDB5C4](v35, -1, -1);
      MEMORY[0x212BDB5C4](v30, -1, -1);
    }
    else
    {

      v28 = v27;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_2114E1230()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F0))();
  if ((result & 1) != 0)
  {
    v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager;
    v3 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)v0
                                                         + OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager)
                                           + 224);
    v4 = swift_retain();
    LOBYTE(v3) = v3(v4);
    result = swift_release();
    if ((v3 & 1) != 0)
    {
      v5 = *(void (**)(uint64_t))(**(_QWORD **)((char *)v0 + v2) + 240);
      v6 = swift_retain();
      v5(v6);
      swift_release();
      return sub_2114E14DC();
    }
  }
  return result;
}

uint64_t sub_2114E1308()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F0))();
  if ((result & 1) != 0)
  {
    v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager;
    v3 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)v0
                                                         + OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager)
                                           + 232);
    v4 = swift_retain();
    LOBYTE(v3) = v3(v4);
    result = swift_release();
    if ((v3 & 1) != 0)
    {
      v5 = *(void (**)(uint64_t))(**(_QWORD **)((char *)v0 + v2) + 248);
      v6 = swift_retain();
      v5(v6);
      swift_release();
      return sub_2114E14DC();
    }
  }
  return result;
}

void sub_2114E13E0()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void (*v7)(void);
  id v8;
  id v9;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F0))() & 1) != 0)
  {
    (*(void (**)(_QWORD))((*v1 & *v0) + 0x2F8))(0);
    v2 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
    if (v2)
    {
      v3 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
      v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
      *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille) = v2;
      v9 = v2;

      v5 = *(_QWORD *)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
      if (v5)
      {
        v6 = *(void **)((char *)v0 + v3);
        v7 = *(void (**)(void))(*(_QWORD *)v5 + 96);
        swift_retain();
        v8 = v6;
        v7();
        swift_release();

      }
    }
    else
    {
      sub_2114E1C7C();
    }
  }
}

uint64_t sub_2114E14DC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void (*v29)(void);
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;

  v1 = v0;
  v2 = sub_2114E4F38();
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager;
  v6 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)v0
                                                       + OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager)
                                         + 264);
  v7 = swift_retain();
  v8 = v6(v7);
  v10 = v9;
  swift_release();
  v44 = v8;
  v45 = v10;
  swift_bridgeObjectRetain();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  v12 = v44;
  v11 = v45;
  type metadata accessor for BRLTJBrailleForTextTranslationResult();
  v13 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v14 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
  v15 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)v0 + v5) + 256);
  v16 = swift_retain();
  v17 = v15(v16);
  v19 = v18;
  swift_release();
  v20 = sub_2114D9404(v14, v17, v19);
  (*(void (**)(void))((*v13 & *v20) + 0x80))();

  v44 = v12;
  v45 = v11;
  swift_bridgeObjectRetain();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2114E4FD4();
  swift_bridgeObjectRelease();
  v22 = v44;
  v21 = v45;
  type metadata accessor for BRLTJBrailleString();
  swift_bridgeObjectRetain();
  v23 = sub_2114C7C74();
  v24 = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(v22, v21, 0, 0, 1, 0, 0, 0, 0, 0, 1, v23);
  v25 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  v26 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille) = v24;

  v27 = *(_QWORD *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v27)
  {
    v28 = *(void **)((char *)v1 + v25);
    v29 = *(void (**)(void))(*(_QWORD *)v27 + 96);
    swift_retain();
    v30 = v28;
    v29();
    swift_release();

  }
  v31 = sub_2114D5FC8();
  swift_beginAccess();
  v33 = v40;
  v32 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v4, v31, v41);
  swift_bridgeObjectRetain();
  v34 = sub_2114E4F20();
  v35 = sub_2114E5058();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v43 = v37;
    *(_DWORD *)v36 = 136315138;
    swift_bridgeObjectRetain();
    v42 = sub_2114D48F8(v22, v21, &v43);
    sub_2114E5094();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2114B8000, v34, v35, "Show current word description: %s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v37, -1, -1);
    MEMORY[0x212BDB5C4](v36, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v4, v41);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v4, v32);
  }
}

uint64_t sub_2114E18EC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2114E1978(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_2114E19C0@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x348))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2114E1A04(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **a2) + 0x350))(*a1);
}

uint64_t (*sub_2114E1A40())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2114E1A84()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v10)(void);
  _QWORD *v11;
  _QWORD *v12;
  void (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
  if (!v4)
    goto LABEL_10;
  if (v3 == 24938 && v4 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = sub_2114E516C();
    swift_bridgeObjectRelease();
    v7 = 0;
    if ((v6 & 1) == 0)
      return v7 & 1;
  }
  v8 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  v9 = *(_QWORD **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  v10 = *(uint64_t (**)(void))((*v2 & *v9) + 0x190);
  v11 = v9;
  LOBYTE(v10) = v10();

  if ((v10 & 1) == 0)
  {
    v12 = *(_QWORD **)((char *)v1 + v8);
    v13 = *(void (**)(void))((*v2 & *v12) + 0x198);
    v14 = v12;
    v13();

    v15 = sub_2114E4FE0();
    if (v16)
    {
      v17 = v15;
      v18 = v16;
      v7 = 0;
      do
      {
        if (v17 == 10920162 && v18 == 0xA300000000000000 || (sub_2114E516C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v7 = 1;
        }
        else if (v17 == 11837666 && v18 == 0xA300000000000000)
        {
          swift_bridgeObjectRelease();
          v7 = 0;
        }
        else
        {
          v20 = sub_2114E516C();
          swift_bridgeObjectRelease();
          v7 &= v20 ^ 1;
        }
        v17 = sub_2114E4FE0();
        v18 = v19;
      }
      while (v19);
    }
    else
    {
      v7 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_10:
    v7 = 0;
  }
  return v7 & 1;
}

void sub_2114E1C7C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  void (*v35)(void);
  id v36;
  uint64_t v37;
  int v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  v1 = v0;
  v2 = sub_2114E4F38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BRLTJBrailleForScriptTranslationResult();
  v6 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v7 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v0) + 0x150))();
  v8 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  v9 = sub_2114D97C8(v7, *(id *)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_script]);
  v10 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
  v11 = *(void **)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult];
  *(_QWORD *)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult] = v9;

  v12 = *(_QWORD **)&v1[v10];
  v13 = *(uint64_t (**)(void))((*v6 & *v12) + 0xD0);
  v14 = v12;
  v15 = v13();

  v16 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  v17 = *(void **)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille];
  *(_QWORD *)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille] = v15;

  v18 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v18, v2);
  v19 = v1;
  v20 = sub_2114E4F20();
  v21 = sub_2114E5058();
  v22 = v21;
  v23 = os_log_type_enabled(v20, v21);
  v42 = v16;
  if (v23)
  {
    v24 = swift_slowAlloc();
    v38 = v22;
    v25 = v24;
    v26 = swift_slowAlloc();
    v40 = v3;
    v27 = (_QWORD *)v26;
    *(_DWORD *)v25 = 138412546;
    v39 = v5;
    v41 = v2;
    v28 = *(void **)&v1[v8];
    v43 = v28;
    v29 = v28;
    sub_2114E5094();
    *v27 = v28;

    *(_WORD *)(v25 + 12) = 2112;
    v30 = *(void **)&v1[v16];
    v43 = v30;
    v31 = v30;
    v5 = v39;
    sub_2114E5094();
    v27[1] = v30;
    v2 = v41;

    _os_log_impl(&dword_2114B8000, v20, (os_log_type_t)v38, "Translate: \"%@\" -> \"%@\"", (uint8_t *)v25, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB38D8);
    swift_arrayDestroy();
    v32 = v27;
    v3 = v40;
    MEMORY[0x212BDB5C4](v32, -1, -1);
    MEMORY[0x212BDB5C4](v25, -1, -1);
  }
  else
  {

    v20 = v19;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v33 = *(uint64_t *)((char *)&v19->isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v33)
  {
    v34 = *(void **)&v1[v42];
    v35 = *(void (**)(void))(*(_QWORD *)v33 + 96);
    swift_retain();
    v36 = v34;
    v35();
    swift_release();

  }
}

id BRLTJBrailleStateManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTJBrailleStateManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BRLTJBrailleStateManager.setDelegate(_:)()
{
  uint64_t v0;
  uint64_t v1;

  type metadata accessor for BRLTJStateNotifier();
  v1 = swift_unknownObjectRetain();
  *(_QWORD *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier) = sub_2114E282C(v1);
  return swift_release();
}

uint64_t BRLTJBrailleStateManager.setTranslationDelegate(_:outputMode:inputMode:candidateSelectionLanguage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  id v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t);

  v6 = v5;
  type metadata accessor for BRLTJTranslator();
  v12 = sub_2114D9054((uint64_t)objc_msgSend(objc_allocWithZone((Class)BRLTJTranslatorWrapper), sel_initWithTranslationDelegate_outputMode_inputMode_, a1, a2, a3));
  v13 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(id))((*MEMORY[0x24BEE4EA0] & *v6) + 0x158))(v12);
  *(_QWORD *)((char *)v6 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_outputMode) = a2;
  *(_QWORD *)((char *)v6 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_inputMode) = a3;
  v15 = *(uint64_t (**)(uint64_t, uint64_t))((*v13 & *v6) + 0x1F0);
  swift_bridgeObjectRetain();
  return v15(a4, a5);
}

uint64_t sub_2114E22CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2114E2310(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t method lookup function for BRLTJBrailleStateManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.translator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.translator.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.translator.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isEditing.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.setScript(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.insertBrailleChar(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.delete()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.forwardDelete()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.escapeCommand()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.returnCommand()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.wordDescriptionCommand()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.setBrailleSelection(_:)(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v3) + 0x1D0))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.setBrailleSelection(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.scriptLocationForBrailleLocation(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateSelectionLanguage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateSelectionLanguage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateSelectionLanguage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateManager.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateManager.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateManager.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isCandidateSelectionActive.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.startCandidateSelection()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.showNextCandidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.showPreviousCandidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.selectCandidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingAlert.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingAlert.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x290))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingAlert.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.displayedScript.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.displayedBraille.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isWordDescriptionActive.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isWordDescriptionActive.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isWordDescriptionActive.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x300))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.showNextWordDescription()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.showPreviousWordDescription()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingTerminalOutput.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x348))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingTerminalOutput.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x350))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingTerminalOutput.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.stageScript.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.isActive.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.currentIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.activate(stageScript:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.deactivate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.hasNext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.moveToNext()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.hasPrevious.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.moveToPrevious()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.currentRawDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.currentDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.currentCandidate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.learnCurrentCandidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.stageRemainder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

void type metadata accessor for BRLTTranslationMode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254AB3950)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254AB3950);
  }
}

uint64_t sub_2114E2824()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_2114E282C(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t sub_2114E285C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

void sub_2114E2868(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  NSObject *v14;
  _QWORD *v15;
  uint8_t *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;

  v2 = v1;
  v4 = sub_2114E4F38();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = sub_2114E4F20();
  v11 = sub_2114E5064();
  if (os_log_type_enabled(v10, v11))
  {
    v31 = v2;
    v12 = swift_slowAlloc();
    v30 = v5;
    v13 = (uint8_t *)v12;
    v29 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v32 = v9;
    v14 = v9;
    v2 = v31;
    sub_2114E5094();
    v15 = v29;
    *v29 = v9;

    _os_log_impl(&dword_2114B8000, v10, v11, "Refresh Braille display: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB38D8);
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v15, -1, -1);
    v16 = v13;
    v5 = v30;
    MEMORY[0x212BDB5C4](v16, -1, -1);
  }
  else
  {

    v10 = v9;
  }

  v17 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v18 = *(void **)(v2 + 16);
  v19 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v9->isa) + 0x1D0))(v17);
  v20 = objc_allocWithZone((Class)BRLTBrailleString);
  v21 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v20, sel_initWithUnicode_, v21);

  v23 = (*(uint64_t (**)(void))((*v19 & (uint64_t)v9->isa) + 0x90))();
  v26 = sub_2114DA4CC(v23, v25, v24 & 1);
  objc_msgSend(v18, sel_brailleDisplayStringDidChange_brailleSelection_modifiers_, v22, v26, v27, 0);

}

void sub_2114E2AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, unint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;

  v10 = v9;
  v60 = a8;
  v50 = a1;
  v51 = a2;
  v15 = a7 & 1;
  v16 = sub_2114E4F38();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = a3;
  v56 = a4;
  v59 = v15;
  v20 = sub_2114DA5C0(a3, a4, a5, a6, v15);
  v58 = sub_2114DA4CC(v20, v22, v21 & 1);
  v24 = v23;
  v25 = sub_2114D5FC8();
  swift_beginAccess();
  v53 = v17;
  v54 = v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v25, v16);
  swift_bridgeObjectRetain_n();
  v26 = sub_2114E4F20();
  v27 = sub_2114E5064();
  v28 = os_log_type_enabled(v26, v27);
  v57 = v24;
  v52 = a5;
  if (v28)
  {
    v29 = v59 != 0;
    v30 = swift_slowAlloc();
    v49 = v10;
    v31 = v30;
    v48 = swift_slowAlloc();
    v64 = v48;
    *(_DWORD *)v31 = 136315650;
    v61 = a5;
    v62 = a6;
    v63 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB3680);
    v32 = sub_2114E4F68();
    v61 = sub_2114D48F8(v32, v33, &v64);
    sub_2114E5094();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    v34 = sub_2114E507C();
    v61 = sub_2114D48F8(v34, v35, &v64);
    sub_2114E5094();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 22) = 2080;
    swift_bridgeObjectRetain();
    v61 = sub_2114D48F8(v60, a9, &v64);
    sub_2114E5094();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2114B8000, v26, v27, "Notify script replacement: range = %s, translated range = %s string = \"%s\"", (uint8_t *)v31, 0x20u);
    v36 = v48;
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v36, -1, -1);
    v37 = v31;
    v10 = v49;
    MEMORY[0x212BDB5C4](v37, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v53 + 8))(v19, v54);
  v38 = sub_2114E4F98();
  v39 = v57;
  if (v59)
    goto LABEL_7;
  v40 = sub_2114E4F98();
  if (!__OFADD__(v52, v40))
  {
    v38 = sub_2114DA570(v50, v51, v52 + v40);
LABEL_7:
    v41 = v38;
    v42 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    v43 = sub_2114E4EFC();
    v44 = objc_allocWithZone((Class)BRLTScriptString);
    v45 = (void *)sub_2114E4F50();
    swift_bridgeObjectRelease();
    v46 = objc_msgSend(v44, sel_initWithString_selection_, v45, v43, 0);

    objc_msgSend(v42, sel_replaceScriptStringRange_withScriptString_cursorLocation_, v58, v39, v46, v41);
    return;
  }
  __break(1u);
}

void sub_2114E2E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v9 = sub_2114DA570(a1, a2, a4);
  v10 = sub_2114DA570(a1, a2, a3);
  v11 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
    __break(1u);
    goto LABEL_6;
  }
  v12 = v10;
  v13 = v9 - v11;
  if (__OFSUB__(v9, v11))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v9 >= v13)
  {
    v14 = sub_2114DA4CC(v13, v9, 0);
    v16 = v15;
    v17 = *(void **)(v4 + 16);
    v18 = objc_msgSend(objc_allocWithZone((Class)BRLTScriptString), sel_init);
    objc_msgSend(v17, sel_replaceScriptStringRange_withScriptString_cursorLocation_, v14, v16, v18, v12);

    return;
  }
LABEL_7:
  __break(1u);
}

void sub_2114E2F70()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(v0 + 16);
  v2 = (void *)sub_2114E4F50();
  v3 = (id)sub_2114E4F50();
  objc_msgSend(v1, sel_requestSpeech_language_, v2, v3);

}

uint64_t sub_2114E2FDC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_2114E2FF8()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BRLTJStateNotifier()
{
  return objc_opt_self();
}

uint64_t sub_2114E303C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__stageScript);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2114E3074@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xE8))();
  *a2 = result;
  return result;
}

uint64_t sub_2114E30B4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_2114E3100()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_2114E3144(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id BRLTJCandidateManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id BRLTJCandidateManager.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  void *v3;
  char *v4;
  uint64_t v5;
  objc_super v7;

  v1 = OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra] = 0;
  v2 = &v0[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__stageScript];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0xE000000000000000;
  v3 = *(void **)&v0[v1];
  *(_QWORD *)&v0[v1] = 0;
  v4 = v0;

  v5 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v4[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_candidateList] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v4[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_analysisStringList] = v5;
  *(_QWORD *)&v4[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex] = 0;
  v4[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__isActive] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for BRLTJCandidateManager();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for BRLTJCandidateManager()
{
  return objc_opt_self();
}

uint64_t sub_2114E329C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__isActive);
}

void *sub_2114E32AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  void *v7;
  char **v8;
  char *v9;
  char **v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *result;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;

  *(_BYTE *)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__isActive) = 1;
  v5 = objc_msgSend(objc_allocWithZone((Class)BRLTJMecabraWrapper), sel_init);
  v6 = OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra;
  v7 = *(void **)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra) = v5;

  v8 = (char **)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_candidateList);
  swift_beginAccess();
  v9 = (char *)MEMORY[0x24BEE4AF8];
  *v8 = (char *)MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v10 = (char **)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_analysisStringList);
  swift_beginAccess();
  *v10 = v9;
  swift_bridgeObjectRelease();
  v11 = (_QWORD *)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
  swift_beginAccess();
  *v11 = 0;
  v12 = (_QWORD *)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__stageScript);
  *v12 = a1;
  v12[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (sub_2114E4F98() < 33)
  {
    result = (void *)swift_bridgeObjectRetain();
  }
  else
  {
    sub_2114E4FBC();
    swift_bridgeObjectRetain();
    v13 = sub_2114E5004();
    v15 = v14;
    v17 = v16;
    v19 = v18;
    swift_bridgeObjectRelease();
    MEMORY[0x212BDAD78](v13, v15, v17, v19);
    result = (void *)swift_bridgeObjectRelease();
  }
  v21 = *(void **)(v2 + v6);
  if (!v21)
  {
    __break(1u);
    goto LABEL_29;
  }
  v22 = v21;
  v23 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_analyzeString_, v23);

  result = *(void **)(v2 + v6);
  if (!result)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (!objc_msgSend(result, sel_moveToNextCandidate))
  {
    swift_beginAccess();
    v42 = *v8;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v8 = v42;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v42 = sub_2114CA2A4(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
      *v8 = v42;
    }
    v45 = *((_QWORD *)v42 + 2);
    v44 = *((_QWORD *)v42 + 3);
    if (v45 >= v44 >> 1)
    {
      v42 = sub_2114CA2A4((char *)(v44 > 1), v45 + 1, 1, v42);
      *v8 = v42;
    }
    *((_QWORD *)v42 + 2) = v45 + 1;
    v46 = &v42[16 * v45];
    *((_QWORD *)v46 + 4) = 0;
    *((_QWORD *)v46 + 5) = 0xE000000000000000;
    swift_endAccess();
    swift_beginAccess();
    v47 = *v10;
    swift_bridgeObjectRetain();
    v48 = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v47;
    if ((v48 & 1) == 0)
    {
      v47 = sub_2114CA2A4(0, *((_QWORD *)v47 + 2) + 1, 1, v47);
      *v10 = v47;
    }
    v50 = *((_QWORD *)v47 + 2);
    v49 = *((_QWORD *)v47 + 3);
    if (v50 >= v49 >> 1)
    {
      v47 = sub_2114CA2A4((char *)(v49 > 1), v50 + 1, 1, v47);
      *v10 = v47;
    }
    *((_QWORD *)v47 + 2) = v50 + 1;
    v51 = &v47[16 * v50];
    *((_QWORD *)v51 + 4) = a1;
    *((_QWORD *)v51 + 5) = a2;
    return (void *)swift_endAccess();
  }
  result = *(void **)(v2 + v6);
  if (!result)
    goto LABEL_30;
  v24 = objc_msgSend(result, sel_getCurrentCandidateSurface);
  v25 = sub_2114E4F5C();
  v27 = v26;

  swift_beginAccess();
  v28 = *v8;
  v29 = swift_isUniquelyReferenced_nonNull_native();
  *v8 = v28;
  if ((v29 & 1) == 0)
  {
    v28 = sub_2114CA2A4(0, *((_QWORD *)v28 + 2) + 1, 1, v28);
    *v8 = v28;
  }
  v31 = *((_QWORD *)v28 + 2);
  v30 = *((_QWORD *)v28 + 3);
  if (v31 >= v30 >> 1)
  {
    v28 = sub_2114CA2A4((char *)(v30 > 1), v31 + 1, 1, v28);
    *v8 = v28;
  }
  *((_QWORD *)v28 + 2) = v31 + 1;
  v32 = &v28[16 * v31];
  *((_QWORD *)v32 + 4) = v25;
  *((_QWORD *)v32 + 5) = v27;
  swift_endAccess();
  result = *(void **)(v2 + v6);
  if (result)
  {
    v33 = objc_msgSend(result, sel_getCurrentCandidateAnalysisString);
    v34 = sub_2114E4F5C();
    v36 = v35;

    swift_beginAccess();
    v37 = *v10;
    v38 = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v37;
    if ((v38 & 1) == 0)
    {
      v37 = sub_2114CA2A4(0, *((_QWORD *)v37 + 2) + 1, 1, v37);
      *v10 = v37;
    }
    v40 = *((_QWORD *)v37 + 2);
    v39 = *((_QWORD *)v37 + 3);
    if (v40 >= v39 >> 1)
    {
      v37 = sub_2114CA2A4((char *)(v39 > 1), v40 + 1, 1, v37);
      *v10 = v37;
    }
    *((_QWORD *)v37 + 2) = v40 + 1;
    v41 = &v37[16 * v40];
    *((_QWORD *)v41 + 4) = v34;
    *((_QWORD *)v41 + 5) = v36;
    return (void *)swift_endAccess();
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_2114E3794()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__isActive) = 0;
  v1 = *(void **)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra) = 0;

  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__stageScript);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2114E37DC()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t sub_2114E37F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char **v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char **v25;
  char *v26;
  char v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;

  v1 = sub_2114E4F38();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))(v3);
  v7 = (char **)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_candidateList);
  swift_beginAccess();
  if (v6 != *((_QWORD *)*v7 + 2) - 1)
    return 1;
  v8 = OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra;
  v9 = *(void **)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra);
  if (v9 && objc_msgSend(v9, sel_moveToNextCandidate))
  {
    result = *(_QWORD *)((char *)v0 + v8);
    if (result)
    {
      v11 = objc_msgSend((id)result, sel_getCurrentCandidateSurface);
      v12 = sub_2114E4F5C();
      v14 = v13;

      swift_beginAccess();
      v15 = *v7;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v7 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v15 = sub_2114CA2A4(0, *((_QWORD *)v15 + 2) + 1, 1, v15);
        *v7 = v15;
      }
      v18 = *((_QWORD *)v15 + 2);
      v17 = *((_QWORD *)v15 + 3);
      v19 = v18 + 1;
      if (v18 >= v17 >> 1)
      {
        v37 = v18 + 1;
        v35 = sub_2114CA2A4((char *)(v17 > 1), v18 + 1, 1, v15);
        v19 = v37;
        v15 = v35;
        *v7 = v35;
      }
      *((_QWORD *)v15 + 2) = v19;
      v20 = &v15[16 * v18];
      *((_QWORD *)v20 + 4) = v12;
      *((_QWORD *)v20 + 5) = v14;
      swift_endAccess();
      result = *(_QWORD *)((char *)v0 + v8);
      if (result)
      {
        v21 = objc_msgSend((id)result, sel_getCurrentCandidateAnalysisString);
        v22 = sub_2114E4F5C();
        v24 = v23;

        v25 = (char **)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_analysisStringList);
        swift_beginAccess();
        v26 = *v25;
        v27 = swift_isUniquelyReferenced_nonNull_native();
        *v25 = v26;
        if ((v27 & 1) == 0)
        {
          v26 = sub_2114CA2A4(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
          *v25 = v26;
        }
        v29 = *((_QWORD *)v26 + 2);
        v28 = *((_QWORD *)v26 + 3);
        if (v29 >= v28 >> 1)
        {
          v26 = sub_2114CA2A4((char *)(v28 > 1), v29 + 1, 1, v26);
          *v25 = v26;
        }
        *((_QWORD *)v26 + 2) = v29 + 1;
        v30 = &v26[16 * v29];
        *((_QWORD *)v30 + 4) = v22;
        *((_QWORD *)v30 + 5) = v24;
        swift_endAccess();
        return 1;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    v31 = sub_2114D5FC8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v31, v1);
    v32 = sub_2114E4F20();
    v33 = sub_2114E5064();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2114B8000, v32, v33, "Candidate Manager: no more candidates", v34, 2u);
      MEMORY[0x212BDB5C4](v34, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  return result;
}

uint64_t sub_2114E3B38()
{
  _QWORD *v0;
  uint64_t result;
  _QWORD *v2;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
  if ((result & 1) != 0)
  {
    v2 = (_QWORD *)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
    result = swift_beginAccess();
    if (__OFADD__(*v2, 1))
      __break(1u);
    else
      ++*v2;
  }
  return result;
}

BOOL sub_2114E3BAC()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))() > 0;
}

uint64_t sub_2114E3BE0()
{
  _QWORD *v0;
  uint64_t result;
  _QWORD *v2;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
  if ((result & 1) != 0)
  {
    v2 = (_QWORD *)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
    result = swift_beginAccess();
    if (__OFSUB__(*v2, 1))
      __break(1u);
    else
      --*v2;
  }
  return result;
}

uint64_t sub_2114E3C54()
{
  _QWORD *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
  v2 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_2114E4F50();
  v4 = objc_msgSend(v1, sel_descriptionOfWord_forLanguage_, v2, v3);

  if (!v4)
    return 0;
  v5 = sub_2114E4F5C();

  return v5;
}

uint64_t sub_2114E3D3C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = sub_2114E4F38();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(objc_allocWithZone((Class)BRLTJJapaneseProcessor), sel_init);
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
  v6 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_spacedYomiOfWordDescription_, v6);

  v8 = sub_2114E4F5C();
  v10 = v9;

  v11 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v11, v1);
  swift_bridgeObjectRetain_n();
  v12 = sub_2114E4F20();
  v13 = sub_2114E5064();
  if (os_log_type_enabled(v12, v13))
  {
    v20 = v1;
    v14 = swift_slowAlloc();
    v19 = v5;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v22 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    v21 = sub_2114D48F8(v8, v10, &v22);
    sub_2114E5094();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2114B8000, v12, v13, "Candidate Manager: current description = '%s'", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v16, -1, -1);
    MEMORY[0x212BDB5C4](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v8;
}

uint64_t sub_2114E3FC4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = sub_2114E4F38();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))(v3);
  v7 = (char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_candidateList;
  result = swift_beginAccess();
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v6 >= *(_QWORD *)(*(_QWORD *)v7 + 16))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v9 = *(_QWORD *)v7 + 16 * v6;
  v10 = *(_QWORD *)(v9 + 32);
  v11 = *(_QWORD *)(v9 + 40);
  swift_bridgeObjectRetain();
  v12 = sub_2114D5FC8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v12, v1);
  swift_bridgeObjectRetain_n();
  v13 = sub_2114E4F20();
  v14 = sub_2114E5064();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v19 = v1;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v21 = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    v20 = sub_2114D48F8(v10, v11, &v21);
    sub_2114E5094();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2114B8000, v13, v14, "Candidate Manager: current candidate = '%s'", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDB5C4](v17, -1, -1);
    MEMORY[0x212BDB5C4](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v19);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return v10;
}

void sub_2114E421C()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(void);
  id v3;
  id v4;

  v1 = *(void **)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra);
  if (v1)
  {
    v2 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168);
    v3 = v1;
    v2();
    v4 = (id)sub_2114E4F50();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_learnCandidate_, v4);

  }
}

uint64_t sub_2114E42BC()
{
  _QWORD *v0;
  _QWORD *v1;
  void (*v2)(void);
  uint64_t v3;
  unint64_t v4;
  char *v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v2 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98);
  v2();
  v2();
  v3 = swift_bridgeObjectRelease();
  v4 = (*(uint64_t (**)(uint64_t))((*v1 & *v0) + 0xE8))(v3);
  v5 = (char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_analysisStringList;
  result = swift_beginAccess();
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 < *(_QWORD *)(*(_QWORD *)v5 + 16))
  {
    swift_bridgeObjectRetain();
    sub_2114E4F98();
    swift_bridgeObjectRelease();
    v7 = sub_2114E4FBC();
    v8 = swift_bridgeObjectRelease();
    v9 = ((uint64_t (*)(uint64_t))v2)(v8);
    v11 = sub_2114C8CF8(v7, v9, v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    swift_bridgeObjectRelease();
    v18 = MEMORY[0x212BDAD78](v11, v13, v15, v17);
    swift_bridgeObjectRelease();
    return v18;
  }
  __break(1u);
  return result;
}

id BRLTJCandidateManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTJCandidateManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2114E44A4()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x98))();
}

uint64_t sub_2114E44DC()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x118))() & 1;
}

uint64_t sub_2114E4518()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0xE8))();
}

uint64_t sub_2114E4550()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x120))();
}

uint64_t sub_2114E4588()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x128))();
}

uint64_t sub_2114E45C0()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x138))() & 1;
}

uint64_t sub_2114E45FC()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x140))();
}

uint64_t sub_2114E4634()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x148))() & 1;
}

uint64_t sub_2114E4670()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x150))();
}

uint64_t sub_2114E46A8()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x158))();
}

uint64_t sub_2114E46E0()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x160))();
}

uint64_t sub_2114E4718()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x168))();
}

uint64_t sub_2114E4750()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x170))();
}

uint64_t sub_2114E4788()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x180))();
}

uint64_t method lookup function for BRLTJCandidateManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BRLTJCandidateManager.stageScript.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.currentIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.isActive.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.activate(stageScript:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.deactivate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.hasNext.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.moveToNext()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.hasPrevious.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.moveToPrevious()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.currentRawDescription.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.currentDescription.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.currentCandidate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.learnCurrentCandidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.stageRemainder.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

void BRLTTranslatorClassIsValid_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2114B8000, a2, OS_LOG_TYPE_ERROR, "%@ doesn't conform to BRLTTranslatorProtocol", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_2114E4EFC()
{
  return MEMORY[0x24BDCAF20]();
}

uint64_t sub_2114E4F08()
{
  return MEMORY[0x24BDCB618]();
}

uint64_t sub_2114E4F14()
{
  return MEMORY[0x24BDCB748]();
}

uint64_t sub_2114E4F20()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2114E4F2C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2114E4F38()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2114E4F44()
{
  return MEMORY[0x24BDCF838]();
}

uint64_t sub_2114E4F50()
{
  return MEMORY[0x24BDCF9E8]();
}

uint64_t sub_2114E4F5C()
{
  return MEMORY[0x24BDCFA20]();
}

uint64_t sub_2114E4F68()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2114E4F74()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2114E4F80()
{
  return MEMORY[0x24BEE0A68]();
}

uint64_t sub_2114E4F8C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2114E4F98()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2114E4FA4()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_2114E4FB0()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_2114E4FBC()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_2114E4FC8()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_2114E4FD4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2114E4FE0()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_2114E4FEC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2114E4FF8()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_2114E5004()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2114E5010()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2114E501C()
{
  return MEMORY[0x24BDCFBD0]();
}

uint64_t sub_2114E5028()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2114E5034()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2114E5040()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2114E504C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2114E5058()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2114E5064()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2114E5070()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2114E507C()
{
  return MEMORY[0x24BDD0268]();
}

uint64_t sub_2114E5088()
{
  return MEMORY[0x24BEE1E58]();
}

uint64_t sub_2114E5094()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2114E50A0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2114E50AC()
{
  return MEMORY[0x24BDD0540]();
}

uint64_t sub_2114E50B8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2114E50C4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2114E50D0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2114E50DC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2114E50E8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2114E50F4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2114E5100()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2114E510C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2114E5118()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2114E5124()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2114E5130()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2114E513C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2114E5148()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2114E5154()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2114E5160()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2114E516C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t AXBrailleTablesDirectory()
{
  return MEMORY[0x24BDFDF78]();
}

uint64_t BRLLogTranslation()
{
  return MEMORY[0x24BDFE440]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x24BE1B200]();
}

uint64_t CEMEmojiTokenCopyName()
{
  return MEMORY[0x24BE1B240]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithLocaleAndBlock()
{
  return MEMORY[0x24BE1B270]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x24BDBC708](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x24BDBC728](tokenizer, string, range.location, range.length);
}

uint64_t MecabraAcceptInlineCandidates()
{
  return MEMORY[0x24BEDC620]();
}

uint64_t MecabraAnalyzeStringWithContext()
{
  return MEMORY[0x24BEDC628]();
}

uint64_t MecabraCandidateGetAnalysisString()
{
  return MEMORY[0x24BEDC640]();
}

uint64_t MecabraCandidateGetSurface()
{
  return MEMORY[0x24BEDC658]();
}

uint64_t MecabraContextAddInlineCandidate()
{
  return MEMORY[0x24BEDC6C8]();
}

uint64_t MecabraContextCreateMutable()
{
  return MEMORY[0x24BEDC6D0]();
}

uint64_t MecabraContextRelease()
{
  return MEMORY[0x24BEDC6D8]();
}

uint64_t MecabraCreateWithOptions()
{
  return MEMORY[0x24BEDC728]();
}

uint64_t MecabraGetNextCandidate()
{
  return MEMORY[0x24BEDC740]();
}

uint64_t MecabraRelease()
{
  return MEMORY[0x24BEDC780]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFStringTokenizerGetCurrentTokenPartOfSpeech()
{
  return MEMORY[0x24BDBD0B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

