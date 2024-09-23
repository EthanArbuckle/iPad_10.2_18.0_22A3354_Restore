@implementation FigStarkModeControllerRemoveStateChangedHandler

void __FigStarkModeControllerRemoveStateChangedHandler_block_invoke(uint64_t a1)
{
  const void *v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __FigStarkModeControllerRemoveStateChangedHandler_block_invoke_2;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v4 = *(_OWORD *)(a1 + 32);
  MXDispatchSync((uint64_t)"FigStarkModeControllerRemoveStateChangedHandler_block_invoke", (uint64_t)"FigStarkMode.m", 1105, 0, 0, *(NSObject **)(v4 + 16), (uint64_t)v3);
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

void __FigStarkModeControllerRemoveStateChangedHandler_block_invoke_2(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex FirstIndexOfValue;
  CFRange v4;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 120);
  v4.length = CFArrayGetCount(v2);
  v4.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v4, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
  {
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 120), FirstIndexOfValue);
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

@end
