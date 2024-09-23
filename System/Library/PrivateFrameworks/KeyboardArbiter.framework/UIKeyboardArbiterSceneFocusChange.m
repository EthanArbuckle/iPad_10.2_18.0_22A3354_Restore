@implementation UIKeyboardArbiterSceneFocusChange

void __56___UIKeyboardArbiterSceneFocusChange_focusNothingChange__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_UIKeyboardArbiterSceneFocusChange _init]([_UIKeyboardArbiterSceneFocusChange alloc], "_init");
  v1 = (void *)qword_253E78FF0;
  qword_253E78FF0 = (uint64_t)v0;

  *(_BYTE *)(qword_253E78FF0 + 8) = 1;
}

id __64___UIKeyboardArbiterSceneFocusChange_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(_BYTE *)(v3 + 8))
    return (id)objc_msgSend(v2, "appendString:withName:", CFSTR("nothing"), 0);
  v5 = (id)objc_msgSend(v2, "appendInt:withName:", *(unsigned int *)(v3 + 12), CFSTR("pid"));
  return (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("sceneIdentity"));
}

@end
