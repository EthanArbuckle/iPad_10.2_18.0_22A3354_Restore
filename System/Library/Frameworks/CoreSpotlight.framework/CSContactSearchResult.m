@implementation CSContactSearchResult

void __108___CSContactSearchResult_generateQueryStringForContact_filterQueries_includeSecondaryRecipients_inputScope___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"cd)"), *(_QWORD *)(a1 + 40), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
