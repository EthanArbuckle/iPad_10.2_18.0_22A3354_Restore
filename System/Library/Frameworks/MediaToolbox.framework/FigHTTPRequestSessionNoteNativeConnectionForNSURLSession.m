@implementation FigHTTPRequestSessionNoteNativeConnectionForNSURLSession

CFTypeRef ___FigHTTPRequestSessionNoteNativeConnectionForNSURLSession_block_invoke(uint64_t a1)
{
  CFTypeRef result;
  CFTypeRef v3;

  result = *(CFTypeRef *)(a1 + 32);
  if (result)
  {
    v3 = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 40);
    if (result != v3)
    {
      if (!v3
        || (CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 40)),
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 0,
            (result = *(CFTypeRef *)(a1 + 32)) != 0))
      {
        result = CFRetain(result);
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = result;
    }
  }
  return result;
}

@end
