@implementation StepByStepUtilities

+ (unsigned)getProductIDFromParamDict:(id)a3
{
  const __CFString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  const char *v14;

  v4 = (const __CFString *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  if (v4)
    return sub_21A68E368(v4, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
  v13 = objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("kSBSKey_TargetNetwork"));
  return objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v14, v13);
}

+ (int)getDeviceKindFromParamDict:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  const char *v14;

  v4 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  if (v4)
    return sub_21A68E344(v4, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
  v13 = objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("kSBSKey_TargetNetwork"));
  return objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v14, v13);
}

+ (id)getProductLocalizedStringWithFormat:(id)a3 fromParamDict:(id)a4
{
  void *v7;
  uint64_t ProductIDFromParamDict;
  const char *v9;
  int DeviceKindFromParamDict;
  const __CFString *v11;
  const char *v12;
  uint64_t valid;

  v7 = (void *)MEMORY[0x24BDD17C8];
  ProductIDFromParamDict = objc_msgSend_getProductIDFromParamDict_(a1, a2, (uint64_t)a4);
  DeviceKindFromParamDict = objc_msgSend_getDeviceKindFromParamDict_(a1, v9, (uint64_t)a4);
  v11 = sub_21A690D10(ProductIDFromParamDict, DeviceKindFromParamDict);
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v7, v12, (uint64_t)a3, CFSTR("%@"), 0, v11);
  if (valid)
    return (id)sub_21A690C10(valid, qword_2550F4DE8);
  else
    return &stru_24DD08368;
}

+ (id)findSourceBaseByName:(id)a3 fromParamDict:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("kSBSKey_BrowseRecordList"), 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v20, 16);
  if (!v7)
    return 0;
  v9 = v7;
  v10 = *(_QWORD *)v17;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v10)
      objc_enumerationMutation(v5);
    v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
    v13 = (void *)objc_msgSend_objectForKey_(v12, v8, (uint64_t)CFSTR("name"));
    if ((objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3) & 1) != 0)
      return v12;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v16, v20, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (id)findSourceBaseByRadioName:(id)a3 fromParamDict:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("kSBSKey_BrowseRecordList"), 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v20, 16);
  if (!v7)
    return 0;
  v9 = v7;
  v10 = *(_QWORD *)v17;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v10)
      objc_enumerationMutation(v5);
    v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
    v13 = (void *)objc_msgSend_objectForKey_(v12, v8, (uint64_t)CFSTR("name"));
    if ((objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3) & 1) != 0)
      return v12;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v16, v20, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (id)findSourceNetworkByName:(id)a3 fromParamDict:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("kSBSKey_NetworkScanRecordList"), 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v20, 16);
  if (!v7)
    return 0;
  v9 = v7;
  v10 = *(_QWORD *)v17;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v10)
      objc_enumerationMutation(v5);
    v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
    v13 = (void *)objc_msgSend_objectForKey_(v12, v8, (uint64_t)CFSTR("SSID_STR"));
    if ((objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3) & 1) != 0)
      return v12;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v16, v20, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (id)findSourceConfigByName:(id)a3 fromParamDict:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("kSBSKey_PreviousConfigurationList"), 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v20, 16);
  if (!v7)
    return 0;
  v9 = v7;
  v10 = *(_QWORD *)v17;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v10)
      objc_enumerationMutation(v5);
    v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
    v13 = (void *)objc_msgSend_objectForKey_(v12, v8, (uint64_t)CFSTR("device"));
    if ((objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3) & 1) != 0)
      return v12;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v16, v20, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (id)selectorChoiceToReplaceOption:(int)a3
{
  if ((a3 - 311) > 3)
    return CFSTR("Restore");
  else
    return off_24DD079E0[a3 - 311];
}

+ (int64_t)selectorChoiceToMatrixTag:(int)a3
{
  int64_t v3;

  v3 = 1131570529;
  if (a3 == 200)
    v3 = 1165522021;
  if (a3 == 300)
    v3 = 1382379628;
  if (a3 == 400)
    return 1382380404;
  else
    return v3;
}

+ (int)matrixTagToSelectorChoice:(int64_t)a3
{
  int v3;

  if (a3 == 1165522021)
    v3 = 200;
  else
    v3 = 100;
  if (a3 == 1382379628)
    v3 = 300;
  if (a3 == 1382380404)
    return 400;
  else
    return v3;
}

+ (int64_t)autoGuessRecommendationToMatrixTag:(id)a3
{
  const char *v4;
  int64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;

  if ((objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("BSSetupRecommend_OfferCreate")) & 1) != 0)
    return 1131570529;
  v5 = 1165522021;
  if ((objc_msgSend_isEqualToString_(a3, v4, (uint64_t)CFSTR("BSSetupRecommend_OfferExtendOverEthernet")) & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("BSSetupRecommend_OfferExtendWirelessly")) & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("BSSetupRecommend_OfferJoinNetwork")) & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v8, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseBaseWired")) & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v9, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseBaseWireless")) & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v10, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseNetworkToJoin")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(a3, v11, (uint64_t)CFSTR("BSSetupRecommend_OfferReplace")) & 1) != 0)
      return 1382379628;
    v5 = 1131570529;
    if (objc_msgSend_isEqualToString_(a3, v12, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceConfiguration")))return 1382379628;
  }
  return v5;
}

+ (void)formatRecommendation:(id)a3 fromParamDict:(id)a4 forStep:(int)a5 restoreString:(id *)a6 restoreSpecificString:(id *)a7 dontRecommendString:(id *)a8
{
  id v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  char isEqualToString;
  void *v27;
  void *valid;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t ProductLocalizedStringWithFormat_fromParamDict;
  uint64_t v45;
  const char *v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  id *v59;

  v13 = a3;
  if (a3
    || (v14 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("kSBSKey_RestoreRecommendation")),
        (v13 = v14) != 0))
  {
    v59 = a8;
    v15 = (void *)objc_msgSend_objectForKey_(v13, a2, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
    v17 = (void *)objc_msgSend_objectForKey_(v13, v16, (uint64_t)CFSTR("BSAutoGuess_RestoreData"));
    v19 = (void *)objc_msgSend_objectForKey_(v13, v18, (uint64_t)CFSTR("BSAutoGuess_RestoreNetworkMode"));
    v22 = objc_msgSend_integerValue(v19, v20, v21);
    isEqualToString = objc_msgSend_isEqualToString_(v15, v23, (uint64_t)CFSTR("BSSetupRecommend_OfferRestore"));
    v27 = 0;
    if (v22 <= 2)
    {
      if (!v22)
      {
        if (objc_msgSend_length(v17, v24, v25))
        {
          if (a5 == 16)
            ProductLocalizedStringWithFormat_fromParamDict = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v43, (uint64_t)CFSTR("WillRestoreToCreateNetworkSpecific%@"), a4);
          else
            ProductLocalizedStringWithFormat_fromParamDict = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v43, (uint64_t)CFSTR("CanRestoreToCreateNetworkSpecific%@"), a4);
          v45 = sub_21A690C10(ProductLocalizedStringWithFormat_fromParamDict, qword_2550F4DE8);
          valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v46, v45, CFSTR("%@"), 0, v17);
        }
        else
        {
          valid = 0;
        }
        v49 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v43, (uint64_t)CFSTR("CanRestoreToCreateNetwork%@"), a4);
        goto LABEL_49;
      }
      valid = 0;
      if (v22 != 1)
        goto LABEL_50;
      if (objc_msgSend_length(v17, v24, v25))
      {
        if (a5 == 16)
          v33 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)CFSTR("WillRestoreToJoinNetworkSpecific%@"), a4);
        else
          v33 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)CFSTR("CanRestoreToJoinNetworkSpecific%@"), a4);
        v34 = sub_21A690C10(v33, qword_2550F4DE8);
        valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v35, v34, CFSTR("%@"), 0, v17);
      }
      else
      {
        valid = 0;
      }
      v47 = CFSTR("CanRestoreToJoinNetwork%@");
      v48 = CFSTR("WillRestoreToJoinNetwork%@");
    }
    else if (v22 == 3)
    {
      if (objc_msgSend_length(v17, v24, v25))
      {
        if (a5 == 16)
          v36 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)CFSTR("WillRestoreToWirelessDisabledSpecific%@"), a4);
        else
          v36 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)CFSTR("CanRestoreToWirelessDisabledSpecific%@"), a4);
        v37 = sub_21A690C10(v36, qword_2550F4DE8);
        valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v38, v37, CFSTR("%@"), 0, v17);
      }
      else
      {
        valid = 0;
      }
      v47 = CFSTR("CanRestoreToWirelessDisabled%@");
      v48 = CFSTR("WillRestoreToWirelessDisabled%@");
    }
    else
    {
      if (v22 == 10)
      {
        if (objc_msgSend_length(v17, v24, v25))
        {
          if (a5 == 16)
            v40 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v39, (uint64_t)CFSTR("WillRestoreToExtendNetworkSpecific%@"), a4);
          else
            v40 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v39, (uint64_t)CFSTR("CanRestoreToExtendNetworkSpecific%@"), a4);
          v41 = sub_21A690C10(v40, qword_2550F4DE8);
          valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v42, v41, CFSTR("%@"), 0, v17);
        }
        else
        {
          valid = 0;
        }
        v49 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v39, (uint64_t)CFSTR("CanRestoreToExtendNetwork%@"), a4);
        goto LABEL_49;
      }
      valid = 0;
      if (v22 != 20)
        goto LABEL_50;
      if (objc_msgSend_length(v17, v24, v25))
      {
        if (a5 == 16)
          v30 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)CFSTR("WillRestoreToExtendNetworkSpecific%@"), a4);
        else
          v30 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)CFSTR("CanRestoreToExtendNetworkSpecific%@"), a4);
        v31 = sub_21A690C10(v30, qword_2550F4DE8);
        valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v32, v31, CFSTR("%@"), 0, v17);
      }
      else
      {
        valid = 0;
      }
      v47 = CFSTR("CanRestoreToExtendNetwork%@");
      v48 = CFSTR("WillRestoreToExtendNetwork%@");
    }
    if (a5 == 16)
      v49 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)v48, a4);
    else
      v49 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)v47, a4);
LABEL_49:
    v27 = (void *)sub_21A690C10(v49, qword_2550F4DE8);
LABEL_50:
    if ((isEqualToString & 1) != 0)
    {
LABEL_51:
      v14 = 0;
      goto LABEL_61;
    }
    v50 = (void *)objc_msgSend_objectForKey_(v13, v24, (uint64_t)CFSTR("BSAutoGuess_NoRestoreReason"));
    v53 = objc_msgSend_integerValue(v50, v51, v52);
    switch(v53)
    {
      case 4:
        v58 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v54, (uint64_t)CFSTR("CannotRecommendRestoreDHCPRangeConflict%@"), a4);
        break;
      case 3:
        v58 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v54, (uint64_t)CFSTR("CannotRecommendRestoreDisabledNoWanLink%@"), a4);
        break;
      case 2:
        v14 = 0;
        if (v22 <= 0x14 && ((1 << v22) & 0x100402) != 0)
        {
          v55 = sub_21A690C10((uint64_t)CFSTR("CannotRecommendRestoreCantFindWiFi"), qword_2550F4DE8);
          v56 = sub_21A690C10((uint64_t)CFSTR("TextualSentenceConcatenator"), qword_2550F4DE8);
          v14 = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v57, v56, CFSTR("%@"), 0, v55);
        }
LABEL_61:
        a8 = v59;
        if (!a6)
          goto LABEL_63;
        goto LABEL_62;
      default:
        goto LABEL_51;
    }
    v14 = (void *)sub_21A690C10(v58, qword_2550F4DE8);
    goto LABEL_61;
  }
  v27 = 0;
  valid = 0;
  if (a6)
LABEL_62:
    *a6 = v27;
LABEL_63:
  if (a7)
    *a7 = valid;
  if (a8)
    *a8 = v14;
}

+ (id)nameForNetworkOrDevice:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  v4 = (void *)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("SSID_STR"));
  if (objc_msgSend_length(v4, v5, v6))
    return v4;
  else
    return (id)objc_msgSend_valueForKey_(a3, v7, (uint64_t)CFSTR("name"));
}

+ (id)productIDForNetworkOrDevice:(id)a3
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3);
  return (id)objc_msgSend_numberWithInteger_(v3, v5, v4);
}

@end
