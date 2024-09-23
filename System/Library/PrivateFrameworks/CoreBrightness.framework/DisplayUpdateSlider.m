@implementation DisplayUpdateSlider

void ____DisplayUpdateSlider_block_invoke(uint64_t a1)
{
  __DisplaySetBLDriverProperty(*(_QWORD *)(a1 + 32), CFSTR("DisplayBrightness"), *(const void **)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    (*(void (**)(_QWORD, const __CFString *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("DisplayBrightness"), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = 0;
}

void ____DisplayUpdateSlider_block_invoke_732(uint64_t a1)
{
  __DisplaySetBLDriverProperty(*(_QWORD *)(a1 + 32), CFSTR("DisplayBrightness"), *(const void **)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    (*(void (**)(_QWORD, const __CFString *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("DisplayBrightness"), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = 0;
}

void ____DisplayUpdateSlider_block_invoke_734(uint64_t a1)
{
  __DisplaySetBLDriverProperty(*(_QWORD *)(a1 + 32), CFSTR("DisplayBrightness"), *(const void **)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    (*(void (**)(_QWORD, const __CFString *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("DisplayBrightness"), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = 0;
}

@end
