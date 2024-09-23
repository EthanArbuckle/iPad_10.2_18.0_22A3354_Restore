id CreateTablesAndIndexes()
{
  if (CreateTablesAndIndexes_onceToken != -1)
    dispatch_once(&CreateTablesAndIndexes_onceToken, &__block_literal_global);
  return (id)CreateTablesAndIndexes__ddlCreateTables;
}

id DropTablesAndIndexes()
{
  if (DropTablesAndIndexes_onceToken != -1)
    dispatch_once(&DropTablesAndIndexes_onceToken, &__block_literal_global_49);
  return (id)DropTablesAndIndexes__ddlDropTables;
}

void sub_23B4A5B48(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_23B4A8748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B4A8C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B4A9270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B4AB814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_23B4AC114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23B4ACBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23B4AD6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

void sub_23B4B00E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B4B0244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B4B05C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v30 - 160), 8);
  _Block_object_dispose((const void *)(v30 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_23B4B0F70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_23B4B1670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B4B211C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;
  uint64_t v69;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 256), 8);
  _Block_object_dispose((const void *)(v69 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_23B4B3384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;
  uint64_t v69;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_23B4B43F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B4B49F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_23B4B4B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_23B4B5AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_23B4B5C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FinHealthLogObject(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = FinHealthLogObject___once;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&FinHealthLogObject___once, &__block_literal_global_0);
  FinHealthLogFacilities();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", v2);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = v4;
  return (id)FinHealthLogObject_logObjects[v5];
}

id FinHealthLogFacilities()
{
  if (FinHealthLogFacilities___once != -1)
    dispatch_once(&FinHealthLogFacilities___once, &__block_literal_global_8);
  return (id)FinHealthLogFacilities_logFacilities;
}

void sub_23B4B83A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t FHTransactionTimeOfDayFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("EarlyMorning")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Morning")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Daytime")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Evening")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Nighttime")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *FHTransactionTimeOfDayToString(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("unknown");
  else
    return off_250C66C68[a1];
}

__CFString *FHTransactionRepeatingPatternClassToFHSmartFeature(uint64_t a1)
{
  __CFString **v1;
  __CFString *v2;
  __CFString *result;

  switch(a1)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      v1 = &FHSmartFeatureAggregateTypeRecurring;
      goto LABEL_3;
    case 1:
      v1 = &FHSmartFeatureAggregateTypeRegular;
      goto LABEL_3;
    case 2:
      v1 = &FHSmartFeatureAggregateTypeIrregular;
LABEL_3:
      v2 = *v1;
      goto LABEL_4;
    case 11:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 11);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      result = v2;
      break;
    default:
      result = (__CFString *)0;
      break;
  }
  return result;
}

id loadConfigurationFromJsonFile(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_23B4A2000, v5, OS_LOG_TYPE_DEBUG, "bundle path: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:inDirectory:", v2, CFSTR("json"), CFSTR("FeaturesResources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id FHSmartFeaturesDict()
{
  if (FHSmartFeaturesDict_onceToken != -1)
    dispatch_once(&FHSmartFeaturesDict_onceToken, &__block_literal_global_1);
  return (id)FHSmartFeaturesDict_fhSmartFeaturesDict;
}

id FHMerchantSmartFeaturesArray()
{
  if (FHMerchantSmartFeaturesArray_onceToken != -1)
    dispatch_once(&FHMerchantSmartFeaturesArray_onceToken, &__block_literal_global_107);
  return (id)FHMerchantSmartFeaturesArray__fhSmartFeatures;
}

id FHAmountSmartFeaturesArray()
{
  if (FHAmountSmartFeaturesArray_onceToken != -1)
    dispatch_once(&FHAmountSmartFeaturesArray_onceToken, &__block_literal_global_108);
  return (id)FHAmountSmartFeaturesArray__fhSmartFeatures;
}

id FHDateTimeSmartFeaturesArray()
{
  if (FHDateTimeSmartFeaturesArray_onceToken != -1)
    dispatch_once(&FHDateTimeSmartFeaturesArray_onceToken, &__block_literal_global_109);
  return (id)FHDateTimeSmartFeaturesArray__fhSmartFeatures;
}

id FHRepeatingAggregateFeatureSet()
{
  if (FHRepeatingAggregateFeatureSet_onceToken != -1)
    dispatch_once(&FHRepeatingAggregateFeatureSet_onceToken, &__block_literal_global_110);
  return (id)FHRepeatingAggregateFeatureSet__fhSmartFeatures;
}

id FHMultiClassPredictionsSmartFeaturesArray()
{
  if (FHMultiClassPredictionsSmartFeaturesArray_onceToken != -1)
    dispatch_once(&FHMultiClassPredictionsSmartFeaturesArray_onceToken, &__block_literal_global_112);
  return (id)FHMultiClassPredictionsSmartFeaturesArray__fhSmartFeatures;
}

id FHMultiClassPredictionsSmartFeaturesAsString()
{
  if (FHMultiClassPredictionsSmartFeaturesAsString_onceToken != -1)
    dispatch_once(&FHMultiClassPredictionsSmartFeaturesAsString_onceToken, &__block_literal_global_114);
  return (id)FHMultiClassPredictionsSmartFeaturesAsString__commaSeparatedBinaryPredictionsSmartFeatures;
}

id FHApplicationToTagsMapping()
{
  if (FHApplicationToTagsMapping_onceToken != -1)
    dispatch_once(&FHApplicationToTagsMapping_onceToken, &__block_literal_global_120);
  return (id)FHApplicationToTagsMapping_fhFeaturesForApplications;
}

id FHApplications()
{
  if (FHApplications_onceToken != -1)
    dispatch_once(&FHApplications_onceToken, &__block_literal_global_123);
  return (id)FHApplications_fhApplications;
}

id FHCleanSuperMerchants()
{
  if (FHCleanSuperMerchants_onceToken != -1)
    dispatch_once(&FHCleanSuperMerchants_onceToken, &__block_literal_global_124);
  return (id)FHCleanSuperMerchants_fhSuperMerchants;
}

id FHSuperMerchants()
{
  if (FHSuperMerchants_onceToken != -1)
    dispatch_once(&FHSuperMerchants_onceToken, &__block_literal_global_143);
  return (id)FHSuperMerchants_fhSuperMerchants;
}

id getCleanMerchantName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("!@#$%^&*()_+|"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", &stru_250C67C70);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_250C67C70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id FHMerchantsUnaffectedBySource()
{
  if (FHMerchantsUnaffectedBySource_onceToken != -1)
    dispatch_once(&FHMerchantsUnaffectedBySource_onceToken, &__block_literal_global_167);
  return (id)FHMerchantsUnaffectedBySource_fhMerchantsUnaffectedBySource;
}

const __CFString *FHApplicationFromProcessName(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("passd")) & 1) != 0)
  {
    v2 = CFSTR("Search");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PassKitUI")) & 1) != 0)
  {
    v2 = CFSTR("Payment Ring");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("engagementd")) & 1) != 0)
  {
    v2 = CFSTR("Messaging");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("finhealth_client")))
  {
    v2 = CFSTR("Test Client");
  }
  else
  {
    v2 = CFSTR("unknown Client");
  }

  return v2;
}

id FHPeerPaymentForecastingSignalPriority()
{
  if (FHPeerPaymentForecastingSignalPriority_onceToken != -1)
    dispatch_once(&FHPeerPaymentForecastingSignalPriority_onceToken, &__block_literal_global_182);
  return (id)FHPeerPaymentForecastingSignalPriority_peerPaymentForecastingSignalPriority;
}

uint64_t FHDataDirectory()
{
  return objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/FinHealth/"));
}

id FHModelDirectory()
{
  void *v0;
  void *v1;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/FinHealth/"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("/mlmodels/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id GetProcessingDate()
{
  if (GetProcessingDate_onceToken != -1)
    dispatch_once(&GetProcessingDate_onceToken, &__block_literal_global_197);
  return (id)GetProcessingDate_processingDate;
}

double TimeWindowToSeconds(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  switch(a1)
  {
    case 1:
      v3 = (double)0xFFFFFFFFFF895900;
      break;
    case 2:
      v3 = 31536000.0 * -0.5;
      break;
    case 3:
      v3 = -31536000.0;
      break;
    default:
      GetProcessingDate();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "timeIntervalSinceReferenceDate");
      v3 = -v2;

      break;
  }
  return v3;
}

uint64_t GetTimeOfDay(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v4);

  objc_msgSend(v6, "components:fromDate:", 636, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "hour");
  if (v8 > 0x18)
    v9 = 0;
  else
    v9 = qword_23B4D0128[v8];

  return v9;
}

const __CFString *FHMerchantCategoryToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("Unknown");
  else
    return off_250C66C98[a1 - 1];
}

uint64_t FHMerchantCategoryFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Food Drinks")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Shopping")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Travel")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Services")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Fun")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Health")) & 1) != 0)
  {
    v2 = 6;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Transport")))
  {
    v2 = 7;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *GetDayOfWeekFromSignalDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "component:fromDate:", 512, v2);

  if ((unint64_t)(v4 - 1) > 6)
    return CFSTR("UNKNOWN");
  else
    return off_250C66CD0[v4 - 1];
}

id GetPeriodicCategoryFromFrequency(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v1 = (objc_class *)MEMORY[0x24BDD1520];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 0, 0, 0, 0, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithInteger:", 86400);
  objc_msgSend(v2, "decimalNumberByDividingBy:withBehavior:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  if ((unint64_t)(v6 - 6) >= 3)
  {
    if ((unint64_t)(v6 - 13) >= 3)
    {
      if ((unint64_t)(v6 - 27) >= 7)
        v7 = 1;
      else
        v7 = 5;
    }
    else
    {
      v7 = 4;
    }
  }
  else
  {
    v7 = 3;
  }
  FHRecurringPeerPaymentPeriodicCategoryTypeToString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id FHDateFromNumberOfDays(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDBCE68];
  v4 = a1;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDay:", a2);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id FHStartOfYear(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 6, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FHStartOfLastYear(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setYear:", -1);
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v4, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  FHStartOfYear(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id FHDateStartOfWeek(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a1;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "component:fromDate:", 512, v4) != a2)
  {
    objc_msgSend(v5, "nextDateAfterDate:matchingUnit:value:options:", v4, 512, a2, 260);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  objc_msgSend(v5, "components:fromDate:", 28702, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id FHDateStartOfWeekOnMonday(void *a1)
{
  return FHDateStartOfWeek(a1, 2);
}

id FHDateStartOfLastMonth(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setMonth:", -1);
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v4, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  FHDateStartOfMonth(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id FHDateStartOfMonth(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 14, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FHDateByAddingMonths(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a1;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v6, "setMonth:", a2);
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id FHDateByAddingWeeks(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a1;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v6, "setDay:", 7 * a2);
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id FHDateEndOfMonth(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  FHDateByAddingMonths(a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FHDateStartOfMonth(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id FHDateEndOfWeekStartingOnMonday(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  FHDateStartOfWeek(a1, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FHDateByAddingWeeks(v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dateByAddingTimeInterval:", -1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t FHIsDateBetweenDates(void *a1, void *a2, void *a3, unsigned int a4, unsigned int a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v14 = a4 - 1;
    v15 = a5 - 1;
    v16 = objc_msgSend(v10, "compare:", v9) == v14 || objc_msgSend(v10, "compare:", v9) == -1;
    v17 = objc_msgSend(v12, "compare:", v9) == v15 || objc_msgSend(v12, "compare:", v9) == 1;
    v13 = v16 & v17;
  }

  return v13;
}

uint64_t FHNumberOfDaysBetweenDates(void *a1, void *a2, unsigned int a3)
{
  uint64_t v3;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v3 = -1;
  if (a1 && a2)
  {
    v6 = (void *)MEMORY[0x24BDBCE48];
    v7 = a2;
    v8 = a1;
    objc_msgSend(v6, "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v8, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v10, "day") + a3;
  }
  return v3;
}

uint64_t FHNumberOfDaysBetweenDatesInclusive(void *a1, void *a2)
{
  return FHNumberOfDaysBetweenDates(a1, a2, 1u);
}

id FHShuffledArray(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2 < 2)
  {
    v6 = (void *)objc_msgSend(v1, "copy");
  }
  else
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(v1, "mutableCopy");
    v5 = v3 - 1;
    do
    {
      objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", v5, arc4random() % v5);
      --v5;
    }
    while (v5);
    v6 = (void *)objc_msgSend(v4, "copy");

  }
  return v6;
}

uint64_t FHNumberOfDaysInMonthForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rangeOfUnit:inUnit:forDate:", 16, 8, v2);
  v5 = v4;

  return v5;
}

uint64_t FHEqualObjects(void *a1, void *a2)
{
  if (a1 && a2)
    return objc_msgSend(a1, "isEqual:", a2);
  else
    return a1 == a2;
}

uint64_t FHEqualStrings(void *a1, void *a2)
{
  if (a1 && a2)
    return objc_msgSend(a1, "isEqualToString:", a2);
  else
    return a1 == a2;
}

uint64_t FHPaymentRingSuggestionCategoryFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MinimumRemainingPayment")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LastPayment")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LastPaymentPlusMerchantCategory1")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LastPaymentPlusMerchantCategory2")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("NewPurchases")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInNineMonths")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInEightMonths")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInSevenMonths")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInSixMonths")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInFiveMonths")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInFourMonths")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInThreeMonths")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInTwoMonths")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInNineMonthsFromUtilization")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInSixMonthsFromUtilization")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInThreeMonthsFromUtilization")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInPlanCompletion")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RemainingStatementBalance")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CurrentBalance")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OneThirdOfCurrentBalance")) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OneSixthOfCurrentBalance")) & 1) != 0)
  {
    v2 = 21;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OneNinthOfCurrentBalance")) & 1) != 0)
  {
    v2 = 22;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInThreeMonthsForTransactor")) & 1) != 0)
  {
    v2 = 23;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInSixMonthsForTransactor")) & 1) != 0)
  {
    v2 = 24;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PayInNineMonthsForTransactor")) & 1) != 0)
  {
    v2 = 25;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OneThirdOfStatementBalance")) & 1) != 0)
  {
    v2 = 26;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OneSixthOfStatementBalance")) & 1) != 0)
  {
    v2 = 27;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OneNinthOfStatementBalance")) & 1) != 0)
  {
    v2 = 28;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AverageOfMinimumAndStatetmentBalance")) & 1) != 0)
  {
    v2 = 29;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CardBalance")) & 1) != 0)
  {
    v2 = 30;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CombinedBalance")) & 1) != 0)
  {
    v2 = 31;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("FHSmartFeatureAggregateTypeAmountVeryExpensive")) & 1) != 0)
  {
    v2 = 32;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("FHSmartFeatureAggregateTypeRecurring")) & 1) != 0)
  {
    v2 = 33;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("FHSmartFeatureAggregateTypeTopMerchant")) & 1) != 0)
  {
    v2 = 34;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("FHSmartFeatureCompoundTypeTripEvents")) & 1) != 0)
  {
    v2 = 35;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("FHSmartFeatureAggregateTypePeakSpend")) & 1) != 0)
  {
    v2 = 36;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Count")))
  {
    v2 = 37;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *FHPaymentRingSuggestionCategoryToString(unint64_t a1)
{
  if (a1 > 0x25)
    return CFSTR("unknown");
  else
    return off_250C66D08[a1];
}

void sub_23B4BE8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,char a28)
{
  uint64_t v28;

  _Block_object_dispose((const void *)(v28 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_23B4BEBA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_23B4BF6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  id *v57;

  objc_destroyWeak(v57);
  _Block_object_dispose(&a57, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23B4C03F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *FHRecurringPeerPaymentPeriodicCategoryTypeToString(uint64_t a1)
{
  __CFString *v1;
  __CFString *result;

  switch(a1)
  {
    case 1:
      v1 = CFSTR("not supported");
      goto LABEL_3;
    case 2:
      result = CFSTR("daily");
      break;
    case 3:
      result = CFSTR("weekly");
      break;
    case 4:
      result = CFSTR("biweekly");
      break;
    case 5:
      result = CFSTR("monthly");
      break;
    case 6:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FHRecurringPeerPaymentPeriodicCategoryTypeCount: %lu"), 6);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v1;
      break;
    default:
      result = CFSTR("unknown");
      break;
  }
  return result;
}

uint64_t FHRecurringPeerPaymentPeriodicCategoryTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("not supported")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("daily")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("weekly")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("biweekly")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("monthly")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t FHTransactionInternalStateFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Dirty")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RawConsistent")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UpdatedRealtime")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UpdatedBatch")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Consistent")) & 1) != 0)
  {
    v2 = 5;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Invalid")))
  {
    v2 = 6;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *FHTransactionInternalStateToString(uint64_t a1)
{
  __CFString *v1;
  __CFString *result;

  switch(a1)
  {
    case 1:
      v1 = CFSTR("Dirty");
      goto LABEL_3;
    case 2:
      result = CFSTR("RawConsistent");
      break;
    case 3:
      result = CFSTR("UpdatedRealtime");
      break;
    case 4:
      result = CFSTR("UpdatedBatch");
      break;
    case 5:
      result = CFSTR("Consistent");
      break;
    case 6:
      result = CFSTR("Invalid");
      break;
    case 7:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FHTransactionInternalStateCount: %lu"), 7);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v1;
      break;
    default:
      result = CFSTR("Unknown");
      break;
  }
  return result;
}

const __CFString *FHTransactionAccountTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_250C67998[a1 - 1];
}

uint64_t FHTransactionAccountTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PeerPayment")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Broadway")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Count")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *FHTransactionPeerPaymentSubtypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_250C679C0[a1 - 1];
}

uint64_t FHTransactionPeerPaymentSubtypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Send")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Receive")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Request")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Count")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

FHTransaction *TransactionFromPKPaymentTransaction(void *a1)
{
  void *v1;
  id v2;
  FHTransaction *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v40;
  NSObject *v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = objc_alloc_init(FHTransaction);
  if (!objc_opt_class())
    goto LABEL_20;
  v4 = v2;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setIdentifier:](v3, "setIdentifier:", v5);

  objc_msgSend(v4, "serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionServiceIdentifier:](v3, "setTransactionServiceIdentifier:", v6);

  objc_msgSend(v4, "paymentHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setPaymentHash:](v3, "setPaymentHash:", v7);

  objc_msgSend(v4, "transactionSourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionSourceIdentifier:](v3, "setTransactionSourceIdentifier:", v8);

  objc_msgSend(v4, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setAmount:](v3, "setAmount:", v9);

  objc_msgSend(v4, "currencyCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCurrencyCode:](v3, "setCurrencyCode:", v10);

  objc_msgSend(v4, "transactionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionDate:](v3, "setTransactionDate:", v11);

  objc_msgSend(v4, "transactionStatusChangedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionStatusChangedDate:](v3, "setTransactionStatusChangedDate:", v12);

  -[FHTransaction setTransactionStatus:](v3, "setTransactionStatus:", objc_msgSend(v4, "transactionStatus"));
  -[FHTransaction setTransactionSource:](v3, "setTransactionSource:", objc_msgSend(v4, "transactionSource"));
  -[FHTransaction setCardType:](v3, "setCardType:", objc_msgSend(v4, "cardType"));
  -[FHTransaction setTransactionType:](v3, "setTransactionType:", objc_msgSend(v4, "transactionType"));
  -[FHTransaction setAccountType:](v3, "setAccountType:", objc_msgSend(v4, "accountType"));
  objc_msgSend(v4, "altDSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setAltDSID:](v3, "setAltDSID:", v13);

  objc_msgSend(v4, "receiptIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setReceiptIdentifier:](v3, "setReceiptIdentifier:", v14);

  -[FHTransaction setTransactionInternalState:](v3, "setTransactionInternalState:", 0);
  objc_msgSend(v4, "timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTimeZone:](v3, "setTimeZone:", v15);

  objc_msgSend(v4, "merchant");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMerchantUniqueIdentifier:](v3, "setMerchantUniqueIdentifier:", v17);

  objc_msgSend(v4, "merchant");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setName:](v3, "setName:", v19);

  objc_msgSend(v4, "merchant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rawName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setRawName:](v3, "setRawName:", v21);

  objc_msgSend(v4, "merchant");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setIndustryCode:](v3, "setIndustryCode:", objc_msgSend(v22, "industryCode"));

  objc_msgSend(v4, "merchant");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "industryCategory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setIndustryCategory:](v3, "setIndustryCategory:", v24);

  objc_msgSend(v4, "merchant");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "displayName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setDisplayName:](v3, "setDisplayName:", v26);

  objc_msgSend(v4, "merchant");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rawCountry");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCountry:](v3, "setCountry:", v28);

  objc_msgSend(v4, "merchant");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCategory:](v3, "setCategory:", objc_msgSend(v29, "category"));

  objc_msgSend(v4, "merchant");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "detailedCategory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMerchantDetailedCategory:](v3, "setMerchantDetailedCategory:", v31);

  objc_msgSend(v4, "merchant");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "mapsMerchant");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMapsMerchantID:](v3, "setMapsMerchantID:", objc_msgSend(v33, "identifier"));

  objc_msgSend(v4, "merchant");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "mapsBrand");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMapsMerchantBrandID:](v3, "setMapsMerchantBrandID:", objc_msgSend(v35, "identifier"));

  objc_msgSend(v4, "merchant");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "mapsMerchant");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMapsMerchantResultProviderID:](v3, "setMapsMerchantResultProviderID:", objc_msgSend(v37, "resultProviderIdentifier"));

  objc_msgSend(v4, "merchant");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "mapsBrand");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMapsMerchantBrandResultProviderID:](v3, "setMapsMerchantBrandResultProviderID:", objc_msgSend(v39, "resultProviderIdentifier"));

  objc_msgSend(v4, "location");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setLocation:](v3, "setLocation:", v40);

  if (_os_feature_enabled_impl())
  {
    -[FHTransaction location](v3, "location");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      -[FHTransaction location](v3, "location");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "coordinate");
      if (v42 != 0.0)
        goto LABEL_14;
      -[FHTransaction location](v3, "location");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "coordinate");
      if (v43 != 0.0)
        goto LABEL_13;
    }
    -[FHTransaction country](v3, "country");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = (void *)v44;
      +[FHTransaction _allowedCountryNamesForMapsMerchant](FHTransaction, "_allowedCountryNamesForMapsMerchant");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHTransaction country](v3, "country");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "containsObject:", v47);

      if (v41)
      {

      }
      if ((v48 & 1) == 0)
        goto LABEL_16;
      objc_msgSend(v4, "merchant");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "mapsMerchant");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "location");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHTransaction setLocation:](v3, "setLocation:", v51);

      FinHealthLogObject(CFSTR("FinHealthCore"));
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        goto LABEL_15;
      -[FHTransaction location](v3, "location");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 138412290;
      v71 = v39;
      _os_log_impl(&dword_23B4A2000, v41, OS_LOG_TYPE_DEBUG, "FH_GEO_REVERSE_LOOKUP enabled, transaction.location is :%@", (uint8_t *)&v70, 0xCu);
LABEL_14:

LABEL_15:
      goto LABEL_16;
    }
    if (v41)
    {
LABEL_13:

      goto LABEL_14;
    }
  }
LABEL_16:
  objc_msgSend(v4, "merchant");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "mapsMerchant");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "postalAddress");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "street");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setStreet:](v3, "setStreet:", v55);

  objc_msgSend(v54, "ISOCountryCode");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCountryCode:](v3, "setCountryCode:", v56);

  if (-[FHTransaction transactionSource](v3, "transactionSource") == 1)
  {
    objc_msgSend(v54, "city");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setCity:](v3, "setCity:", v57);

    objc_msgSend(v54, "state");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setState:](v3, "setState:", v58);

    objc_msgSend(v54, "postalCode");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setZip:](v3, "setZip:", v59);
  }
  else
  {
    objc_msgSend(v4, "merchant");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "city");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setCity:](v3, "setCity:", v61);

    objc_msgSend(v4, "merchant");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "state");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setState:](v3, "setState:", v63);

    objc_msgSend(v4, "merchant");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "zip");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setZip:](v3, "setZip:", v64);

  }
  objc_msgSend(v4, "peerPaymentCounterpartHandle");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setPeerPaymentCounterpartHandle:](v3, "setPeerPaymentCounterpartHandle:", v65);

  -[FHTransaction setPeerPaymentType:](v3, "setPeerPaymentType:", objc_msgSend(v4, "peerPaymentType"));
  objc_msgSend(v4, "peerPaymentMemo");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionDescription:](v3, "setTransactionDescription:", v66);

  -[FHTransaction setRecurring:](v3, "setRecurring:", objc_msgSend(v4, "isRecurring"));
  -[FHTransaction setDisputeType:](v3, "setDisputeType:", objc_msgSend(v4, "disputeType"));
  -[FHTransaction setDisputeStatus:](v3, "setDisputeStatus:", objc_msgSend(v4, "disputeStatus"));
  objc_msgSend(v4, "disputeOpenDate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setDisputeOpenDate:](v3, "setDisputeOpenDate:", v67);

  objc_msgSend(v4, "disputeLastUpdatedDate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setDisputeLastUpdatedDate:](v3, "setDisputeLastUpdatedDate:", v68);

LABEL_20:
  return v3;
}

FHTransaction *TransactionFromArray(void *a1)
{
  id v1;
  FHTransaction *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  double v33;
  CLLocationDegrees v34;
  void *v35;
  double v36;
  CLLocationDegrees v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  CLLocationCoordinate2D v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  int v51;
  void *v52;
  void *v53;

  v1 = a1;
  v2 = objc_alloc_init(FHTransaction);
  v3 = (int)objc_msgSend(v1, "intAtIndex:", 6);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithInteger:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v1, "unsignedIntAtIndex:", 9));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v1, "unsignedIntAtIndex:", 11));
  objc_msgSend(v1, "stringAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setIdentifier:](v2, "setIdentifier:", v7);

  objc_msgSend(v1, "stringAtIndex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionServiceIdentifier:](v2, "setTransactionServiceIdentifier:", v8);

  objc_msgSend(v1, "stringAtIndex:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setFinanceTransactionIdentifier:](v2, "setFinanceTransactionIdentifier:", v9);

  objc_msgSend(v1, "stringAtIndex:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setPaymentHash:](v2, "setPaymentHash:", v10);

  objc_msgSend(v1, "stringAtIndex:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionSourceIdentifier:](v2, "setTransactionSourceIdentifier:", v11);

  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberByDividingBy:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setAmount:](v2, "setAmount:", v13);

  -[FHTransaction setAmountFromDatabase:](v2, "setAmountFromDatabase:", v3);
  objc_msgSend(v1, "stringAtIndex:", 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCurrencyCode:](v2, "setCurrencyCode:", v14);

  -[FHTransaction setTransactionDate:](v2, "setTransactionDate:", v5);
  -[FHTransaction setTransactionStatus:](v2, "setTransactionStatus:", (int)objc_msgSend(v1, "intAtIndex:", 10));
  -[FHTransaction setTransactionStatusChangedDate:](v2, "setTransactionStatusChangedDate:", v6);
  -[FHTransaction setTransactionSource:](v2, "setTransactionSource:", (int)objc_msgSend(v1, "intAtIndex:", 12));
  -[FHTransaction setCardType:](v2, "setCardType:", (int)objc_msgSend(v1, "intAtIndex:", 13));
  -[FHTransaction setTransactionType:](v2, "setTransactionType:", (int)objc_msgSend(v1, "intAtIndex:", 14));
  -[FHTransaction setAccountType:](v2, "setAccountType:", (int)objc_msgSend(v1, "intAtIndex:", 15));
  objc_msgSend(v1, "stringAtIndex:", 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setAltDSID:](v2, "setAltDSID:", v15);

  objc_msgSend(v1, "stringAtIndex:", 17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setReceiptIdentifier:](v2, "setReceiptIdentifier:", v16);

  -[FHTransaction setTransactionInternalState:](v2, "setTransactionInternalState:", (int)objc_msgSend(v1, "intAtIndex:", 18));
  objc_msgSend(v1, "stringAtIndex:", 19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMerchantUniqueIdentifier:](v2, "setMerchantUniqueIdentifier:", v17);

  -[FHTransaction setIndustryCode:](v2, "setIndustryCode:", (int)objc_msgSend(v1, "intAtIndex:", 20));
  objc_msgSend(v1, "stringAtIndex:", 21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setName:](v2, "setName:", v18);

  objc_msgSend(v1, "stringAtIndex:", 22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setRawName:](v2, "setRawName:", v19);

  -[FHTransaction setCategory:](v2, "setCategory:", (int)objc_msgSend(v1, "intAtIndex:", 23));
  objc_msgSend(v1, "stringAtIndex:", 24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMerchantDetailedCategory:](v2, "setMerchantDetailedCategory:", v20);

  objc_msgSend(v1, "stringAtIndex:", 25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setDisplayName:](v2, "setDisplayName:", v21);

  objc_msgSend(v1, "stringAtIndex:", 26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setStreet:](v2, "setStreet:", v22);

  objc_msgSend(v1, "stringAtIndex:", 27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCity:](v2, "setCity:", v23);

  objc_msgSend(v1, "stringAtIndex:", 28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setState:](v2, "setState:", v24);

  objc_msgSend(v1, "stringAtIndex:", 29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setZip:](v2, "setZip:", v25);

  objc_msgSend(v1, "stringAtIndex:", 30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCountryCode:](v2, "setCountryCode:", v26);

  objc_msgSend(v1, "stringAtIndex:", 31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCountry:](v2, "setCountry:", v27);

  objc_msgSend(v1, "stringAtIndex:", 32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMapsMerchantID:](v2, "setMapsMerchantID:", objc_msgSend(v28, "longLongValue"));

  -[FHTransaction setMapsMerchantResultProviderID:](v2, "setMapsMerchantResultProviderID:", objc_msgSend(v1, "intAtIndex:", 33));
  objc_msgSend(v1, "stringAtIndex:", 34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMapsMerchantBrandID:](v2, "setMapsMerchantBrandID:", objc_msgSend(v29, "longLongValue"));

  -[FHTransaction setMapsMerchantBrandResultProviderID:](v2, "setMapsMerchantBrandResultProviderID:", objc_msgSend(v1, "intAtIndex:", 35));
  objc_msgSend(v1, "stringAtIndex:", 42);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setPeerPaymentCounterpartHandle:](v2, "setPeerPaymentCounterpartHandle:", v30);

  -[FHTransaction setPeerPaymentType:](v2, "setPeerPaymentType:", (int)objc_msgSend(v1, "intAtIndex:", 43));
  objc_msgSend(v1, "stringAtIndex:", 44);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionDescription:](v2, "setTransactionDescription:", v31);

  -[FHTransaction setRecurring:](v2, "setRecurring:", objc_msgSend(v1, "intAtIndex:", 45) != 0);
  objc_msgSend(v1, "objectAtIndex:", 36);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleValue");
  v34 = v33;

  objc_msgSend(v1, "objectAtIndex:", 37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "doubleValue");
  v37 = v36;

  objc_msgSend(v1, "objectAtIndex:", 39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  v40 = v39;

  objc_msgSend(v1, "objectAtIndex:", 38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "doubleValue");
  v43 = v42;

  v44 = CLLocationCoordinate2DMake(v34, v37);
  if ((v34 != 0.0 || v37 != 0.0) && CLLocationCoordinate2DIsValid(v44))
  {
    v45 = objc_alloc(MEMORY[0x24BDBFA80]);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v45, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v46, v44.latitude, v44.longitude, 0.0, v40, v43);
    -[FHTransaction setLocation:](v2, "setLocation:", v47);

  }
  if (objc_msgSend(v1, "intAtIndex:", 8))
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", (int)objc_msgSend(v1, "intAtIndex:", 8));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setTimeZone:](v2, "setTimeZone:", v48);

  }
  -[FHTransaction setDisputeType:](v2, "setDisputeType:", (int)objc_msgSend(v1, "intAtIndex:", 40));
  -[FHTransaction setDisputeStatus:](v2, "setDisputeStatus:", (int)objc_msgSend(v1, "intAtIndex:", 41));
  v49 = objc_msgSend(v1, "unsignedIntAtIndex:", 46);
  v50 = objc_msgSend(v1, "unsignedIntAtIndex:", 47);
  if (v49 >= 1)
  {
    v51 = v50;
    if (v50 >= 1)
    {
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)v49);
      -[FHTransaction setDisputeOpenDate:](v2, "setDisputeOpenDate:", v52);

      v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)v51);
      -[FHTransaction setDisputeLastUpdatedDate:](v2, "setDisputeLastUpdatedDate:", v53);

    }
  }

  return v2;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x24BEDDEF8]();
}

uint64_t _sqlite3_integrity_check()
{
  return MEMORY[0x24BEDDF00]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x24BEDCE68](cls, outCount);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x24BEDCF08](v);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x24BEDE278](*(_QWORD *)&a1);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

