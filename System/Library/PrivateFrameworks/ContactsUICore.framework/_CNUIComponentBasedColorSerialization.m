@implementation _CNUIComponentBasedColorSerialization

+ (id)colorFromDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  CGColorSpace *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  CGColorRef v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hexComponents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v22 = 0;
    objc_msgSend(a1, "parseString:forComponents:count:", v6, components, &v22);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colorSpaceName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (CGColorSpace *)objc_msgSend(a1, "_createColorSpaceWithName:", v7);

    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61___CNUIComponentBasedColorSerialization_colorFromDictionary___block_invoke;
    v21[3] = &__block_descriptor_40_e5_v8__0l;
    v21[4] = v8;
    v10 = (void *)objc_msgSend(v21, "copy");
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1DF0D6388]();
    objc_msgSend(v5, "push:", v12);

    v13 = CGColorCreate(v8, components);
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __61___CNUIComponentBasedColorSerialization_colorFromDictionary___block_invoke_2;
    v20[3] = &__block_descriptor_40_e5_v8__0l;
    v20[4] = v13;
    v14 = (void *)objc_msgSend(v20, "copy");
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1DF0D6388]();
    objc_msgSend(v5, "push:", v16);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v5, "popAllWithHandler:", &__block_literal_global_74);
  v18 = (id)objc_opt_self();

  return v17;
}

+ (void)parseString:(id)a3 forComponents:(double *)a4 count:(int64_t *)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  char v11;

  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v7);
  if (*a5 <= 3)
  {
    do
    {
      v11 = 0;
      if ((objc_msgSend(v8, "_cn_scanHexChar:", &v11) & 1) == 0)
        break;
      LOBYTE(v9) = v11;
      v10 = *a5;
      a4[*a5] = (double)v9 / 255.0;
      *a5 = v10 + 1;
    }
    while (v10 < 3);
  }

}

+ (CGColorSpace)_createColorSpaceWithName:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  CGColorSpace *v5;
  NSObject *v6;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3)
  {
    if (!-[__CFString length](v3, "length") || (v5 = CGColorSpaceCreateWithName(v4)) == 0)
    {
      v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
      if (-[__CFString length](v4, "length"))
      {
        +[CNUICoreLogProvider color_os_log](CNUICoreLogProvider, "color_os_log");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          +[_CNUIComponentBasedColorSerialization _createColorSpaceWithName:].cold.1((uint64_t)v4, v6);

      }
    }
  }
  else
  {
    v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  }

  return v5;
}

+ (id)dictionaryForColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  size_t NumberOfComponents;
  id v8;
  const CGFloat *Components;
  double *v10;
  double v11;
  id v12;
  CGColorSpace *ColorSpace;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA61C4F0, CFSTR("type"));
  v5 = (void *)objc_opt_new();
  v6 = objc_retainAutorelease(v3);
  NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v6, "CGColor"));
  v8 = objc_retainAutorelease(v6);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v8, "CGColor"));
  if (NumberOfComponents)
  {
    v10 = (double *)Components;
    do
    {
      v11 = *v10++;
      objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), (int)(v11 * 255.0));
      --NumberOfComponents;
    }
    while (NumberOfComponents);
  }
  v12 = objc_retainAutorelease(v8);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v12, "CGColor"));
  CGColorSpaceGetName(ColorSpace);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("hexComponents"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("colorSpaceName"));
  return v4;
}

+ (void)_createColorSpaceWithName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD140000, a2, OS_LOG_TYPE_ERROR, "Could not create colorSpace from name '%@'; will fall back to using sRGB",
    (uint8_t *)&v2,
    0xCu);
}

@end
