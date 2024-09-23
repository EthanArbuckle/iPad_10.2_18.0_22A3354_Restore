@implementation NSString(Shared)

- (id)ic_quotedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("QUOTED_TITLE_FORMAT"), CFSTR("“%@”"), 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
