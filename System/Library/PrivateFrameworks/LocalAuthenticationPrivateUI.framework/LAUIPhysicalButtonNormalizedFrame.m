@implementation LAUIPhysicalButtonNormalizedFrame

void __LAUIPhysicalButtonNormalizedFrame_block_invoke()
{
  const __CFData *v0;
  const __CFData *v1;
  CFTypeID v2;
  __int128 *BytePtr;
  __int128 v4;

  v0 = (const __CFData *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      BytePtr = (__int128 *)CFDataGetBytePtr(v1);
      v4 = BytePtr[1];
      LAUIPhysicalButtonNormalizedFrame::frame = *BytePtr;
      *(_OWORD *)&qword_253EB01C8 = v4;
    }
    CFRelease(v1);
  }
}

@end
