@implementation RWIProtocolPageFrame(IKJSDependency)

+ (id)safe_initWithIdentifier:()IKJSDependency loaderId:url:securityOrigin:mimeType:
{
  id v11;
  void *v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v17 = a4;
  v16 = a5;
  v15 = a6;
  v14 = a7;
  v19[0] = &v18;
  v19[1] = &v17;
  v19[2] = &v16;
  v19[3] = &v15;
  v19[4] = &v14;
  v11 = objc_alloc(MEMORY[0x1E0DD9698]);
  objc_msgSend(v11, "ik_initWithSelectorString:arguments:", CFSTR("initWithIdentifier:loaderId:url:securityOrigin:mimeType:"), v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
