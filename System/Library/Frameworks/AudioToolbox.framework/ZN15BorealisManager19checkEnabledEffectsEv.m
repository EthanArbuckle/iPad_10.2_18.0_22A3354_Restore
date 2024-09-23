@implementation ZN15BorealisManager19checkEnabledEffectsEv

_QWORD *___ZN15BorealisManager19checkEnabledEffectsEv_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  int *v7;
  float *v8;
  float *v9;
  _QWORD v11[5];

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 16))
  {
    *(_QWORD *)(v4 + 32) = NSClassFromString(CFSTR("VTStateManager"));
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BorealisManager::hardwareSupportsVoiceTrigger((BorealisManager *)v4)), CFSTR("VoiceTriggerAvailable"), 0);
    v6 = objc_alloc(*(Class *)(v4 + 32));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___ZN15BorealisManager19checkEnabledEffectsEv_block_invoke_2;
    v11[3] = &__block_descriptor_40_e11_v24__0q8Q16l;
    v11[4] = v4;
    *(_QWORD *)(v4 + 48) = objc_msgSend(v6, "initWithProperty:callbackWithMessageAndTimestamp:", v5, v11);
  }
  CASmartPreferences::Read((CASmartPreferences *)CFSTR("BorealisCapture"), CFSTR("com.apple.coreaudio"), (const __CFString *)&gCaptureRecordings, a4);
  CASmartPreferences::Read((CASmartPreferences *)CFSTR("BorealisPriority"), CFSTR("com.apple.coreaudio"), (const __CFString *)&gWorkThreadPriority, v7);
  CASmartPreferences::Read((CASmartPreferences *)CFSTR("BorealisIOBufferFrameSize"), CFSTR("com.apple.coreaudio"), (const __CFString *)&gIOBufferFrameSize, v8);
  return CASmartPreferences::Read((CASmartPreferences *)CFSTR("BorealisCapacity"), CFSTR("com.apple.coreaudio"), (const __CFString *)&gRingBufferCapacitySeconds, v9);
}

@end
