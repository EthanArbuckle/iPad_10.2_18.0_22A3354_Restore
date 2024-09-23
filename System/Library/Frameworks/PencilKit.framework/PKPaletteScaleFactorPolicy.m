@implementation PKPaletteScaleFactorPolicy

- (double)scaleFactorForWindowBounds:(CGRect)a3
{
  uint64_t v3;
  double width;
  double height;
  uint64_t *v6;
  double v7;
  NSObject *v8;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v3 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3.size.width >= a3.size.height)
    width = a3.size.width;
  else
    width = a3.size.height;
  if (a3.size.width >= a3.size.height)
    height = a3.size.height;
  else
    height = a3.size.width;
  v6 = &qword_1BE4FE250;
  while (width > *((double *)v6 - 2) || height > *((double *)v6 - 1))
  {
    ++v3;
    v6 += 3;
    if (v3 == 8)
    {
      v3 = 0x7FFFFFFFFFFFFFFFLL;
      v7 = 1.0;
      goto LABEL_13;
    }
  }
  v7 = *(double *)v6;
LABEL_13:
  v8 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 134218752;
    v11 = width;
    v12 = 2048;
    v13 = height;
    v14 = 2048;
    v15 = v7;
    v16 = 2048;
    v17 = v3;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_INFO, "Scale factor for windowBoundsWidth: %f, windowBoundsHeight: %f is scaleFactor: %f, policy: %ld", (uint8_t *)&v10, 0x2Au);
  }

  return v7;
}

@end
