@implementation HKSelectedRangeFormatter

- (HKSelectedRangeFormatter)initWithUnitPreferenceController:(id)a3
{
  id v4;
  HKSelectedRangeFormatter *v5;
  HKSelectedRangeFormatter *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSelectedRangeFormatter;
  v5 = -[HKSelectedRangeFormatter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HKSelectedRangeFormatter setChartRangeProvider:](v5, "setChartRangeProvider:", 0);
    -[HKSelectedRangeFormatter setUnitPreferenceController:](v6, "setUnitPreferenceController:", v4);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeFormatter setMajorFont:](v6, "setMajorFont:", v7);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1438]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeFormatter setMinorFont:](v6, "setMinorFont:", v8);

  }
  return v6;
}

- (id)selectedRangeDataWithCoordinates:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v14 = (void *)MEMORY[0x1E0C99DE8];
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v14, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __111__HKSelectedRangeFormatter_selectedRangeDataWithCoordinates_majorFont_minorFont_displayType_timeScope_context___block_invoke;
  v23[3] = &unk_1E9C44628;
  v24 = v19;
  v20 = v19;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);

  -[HKSelectedRangeFormatter selectedRangeDataWithCoordinateInfo:majorFont:minorFont:displayType:timeScope:context:](self, "selectedRangeDataWithCoordinateInfo:majorFont:minorFont:displayType:timeScope:context:", v20, v17, v16, v15, a7, a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __111__HKSelectedRangeFormatter_selectedRangeDataWithCoordinates_majorFont_minorFont_displayType_timeScope_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)selectedRangeDataWithGraphView:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primarySeries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __109__HKSelectedRangeFormatter_selectedRangeDataWithGraphView_majorFont_minorFont_displayType_timeScope_context___block_invoke;
    v22[3] = &unk_1E9C44650;
    v23 = v18;
    objc_msgSend(v14, "enumerateVisibleCoordinatesForSeries:block:", v19, v22);

  }
  -[HKSelectedRangeFormatter selectedRangeDataWithCoordinateInfo:majorFont:minorFont:displayType:timeScope:context:](self, "selectedRangeDataWithCoordinateInfo:majorFont:minorFont:displayType:timeScope:context:", v18, v15, v16, v17, a7, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __109__HKSelectedRangeFormatter_selectedRangeDataWithGraphView_majorFont_minorFont_displayType_timeScope_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)selectedRangeDataWithCoordinateInfo:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v14 = (void *)MEMORY[0x1E0C99DE8];
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v14, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __114__HKSelectedRangeFormatter_selectedRangeDataWithCoordinateInfo_majorFont_minorFont_displayType_timeScope_context___block_invoke;
  v23[3] = &unk_1E9C44678;
  v24 = v19;
  v20 = v19;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);

  -[HKSelectedRangeFormatter selectedRangeDataWithChartData:majorFont:minorFont:displayType:timeScope:context:](self, "selectedRangeDataWithChartData:majorFont:minorFont:displayType:timeScope:context:", v20, v17, v16, v15, a7, a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __114__HKSelectedRangeFormatter_selectedRangeDataWithCoordinateInfo_majorFont_minorFont_displayType_timeScope_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F0170730))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)selectedRangeDataWithChartData:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v32;
  id v33;
  uint64_t v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (objc_msgSend(v14, "count"))
  {
    -[HKSelectedRangeFormatter _formatterForDisplayType:timeScope:majorFont:minorFont:](self, "_formatterForDisplayType:timeScope:majorFont:minorFont:", v17, a7, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "objectType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v21 = v18;
        objc_msgSend(v17, "objectType");
        v33 = v15;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "displayType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSelectedRangeFormatter chartRangeProvider](self, "chartRangeProvider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "configureFormatterForDisplayType:quantityType:chartRangeProvider:timeScope:context:", v23, v22, v24, a7, a8);

        objc_msgSend(v21, "formattedSelectedRangeLabelDataWithChartData:context:", v14, a8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v33;
LABEL_18:

        goto LABEL_19;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
      }
      objc_msgSend(v18, "formattedSelectedRangeLabelDataWithChartData:context:", v14, a8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v26 = v18;
    objc_msgSend(v26, "displayType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeFormatter _statFormatterItemOptionsForTimePeriodDisplayType:timeScope:context:](self, "_statFormatterItemOptionsForTimePeriodDisplayType:timeScope:context:", v27, a7, a8);
    v34 = objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v17, "displayTypeIdentifier");
    if (a7 != 6 || v28 != 79)
      goto LABEL_15;
    if (a8 == 1)
    {
      -[HKSelectedRangeFormatter chartRangeProvider](self, "chartRangeProvider");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)v34;
      objc_msgSend(v26, "formattedBoundedSelectedRangeLabelDataWithChartData:items:customDataType:chartRangeProvider:", v14, v34, 6, v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    if (!a8)
    {
      v29 = (void *)v34;
      objc_msgSend(v26, "formattedSelectedRangeLabelDataWithChartData:items:customDataType:", v14, v34, 6);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_15:
      v29 = (void *)v34;
      objc_msgSend(v26, "formattedSelectedRangeLabelDataWithChartData:items:", v14, v34);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v30;
LABEL_17:

    goto LABEL_18;
  }
  v25 = (void *)MEMORY[0x1E0C9AA60];
LABEL_19:

  return v25;
}

- (id)_formatterForDisplayType:(id)a3 timeScope:(int64_t)a4 majorFont:(id)a5 minorFont:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "hk_interactiveChartsFormatterForTimeScope:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMajorFont:", v11);
  objc_msgSend(v13, "setMinorFont:", v12);
  v14 = v10;
  objc_opt_class();
  v15 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    while (1)
    {
      v16 = v15;
      objc_msgSend(v16, "baseDisplayType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        break;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_7;
    }
    v15 = v16;
  }
LABEL_7:
  objc_msgSend(v13, "setDisplayType:", v15);
  -[HKSelectedRangeFormatter unitPreferenceController](self, "unitPreferenceController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUnitController:", v17);

  return v13;
}

- (id)_statFormatterItemOptionsForTimePeriodDisplayType:(id)a3 timeScope:(int64_t)a4 context:(int64_t)a5
{
  void *v5;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (a5 != 1)
  {
    if (a5)
      goto LABEL_18;
    if (objc_msgSend(v9, "displayTypeIdentifier") != 237)
    {
      v11 = a4 & 0xFFFFFFFFFFFFFFFELL;
      v12 = &unk_1E9CEA040;
      v13 = &unk_1E9CEA028;
      goto LABEL_15;
    }
LABEL_9:
    -[HKSelectedRangeFormatter _handwashingStatFormatterItemOptionsForTimePeriodTimeScope:](self, "_handwashingStatFormatterItemOptionsForTimePeriodTimeScope:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v14 = objc_msgSend(v9, "displayTypeIdentifier");
  v5 = &unk_1E9CEA0E8;
  if (v14 <= 98)
  {
    if (v14 == 70)
      goto LABEL_14;
    if (v14 == 79)
    {
      if ((unint64_t)(a4 - 2) >= 5)
        v5 = &unk_1E9CEA0A0;
      else
        v5 = (void *)qword_1E9C44698[a4 - 2];
    }
  }
  else
  {
    if (v14 != 99)
    {
      if (v14 != 189)
      {
        if (v14 != 237)
          goto LABEL_18;
        goto LABEL_9;
      }
LABEL_14:
      v11 = a4 & 0xFFFFFFFFFFFFFFFELL;
      v12 = &unk_1E9CEA0D0;
      v13 = &unk_1E9CEA0B8;
LABEL_15:
      if (v11 == 2)
        v5 = v13;
      else
        v5 = v12;
      goto LABEL_18;
    }
    if ((unint64_t)a4 > 6)
      v16 = 8;
    else
      v16 = qword_1D7B81FC8[a4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:

  return v5;
}

- (id)_handwashingStatFormatterItemOptionsForTimePeriodTimeScope:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return &unk_1E9CEA100;
  else
    return &unk_1E9CEA118;
}

- (HKInteractiveChartRangeProvider)chartRangeProvider
{
  return self->_chartRangeProvider;
}

- (void)setChartRangeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_chartRangeProvider, a3);
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
  objc_storeStrong((id *)&self->_unitPreferenceController, a3);
}

- (UIFont)majorFont
{
  return self->_majorFont;
}

- (void)setMajorFont:(id)a3
{
  objc_storeStrong((id *)&self->_majorFont, a3);
}

- (UIFont)minorFont
{
  return self->_minorFont;
}

- (void)setMinorFont:(id)a3
{
  objc_storeStrong((id *)&self->_minorFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_chartRangeProvider, 0);
}

@end
