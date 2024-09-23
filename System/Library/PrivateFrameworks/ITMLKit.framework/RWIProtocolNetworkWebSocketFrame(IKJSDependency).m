@implementation RWIProtocolNetworkWebSocketFrame(IKJSDependency)

+ (id)safe_initWithOpcode:()IKJSDependency mask:payloadData:payloadLength:
{
  id v7;
  void *v8;
  double v10;
  id v11;
  char v12;
  double v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v12 = a5;
  v11 = a6;
  v10 = a2;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v14[3] = &v10;
  v7 = objc_alloc(MEMORY[0x1E0DD9678]);
  objc_msgSend(v7, "ik_initWithSelectorString:arguments:", CFSTR("initWithOpcode:mask:payloadData:payloadLength:"), v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
