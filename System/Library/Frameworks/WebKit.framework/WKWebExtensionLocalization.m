@implementation WKWebExtensionLocalization

id __55___WKWebExtensionLocalization__localizedArrayForArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedStringForString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = (void *)v5;

    v4 = v6;
    return v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedArrayForArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedDictionaryForDictionary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v4;
}

@end
