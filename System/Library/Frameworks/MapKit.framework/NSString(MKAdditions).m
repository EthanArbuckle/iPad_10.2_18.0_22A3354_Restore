@implementation NSString(MKAdditions)

+ (id)_mapkit_formattedStringForFloat:()MKAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapkit_formattedStringForFloatingPointNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_mapkit_formattedStringForFloatingPointNumber:()MKAdditions
{
  id v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  v6 = (void *)_mapkit_formattedStringForFloatingPointNumber__numberFormatter;
  if (!_mapkit_formattedStringForFloatingPointNumber__numberFormatter)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v8 = (void *)_mapkit_formattedStringForFloatingPointNumber__numberFormatter;
    _mapkit_formattedStringForFloatingPointNumber__numberFormatter = (uint64_t)v7;

    v9 = (void *)_mapkit_formattedStringForFloatingPointNumber__numberFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    objc_msgSend((id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter, "setNumberStyle:", 1);
    objc_msgSend((id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter, "setRoundingMode:", 6);
    v6 = (void *)_mapkit_formattedStringForFloatingPointNumber__numberFormatter;
  }
  if (v5 >= 100.0)
  {
    objc_msgSend(v6, "setUsesSignificantDigits:", 1);
    objc_msgSend((id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter, "setMaximumSignificantDigits:", 3);
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "setUsesSignificantDigits:", 0);
    v11 = 1;
  }
  objc_msgSend((id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter, "setMaximumFractionDigits:", v11);
  objc_msgSend((id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter, "stringFromNumber:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)_mapkit_localizedDistanceStringWithMeters:()MKAdditions abbreviated:
{
  if (qword_1ECE2DAA0 != -1)
    dispatch_once(&qword_1ECE2DAA0, &__block_literal_global_104);
  if (a4)
    objc_msgSend((id)qword_1ECE2DA98, "setUnitStyle:", 1);
  return objc_msgSend((id)qword_1ECE2DA98, "stringFromDistance:", (double)a3);
}

+ (uint64_t)_mapkit_voiceOverLocalizedDistanceStringWithMeters:()MKAdditions
{
  if (qword_1ECE2DAB0 != -1)
    dispatch_once(&qword_1ECE2DAB0, &__block_literal_global_106);
  return objc_msgSend((id)qword_1ECE2DAA8, "stringFromDistance:", (double)a3);
}

+ (id)_mapkit_formattedStringForCoordinate:()MKAdditions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  _CreateCoordinateComponentString(0, a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateCoordinateComponentString(1, a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  _MKLocalizedStringFromThisBundle(CFSTR("%@, %@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", v7, v4, v5, 0);

  return v8;
}

+ (id)_mapkit_commaListDelimiter
{
  return _MKLocalizedStringFromThisBundle(CFSTR(", "));
}

- (id)_mapkit_componentsSeparatedFromCommaDelimitedList
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "_mapkit_commaListDelimiter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_mapkit_shortenedURLStringForFullURLString:()MKAdditions
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(&unk_1E2159FE8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(&unk_1E2159FE8);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v3, "hasPrefix:", v9))
        {
          objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v9, "length"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(&unk_1E2159FE8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
    v5 = v3;
  }
LABEL_11:
  if (objc_msgSend(v5, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x21)
  {
    v11 = objc_msgSend(v5, "rangeOfString:", CFSTR("/"));
    if (v11)
    {
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "substringToIndex:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v12;
      }
    }
  }

  return v5;
}

@end
