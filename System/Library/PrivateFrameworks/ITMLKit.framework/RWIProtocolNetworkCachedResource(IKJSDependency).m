@implementation RWIProtocolNetworkCachedResource(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency type:bodySize:
{
  id v6;
  void *v7;
  double v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v9 = a1;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  v6 = objc_alloc(MEMORY[0x1E0DD9640]);
  objc_msgSend(v6, "ik_initWithSelectorString:arguments:", CFSTR("initWithUrl:type:bodySize:"), v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
