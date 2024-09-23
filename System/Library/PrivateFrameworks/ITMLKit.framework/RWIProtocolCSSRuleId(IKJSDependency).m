@implementation RWIProtocolCSSRuleId(IKJSDependency)

+ (id)safe_initWithStyleSheetId:()IKJSDependency ordinal:
{
  id v4;
  void *v5;
  int v7;
  id v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9[0] = &v8;
  v9[1] = &v7;
  v4 = objc_alloc(MEMORY[0x1E0DD95B0]);
  objc_msgSend(v4, "ik_initWithSelectorString:arguments:", CFSTR("initWithStyleSheetId:ordinal:"), v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
