@implementation UIImage(DOCTagSystemImage)

+ (id)_doc_imageFillNameForColorType:()DOCTagSystemImage differentiateWithShapes:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_doc_imageOutlineNameForColorType:differentiateWithShapes:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR(".fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (__CFString)_doc_imageOutlineNameForColorType:()DOCTagSystemImage differentiateWithShapes:
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x24BDAC8D0];
  v11[0] = &unk_24E33E818;
  v11[1] = &unk_24E33E830;
  v6 = CFSTR("circle");
  v12[0] = CFSTR("circle");
  v12[1] = CFSTR("square");
  v11[2] = &unk_24E33E848;
  v11[3] = &unk_24E33E860;
  v12[2] = CFSTR("diamond");
  v12[3] = CFSTR("hexagon");
  v11[4] = &unk_24E33E878;
  v11[5] = &unk_24E33E890;
  v12[4] = CFSTR("triangle");
  v12[5] = CFSTR("seal");
  v11[6] = &unk_24E33E8A8;
  v11[7] = &unk_24E33E8C0;
  v12[6] = CFSTR("pentagon");
  v12[7] = CFSTR("circle");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v6 = v9;
    else
      v6 = CFSTR("circle");

  }
  return v6;
}

+ (id)_doc_tagImageForRenderingVariant:()DOCTagSystemImage differentiateWithShapes:tagColorType:
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BE2DF20], "untitledTagForRendering:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tagColorIfNotClear");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2DF20], "nonClearNoneTagColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(a1, "_doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:renderedColor:", a3, a4, a5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_doc_tagImageForRenderingVariant:()DOCTagSystemImage differentiateWithShapes:tagColorType:renderedColor:
{
  id v9;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v9 = a6;
  if (!v9)
  {
    v10 = (NSObject **)MEMORY[0x24BE2DF90];
    v11 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[UIImage(DOCTagSystemImage) _doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:renderedColor:].cold.1(v11);
    objc_msgSend(MEMORY[0x24BE2DF20], "untitledTagForRendering:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tagColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BE2DF20], "untitledTagForRendering:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
  {
    v15 = v9;
  }
  else
  {
    objc_msgSend(v13, "tagColorIfNotClear");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE2DF20], "nonClearNoneTagColor");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v18;

  }
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "_doc_imageOutlineNameForColorType:differentiateWithShapes:", a5, a4);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v20 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BEBD640], "_doc_imageFillNameForColorType:differentiateWithShapes:", a5, a4);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v19;
LABEL_19:
  +[DOCTagAppearance renderingAppearance](DOCTagAppearance, "renderingAppearance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "imageWeightForVariant:", a3);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageWithConfiguration:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "imageWithTintColor:renderingMode:", v15, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (void)_doc_tagImageForRenderingVariant:()DOCTagSystemImage differentiateWithShapes:tagColorType:renderedColor:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21EA4C000, log, OS_LOG_TYPE_FAULT, "Invalid nil parameter for 'renderedColor', using fallback", v1, 2u);
}

@end
