@implementation CKTranscriptCollectionSupplementaryView

+ (id)supplementaryViewKindPrefix
{
  return CFSTR("b:");
}

+ (id)supplementaryViewKindForGUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "supplementaryViewKindPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
