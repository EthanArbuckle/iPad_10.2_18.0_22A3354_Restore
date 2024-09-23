@implementation MPSectionedCollection(Safe)

- (id)safeItemAtIndexPath:()Safe
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "numberOfSections");
  if (v5 <= objc_msgSend(v4, "section")
    || (v6 = objc_msgSend(a1, "numberOfItemsInSection:", objc_msgSend(v4, "section")), v6 <= objc_msgSend(v4, "row")))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "itemAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
