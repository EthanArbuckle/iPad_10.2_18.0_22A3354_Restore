@implementation SFWebView

uint64_t __28___SFWebView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1784), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __41___SFWebView_setPlaceholderImage_offset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1784), "setAlpha:", 0.0);
}

void __41___SFWebView_setPlaceholderImage_offset___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1784), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1784);
    *(_QWORD *)(v3 + 1784) = 0;

  }
}

void __41___SFWebView_setPlaceholderImage_offset___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPlaceholderImage:", 0);

}

uint64_t __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1776), "setAlpha:", 1.0);
}

uint64_t __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1776), "didAppear");
}

uint64_t __77___SFWebView_dismissDialogView_withAdditionalAnimations_forDialogController___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __77___SFWebView_dismissDialogView_withAdditionalAnimations_forDialogController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
