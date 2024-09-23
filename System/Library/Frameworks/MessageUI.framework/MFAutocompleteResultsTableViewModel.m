@implementation MFAutocompleteResultsTableViewModel

uint64_t __64___MFAutocompleteResultsTableViewModel_numberOfNonEmptySections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __58___MFAutocompleteResultsTableViewModel_enumerateSections___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "unsignedIntegerValue"), v7, a4);

}

@end
