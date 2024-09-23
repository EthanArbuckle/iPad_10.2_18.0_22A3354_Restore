@implementation RWIProtocolPageCookie(IKJSDependency)

+ (id)safe_initWithName:()IKJSDependency value:domain:path:expires:session:httpOnly:secure:sameSite:
{
  id v17;
  void *v18;
  char v20;
  char v21;
  char v22;
  double v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[10];

  v28[9] = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a1;
  v22 = a8;
  v21 = a9;
  v20 = a10;
  v28[0] = &v27;
  v28[1] = &v26;
  v28[2] = &v25;
  v28[3] = &v24;
  v28[4] = &v23;
  v28[5] = &v22;
  v28[6] = &v21;
  v28[7] = &v20;
  v28[8] = &a11;
  v17 = objc_alloc(MEMORY[0x1E0DD9690]);
  objc_msgSend(v17, "ik_initWithSelectorString:arguments:", CFSTR("initWithName:value:domain:path:expires:session:httpOnly:secure:sameSite:"), v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
