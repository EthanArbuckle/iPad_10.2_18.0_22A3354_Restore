@implementation HUListContentConfigurationUtilities

+ (void)_setupCachedConfigurations
{
  if (_setupCachedConfigurations_onceToken != -1)
    dispatch_once(&_setupCachedConfigurations_onceToken, &__block_literal_global_189);
}

void __65__HUListContentConfigurationUtilities__setupCachedConfigurations__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_632;
  _MergedGlobals_632 = v0;

  v2 = objc_msgSend((id)_MergedGlobals_632, "copy");
  v3 = (void *)qword_1ED580BB0;
  qword_1ED580BB0 = v2;

}

+ (id)buttonStyleConfigurationForItem:(id)a3 isDestructive:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_setupCachedConfigurations");
  v6 = (void *)objc_msgSend((id)qword_1ED580BB0, "copy");
  objc_msgSend(v5, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  if (v4)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v9);

  return v6;
}

+ (id)labelDefaultConfigurationForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_setupCachedConfigurations");
  v4 = (void *)objc_opt_class();
  v5 = (void *)objc_msgSend((id)_MergedGlobals_632, "copy");
  objc_msgSend(v4, "labelConfiguration:forItem:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)labelConfiguration:(id)a3 forItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(a4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryText:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryTextProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v9);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C78]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
  {
    objc_msgSend(v5, "setImage:", v11);
  }
  else if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v14);

  }
  return v5;
}

+ (id)instructionsConfigurationForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = a3;
  if (qword_1ED580BC8 != -1)
    dispatch_once(&qword_1ED580BC8, &__block_literal_global_3_2);
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instructionsStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "integerValue");
  }
  else
  {
    NSLog(CFSTR("No instructions style specified in the results"));
    v6 = -1;
  }
  objc_msgSend(v3, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v6)
  {
    case 0:
      v12 = (void *)objc_msgSend((id)qword_1ED580BB8, "copy");
      objc_msgSend(v12, "setText:", v8);
      v13 = v12;
      goto LABEL_14;
    case 1:
      v11 = (void *)qword_1ED580BC0;
      goto LABEL_11;
    case 2:
    case 3:
      v11 = (void *)qword_1ED580BB8;
LABEL_11:
      v12 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v12, "setText:", v8);
      objc_msgSend(v12, "setSecondaryText:", v10);
      break;
    case 4:
      v12 = (void *)objc_msgSend((id)qword_1ED580BB8, "copy");
      objc_msgSend(v12, "setText:", v8);
      goto LABEL_15;
    case 5:
      v13 = (void *)objc_msgSend((id)qword_1ED580BB8, "copy");
      v12 = v13;
LABEL_14:
      objc_msgSend(v13, "setSecondaryText:", v10);
LABEL_15:
      objc_msgSend(v12, "directionalLayoutMargins");
      v15 = v14;
      objc_msgSend((id)qword_1ED580BC0, "directionalLayoutMargins");
      v17 = v16;
      objc_msgSend(v12, "directionalLayoutMargins");
      v19 = v18;
      objc_msgSend(v12, "directionalLayoutMargins");
      objc_msgSend(v12, "setDirectionalLayoutMargins:", v15, v17, v19);
      break;
    default:
      v12 = 0;
      break;
  }

  return v12;
}

void __72__HUListContentConfigurationUtilities_instructionsConfigurationForItem___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA718], "prominentInsetGroupedHeaderConfiguration");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580BB8;
  qword_1ED580BB8 = v0;

  objc_msgSend(MEMORY[0x1E0CEA718], "groupedHeaderConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED580BC0;
  qword_1ED580BC0 = v2;

}

@end
