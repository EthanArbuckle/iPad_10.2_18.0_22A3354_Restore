@implementation RWIProtocolDOMRGBAColor(IKJSDependency)

+ (id)safe_initWithR:()IKJSDependency g:b:
{
  id v5;
  void *v6;
  int v8;
  int v9;
  int v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a3;
  v8 = a5;
  v11[0] = &v10;
  v11[1] = &v9;
  v11[2] = &v8;
  v5 = objc_alloc(MEMORY[0x1E0DD9628]);
  objc_msgSend(v5, "ik_initWithSelectorString:arguments:", CFSTR("initWithR:g:b:"), v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
