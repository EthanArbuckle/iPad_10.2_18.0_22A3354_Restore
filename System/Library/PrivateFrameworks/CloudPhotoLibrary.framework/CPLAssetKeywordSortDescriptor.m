@implementation CPLAssetKeywordSortDescriptor

- (CPLAssetKeywordSortDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLAssetKeywordSortDescriptor;
  return -[CPLAssetKeywordSortDescriptor init](&v3, sel_init);
}

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  return objc_msgSend(a3, "compare:", a4);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

+ (id)sortedKeywordsForKeywordSet:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CPLAssetKeywordSortDescriptor_sortedKeywordsForKeywordSet___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = sortedKeywordsForKeywordSet__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&sortedKeywordsForKeywordSet__onceToken, block);
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", sortedKeywordsForKeywordSet__sortDescriptors);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __61__CPLAssetKeywordSortDescriptor_sortedKeywordsForKeywordSet___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0C99D20];
  v4 = objc_alloc_init(*(Class *)(a1 + 32));
  objc_msgSend(v1, "arrayWithObject:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sortedKeywordsForKeywordSet__sortDescriptors;
  sortedKeywordsForKeywordSet__sortDescriptors = v2;

}

@end
