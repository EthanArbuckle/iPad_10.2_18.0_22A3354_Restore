@implementation UIImageSymbolConfiguration(AMSUIImageSymbolConfiguration)

+ (id)ams_imageSymbolConfigurationWithDictionary:()AMSUIImageSymbolConfiguration
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "ams_imageSymbolConfigurationStyleWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_imageSymbolConfigurationTextStyleWithDictionary:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v6, "configurationByApplyingConfiguration:", v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v7;
    }
    objc_msgSend(a1, "ams_imageSymbolConfigurationScaleWithDictionary:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      objc_msgSend(v9, "configurationByApplyingConfiguration:", v11);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v11;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)ams_imageSymbolConfigurationScaleWithDictionary:()AMSUIImageSymbolConfiguration
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    if (ams_imageSymbolConfigurationScaleWithDictionary__ams_once_token___COUNTER__ != -1)
      dispatch_once(&ams_imageSymbolConfigurationScaleWithDictionary__ams_once_token___COUNTER__, &__block_literal_global_8);
    objc_msgSend((id)ams_imageSymbolConfigurationScaleWithDictionary__ams_once_object___COUNTER__, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", objc_msgSend(v5, "integerValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)ams_imageSymbolConfigurationTextStyleWithDictionary:()AMSUIImageSymbolConfiguration
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("textStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5
    || ((objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("text-style")),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (v5 = 0)
      : (v5 = v6),
        v6,
        v5))
  {
    +[AMSUIFontParser fontTextStyleForString:](AMSUIFontParser, "fontTextStyleForString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)ams_imageSymbolConfigurationStyleWithDictionary:()AMSUIImageSymbolConfiguration
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("colors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (!v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("colors"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v9, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "JSONObjectWithData:options:error:", v11, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v12;
      objc_opt_class();
      v7 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v13;

    }
    else
    {
      v7 = 0;
    }

  }
  objc_msgSend(v7, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("hierarchical")) && objc_msgSend(v14, "count"))
  {
    v15 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationWithHierarchicalColor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("monochrome")))
    {
      objc_msgSend(MEMORY[0x24BEBD660], "configurationPreferringMonochrome");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("multicolor")))
    {
      objc_msgSend(MEMORY[0x24BEBD660], "configurationPreferringMulticolor");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("palette")) || !objc_msgSend(v14, "count"))
      {
        v17 = 0;
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPaletteColors:", v14);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v18;
  }
LABEL_28:

  return v17;
}

@end
