@implementation HUExpandableItemModule

- (HFItem)showOptionsItem
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUExpandableItemModule.m"), 15, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUExpandableItemModule showOptionsItem]", objc_opt_class());

  return 0;
}

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (void)setShowOptions:(BOOL)a3
{
  self->_showOptions = a3;
}

@end
