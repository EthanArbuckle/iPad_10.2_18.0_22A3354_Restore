@implementation ContentIndex

uint64_t __ContentIndex_catch_mach_exception_raise_identity_protected_block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  uint64_t v4;
  CFAbsoluteTime Current;

  v2 = *(_QWORD *)(result + 32);
  if (!a2)
  {
    if (!*(_QWORD *)(v2 + 264))
      return result;
    v4 = result;
    Current = CFAbsoluteTimeGetCurrent();
    v2 = *(_QWORD *)(v4 + 32);
    *(CFAbsoluteTime *)(v2 + 192) = Current;
    v3 = *(uint64_t (**)(_QWORD))(v2 + 264);
    return v3(*(_QWORD *)(v2 + 288));
  }
  v3 = *(uint64_t (**)(_QWORD))(v2 + 256);
  if (v3)
    return v3(*(_QWORD *)(v2 + 288));
  return result;
}

@end
