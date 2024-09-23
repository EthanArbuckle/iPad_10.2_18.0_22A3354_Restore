@implementation _SFPBPunchout(Helpers)

+ (id)punchoutWithURL:()Helpers
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE85100];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x24BE85158]);
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAddress:", v7);
  objc_msgSend(v5, "addUrls:", v6);

  return v5;
}

@end
