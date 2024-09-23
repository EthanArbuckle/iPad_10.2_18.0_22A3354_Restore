@implementation FPItem(BRAdditions)

- (BOOL)br_isDocumentsFolder
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "providerItemIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRFileObjectID fileObjectIDWithString:](BRFileObjectID, "fileObjectIDWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "type") == 4;
  else
    v3 = 0;

  return v3;
}

@end
