@implementation WKTextManipulationItem

uint64_t __82___WKTextManipulationItem_isEqualToTextManipulationItem_includingContentEquality___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToTextManipulationToken:includingContentEquality:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tokens"), "objectAtIndexedSubscript:", a3), *(unsigned __int8 *)(a1 + 48));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __57___WKTextManipulationItem__descriptionPreservingPrivacy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (*(_BYTE *)(a1 + 40))
    v3 = objc_msgSend(a2, "description");
  else
    v3 = objc_msgSend(a2, "debugDescription");
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
}

@end
