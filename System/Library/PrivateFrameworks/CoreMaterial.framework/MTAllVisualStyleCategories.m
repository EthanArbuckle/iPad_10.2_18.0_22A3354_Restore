@implementation MTAllVisualStyleCategories

void __MTAllVisualStyleCategories_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("stroke");
  v2[1] = CFSTR("fill");
  v2[2] = CFSTR("overlay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTAllVisualStyleCategories___categories;
  MTAllVisualStyleCategories___categories = v0;

}

@end
