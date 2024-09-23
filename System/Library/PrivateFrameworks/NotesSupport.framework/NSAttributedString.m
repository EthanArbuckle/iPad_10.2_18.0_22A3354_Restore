@implementation NSAttributedString

void __82__NSAttributedString_IC__ic_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5)
{
  uint64_t v9;
  NSRange v10;
  id v11;
  NSRange v12;

  v11 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v12.location = a3;
  v12.length = a4;
  v10 = NSIntersectionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v12);
  (*(void (**)(uint64_t, id, NSUInteger, NSUInteger, uint64_t))(v9 + 16))(v9, v11, v10.location, v10.length, a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 48)
                                                               - (a3
                                                                + a4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = a3 + a4;

}

void __82__NSAttributedString_IC__ic_enumerateAttributesInClampedRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5)
{
  uint64_t v9;
  NSRange v10;
  id v11;
  NSRange v12;

  v11 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v12.location = a3;
  v12.length = a4;
  v10 = NSIntersectionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v12);
  (*(void (**)(uint64_t, id, NSUInteger, NSUInteger, uint64_t))(v9 + 16))(v9, v11, v10.location, v10.length, a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 48)
                                                               - (a3
                                                                + a4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = a3 + a4;

}

uint64_t __55__NSAttributedString_IC__ic_containsAttribute_inRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

@end
