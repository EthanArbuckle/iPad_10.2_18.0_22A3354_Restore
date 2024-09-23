@implementation CFPrefsExtractQuadrupleFromPathIfPossible

void ___CFPrefsExtractQuadrupleFromPathIfPossible_block_invoke()
{
  const UInt8 *v0;
  const UInt8 *v1;

  v0 = CFCopyHomeDirectoryURLForUser(CFSTR("mobile"));
  if (v0)
  {
    v1 = v0;
    _CFPrefsExtractQuadrupleFromPathIfPossible_mobileHome = (uint64_t)CFURLCopyFileSystemPath((CFURLRef)v0, kCFURLPOSIXPathStyle);
    CFRelease(v1);
  }
}

@end
