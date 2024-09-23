@implementation RWIProtocolCSSGrouping(IKJSDependency)

+ (id)safe_initWithType:()IKJSDependency
{
  id v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7[0] = &v6;
  v3 = objc_alloc(MEMORY[0x1E0DD9580]);
  objc_msgSend(v3, "ik_initWithSelectorString:arguments:", CFSTR("initWithType:"), v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
