@implementation UIKeyboard(CKUtilities)

+ (BOOL)__ck_isUsingCompactHeightPredictionBar
{
  double v0;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "predictionViewHeightForCurrentInputMode");
  return v0 <= 38.0;
}

+ (void)__ck_appStripVerticalPadding
{
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_isUsingCompactHeightPredictionBar") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "keyplanePadding", 4.5);
    if (CKMainScreenScale_once_20 != -1)
      dispatch_once(&CKMainScreenScale_once_20, &__block_literal_global_1415);
  }
}

+ (uint64_t)__ck_isPredictionBarEnabled
{
  void *v0;
  char v1;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "predictionFromPreference"))
  {
    v1 = UIKeyboardPredictionEnabledForCurrentInputMode();

    if ((v1 & 1) != 0)
      return 1;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displaysCandidates");

  return v4;
}

@end
