@implementation HKOverlayContextUtilities

+ (id)selectedMetricColorsForCategory:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    case 1:
    case 11:
      +[HKUIMetricColors vitalsColors](HKUIMetricColors, "vitalsColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 2:
      +[HKUIMetricColors activityColors](HKUIMetricColors, "activityColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 4:
      +[HKUIMetricColors nutritionColors](HKUIMetricColors, "nutritionColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 5:
      +[HKUIMetricColors sleepColors](HKUIMetricColors, "sleepColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 6:
      +[HKUIMetricColors bodyMeasurementColors](HKUIMetricColors, "bodyMeasurementColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 8:
      +[HKUIMetricColors reproductiveHealthColors](HKUIMetricColors, "reproductiveHealthColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 9:
    case 15:
      +[HKUIMetricColors unknownCategoryClinicalColors](HKUIMetricColors, "unknownCategoryClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 10:
      +[HKUIMetricColors mindfulnessColors](HKUIMetricColors, "mindfulnessColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 12:
      +[HKUIMetricColors hearingHealthColors](HKUIMetricColors, "hearingHealthColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 13:
      +[HKUIMetricColors respiratoryColors](HKUIMetricColors, "respiratoryColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 14:
      +[HKUIMetricColors otherColors](HKUIMetricColors, "otherColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 16:
      +[HKUIMetricColors allergiesClinicalColors](HKUIMetricColors, "allergiesClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 17:
      +[HKUIMetricColors vitalsClinicalColors](HKUIMetricColors, "vitalsClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 18:
      +[HKUIMetricColors conditionsClinicalColors](HKUIMetricColors, "conditionsClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 19:
      +[HKUIMetricColors immunizationsClinicalColors](HKUIMetricColors, "immunizationsClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 20:
      +[HKUIMetricColors labResultsClinicalColors](HKUIMetricColors, "labResultsClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 21:
      +[HKUIMetricColors medicationsClinicalColors](HKUIMetricColors, "medicationsClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 22:
      +[HKUIMetricColors proceduresClinicalColors](HKUIMetricColors, "proceduresClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 23:
      +[HKUIMetricColors mobilityColors](HKUIMetricColors, "mobilityColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 26:
      +[HKUIMetricColors symptomsColors](HKUIMetricColors, "symptomsColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 27:
      +[HKUIMetricColors insuranceClinicalColors](HKUIMetricColors, "insuranceClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 30:
      +[HKUIMetricColors clinicalNotesClinicalColors](HKUIMetricColors, "clinicalNotesClinicalColors");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 31:
      +[HKUIMetricColors medicationTrackingColors](HKUIMetricColors, "medicationTrackingColors");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v3 = (void *)v4;
      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)stackedChartMetricColorsForSampleType:(id)a3 templateType:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = objc_msgSend(a3, "code");
  if (v6 <= 74)
  {
    switch(v6)
    {
      case 3:
        +[HKUIMetricColors bodyMeasurementColors](HKUIMetricColors, "bodyMeasurementColors");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 61:
        +[HKUIMetricColors respiratoryColors](HKUIMetricColors, "respiratoryColors");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 63:
        +[HKUIMetricColors sleepColors](HKUIMetricColors, "sleepColors");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
    }
  }
  else if (v6 > 190)
  {
    if (v6 == 191)
    {
      +[HKUIMetricColors pregnancyColors](HKUIMetricColors, "pregnancyColors");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (v6 == 251)
    {
      +[HKUIMetricColors otherColors](HKUIMetricColors, "otherColors");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else
  {
    if (v6 == 75)
    {
      +[HKUIMetricColors activityColors](HKUIMetricColors, "activityColors");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (v6 == 99)
    {
      +[HKUIMetricColors mindfulnessColors](HKUIMetricColors, "mindfulnessColors");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v10 = (void *)v7;
      goto LABEL_19;
    }
  }
  objc_msgSend(v5, "displayCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUIMetricColors categoryColorsWithColor:](HKUIMetricColors, "categoryColorsWithColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v10;
}

+ (id)defaultMetricColorsForOverlayMode:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((unint64_t)a3 < 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v3;
}

+ (void)setStackedSeriesLegend:(id)a3 title:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "hk_defaultSecondaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKLegendEntry legendEntryWithTitle:labelColor:](HKLegendEntry, "legendEntryWithTitle:labelColor:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleLegendEntries:", v10);

}

+ (id)stackedAxisConfiguration
{
  HKNumericAxisConfiguration *v2;

  v2 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](v2, "setTopVerticalLabelPadding:", 4.0);
  -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](v2, "setBottomVerticalLabelPadding:", 2.0);
  -[HKAxisConfiguration setMinLabels:](v2, "setMinLabels:", 3);
  -[HKAxisConfiguration setMaxLabels:](v2, "setMaxLabels:", 3);
  return v2;
}

@end
