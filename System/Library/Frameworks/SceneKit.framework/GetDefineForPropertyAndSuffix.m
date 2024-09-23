@implementation GetDefineForPropertyAndSuffix

void ____GetDefineForPropertyAndSuffix_block_invoke()
{
  uint64_t v0;
  uint64_t *v1;
  const __CFAllocator *v2;
  const __CFString *v3;
  __CFString *MutableCopy;

  v0 = 0;
  v1 = &qword_1F03C4ED8;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  do
  {
    v3 = __stringForProperty((char)v0);
    *(v1 - 4) = (uint64_t)v3;
    MutableCopy = CFStringCreateMutableCopy(v2, 0, v3);
    CFStringUppercase(MutableCopy, 0);
    *(v1 - 3) = (uint64_t)CFStringCreateWithFormat(v2, 0, CFSTR("USE_%@"), MutableCopy);
    *(v1 - 2) = (uint64_t)CFStringCreateWithFormat(v2, 0, CFSTR("USE_%@_COLOR"), MutableCopy);
    *(v1 - 1) = (uint64_t)CFStringCreateWithFormat(v2, 0, CFSTR("USE_%@_INTENSITY"), MutableCopy);
    *v1 = (uint64_t)CFStringCreateWithFormat(v2, 0, CFSTR("USE_%@_TEXTURE_COMPONENT"), MutableCopy);
    v1[1] = (uint64_t)CFStringCreateWithFormat(v2, 0, CFSTR("USE_%@TEXCOORD"), MutableCopy);
    v1[2] = (uint64_t)CFStringCreateWithFormat(v2, 0, CFSTR("USE_%@_MAP"), MutableCopy);
    v1[3] = (uint64_t)CFStringCreateWithFormat(v2, 0, CFSTR("USE_%@_CUBEMAP"), MutableCopy);
    CFRelease(MutableCopy);
    ++v0;
    v1 += 8;
  }
  while (v0 != 16);
}

@end
