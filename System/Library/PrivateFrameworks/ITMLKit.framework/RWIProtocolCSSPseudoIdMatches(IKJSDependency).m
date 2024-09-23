@implementation RWIProtocolCSSPseudoIdMatches(IKJSDependency)

+ (id)safe_initWithPseudoId:()IKJSDependency matches:
{
  id v4;
  void *v5;
  id v7;
  uint64_t v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v7 = a4;
  v9[0] = &v8;
  v9[1] = &v7;
  v4 = objc_alloc(MEMORY[0x1E0DD95A0]);
  objc_msgSend(v4, "ik_initWithSelectorString:arguments:", CFSTR("initWithPseudoId:matches:"), v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
