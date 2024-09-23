@implementation UICollectionViewCell(DOCTagsCollectionCellMenuHandler)

- (uint64_t)doc_tagsCollectionCellMenuTarget
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCTagsCollectionCellMenuTarget.m"), 16, CFSTR("The method %@ in %@ must be overridden."), v5, v7);

  return 0;
}

@end
