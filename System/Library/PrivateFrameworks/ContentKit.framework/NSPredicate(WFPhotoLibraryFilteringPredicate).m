@implementation NSPredicate(WFPhotoLibraryFilteringPredicate)

- (id)wf_photoLibraryFilteringPredicate
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (objc_class *)MEMORY[0x24BDD14C0];
    v3 = a1;
    v4 = [v2 alloc];
    v5 = objc_msgSend(v3, "compoundPredicateType");
    objc_msgSend(v3, "subpredicates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "if_map:", &__block_literal_global_180);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v4, "initWithType:subpredicates:", v5, v7);

  }
  else
  {
    v8 = a1;
  }
  return v8;
}

@end
