@implementation NNCComplicationDataSource

+ (id)staticTemplateForFamily:(int64_t)a3 compact:(BOOL)a4
{
  _BOOL8 v4;
  NNCLastNewsStoryResult *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v7 = objc_alloc_init(NNCLastNewsStoryResult);
  NSSNewsWidgetMessageForStaticNewsSection();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNCLastNewsStoryResult setSourceName:](v7, "setSourceName:", v8);

  NSSNewsWidgetMessageForStaticNewsHeadlineTitle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNCLastNewsStoryResult setHeadlineTitle:](v7, "setHeadlineTitle:", v9);

  -[NNCLastNewsStoryResult setHeadlineIndex:](v7, "setHeadlineIndex:", 0);
  -[NNCLastNewsStoryResult setTotalHeadlineCount:](v7, "setTotalHeadlineCount:", 0);
  -[NNCLastNewsStoryResult setFamily:](v7, "setFamily:", a3);
  objc_msgSend(a1, "_templateForFamily:newsStoryResult:compact:", a3, v7, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)newsTintColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.988235294, 0.301960784, 0.37254902, 1.0);
}

+ (id)_loadingStoriesShortString
{
  return &stru_24E59E688;
}

+ (id)_loadingStoriesLargeString
{
  return &stru_24E59E688;
}

+ (id)_noNewStoriesLargeString
{
  return &stru_24E59E688;
}

+ (id)_noNewStoriesShortString
{
  return &stru_24E59E688;
}

+ (id)_complicationTitle
{
  return &stru_24E59E688;
}

+ (id)_oneLineHeadlineTextProviderForResult:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    objc_msgSend(a3, "headlineTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(a1, "_noNewStoriesShortString");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;

    v9 = (void *)MEMORY[0x24BDB8790];
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDB8790];
    objc_msgSend(a1, "_loadingStoriesShortString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
  }
  objc_msgSend(v9, "textProviderWithText:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_templateForFamily:(int64_t)a3 newsStoryResult:(id)a4 compact:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _QWORD *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  _QWORD v70[2];

  v5 = a5;
  v70[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v9 = (_QWORD *)getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_ptr;
  v64 = getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_ptr;
  if (!getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_ptr)
  {
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_block_invoke;
    v60[3] = &unk_24E59E618;
    v60[4] = &v61;
    __getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_block_invoke((uint64_t)v60);
    v9 = (_QWORD *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v9)
  {
    +[NNCComplicationDataSource _templateForFamily:newsStoryResult:compact:].cold.1();
    __break(1u);
  }
  if (*v9 == a3)
    v10 = 3;
  else
    v10 = a3;
  if (v10 == *MEMORY[0x24BDB85A8])
  {
    objc_msgSend((id)objc_opt_class(), "imageProviderWithForegroundName:compact:", CFSTR("victory"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setImageProvider:", v11);

  }
  else
  {
    v12 = 0;
  }
  switch(v10)
  {
    case 0:
      objc_msgSend((id)objc_opt_class(), "imageProviderWithForegroundName:compact:", CFSTR("modularsmall-simple"), v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_opt_new();
      objc_msgSend(v14, "setImageProvider:", v13);

      break;
    case 1:
      v14 = (id)objc_opt_new();
      objc_msgSend((id)objc_opt_class(), "imageProviderWithForegroundName:compact:", CFSTR("modularlarge-standardbody"), v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHeaderImageProvider:", v15);
      if (!v8)
        goto LABEL_30;
      objc_msgSend(v8, "headlineTitle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32 == 0;

      v18 = (void *)MEMORY[0x24BDB8790];
      if (v33)
        goto LABEL_31;
      objc_msgSend(v8, "sourceName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textProviderWithText:", v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setHeaderTextProvider:", v20);
      v35 = (void *)MEMORY[0x24BDB8790];
      objc_msgSend(v8, "headlineTitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "textProviderWithText:", v23);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBody1TextProvider:", v36);

      goto LABEL_32;
    case 2:
      objc_msgSend((id)objc_opt_class(), "imageProviderWithForegroundName:compact:", CFSTR("utilitariansmall-square"), v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_opt_new();
      objc_msgSend(v14, "setImageProvider:", v25);

      break;
    case 3:
      v14 = (id)objc_opt_new();
      objc_msgSend((id)objc_opt_class(), "imageProviderWithForegroundName:compact:", CFSTR("utilitarianlarge-flat"), 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImageProvider:", v42);
      objc_msgSend((id)objc_opt_class(), "_oneLineHeadlineTextProviderForResult:", v8);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextProvider:", v43);

      break;
    case 4:
      objc_msgSend((id)objc_opt_class(), "imageProviderWithForegroundName:compact:", CFSTR("circularsmall-simple"), v5);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_opt_new();
      objc_msgSend(v14, "setImageProvider:", v44);

      break;
    case 6:
      v14 = (id)objc_opt_new();
      objc_msgSend((id)objc_opt_class(), "imageProviderWithForegroundName:compact:", CFSTR("utilitariansmall-flat"), v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImageProvider:", v26);
      objc_msgSend(MEMORY[0x24BDB8790], "textProviderWithText:", &stru_24E59E688);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextProvider:", v27);

      break;
    case 7:
      v14 = (id)objc_opt_new();
      objc_msgSend((id)objc_opt_class(), "imageProviderWithForegroundName:compact:", CFSTR("extralarge-simple"), v5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImageProvider:", v37);

      break;
    case 8:
      v14 = objc_alloc_init(MEMORY[0x24BDB86C8]);
      objc_msgSend(a1, "fullColorImageProviderWithName:", CFSTR("circularsmall-simple"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImageProvider:", v38);

      v69 = CFSTR("NTKRichComplicationViewBackgroundColorKey");
      objc_msgSend(a1, "newsTintColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "colorWithAlphaComponent:", 0.2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMetadata:", v41);

      break;
    case 9:
      v14 = objc_alloc_init(MEMORY[0x24BDB86B0]);
      objc_msgSend((id)objc_opt_class(), "_oneLineHeadlineTextProviderForResult:", v8);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextProvider:", v49);

      objc_msgSend(a1, "_templateForFamily:newsStoryResult:compact:", 10, v8, v5);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCircularTemplate:", v50);

      break;
    case 10:
      v14 = objc_alloc_init(MEMORY[0x24BDB86C0]);
      objc_msgSend(a1, "fullColorImageProviderWithName:", CFSTR("circularsmall-simple"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImageProvider:", v45);

      v67 = CFSTR("NTKRichComplicationViewBackgroundColorKey");
      objc_msgSend(a1, "newsTintColor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "colorWithAlphaComponent:", 0.2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v47;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMetadata:", v48);

      break;
    case 11:
      v14 = (id)objc_opt_new();
      objc_msgSend((id)objc_opt_class(), "fullColorImageProviderWithName:", CFSTR("modularlarge-standardbody"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHeaderImageProvider:", v15);
      if (v8)
      {
        objc_msgSend(v8, "headlineTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        v18 = (void *)MEMORY[0x24BDB8790];
        if (v17)
        {
LABEL_31:
          objc_msgSend(a1, "_complicationTitle");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "textProviderWithText:", v55);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "setHeaderTextProvider:", v20);
          v56 = (void *)MEMORY[0x24BDB8790];
          objc_msgSend(a1, "_noNewStoriesLargeString");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "textProviderWithText:", v57);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "setBody1TextProvider:", v23);
        }
        else
        {
          objc_msgSend(v8, "sourceName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "textProviderWithText:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "newsTintColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setTintColor:", v21);

          objc_msgSend(v14, "setHeaderTextProvider:", v20);
          v22 = (void *)MEMORY[0x24BDB8790];
          objc_msgSend(v8, "headlineTitle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "textProviderWithText:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBody1TextProvider:", v24);

        }
      }
      else
      {
LABEL_30:
        v51 = (void *)MEMORY[0x24BDB8790];
        objc_msgSend(a1, "_complicationTitle");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "textProviderWithText:", v52);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setHeaderTextProvider:", v20);
        v53 = (void *)MEMORY[0x24BDB8790];
        objc_msgSend(a1, "_loadingStoriesLargeString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "textProviderWithText:", v23);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBody1TextProvider:", v54);

      }
LABEL_32:

      break;
    case 12:
      v14 = (id)objc_opt_new();
      objc_msgSend(a1, "fullColorImageProviderWithName:", CFSTR("graphiclarge"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImageProvider:", v28);

      v65 = CFSTR("NTKRichComplicationViewBackgroundColorKey");
      objc_msgSend(a1, "newsTintColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "colorWithAlphaComponent:", 0.2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMetadata:", v31);

      break;
    default:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[NNCComplicationDataSource _templateForFamily:newsStoryResult:compact:].cold.2(v10);
      v14 = v12;
      break;
  }
  objc_msgSend((id)objc_opt_class(), "newsTintColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v58);

  return v14;
}

+ (id)imageProviderWithForegroundName:(id)a3 compact:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("complication-%@"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDB8778], "imageProviderWithOnePieceImage:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "newsTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fullColorImageProviderWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  double v24;
  double v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x2207D2B04]();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("complication-%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:compatibleWithTraitCollection:", v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDF6AA0], "preferredFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    objc_msgSend(v10, "setScale:");
    objc_msgSend(v10, "setPreferredRange:", 2);
    objc_msgSend(v9, "size");
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v10, v11, v13);
    objc_msgSend(a1, "newsTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __60__NNCComplicationDataSource_fullColorImageProviderWithName___block_invoke;
    v21[3] = &unk_24E59E5F0;
    v22 = v16;
    v24 = v12;
    v25 = v14;
    v23 = v9;
    v17 = v16;
    objc_msgSend(v15, "imageWithActions:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB8750], "providerWithFullColorImage:monochromeFilterType:", v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v19;
}

uint64_t __60__NNCComplicationDataSource_fullColorImageProviderWithName___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  CGRect v5;

  objc_msgSend(*(id *)(a1 + 32), "setFill");
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = v2;
  v5.size.height = v3;
  UIRectFill(v5);
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v2, v3, 1.0);
}

+ (uint64_t)_templateForFamily:newsStoryResult:compact:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[NNCComplicationDataSource _templateForFamily:newsStoryResult:compact:].cold.2(v0);
}

+ (void)_templateForFamily:(uint64_t)a1 newsStoryResult:compact:.cold.2(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "+[NNCComplicationDataSource _templateForFamily:newsStoryResult:compact:]";
  v3 = 2048;
  v4 = a1;
  _os_log_error_impl(&dword_21FD63000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s Unsupported family: %ld", (uint8_t *)&v1, 0x16u);
}

@end
