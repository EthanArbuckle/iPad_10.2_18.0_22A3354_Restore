@implementation NSString

uint64_t __80__NSString_AVTExtension__avt_diffAgainst_suppressCommonLines_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t result;
  unint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "length");
  if (v3 <= result + 1)
    v5 = result + 1;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

@end
