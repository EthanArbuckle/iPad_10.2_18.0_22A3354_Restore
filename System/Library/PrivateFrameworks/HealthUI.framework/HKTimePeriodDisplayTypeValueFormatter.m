@implementation HKTimePeriodDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return -[HKTimePeriodDisplayTypeValueFormatter attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:](self, "attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:", a3, 0, a4, a5, a6, a7, v8);
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[HKTimePeriodDisplayTypeValueFormatter attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:](self, "attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:", a3, 0, a4, a5, a6, a7, v9);
}

- (id)attributedStringFromValue:(id)a3 roundToHours:(BOOL)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return -[HKTimePeriodDisplayTypeValueFormatter attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:usePerDayFormatting:](self, "attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:usePerDayFormatting:", a3, a4, a5, a6, a7, a8, v10);
}

- (id)attributedStringFromValue:(id)a3 roundToHours:(BOOL)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9 usePerDayFormatting:(BOOL)a10
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  int v56;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;

  v13 = a3;
  v14 = a5;
  v60 = a7;
  v15 = a8;
  objc_msgSend(v14, "presentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "useSecondsWhenDisplayingDuration");

  v59 = v13;
  objc_msgSend(v13, "doubleValue");
  HKSeparateTimeIntervalComponents();
  objc_msgSend(v14, "presentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "useSecondsWhenDisplayingDuration");

  v63 = v15;
  v58 = v14;
  v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  HKIntegerFormatter();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromNumber:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MINUTES_PAIR_MEDIUM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringWithFormat:", v23, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("\uFFFC"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "addObject:", v25);
  v26 = objc_msgSend(v61, "count");
  if (v26 == 3)
  {
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v33;
    if (a10)
      v34 = CFSTR("TIME_DISPLAY_3_DAY");
    else
      v34 = CFSTR("TIME_DISPLAY_3");
    objc_msgSend(v33, "localizedStringForKey:value:table:", v34, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringWithFormat:", v39, v40, v41, v42, v58);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = v60;
    if (v26 == 2)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v36;
      if (a10)
        v37 = CFSTR("TIME_DISPLAY_2_DAY");
      else
        v37 = CFSTR("TIME_DISPLAY_2");
      objc_msgSend(v36, "localizedStringForKey:value:table:", v37, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringWithFormat:", v39, v40, v43);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v26 != 1)
      {
        v38 = CFSTR("<error>");
        goto LABEL_18;
      }
      v28 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (a10)
        v31 = CFSTR("TIME_DISPLAY_1_DAY");
      else
        v31 = CFSTR("TIME_DISPLAY_1");
      objc_msgSend(v29, "localizedStringForKey:value:table:", v31, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithFormat:", v39, v40);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  v27 = v60;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v38);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[__CFString length](v38, "length");
  if (v47 >= 1)
  {
    v48 = v47;
    v49 = 0;
    v50 = *MEMORY[0x1E0DC1138];
    v51 = *MEMORY[0x1E0DC1140];
    do
    {
      if (objc_msgSend(v44, "characterIsMember:", -[__CFString characterAtIndex:](v38, "characterAtIndex:", v49)))
      {
        if (v27)
          objc_msgSend(v45, "addAttribute:value:range:", v50, v27, v49, 1);
        v52 = v62;
        if (!a9)
          goto LABEL_29;
      }
      else
      {
        if (v63)
          objc_msgSend(v45, "addAttribute:value:range:", v50, v63, v49, 1);
        v52 = v46;
        if (!a9)
          goto LABEL_29;
      }
      objc_msgSend(v45, "addAttribute:value:range:", v51, v52, v49, 1);
LABEL_29:
      ++v49;
    }
    while (v48 != v49);
  }
  objc_msgSend(MEMORY[0x1E0CB3498], "hk_attributedStringForSpacing:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "length"))
  {
    v54 = 0;
    do
    {
      objc_msgSend(v45, "string");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "characterAtIndex:", v54);

      if (v56 == 65532)
      {
        objc_msgSend(v45, "replaceCharactersInRange:withAttributedString:", v54, objc_msgSend(CFSTR("\uFFFC"), "length"), v53);
        v54 += objc_msgSend(v53, "length");
      }
      ++v54;
    }
    while (v54 < objc_msgSend(v45, "length"));
  }

  return v45;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  return (id)-[HKNumberFormatter stringFromNumber:displayType:unitController:](self->super._numberFormatter, "stringFromNumber:displayType:unitController:", a3, a4, a5);
}

@end
