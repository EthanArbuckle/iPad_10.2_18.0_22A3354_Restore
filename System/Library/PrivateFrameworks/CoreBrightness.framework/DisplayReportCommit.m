@implementation DisplayReportCommit

void ____DisplayReportCommit_block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    (*(void (**)(_QWORD, const __CFString *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("DisplayBrightness"), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
