@implementation RWIProtocolNetworkWebSocketResponse(IKJSDependency)

+ (id)safe_initWithStatus:()IKJSDependency statusText:headers:
{
  id v6;
  void *v7;
  id v9;
  id v10;
  int v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v10 = a4;
  v9 = a5;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  v6 = objc_alloc(MEMORY[0x1E0DD9688]);
  objc_msgSend(v6, "ik_initWithSelectorString:arguments:", CFSTR("initWithStatus:statusText:headers:"), v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
