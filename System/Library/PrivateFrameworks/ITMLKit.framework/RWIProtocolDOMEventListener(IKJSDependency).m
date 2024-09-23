@implementation RWIProtocolDOMEventListener(IKJSDependency)

+ (id)safe_initWithEventListenerId:()IKJSDependency type:useCapture:isAttribute:
{
  id v8;
  void *v9;
  char v11;
  char v12;
  id v13;
  int v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v13 = a4;
  v12 = a5;
  v11 = a6;
  v15[0] = &v14;
  v15[1] = &v13;
  v15[2] = &v12;
  v15[3] = &v11;
  v8 = objc_alloc(MEMORY[0x1E0DD9618]);
  objc_msgSend(v8, "ik_initWithSelectorString:arguments:", CFSTR("initWithEventListenerId:type:useCapture:isAttribute:"), v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
