@implementation UITableViewCell

void __74__UITableViewCell_HUCheckmarkAdditions__hu_emptyCheckmarkPlaceholderImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA638], "hu_cellCheckmarkImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:renderingMode:", v0, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_1_4;
  _MergedGlobals_1_4 = v1;

}

IMP __59__UITableViewCell_HUAdditions__hu_setForcedSeparatorStyle___block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  void *v2;
  void (*v3)(void);
  _QWORD aBlock[5];

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_setSeparatorStyle_);
  off_1ED580DD8 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))method_getImplementation(InstanceMethod);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UITableViewCell_HUAdditions__hu_setForcedSeparatorStyle___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e11_v24__0_8q16l;
  aBlock[4] = sel_setSeparatorStyle_;
  v2 = _Block_copy(aBlock);
  v3 = imp_implementationWithBlock(v2);

  return method_setImplementation(InstanceMethod, v3);
}

void __59__UITableViewCell_HUAdditions__hu_setForcedSeparatorStyle___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_getAssociatedObject(v6, &_MergedGlobals_641);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    off_1ED580DD8(v6, *(_QWORD *)(a1 + 32), a3);

}

@end
