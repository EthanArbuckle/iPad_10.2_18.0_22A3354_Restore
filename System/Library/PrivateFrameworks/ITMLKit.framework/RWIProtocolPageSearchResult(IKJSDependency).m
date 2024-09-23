@implementation RWIProtocolPageSearchResult(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency frameId:matchesCount:
{
  id v7;
  void *v8;
  double v10;
  id v11;
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v11 = a5;
  v10 = a1;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  v7 = objc_alloc(MEMORY[0x1E0DD96B0]);
  objc_msgSend(v7, "ik_initWithSelectorString:arguments:", CFSTR("initWithUrl:frameId:matchesCount:"), v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
