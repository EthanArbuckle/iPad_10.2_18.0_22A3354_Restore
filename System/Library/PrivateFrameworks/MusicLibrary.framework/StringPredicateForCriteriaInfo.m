@implementation StringPredicateForCriteriaInfo

uint64_t __StringPredicateForCriteriaInfo_block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __StringPredicateForCriteriaInfo_block_invoke_5()
{
  return 0;
}

uint64_t __StringPredicateForCriteriaInfo_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasSuffix:");
}

uint64_t __StringPredicateForCriteriaInfo_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:");
}

uint64_t __StringPredicateForCriteriaInfo_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:");
}

uint64_t __StringPredicateForCriteriaInfo_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:");
}

@end
