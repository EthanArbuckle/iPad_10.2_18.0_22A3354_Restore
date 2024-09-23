@implementation APSPSGDataSourceGetShared

uint64_t __APSPSGDataSourceGetShared_block_invoke()
{
  uint64_t result;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  result = APSPSGDataSourceCreate(*MEMORY[0x1E0C9AE00], &APSPSGDataSourceGetShared_psgDataSource);
  APSPSGDataSourceGetShared_err = result;
  if ((_DWORD)result)
    return APSLogErrorAt(result);
  v1 = APSPSGDataSourceGetShared_psgDataSource;
  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v2)
  {
    result = 4294954514;
    APSPSGDataSourceGetShared_err = -12782;
    return APSLogErrorAt(result);
  }
  result = v2(v1);
  APSPSGDataSourceGetShared_err = result;
  if ((_DWORD)result)
    return APSLogErrorAt(result);
  return result;
}

@end
