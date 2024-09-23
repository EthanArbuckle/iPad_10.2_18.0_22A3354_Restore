@implementation EFSortDescriptor

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  unint64_t v7;

  -[EFSortDescriptor key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[EFSortDescriptor ascending](self, "ascending");
  NSStringFromSelector((SEL)-[EFSortDescriptor selector](self, "selector"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 33 * (33 * v4 + v5) + objc_msgSend(v6, "hash") + 35937;

  return v7;
}

@end
