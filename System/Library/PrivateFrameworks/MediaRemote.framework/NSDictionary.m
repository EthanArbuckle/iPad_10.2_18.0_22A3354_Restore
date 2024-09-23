@implementation NSDictionary

void __56__NSDictionary_MRAdditions__MR_isEqualToNowPlayingInfo___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = _MRNowPlayingValuesAreEqual(v7, v8);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;

  }
}

@end
