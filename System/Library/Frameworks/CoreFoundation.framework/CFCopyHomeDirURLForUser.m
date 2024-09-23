@implementation CFCopyHomeDirURLForUser

void ___CFCopyHomeDirURLForUser_block_invoke(uint64_t a1)
{
  __CFString *v2;

  v2 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    CFStringAppend(v2, CFSTR("\n"));
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFStringCreateMutable(0, 0);
}

@end
