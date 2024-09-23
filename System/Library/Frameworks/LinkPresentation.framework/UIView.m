@implementation UIView

void __76__UIView_LPExtras___lp_applyAndRegisterForUpdatesToValue_withApplyCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  objc_msgSend(v3, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForAppearance:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v8, v7);

}

@end
