@implementation ZN15TTrueTypeScaler17GetTrueTypeScalerEv

int *___ZN15TTrueTypeScaler17GetTrueTypeScalerEv_block_invoke()
{
  int *result;
  _DWORD *exception;

  result = TTScalerOpen();
  TTrueTypeScaler::sProtocol = *((_QWORD *)result + 9);
  if (!TTrueTypeScaler::sProtocol)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E6176998;
    exception[2] = 1;
  }
  return result;
}

@end
