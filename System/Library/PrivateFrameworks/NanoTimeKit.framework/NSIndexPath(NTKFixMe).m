@implementation NSIndexPath(NTKFixMe)

- (uint64_t)element
{
  return objc_msgSend(a1, "indexAtPosition:", 1);
}

- (unint64_t)upNextSection
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "indexAtPosition:", 0);
  if (v1 >= NTKUpNextSectionMax)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The section %lu is not a valid Up Next Section"), v1);
  return v1;
}

+ (id)indexPathWithElement:()NTKFixMe inUpNextSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
