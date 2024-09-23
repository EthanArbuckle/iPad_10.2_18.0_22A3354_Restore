@implementation HKInteractiveChartAppleWalkingSteadinessFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[HKInteractiveChartAppleWalkingSteadinessFormatter _formattedCurrentValueForChartData:context:](self, "_formattedCurrentValueForChartData:context:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)_formattedCurrentValueForChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = +[HKMobilityUtilities chartDataSpansMultipleClassifications:](HKMobilityUtilities, "chartDataSpansMultipleClassifications:", v6);
    if (v8)
      v9 = &unk_1E9CE9E78;
    else
      v9 = &unk_1E9CE9E90;
    if (v8)
      v10 = 26;
    else
      v10 = 25;
    -[HKInteractiveChartGenericStatFormatter setOverrideStatFormatterItemOptions:](self, "setOverrideStatFormatterItemOptions:", v9);
    v14.receiver = self;
    v14.super_class = (Class)HKInteractiveChartAppleWalkingSteadinessFormatter;
    -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v14, sel_formattedSelectedRangeLabelDataWithChartData_context_, v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStatisticsType:", v10);
    objc_msgSend(v12, "setDataType:", 0);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HKInteractiveChartAppleWalkingSteadinessFormatter;
    -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v15, sel_formattedSelectedRangeLabelDataWithChartData_context_, v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)attributedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[HKMobilityUtilities localizedTitleForClassification:](HKMobilityUtilities, "localizedTitleForClassification:", +[HKMobilityUtilities classificationForAppleWalkingSteadinessValue:](HKMobilityUtilities, "classificationForAppleWalkingSteadinessValue:", a4, a5, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *MEMORY[0x1E0DC1138];
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v9);
  return v10;
}

- (id)selectedRangeSeparatorString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RANGE_STROKE_SEPARATOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  return &stru_1E9C4C428;
}

@end
