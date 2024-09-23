@implementation FigProprietaryDefaultsCaptureSourceCreateWithSourceInfo

void __FigProprietaryDefaultsCaptureSourceCreateWithSourceInfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  const void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("ProprietaryDefaultKey");
  v7[1] = CFSTR("ProprietaryDefaultValue");
  v8[0] = a2;
  v8[1] = a3;
  v4 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (const void *)objc_msgSend(*(id *)(a1 + 32), "retainReferencedObject");
  if (v5)
  {
    v6 = v5;
    captureSource_postNotificationWithPayload(v5, CFSTR("ProprietaryDefaultChanged"), v4);
    CFRelease(v6);
  }
}

@end
