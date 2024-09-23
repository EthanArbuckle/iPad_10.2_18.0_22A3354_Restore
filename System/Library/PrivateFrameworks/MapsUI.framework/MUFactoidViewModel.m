@implementation MUFactoidViewModel

- (NSString)titleString
{
  return (NSString *)&stru_1E2E05448;
}

- (NSString)valueString
{
  return (NSString *)&stru_1E2E05448;
}

- (id)buildSymbolWithFont:(id)a3
{
  return 0;
}

- (NSString)symbolName
{
  return 0;
}

- (UIColor)symbolColor
{
  return 0;
}

- (UIColor)darkSymbolColor
{
  return 0;
}

- (BOOL)shouldReverseForRTLLayout
{
  return 1;
}

+ (id)viewModelForFactoid:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MUTextFactoidViewModel *v15;
  void *v16;
  void *v17;
  MUTextFactoidViewModel *v18;
  double v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;

  v4 = a3;
  if (!objc_msgSend(v4, "shouldUseStructuredData"))
  {
    objc_msgSend(v4, "unstructuredValue");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "unitType") && objc_msgSend(v4, "unitType") != 1)
  {
    if (objc_msgSend(v4, "unitType") != 6)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C99840]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      v24 = objc_alloc_init(MEMORY[0x1E0CB3760]);
      MUConfigureMeasurementFormatter(v24, v23, objc_msgSend(v4, "unitType"), objc_msgSend(a1, "maximumFractionDigitsForFactoid:", v4), objc_msgSend(a1, "roundingModeForFactoid:", v4));
      objc_msgSend(v4, "value");
      MUFactoidMeasurementFormatterForValue(objc_msgSend(v4, "unitType"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "copy");
      if ((v23 & 1) == 0)
      {
        objc_msgSend(v4, "value");
        MUFactoidImpericalMeasurementFormatterForValue(objc_msgSend(v4, "unitType"), v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v29;
      }
      objc_msgSend(v21, "languageCode");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "isEqualToString:", CFSTR("en")))
      {
        objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C997F0]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0C99808]);

      }
      else
      {
        v32 = 0;
      }

      objc_msgSend(v27, "unit");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      MUConvertedFormattedString(v26, v33, v24, v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v4, "value");
    MUConvertedFormattedDurationString(v20);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v10;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v6 = 1;
  objc_msgSend(v5, "setNumberStyle:", 1);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "value");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  objc_msgSend(v4, "color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "symbolColorWithGEOColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "darkSymbolColorWithGEOColor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [MUTextFactoidViewModel alloc];
  objc_msgSend(v4, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MUTextFactoidViewModel initWithTitle:valueString:symbolName:symbolColor:darkSymbolColor:shouldReverseForRTLLayout:](v15, "initWithTitle:valueString:symbolName:symbolColor:darkSymbolColor:shouldReverseForRTLLayout:", v16, v9, v17, v12, v14, v6);

  return v18;
}

+ (id)viewModelsFromFactoids:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        +[MUFactoidViewModel viewModelForFactoid:](MUFactoidViewModel, "viewModelForFactoid:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (id)symbolColorWithGEOColor:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    switch(objc_msgSend(v3, "systemColor"))
    {
      case 1u:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 2u:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 3u:
      case 4u:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
    v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

+ (id)darkSymbolColorWithGEOColor:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    switch(objc_msgSend(v3, "systemColor"))
    {
      case 1u:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 2u:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 3u:
      case 4u:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
    v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)maximumFractionDigitsForFactoid:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;

  v3 = a3;
  v7 = 0;
  if (objc_msgSend(v3, "semantic") == 4 && objc_msgSend(v3, "unitType") == 4)
  {
    objc_msgSend(v3, "value");
    v5 = v4;
    GEOConfigGetDouble();
    if (v5 <= v6)
      v7 = 1;
  }

  return v7;
}

+ (unint64_t)roundingModeForFactoid:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;

  v3 = a3;
  if (objc_msgSend(v3, "semantic") == 4
    && objc_msgSend(v3, "unitType") == 4
    && (objc_msgSend(v3, "value"), v5 = v4, GEOConfigGetDouble(), v5 <= v6))
  {
    v7 = 6;
  }
  else
  {
    v7 = 4;
  }

  return v7;
}

@end
