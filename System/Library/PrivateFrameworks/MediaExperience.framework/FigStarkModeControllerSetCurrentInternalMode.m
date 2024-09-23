@implementation FigStarkModeControllerSetCurrentInternalMode

CFTypeRef __FigStarkModeControllerSetCurrentInternalMode_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  CFTypeRef v9;
  uint64_t v10;
  CFTypeRef result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 80);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(const void **)(v2 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v2 + 96) = v7;
  *(_OWORD *)(v2 + 48) = v5;
  *(_OWORD *)(v2 + 64) = v6;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(CFTypeRef *)(v8 + 80);
  if (v9)
  {
    v9 = CFRetain(v9);
    v8 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v8 + 80) = v9;
  v10 = *(_QWORD *)(a1 + 32);
  result = *(CFTypeRef *)(v10 + 48);
  if (result)
  {
    result = CFRetain(result);
    v10 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v10 + 48) = result;
  return result;
}

@end
