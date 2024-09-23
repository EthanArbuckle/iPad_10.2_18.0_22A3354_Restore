@implementation FPSpotlightQueryStringForSearchQuery

id __FPSpotlightQueryStringForSearchQuery_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  const __CFString *v4;
  void *v5;

  v2 = a2;
  v3 = objc_msgSend(&unk_1E448F530, "containsObject:", v2);
  v4 = CFSTR("kMDItemContentTypeTree");
  if (v3)
    v4 = CFSTR("kMDItemContentType");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\")"), v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
