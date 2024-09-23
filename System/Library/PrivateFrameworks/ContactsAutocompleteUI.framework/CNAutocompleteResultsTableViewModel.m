@implementation CNAutocompleteResultsTableViewModel

uint64_t __64___CNAutocompleteResultsTableViewModel_numberOfNonEmptySections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __58___CNAutocompleteResultsTableViewModel_enumerateSections___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, objc_msgSend(a2, "unsignedIntegerValue"), v7, a4);

}

@end
