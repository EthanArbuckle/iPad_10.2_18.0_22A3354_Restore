@implementation HMSymptomsHandler

void __65__HMSymptomsHandler_HFAdditions__hf_symptomTypesSortedByPriority__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED378F10;
  qword_1ED378F10 = (uint64_t)&unk_1EA7CDD38;

}

void __44__HMSymptomsHandler_HFAdditions__initialize__block_invoke(uint64_t a1)
{
  objc_method *InstanceMethod;
  objc_method *v3;

  InstanceMethod = class_getInstanceMethod(*(Class *)(a1 + 32), sel_symptoms);
  v3 = class_getInstanceMethod(*(Class *)(a1 + 32), sel_hf_fakeSymptomsImplementationUsedForDebuggingPleaseDontTouchThisItIsFragileSwizzlingIsBadMKay);
  method_exchangeImplementations(InstanceMethod, v3);
}

uint64_t __63__HMSymptomsHandler_HFAdditions__hf_symptomArraySortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(void *, id);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD aBlock[4];
  id v15;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__HMSymptomsHandler_HFAdditions__hf_symptomArraySortComparator__block_invoke_2;
  aBlock[3] = &unk_1EA72D378;
  v15 = *(id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = (uint64_t (**)(void *, id))_Block_copy(aBlock);
  v8 = v7[2](v7, v6);

  v9 = v7[2](v7, v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  return v12;
}

uint64_t __63__HMSymptomsHandler_HFAdditions__hf_symptomArraySortComparator__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = objc_msgSend(v3, "type") + 1000;

  return v6;
}

@end
