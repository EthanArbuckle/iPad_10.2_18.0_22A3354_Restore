@implementation RWIProtocolCSSRule(IKJSDependency)

+ (id)safe_initWithSelectorList:()IKJSDependency sourceLine:origin:style:
{
  id v9;
  void *v10;
  id v12;
  uint64_t v13;
  int v14;
  id v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v14 = a4;
  v13 = a5;
  v12 = a6;
  v16[0] = &v15;
  v16[1] = &v14;
  v16[2] = &v13;
  v16[3] = &v12;
  v9 = objc_alloc(MEMORY[0x1E0DD95A8]);
  objc_msgSend(v9, "ik_initWithSelectorString:arguments:", CFSTR("initWithSelectorList:sourceLine:origin:style:"), v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
