@implementation Z21SetupTIFFErrorHandlerv

size_t (*___Z21SetupTIFFErrorHandlerv_block_invoke())(const char *a1, const char *a2, va_list a3)
{
  _cg_TIFFSetErrorHandler(0);
  _cg_TIFFSetErrorHandlerExt(IIOErrorHandler);
  return _cg_TIFFSetWarningHandler((size_t (*)(const char *, const char *, va_list))IIOWarningHandler);
}

@end
