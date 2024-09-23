@implementation HMSymptomsHandler(HFAdditions)

+ (id)hf_symptomArraySortComparator
{
  void *v0;
  id v1;
  void *v2;
  _QWORD aBlock[4];
  id v5;

  objc_msgSend((id)objc_opt_class(), "hf_symptomTypesSortedByPriority");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__HMSymptomsHandler_HFAdditions__hf_symptomArraySortComparator__block_invoke;
  aBlock[3] = &unk_1EA72D3A0;
  v5 = v0;
  v1 = v0;
  v2 = _Block_copy(aBlock);

  return v2;
}

+ (id)hf_symptomTypesSortedByPriority
{
  if (_MergedGlobals_238 != -1)
    dispatch_once(&_MergedGlobals_238, &__block_literal_global_57);
  return (id)qword_1ED378F10;
}

+ (void)initialize
{
  uint64_t v1;
  _QWORD block[5];

  if (objc_opt_class() == a1 && HFPreferencesInternalDebuggingEnabled())
  {
    v1 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__HMSymptomsHandler_HFAdditions__initialize__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v1;
    if (initialize_onceToken != -1)
      dispatch_once(&initialize_onceToken, block);
  }
}

- (id)hf_symptomsSortedByPriority
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "symptoms");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_symptomArraySortComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_fakeSymptomsImplementationUsedForDebuggingPleaseDontTouchThisItIsFragileSwizzlingIsBadMKay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "hf_fakeSymptomsImplementationUsedForDebuggingPleaseDontTouchThisItIsFragileSwizzlingIsBadMKay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_mediaProfileContainerForSymptomsHandler:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hf_fakeDebugSymptoms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v7);

  return v3;
}

@end
