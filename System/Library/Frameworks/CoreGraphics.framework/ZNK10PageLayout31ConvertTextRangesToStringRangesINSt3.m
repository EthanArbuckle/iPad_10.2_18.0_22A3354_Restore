@implementation ZNK10PageLayout31ConvertTextRangesToStringRangesINSt3

void ***___ZNK10PageLayout31ConvertTextRangesToStringRangesINSt3__14spanI7CFRangeLm18446744073709551615EEENS1_20back_insert_iteratorINS1_6vectorIS3_NS1_9allocatorIS3_EEEEEEEEvOT_OT0__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  void ***result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2 + a3;
  result = (void ***)objc_msgSend(*(id *)(v6 + 24), "length");
  if (v7 < (unint64_t)result)
  {
    result = (void ***)objc_msgSend(*(id *)(v6 + 24), "characterAtIndex:", v7);
    if ((_DWORD)result == 10)
      ++v3;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(_QWORD *)(v9 + 48);
  if (v10 != -1)
  {
    v11 = *(_QWORD *)(v9 + 56);
    if (v11 + v10 == a2)
    {
      *(_QWORD *)(v9 + 56) = v11 + v3;
      return result;
    }
    result = std::back_insert_iterator<std::vector<CFRange>>::operator=[abi:se180100](*(void ****)(a1 + 48), (_OWORD *)(v9 + 48));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v9 + 48) = a2;
  *(_QWORD *)(v9 + 56) = v3;
  return result;
}

@end
