@implementation NSIndexPath(MSVAdditions)

- (uint64_t)msv_section
{
  return objc_msgSend(a1, "indexAtPosition:", 0);
}

- (uint64_t)msv_item
{
  if ((unint64_t)objc_msgSend(a1, "length") < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return objc_msgSend(a1, "indexAtPosition:", 1);
}

+ (id)msv_indexPathForItem:()MSVAdditions inSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
