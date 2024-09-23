@implementation SFMorePageMenuSections

void __SFMorePageMenuSections_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PageMenuSectionWebsiteActions");
  v2[1] = CFSTR("PageMenuSectionCurrentTab");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFMorePageMenuSections_sections;
  SFMorePageMenuSections_sections = v0;

}

@end
