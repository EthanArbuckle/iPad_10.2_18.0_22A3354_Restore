@implementation NSString(BRCBookmarkAdditions_Legacy)

+ (id)itemResolutionStringWithRelativePath:()BRCBookmarkAdditions_Legacy
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "documentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemResolutionStringWithDocumentID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bookmarkDataWithRelativePath:()BRCBookmarkAdditions_Legacy serverZone:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "itemResolutionStringWithRelativePath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bookmarkDataWithItemResolutionString:serverZone:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)unsaltedBookmarkDataWithRelativePath:()BRCBookmarkAdditions_Legacy serverZoneMangledID:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "itemResolutionStringWithRelativePath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
