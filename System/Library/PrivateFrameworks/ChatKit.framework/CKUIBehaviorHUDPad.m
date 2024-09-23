@implementation CKUIBehaviorHUDPad

- (id)theme
{
  if (theme_once_4516 != -1)
    dispatch_once(&theme_once_4516, &__block_literal_global_4517);
  return (id)theme_sBehavior_4515;
}

void __27__CKUIBehaviorHUDPad_theme__block_invoke()
{
  CKUIThemeHUD *v0;
  void *v1;

  v0 = objc_alloc_init(CKUIThemeHUD);
  v1 = (void *)theme_sBehavior_4515;
  theme_sBehavior_4515 = (uint64_t)v0;

}

- (BOOL)joystickUsesWindow
{
  if (joystickUsesWindow_once_4519 != -1)
    dispatch_once(&joystickUsesWindow_once_4519, &__block_literal_global_4520);
  return 0;
}

- (BOOL)entryFieldShouldUseBackdropView
{
  if (entryFieldShouldUseBackdropView_once_4522 != -1)
    dispatch_once(&entryFieldShouldUseBackdropView_once_4522, &__block_literal_global_4523);
  return 0;
}

- (BOOL)usesActionMenu
{
  if (usesActionMenu_once_4525 != -1)
    dispatch_once(&usesActionMenu_once_4525, &__block_literal_global_4526);
  return 0;
}

- (UIEdgeInsets)entryViewVerticalCoverInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD block[5];
  UIEdgeInsets result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CKUIBehaviorHUDPad_entryViewVerticalCoverInsets__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (entryViewVerticalCoverInsets_once_4528 != -1)
    dispatch_once(&entryViewVerticalCoverInsets_once_4528, block);
  v3 = *((double *)&entryViewVerticalCoverInsets_sBehavior_4527 + 1);
  v2 = *(double *)&entryViewVerticalCoverInsets_sBehavior_4527;
  v4 = *(double *)&qword_1EE11D6D0;
  v5 = unk_1EE11D6D8;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __50__CKUIBehaviorHUDPad_entryViewVerticalCoverInsets__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_supportsForceTouch"))
  {
    v8.receiver = *(id *)(a1 + 32);
    v8.super_class = (Class)CKUIBehaviorHUDPad;
    objc_msgSendSuper2(&v8, sel_entryViewVerticalCoverInsets);
    *(_QWORD *)&entryViewVerticalCoverInsets_sBehavior_4527 = v3;
    *((_QWORD *)&entryViewVerticalCoverInsets_sBehavior_4527 + 1) = v4;
    qword_1EE11D6D0 = v5;
    unk_1EE11D6D8 = v6;
  }
  else
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    entryViewVerticalCoverInsets_sBehavior_4527 = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&qword_1EE11D6D0 = v7;
  }

}

- (UIEdgeInsets)entryViewHorizontalCoverInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD block[5];
  UIEdgeInsets result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CKUIBehaviorHUDPad_entryViewHorizontalCoverInsets__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (entryViewHorizontalCoverInsets_once_4531 != -1)
    dispatch_once(&entryViewHorizontalCoverInsets_once_4531, block);
  v2 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_4530_0;
  v3 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_4530_1;
  v4 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_4530_2;
  v5 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_4530_3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __52__CKUIBehaviorHUDPad_entryViewHorizontalCoverInsets__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_supportsForceTouch"))
  {
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)CKUIBehaviorHUDPad;
    objc_msgSendSuper2(&v7, sel_entryViewHorizontalCoverInsets);
  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  entryViewHorizontalCoverInsets_sBehavior_4530_0 = v3;
  entryViewHorizontalCoverInsets_sBehavior_4530_1 = v4;
  entryViewHorizontalCoverInsets_sBehavior_4530_2 = v5;
  entryViewHorizontalCoverInsets_sBehavior_4530_3 = v6;

}

@end
