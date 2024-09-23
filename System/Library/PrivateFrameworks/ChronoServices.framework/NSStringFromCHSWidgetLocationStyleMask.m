@implementation NSStringFromCHSWidgetLocationStyleMask

uint64_t __NSStringFromCHSWidgetLocationStyleMask_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), "appendString:", CFSTR(", "));
  v4 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 7 && ((0x8Bu >> v4) & 1) != 0)
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 40), "appendString:", off_1E2A5B7C8[v4]);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24);
  return result;
}

@end
