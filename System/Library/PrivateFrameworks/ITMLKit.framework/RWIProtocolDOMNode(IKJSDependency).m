@implementation RWIProtocolDOMNode(IKJSDependency)

+ (id)safe_initWithNodeId:()IKJSDependency nodeType:nodeName:localName:nodeValue:
{
  id v9;
  void *v10;
  id v12;
  id v13;
  id v14;
  int v15;
  int v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a3;
  v14 = a5;
  v13 = a6;
  v12 = a7;
  v17[0] = &v16;
  v17[1] = &v15;
  v17[2] = &v14;
  v17[3] = &v13;
  v17[4] = &v12;
  v9 = objc_alloc(MEMORY[0x1E0DD9620]);
  objc_msgSend(v9, "ik_initWithSelectorString:arguments:", CFSTR("initWithNodeId:nodeType:nodeName:localName:nodeValue:"), v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
