@implementation RWIProtocolCSSFontVariationAxis(IKJSDependency)

+ (id)safe_initWithTag:()IKJSDependency minimumValue:maximumValue:defaultValue:
{
  id v6;
  void *v7;
  double v9;
  double v10;
  double v11;
  id v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a1;
  v9 = a3;
  v12 = a6;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  v13[3] = &v9;
  v6 = objc_alloc(MEMORY[0x1E0DD9578]);
  objc_msgSend(v6, "ik_initWithSelectorString:arguments:", CFSTR("initWithTag:minimumValue:maximumValue:defaultValue:"), v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
