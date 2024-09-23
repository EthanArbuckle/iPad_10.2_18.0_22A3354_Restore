@implementation DisplaySetLogicalBrightnessInternal

void ____DisplaySetLogicalBrightnessInternal_block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      (*(void (**)(_QWORD, const __CFString *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("BacklightPowerNits"), *(_QWORD *)(a1 + 40));
    else
      (*(void (**)(_QWORD, const __CFString *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("BacklightPowerMilliWatts"), *(_QWORD *)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
