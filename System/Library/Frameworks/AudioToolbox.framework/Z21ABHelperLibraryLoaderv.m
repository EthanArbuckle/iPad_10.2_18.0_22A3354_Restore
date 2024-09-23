@implementation Z21ABHelperLibraryLoaderv

void *___Z21ABHelperLibraryLoaderv_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  if (result)
  {
    v1 = result;
    ABHelperLibraryLoader(void)::libSym = (uint64_t)dlsym(result, "ABHelperIsABTestModeOn");
    ABHelperLibraryLoader(void)::libSym = (uint64_t)dlsym(v1, "ABHelperWriteJSONFileFromDescription");
    ABHelperLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD))dlsym(v1, "ABHelperCreateDescriptionFromAudioUnit");
    ABHelperLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD))dlsym(v1, "ABHelperCreateDescriptionFromDSPGraphBox");
    ABHelperLibraryLoader(void)::libSym = (uint64_t)dlsym(v1, "ABHelperCreateDescriptionFromASBD");
    result = dlsym(v1, "ABHelperCreateDescriptionFromDSPGraph");
    ABHelperLibraryLoader(void)::libSym = (uint64_t)result;
  }
  return result;
}

@end
