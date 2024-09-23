@implementation UIImageSymbolConfiguration(PKPaletteButtonAdditions)

+ (uint64_t)pk_defaultImageSymbolConfiguration
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC3888];
  if (qword_1EF560518 != -1)
    dispatch_once(&qword_1EF560518, &__block_literal_global_75);
  return objc_msgSend(v2, "configurationWithPointSize:weight:scale:", 6, objc_msgSend(a1, "_pk_defaultImageSymbolScale"), *(double *)&_MergedGlobals_7);
}

+ (uint64_t)_pk_defaultImageSymbolScale
{
  if (PKIsVisionDevice())
    return 3;
  else
    return 2;
}

@end
