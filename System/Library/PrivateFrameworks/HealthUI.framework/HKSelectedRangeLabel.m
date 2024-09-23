@implementation HKSelectedRangeLabel

- (HKSelectedRangeLabel)init
{
  HKSelectedRangeLabel *result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKSelectedRangeLabel;
  result = -[HKSelectedRangeLabel init](&v4, sel_init);
  if (result)
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&result->_padding.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&result->_padding.bottom = v3;
  }
  return result;
}

+ (void)clearCaches
{
  id v2;

  +[_WDSelectedRangeIcon _iconCache](_WDSelectedRangeIcon, "_iconCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)drawTextInRect:(CGRect)a3
{
  double top;
  double left;
  CGFloat v5;
  CGFloat v6;
  objc_super v7;

  top = self->_padding.top;
  left = self->_padding.left;
  v5 = a3.size.width - (left + self->_padding.right);
  v6 = a3.size.height - (top + self->_padding.bottom);
  v7.receiver = self;
  v7.super_class = (Class)HKSelectedRangeLabel;
  -[HKSelectedRangeLabel drawTextInRect:](&v7, sel_drawTextInRect_, a3.origin.x + left, a3.origin.y + top, v5, v6);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)HKSelectedRangeLabel;
  -[HKSelectedRangeLabel intrinsicContentSize](&v7, sel_intrinsicContentSize);
  v4 = v3 + self->_padding.left + self->_padding.right;
  v6 = v5 + self->_padding.top + self->_padding.bottom;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setSelectedRangeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HKSelectedRangeLabel textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSelectedRangeLabel standardPrefixColorForSelectedRangeData:defaultColor:](HKSelectedRangeLabel, "standardPrefixColorForSelectedRangeData:defaultColor:", v4, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSelectedRangeLabel font](self, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeLabel textColor](self, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSelectedRangeLabel attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:](HKSelectedRangeLabel, "attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v4, v6, v7, v9, objc_msgSend(v4, "prefersImageAffixes"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSelectedRangeLabel setAttributedText:](self, "setAttributedText:", v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKSelectedRangeLabel;
  -[HKSelectedRangeLabel traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  +[_WDSelectedRangeIcon _iconCache](_WDSelectedRangeIcon, "_iconCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

+ (id)attributedStringForSelectedRangeData:(id)a3 font:(id)a4 foregroundColor:(id)a5 prefixColor:(id)a6 prefersImageAffixes:(BOOL)a7 embedded:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend(a1, "_attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v14, v15, v16, a6, v9, v8);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v9 && v17)
  {
    objc_msgSend(a1, "_attributedMultiplePrefixStringForSelectedRangeData:attributedString:font:foregroundColor:", v14, v17, v15, v16);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }

  return v18;
}

+ (id)_attributedStringForSelectedRangeData:(id)a3 font:(id)a4 foregroundColor:(id)a5 prefixColor:(id)a6 prefersImageAffixes:(BOOL)a7 embedded:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  _QWORD v35[3];
  _QWORD v36[2];
  _QWORD v37[3];

  v8 = a8;
  v9 = a7;
  v37[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v36[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(v14, "titleColorOverride");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = v18;
  else
    v20 = (uint64_t)v16;
  v36[1] = *MEMORY[0x1E0DC1138];
  v37[0] = v20;
  v37[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[_WDSelectedRangeIcon iconForData:foregroundColor:compatibleWithFont:](_WDSelectedRangeIcon, "iconForData:foregroundColor:compatibleWithFont:", v14, v17, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(a1, "_stringForSelectedRangeData:embedded:", v14, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v23, v21);
    v25 = (void *)v24;
    if (v22 && v24)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v34 = v16;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("BLOOD_PRESSURE_SYMBOL_SPACE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v33 = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v26, "initWithString:attributes:", v28, v21);

      v16 = v34;
      v35[0] = v22;
      v35[1] = v29;
      v35[2] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinAttributedStringsForLocale(v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      v17 = v33;
LABEL_14:

      v25 = v31;
      goto LABEL_15;
    }
  }
  else
  {
    v25 = 0;
  }
  if (v22)
  {
    v31 = v22;
    goto LABEL_14;
  }
LABEL_15:

  return v25;
}

+ (id)_addChevron:(id)a3 font:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == 1)
    v8 = CFSTR("date_chevron_left");
  else
    v8 = CFSTR("date_chevron_right");
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v11, "setImage:", v10);
  objc_msgSend(v10, "size");
  if (v12 != 0.0)
  {
    objc_msgSend(v10, "size");
    objc_msgSend(v10, "size");
  }
  objc_msgSend(v6, "capHeight");
  objc_msgSend(v11, "bounds");
  v14 = v13;
  objc_msgSend(v11, "bounds");
  objc_msgSend(v11, "setBounds:", v14);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinAttributedStringsForLocale(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_attributedMultiplePrefixStringForSelectedRangeData:(id)a3 attributedString:(id)a4 font:(id)a5 foregroundColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HKSelectedRangeData *v14;
  HKSelectedRangeData *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HKSelectedRangeData *v27;
  HKSelectedRangeData *v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v34 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "dataType") == 5
    && (objc_msgSend(v10, "statisticsType") == 3 || objc_msgSend(v10, "statisticsType") == 5))
  {
    v29 = v11;
    v30 = v10;
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    v14 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
    -[HKSelectedRangeData setDataType:](v14, "setDataType:", 3);
    v15 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
    -[HKSelectedRangeData setDataType:](v15, "setDataType:", 4);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v15;
    v28 = v14;
    v40[0] = v14;
    v40[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = v13;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v35)
    {
      v32 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v37 != v32)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(a1, "standardPrefixColorForSelectedRangeData:defaultColor:", v17, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v17, v34, v12, v18, 1, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v17, v34, v12, v18, 0, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "mutableString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "string");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "rangeOfString:", v22);
          v25 = v24;

          v13 = v33;
          if (v25)
            objc_msgSend(v33, "replaceCharactersInRange:withAttributedString:", v23, v25, v19);

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v35);
    }

    v11 = v29;
    v10 = v30;
  }
  else
  {
    v33 = v11;
  }

  return v33;
}

+ (id)_stringForSelectedRangeData:(id)a3 embedded:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void **v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  _QWORD v49[4];

  v4 = a4;
  v49[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "titleOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (objc_msgSend(v5, "statisticsType") == 3 && objc_msgSend(v5, "dataType") == 7)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("LEFT_AVERAGE_HEARING");
    }
    else if (objc_msgSend(v5, "statisticsType") == 3 && objc_msgSend(v5, "dataType") == 8)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("RIGHT_AVERAGE_HEARING");
    }
    else if (objc_msgSend(v5, "statisticsType") == 3 && objc_msgSend(v5, "dataType") == 9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("IN_BED_AVERAGE");
    }
    else
    {
      if (objc_msgSend(v5, "statisticsType") != 3 || objc_msgSend(v5, "dataType") != 10)
      {
        if (objc_msgSend(v5, "statisticsType") == 3 && objc_msgSend(v5, "dataType") == 24)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = CFSTR("SLEEP_STAGES_ANNOTATION_AVERAGE_AWAKE");
        }
        else if (objc_msgSend(v5, "statisticsType") == 3 && objc_msgSend(v5, "dataType") == 25)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = CFSTR("SLEEP_STAGES_ANNOTATION_AVERAGE_CORE");
        }
        else if (objc_msgSend(v5, "statisticsType") == 3 && objc_msgSend(v5, "dataType") == 26)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = CFSTR("SLEEP_STAGES_ANNOTATION_AVERAGE_DEEP");
        }
        else
        {
          if (objc_msgSend(v5, "statisticsType") != 3 || objc_msgSend(v5, "dataType") != 27)
          {
            if (objc_msgSend(v5, "statisticsType") == 3 && objc_msgSend(v5, "dataType") == 5)
            {
              v15 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v16;
              v17 = CFSTR("AVERAGE_INSULIN_DELIVERY");
            }
            else
            {
              if (objc_msgSend(v5, "statisticsType") != 5 || objc_msgSend(v5, "dataType") != 5)
              {
                switch(objc_msgSend(v5, "statisticsType"))
                {
                  case 1:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("MINIMUM_ABBREVIATED");
                    goto LABEL_81;
                  case 2:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("MAXIMUM_ABBREVIATED");
                    goto LABEL_81;
                  case 3:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v4)
                    {
                      v24 = CFSTR("AVERAGE_ABBREVIATED");
                      goto LABEL_74;
                    }
                    v23 = CFSTR("AVERAGE_NORMAL");
                    goto LABEL_151;
                  case 4:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("EXPOSURE_NORMAL");
                    goto LABEL_81;
                  case 5:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("TOTAL_ABBREVIATED");
                    goto LABEL_81;
                  case 6:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("INCREASE_ABBREVIATED");
                    goto LABEL_81;
                  case 7:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("DECREASE_ABBREVIATED");
                    goto LABEL_81;
                  case 8:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v4)
                    {
                      v24 = CFSTR("DAILY_AVERAGE_ABBREVIATED");
                      goto LABEL_74;
                    }
                    v23 = CFSTR("DAILY_AVERAGE_FULL");
                    goto LABEL_151;
                  case 9:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("RANGE_ABBREVIATED");
                    goto LABEL_81;
                  case 10:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("DURATION_ABBREVIATED");
                    goto LABEL_81;
                  case 11:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("MOST_RECENT_ABBREVIATED");
                    goto LABEL_81;
                  case 12:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v4)
                    {
                      v24 = CFSTR("MONTHLY_AVERAGE_ABBREVIATED");
                      goto LABEL_74;
                    }
                    v23 = CFSTR("MONTHLY_AVERAGE_FULL");
                    goto LABEL_151;
                  case 13:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v4)
                    {
                      v24 = CFSTR("HOURLY_AVERAGE_ABBREVIATED");
                      goto LABEL_74;
                    }
                    v23 = CFSTR("HOURLY_AVERAGE_FULL");
                    goto LABEL_151;
                  case 14:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v4)
                    {
                      v24 = CFSTR("MINUTE_AVERAGE_ABBREVIATED");
                      goto LABEL_74;
                    }
                    v23 = CFSTR("MINUTE_AVERAGE_FULL");
                    goto LABEL_151;
                  case 15:
                    HKHealthKitFrameworkBundle();
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v25 = (const __CFString *)*MEMORY[0x1E0CB5138];
                    v23 = CFSTR("RESTING_HEART_RATE");
                    goto LABEL_82;
                  case 16:
                    HKHealthKitFrameworkBundle();
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v25 = (const __CFString *)*MEMORY[0x1E0CB5138];
                    v23 = CFSTR("WALKING_HEART_RATE_AVERAGE_SHORT");
                    goto LABEL_82;
                  case 17:
                    HKHealthKitFrameworkBundle();
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v25 = (const __CFString *)*MEMORY[0x1E0CB5138];
                    v23 = CFSTR("WORKOUT");
                    goto LABEL_82;
                  case 18:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("BREATHE");
                    goto LABEL_81;
                  case 19:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("SLEEP");
                    goto LABEL_81;
                  case 20:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("SYMPTOM_TITLE");
                    goto LABEL_81;
                  case 21:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SCANDIUM_OVERLAY_LOW_AIR_PRESSURE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "localizedUppercaseString");
                    v12 = (void *)objc_claimAutoreleasedReturnValue();

                    v9 = 0;
                    goto LABEL_84;
                  case 22:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("CARDIO_FITNESS_LEVEL_TITLE");
                    goto LABEL_71;
                  case 23:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("CARDIO_FITNESS_LEVEL_AVERAGE_TITLE");
LABEL_71:
                    v25 = CFSTR("HealthUI-Localizable-CardioFitness");
                    goto LABEL_82;
                  case 24:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v4)
                    {
                      v24 = CFSTR("WEEKLY_AVERAGE_ABBREVIATED");
LABEL_74:
                      objc_msgSend(v22, "localizedStringForKey:value:table:", v24, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
                      v9 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v23 = CFSTR("WEEKLY_AVERAGE_FULL");
LABEL_151:
                      v25 = CFSTR("HealthUI-Localizable");
                      v21 = v22;
LABEL_82:
                      objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1E9C4C428, v25);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "localizedUppercaseString");
                      v9 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    v12 = 0;
LABEL_84:

LABEL_85:
                    switch(objc_msgSend(v5, "dataType"))
                    {
                      case 1:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SYSTOLIC");
                        goto LABEL_111;
                      case 2:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("DIASTOLIC");
                        goto LABEL_111;
                      case 3:
                        v31 = 1;
                        HKUIStringForInsulinDeliveryReasonEmbedded(1, v4);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "localizedUppercaseString");
                        v32 = objc_claimAutoreleasedReturnValue();
                        goto LABEL_126;
                      case 4:
                        HKUIStringForInsulinDeliveryReasonEmbedded(2, v4);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "localizedUppercaseString");
                        v33 = objc_claimAutoreleasedReturnValue();
                        goto LABEL_144;
                      case 5:
                        v34 = (void *)MEMORY[0x1E0CB3940];
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("INSULIN_DELIVERY_REASON_COMBINED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
                        v35 = objc_claimAutoreleasedReturnValue();
                        HKUIStringForInsulinDeliveryReasonEmbedded(1, 1);
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        HKUIStringForInsulinDeliveryReasonEmbedded(2, 1);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "stringWithFormat:", v35, v36, v37);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v38, "localizedUppercaseString");
                        v32 = objc_claimAutoreleasedReturnValue();

                        v12 = (void *)v35;
                        v31 = 1;
                        goto LABEL_126;
                      case 6:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("ACTIVE_ABBREVIATED");
                        goto LABEL_111;
                      case 7:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("LEFT_AVERAGE_HEARING_SHORT");
                        goto LABEL_111;
                      case 8:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("RIGHT_AVERAGE_HEARING_SHORT");
                        goto LABEL_111;
                      case 9:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("IN_BED");
                        goto LABEL_111;
                      case 10:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("ASLEEP");
                        goto LABEL_111;
                      case 11:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("MENSTRUAL_FLOW");
                        goto LABEL_111;
                      case 12:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("START_OF_CYCLE");
                        goto LABEL_111;
                      case 13:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_GOAL_CONTEXT");
                        goto LABEL_108;
                      case 14:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_SCHEDULE_BEDTIME");
                        goto LABEL_108;
                      case 15:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_SCHEDULE_WAKETIME");
                        goto LABEL_108;
                      case 16:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_START");
                        goto LABEL_108;
                      case 17:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_END");
                        goto LABEL_108;
                      case 18:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_IN_BED_START");
                        goto LABEL_108;
                      case 19:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_IN_BED_END");
LABEL_108:
                        v39 = CFSTR("HealthUI-Localizable-Eucalyptus");
                        goto LABEL_124;
                      case 20:
                      case 21:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("GLUCOSE_BELOW_RANGE");
                        goto LABEL_111;
                      case 22:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("GLUCOSE_IN_RANGE");
                        goto LABEL_111;
                      case 23:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("GLUCOSE_ABOVE_RANGE");
LABEL_111:
                        v39 = CFSTR("HealthUI-Localizable");
                        goto LABEL_124;
                      case 24:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_STAGES_ANNOTATION_AWAKE");
                        goto LABEL_116;
                      case 25:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_STAGES_ANNOTATION_CORE");
                        goto LABEL_116;
                      case 26:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_STAGES_ANNOTATION_DEEP");
                        goto LABEL_116;
                      case 27:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("SLEEP_STAGES_ANNOTATION_REM");
LABEL_116:
                        v39 = CFSTR("HealthUI-Localizable-Acacia");
                        goto LABEL_124;
                      case 28:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v40;
                        v41 = CFSTR("DOSE_EVENT_CHART_TAKEN");
                        goto LABEL_119;
                      case 29:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v40;
                        v41 = CFSTR("DOSE_EVENT_CHART_SKIPPED");
LABEL_119:
                        objc_msgSend(v40, "localizedStringForKey:value:table:", v41, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Meds"));
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "localizedUppercaseString");
                        v32 = objc_claimAutoreleasedReturnValue();

                        v31 = 0;
                        goto LABEL_125;
                      case 30:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("STATE_OF_MIND_CHART_DAILY");
                        goto LABEL_123;
                      case 31:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("STATE_OF_MIND_CHART_MOMENTARY");
                        goto LABEL_123;
                      case 32:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v28;
                        v30 = CFSTR("STATE_OF_MIND_CHART_TOTAL_MOMENTARY");
LABEL_123:
                        v39 = CFSTR("HealthUI-Localizable-Chamomile");
LABEL_124:
                        objc_msgSend(v28, "localizedStringForKey:value:table:", v30, &stru_1E9C4C428, v39);
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "localizedUppercaseString");
                        v32 = objc_claimAutoreleasedReturnValue();

                        v31 = 1;
LABEL_125:
                        v12 = v42;
                        goto LABEL_126;
                      case 33:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v46;
                        v47 = CFSTR("BALANCE_CHART_BLOOD_OXYGEN");
                        goto LABEL_143;
                      case 34:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v46;
                        v47 = CFSTR("BALANCE_CHART_HEART_RATE");
                        goto LABEL_143;
                      case 35:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v46;
                        v47 = CFSTR("BALANCE_CHART_RESPIRATORY_RATE");
                        goto LABEL_143;
                      case 36:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v46;
                        v47 = CFSTR("BALANCE_CHART_TIME_ASLEEP");
                        goto LABEL_143;
                      case 37:
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v46;
                        v47 = CFSTR("BALANCE_CHART_WRIST_TEMPERATURE");
LABEL_143:
                        objc_msgSend(v46, "localizedStringForKey:value:table:", v47, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Balance"));
                        v33 = objc_claimAutoreleasedReturnValue();
LABEL_144:
                        v32 = v33;
                        v31 = 1;
LABEL_126:

                        v12 = (void *)v32;
                        break;
                      default:
                        v31 = 1;
                        break;
                    }
                    if (v9 && v12)
                    {
                      if (v31)
                      {
                        v49[0] = v12;
                        v43 = (void **)v49;
                        v44 = v9;
                      }
                      else
                      {
                        v48 = v9;
                        v43 = &v48;
                        v44 = v12;
                      }
                      v43[1] = CFSTR(" ");
                      v43[2] = v44;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      HKUIJoinStringsForLocale(v18);
                      v7 = (void *)objc_claimAutoreleasedReturnValue();
                      goto LABEL_137;
                    }
                    if (v9)
                      v45 = v9;
                    else
                      v45 = v12;
                    v13 = v45;
                    break;
                  case 25:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("LEVEL_TITLE");
                    goto LABEL_81;
                  case 26:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("LEVEL_RANGE_TITLE");
                    goto LABEL_81;
                  case 27:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("LEVEL_AVERAGE_TITLE");
                    goto LABEL_81;
                  case 28:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("LEVEL_MOST_FREQUENT_TITLE");
                    goto LABEL_81;
                  case 29:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("MAXIMUM_DEPTH");
                    v25 = CFSTR("HealthUI-Localizable-Charon");
                    goto LABEL_82;
                  case 30:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("STATE_MOST_FREQUENT_TITLE");
LABEL_81:
                    v25 = CFSTR("HealthUI-Localizable");
                    goto LABEL_82;
                  case 31:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    v23 = CFSTR("SLEEP_BREATHING_DISTURBANCES_LEVEL_TITLE");
                    v25 = CFSTR("HealthUI-Localizable-Nebula");
                    goto LABEL_82;
                  default:
                    v9 = 0;
                    v12 = 0;
                    goto LABEL_85;
                }
                goto LABEL_30;
              }
              v15 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v16;
              v17 = CFSTR("TOTAL_INSULIN_DELIVERY");
            }
            objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            HKUIStringForInsulinDeliveryReasonEmbedded(1, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            HKUIStringForInsulinDeliveryReasonEmbedded(2, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", v12, v18, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localizedUppercaseString");
            v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_137:
            goto LABEL_31;
          }
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = CFSTR("SLEEP_STAGES_ANNOTATION_AVERAGE_REM");
        }
        v11 = CFSTR("HealthUI-Localizable-Acacia");
LABEL_29:
        objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedUppercaseString");
        v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
        v7 = v13;
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("ASLEEP_AVERAGE");
    }
    v11 = CFSTR("HealthUI-Localizable");
    goto LABEL_29;
  }
  objc_msgSend(v5, "titleOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v7;
}

+ (id)standardPrefixColorForSelectedRangeData:(id)a3 defaultColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "prefixColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    objc_msgSend(v5, "prefixColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  switch(objc_msgSend(v5, "dataType"))
  {
    case 1:
    case 20:
    case 21:
    case 22:
    case 23:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsKeyColor");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_insulinBasalKeyColor");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      HKHealthKeyColor();
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      if (v7)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInBedColor");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      if (v7)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 11:
    case 12:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_reproductiveHealthKeyColor");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 28:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_medicationDoseEventTakenColor");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 29:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_medicationDoseEventSkippedColor");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_16;
  }
  v10 = (void *)v9;

  v8 = v10;
LABEL_16:

  return v8;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

@end
