@implementation RWIProtocolCSSFont(IKJSDependency)

+ (id)safe_initWithDisplayName:()IKJSDependency variationAxes:
{
  id v5;
  void *v6;
  id v8;
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_alloc(MEMORY[0x1E0DD9570]);
  objc_msgSend(v5, "ik_initWithSelectorString:arguments:", CFSTR("initWithDisplayName:variationAxes:"), v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
