@implementation UICollectionViewCompositionalLayout(DOCExtensions)

- (uint64_t)doc_resetSwipedRows
{
  objc_msgSend(a1, "setEditing:", 1);
  return objc_msgSend(a1, "setEditing:", 0);
}

@end
