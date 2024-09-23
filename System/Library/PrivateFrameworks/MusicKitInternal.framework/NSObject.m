@implementation NSObject

id __127__NSObject_MusicKit_SoftLinking_MPCPlayerResponseTracklist__musicKit_responseTracklist_underlyingSectionObjectAtIndexPathBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "structuredIndexPathForDisplayIndexPath:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sectionAtIndex:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "metadataObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
