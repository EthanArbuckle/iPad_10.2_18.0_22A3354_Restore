@implementation UIView

void __61__UIView_CKGradientReferenceView__setGradientViewsNeedLayout__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "referenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
    objc_msgSend(v5, "setNeedsLayout");

}

void __62__UIView_CKGradientReferenceView__layoutGradientViewsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "referenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
    objc_msgSend(v5, "layoutIfNeeded");

}

uint64_t __77__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentBounceView___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __77__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentBounceView___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __95__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentShrinkViewToPoint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
}

@end
