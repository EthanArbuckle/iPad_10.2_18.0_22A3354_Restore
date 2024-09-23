@implementation ZN7CBBOLTS25loadBufferFromPreferencesEv

uint64_t *___ZN7CBBOLTS25loadBufferFromPreferencesEv_block_invoke(uint64_t a1)
{
  uint64_t *result;
  CBBOLTS *v2;
  CFStringRef *v3;
  CFStringRef *v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *, uint64_t, uint64_t);
  void *v9;
  CBBOLTS *v10;
  id v11;
  uint64_t v12[4];

  v12[3] = a1;
  v12[2] = a1;
  v2 = *(CBBOLTS **)(a1 + 32);
  std::initializer_list<AAB::CurveUpdate>::initializer_list[abi:ne180100](v12);
  std::list<AAB::CurveUpdate>::operator=[abi:ne180100]((uint64_t)v2 + 88, v12[0], v12[1]);
  v3 = (CFStringRef *)MEMORY[0x1E0C9B260];
  v4 = (CFStringRef *)MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v11 = 0;
  v11 = (id)CFPreferencesCopyValue(CFSTR("BOLTSBuffer"), CFSTR("com.apple.CoreBrightness"), *v3, *v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = -1073741824;
    v7 = 0;
    v8 = ___ZN7CBBOLTS25loadBufferFromPreferencesEv_block_invoke_2;
    v9 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v10 = v2;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v5);
  }
  while ((unint64_t)std::list<AAB::CurveUpdate>::size[abi:ne180100]() > *((_QWORD *)v2 + 10))
    std::list<AAB::CurveUpdate>::pop_front((uint64_t)v2 + 88);

  result = (uint64_t *)CBBOLTS::useBOLTS(v2);
  if ((result & 1) != 0)
    return CBBOLTS::UpdateCurveWithPrediction((uint64_t)v2, (uint64_t)v2 + 88);
  return result;
}

@end
