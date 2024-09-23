@implementation NSSortDescriptor(MPMediaLibraryEntityTranslatorAdditions)

- (uint64_t)_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering
{
  return objc_msgSend(a1, "ascending") ^ 1;
}

@end
