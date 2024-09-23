@implementation RWIProtocolCSSSelector(IKJSDependency)

+ (id)safe_initWithText:()IKJSDependency
{
  id v3;
  void *v4;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7[0] = &v6;
  v3 = objc_alloc(MEMORY[0x1E0DD95C0]);
  objc_msgSend(v3, "ik_initWithSelectorString:arguments:", CFSTR("initWithText:"), v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
