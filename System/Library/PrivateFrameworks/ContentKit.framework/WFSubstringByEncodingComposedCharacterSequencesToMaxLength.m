@implementation WFSubstringByEncodingComposedCharacterSequencesToMaxLength

uint64_t __WFSubstringByEncodingComposedCharacterSequencesToMaxLength_block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;
  uint64_t v11;
  unint64_t v12;

  result = objc_msgSend(a2, "lengthOfBytesUsingEncoding:", a1[6]);
  v11 = *(_QWORD *)(a1[4] + 8);
  v12 = *(_QWORD *)(v11 + 24) + result;
  if (v12 <= a1[7])
  {
    *(_QWORD *)(v11 + 24) = v12;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    *a7 = 1;
  }
  return result;
}

@end
