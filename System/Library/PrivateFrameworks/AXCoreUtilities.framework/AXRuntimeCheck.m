@implementation AXRuntimeCheck

void __AXRuntimeCheck_HasANE_block_invoke()
{
  if (!AppleNeuralEngineLibraryCore_frameworkLibrary)
    AppleNeuralEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  if (AppleNeuralEngineLibraryCore_frameworkLibrary)
    AXRuntimeCheck_HasANE__hasANE = objc_msgSend(get_ANEDeviceInfoClass(), "hasANE");
}

uint64_t __AXRuntimeCheck_MauiSSEOnly_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_MauiSSEOnly__ffEnabled_MauiSSEOnly = result;
  return result;
}

void __AXRuntimeCheck_isANEDeviceH13plus_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  unint64_t v4;

  if (!AppleNeuralEngineLibraryCore_frameworkLibrary)
    AppleNeuralEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  if (AppleNeuralEngineLibraryCore_frameworkLibrary)
  {
    objc_msgSend(get_ANEDeviceInfoClass(), "aneSubType");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "uppercaseString");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("H"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    AXRuntimeCheck_isANEDeviceH13plus_isANEH13plus = v4 > 0xC;
  }
}

uint64_t __AXRuntimeCheck_SupportsMedina_block_invoke()
{
  uint64_t (*v0)(const __CFString *);
  uint64_t result;
  _Unwind_Exception *v2;
  _Unwind_Exception *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (uint64_t (*)(const __CFString *))getMGGetBoolAnswerSymbolLoc_ptr;
  v8 = getMGGetBoolAnswerSymbolLoc_ptr;
  if (!getMGGetBoolAnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getMGGetBoolAnswerSymbolLoc_block_invoke;
    v4[3] = &unk_1E28C1CB0;
    v4[4] = &v5;
    __getMGGetBoolAnswerSymbolLoc_block_invoke((uint64_t)v4);
    v0 = (uint64_t (*)(const __CFString *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    soft_AXSettingsLocalizedStringForKey_cold_1();
    v3 = v2;
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  result = v0(CFSTR("ExclaveCapability"));
  AXRuntimeCheck_SupportsMedina__supportsMedina = result;
  return result;
}

uint64_t __AXRuntimeCheck_SupportsMacAXV2_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SupportsMacAXV2__supportsMacAXV2 = result;
  return result;
}

void __AXRuntimeCheck_VoiceOverSupportsNeuralVoices_block_invoke()
{
  BOOL v0;

  if (_os_feature_enabled_impl())
  {
    if (AXRuntimeCheck_HasANE_onceToken != -1)
      dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_2);
    v0 = AXRuntimeCheck_HasANE__hasANE != 0;
  }
  else
  {
    v0 = 0;
  }
  AXRuntimeCheck_VoiceOverSupportsNeuralVoices__supportsMacAXV2 = v0;
}

uint64_t __AXRuntimeCheck_MauiSSE_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_MauiSSE__mauiSSE = result;
  return result;
}

uint64_t __AXRuntimeCheck_PerVoiceSettings_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_PerVoiceSettings__ffEnabled_PerVoiceSettings = result;
  return result;
}

uint64_t __AXRuntimeCheck_SiriSSEOnly_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SiriSSEOnly__ffEnabled_SiriSSEOnly = result;
  return result;
}

uint64_t __AXRuntimeCheck_SpeakUp_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SpeakUp__ffEnabled_SpeakUp = result;
  return result;
}

uint64_t __AXRuntimeCheck_MediaAnalysisSupport_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_MediaAnalysisSupport__supportsMediaAnalysisServices = result;
  return result;
}

void __AXRuntimeCheck_ScreenRecognitionSupport_block_invoke()
{
  BOOL v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "physicalMemory") < 0x77359400)
  {
    v0 = 0;
  }
  else
  {
    if (AXRuntimeCheck_HasANE_onceToken != -1)
      dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_2);
    v0 = AXRuntimeCheck_HasANE__hasANE != 0;
  }
  AXRuntimeCheck_ScreenRecognitionSupport__supportsScreenRecognition = v0;

}

uint64_t __AXRuntimeCheck_SupportsIncreaseBrightnessFloor_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SupportsIncreaseBrightnessFloor__supportsIncreaseBrightnessFloor = result;
  return result;
}

uint64_t __AXRuntimeCheck_SupportsDoseAnalysis_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SupportsDoseAnalysis__supportsDoseAnalysis = result;
  return result;
}

uint64_t __AXRuntimeCheck_SupportsVoiceoverIndepedentVolume_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SupportsVoiceoverIndepedentVolume__supportsVoiceoverIndepedentVolume = result;
  return result;
}

@end
