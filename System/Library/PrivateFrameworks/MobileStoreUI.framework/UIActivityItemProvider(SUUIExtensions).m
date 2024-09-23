@implementation UIActivityItemProvider(SUUIExtensions)

+ (uint64_t)activityTypeShouldProvideImage:()SUUIExtensions
{
  uint64_t v3;
  id v4;
  int v5;
  int v6;

  v3 = *MEMORY[0x24BDF7470];
  v4 = a3;
  LODWORD(v3) = objc_msgSend(v4, "isEqualToString:", v3);
  v5 = v3 | objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF7480]);
  LODWORD(v3) = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF7498]);
  v6 = v5 | v3 | objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF74A8]);
  LODWORD(v3) = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF74D0]);

  return (v6 | v3) ^ 1;
}

@end
