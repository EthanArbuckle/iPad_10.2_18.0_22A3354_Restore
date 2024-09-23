@implementation C3DMeshElementSetPrimitiveRanges

uint64_t ____C3DMeshElementSetPrimitiveRanges_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  result = objc_msgSend(a2, "rangeValue");
  v7 = (uint64_t *)(*(_QWORD *)(a1 + 32) + 16 * a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    v8 = -1;
  else
    v8 = result;
  *v7 = v8;
  v7[1] = v6;
  return result;
}

@end
