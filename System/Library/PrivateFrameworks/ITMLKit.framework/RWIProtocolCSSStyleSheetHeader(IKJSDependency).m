@implementation RWIProtocolCSSStyleSheetHeader(IKJSDependency)

+ (id)safe_initWithStyleSheetId:()IKJSDependency frameId:sourceURL:origin:title:disabled:isInline:startLine:startColumn:
{
  id v18;
  void *v19;
  double v21;
  double v22;
  char v23;
  char v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[10];

  v30[9] = *MEMORY[0x1E0C80C00];
  v29 = a5;
  v28 = a6;
  v26 = a8;
  v27 = a7;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v21 = a2;
  v22 = a1;
  v30[0] = &v29;
  v30[1] = &v28;
  v30[2] = &v27;
  v30[3] = &v26;
  v30[4] = &v25;
  v30[5] = &v24;
  v30[6] = &v23;
  v30[7] = &v22;
  v30[8] = &v21;
  v18 = objc_alloc(MEMORY[0x1E0DD9600]);
  objc_msgSend(v18, "ik_initWithSelectorString:arguments:", CFSTR("initWithStyleSheetId:frameId:sourceURL:origin:title:disabled:isInline:startLine:startColumn:"), v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
