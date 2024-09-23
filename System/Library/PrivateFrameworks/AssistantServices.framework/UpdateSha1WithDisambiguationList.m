@implementation UpdateSha1WithDisambiguationList

uint64_t ___UpdateSha1WithDisambiguationList_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 | v6)
    v7 = objc_msgSend((id)v5, "compare:", v6);
  else
    v7 = 0;

  return v7;
}

@end
