@implementation RWIProtocolNetworkRequest(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency method:headers:
{
  id v7;
  void *v8;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v11 = a4;
  v10 = a5;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  v7 = objc_alloc(MEMORY[0x1E0DD9660]);
  objc_msgSend(v7, "ik_initWithSelectorString:arguments:", CFSTR("initWithUrl:method:headers:"), v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
