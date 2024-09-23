@implementation UTDynamicGetPedigree

void ___UTDynamicGetPedigree_block_invoke(uint64_t a1, __CFString *a2)
{
  uint64_t Pedigree;
  void *v5;
  id v6;
  int v7;

  if (_UTTypeIdentifierIsDynamic(a2))
  {
    Pedigree = _UTDynamicGetPedigree(*(_QWORD *)(a1 + 40), a2);
LABEL_5:
    v5 = (void *)Pedigree;
    goto LABEL_6;
  }
  v7 = 0;
  if (_UTGetActiveTypeForCFStringIdentifier(**(void ***)(a1 + 40), a2, &v7))
  {
    Pedigree = _UTTypeGetPedigreeInternal(*(uint64_t **)(a1 + 40), v7);
    goto LABEL_5;
  }
  if (_UTTypeIdentifierIsValid(a2))
  {
    v6 = (id)-[__CFString copy](a2, "copy");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v6, 1);

  }
  else
  {
    v5 = 0;
  }
LABEL_6:
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "unionSet:", v5);

}

@end
