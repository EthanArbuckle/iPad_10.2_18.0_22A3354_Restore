@implementation UINavigationBar(DCI)

+ (uint64_t)mf_canUseDesktopClassNavigationBar
{
  uint64_t result;

  result = _UIBarsDesktopNavigationBarEnabled();
  if ((_DWORD)result)
    return objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad");
  return result;
}

+ (BOOL)mf_shouldUseDesktopClassNavigationBarForTraitCollection:()DCI
{
  id v3;
  _BOOL8 v4;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0DC3A28], "mf_canUseDesktopClassNavigationBar"))
    v4 = objc_msgSend(v3, "horizontalSizeClass") == 2;
  else
    v4 = 0;

  return v4;
}

@end
