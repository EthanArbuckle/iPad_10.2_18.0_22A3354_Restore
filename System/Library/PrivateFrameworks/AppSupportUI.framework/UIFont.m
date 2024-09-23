@implementation UIFont

id __62__UIFont_NUIAccessibilitySupport___nui_isAccessibilityEnabled__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id result;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB3D8];
  v3[0] = *MEMORY[0x1E0CEB3E0];
  v3[1] = v0;
  v1 = *MEMORY[0x1E0CEB3C8];
  v3[2] = *MEMORY[0x1E0CEB3D0];
  v3[3] = v1;
  v3[4] = *MEMORY[0x1E0CEB3C0];
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  +[UIFont(NUIAccessibilitySupport) _nui_isAccessibilityEnabled]::largeSizes = (uint64_t)result;
  return result;
}

@end
