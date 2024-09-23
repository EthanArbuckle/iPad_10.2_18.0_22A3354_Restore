@implementation ZN19PartialQueryResults23populateCompletionModelEP18md

_QWORD *___ZN19PartialQueryResults23populateCompletionModelEP18md_deadline_once_s_block_invoke(_QWORD *result, int a2)
{
  uint64_t v2;

  v2 = result[6];
  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = a2 != 0;
  if (!a2)
    *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_DWORD *)(v2 + 320);
  return result;
}

@end
