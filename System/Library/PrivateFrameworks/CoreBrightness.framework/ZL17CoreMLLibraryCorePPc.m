@implementation ZL17CoreMLLibraryCorePPc

unint64_t *___ZL17CoreMLLibraryCorePPc_block_invoke()
{
  unint64_t v0;

  v0 = _sl_dlopen();
  return std::atomic_store_explicit[abi:ne180100]<void *>(&CoreMLLibraryCore(char **)::frameworkLibrary, v0, 0);
}

@end
