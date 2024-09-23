@implementation UIFont(MPUDynamicType)

- (double)MPU_scaledValueForValue:()MPUDynamicType
{
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  char v11;
  double v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(a1, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDF7768]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v6 = (id *)getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr;
    v17 = getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr;
    if (!getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr)
    {
      v7 = (void *)CoreTextLibrary();
      v6 = (id *)dlsym(v7, "kCTFontDescriptorTextStyleRegular");
      v15[3] = (uint64_t)v6;
      getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr = (uint64_t)v6;
    }
    _Block_object_dispose(&v14, 8);
    if (!v6)
      -[UIFont(MPUDynamicType) MPU_scaledValueForValue:].cold.1();
    v8 = *v6;
    if (objc_msgSend(v5, "isEqualToString:", v8, v14))
    {

    }
    else
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v9 = (_QWORD *)getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr;
      v17 = getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr)
      {
        v10 = (void *)CoreTextLibrary();
        v9 = dlsym(v10, "kCTFontDescriptorTextStyleEmphasized");
        v15[3] = (uint64_t)v9;
        getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr = (uint64_t)v9;
      }
      _Block_object_dispose(&v14, 8);
      if (!v9)
        -[UIFont(MPUDynamicType) MPU_scaledValueForValue:].cold.1();
      v11 = objc_msgSend(v5, "isEqualToString:", *v9, v14);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(a1, "_scaledValueForValue:", a2);
        a2 = v12;
      }
    }
  }

  return a2;
}

- (void)MPU_scaledValueForValue:()MPUDynamicType .cold.1()
{
  dlerror();
  abort_report_np();
  CACurrentMediaTime();
}

@end
