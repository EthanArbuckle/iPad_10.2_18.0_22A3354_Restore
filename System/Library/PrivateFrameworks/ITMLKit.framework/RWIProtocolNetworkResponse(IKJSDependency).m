@implementation RWIProtocolNetworkResponse(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency status:statusText:headers:mimeType:source:
{
  id v13;
  void *v14;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  int v20;
  id v21;
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v20 = a4;
  v19 = a5;
  v18 = a6;
  v16 = a8;
  v17 = a7;
  v22[0] = &v21;
  v22[1] = &v20;
  v22[2] = &v19;
  v22[3] = &v18;
  v22[4] = &v17;
  v22[5] = &v16;
  v13 = objc_alloc(MEMORY[0x1E0DD9670]);
  objc_msgSend(v13, "ik_initWithSelectorString:arguments:", CFSTR("initWithUrl:status:statusText:headers:mimeType:source:"), v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
