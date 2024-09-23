@implementation RWIProtocolCSSSourceRange(IKJSDependency)

+ (id)safe_initWithStartLine:()IKJSDependency startColumn:endLine:endColumn:
{
  id v6;
  void *v7;
  int v9;
  int v10;
  int v11;
  int v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a3;
  v9 = a6;
  v10 = a5;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  v13[3] = &v9;
  v6 = objc_alloc(MEMORY[0x1E0DD95D8]);
  objc_msgSend(v6, "ik_initWithSelectorString:arguments:", CFSTR("initWithStartLine:startColumn:endLine:endColumn:"), v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
