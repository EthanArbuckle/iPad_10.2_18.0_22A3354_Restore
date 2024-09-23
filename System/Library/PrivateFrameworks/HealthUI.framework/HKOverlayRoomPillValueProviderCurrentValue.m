@implementation HKOverlayRoomPillValueProviderCurrentValue

- (HKOverlayRoomPillValueProviderCurrentValue)initWithSelectedRangeFormatter:(id)a3 interfaceLayout:(int64_t)a4
{
  id v7;
  HKOverlayRoomPillValueProviderCurrentValue *v8;
  HKOverlayRoomPillValueProviderCurrentValue *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKOverlayRoomPillValueProviderCurrentValue;
  v8 = -[HKOverlayRoomPillValueProviderCurrentValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_selectedRangeFormatter, a3);
    v9->_interfaceLayout = a4;
  }

  return v9;
}

- (id)_contextStatisticsTypeString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  unint64_t v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "statisticsType");
        if (v9 <= 0x18 && ((1 << v9) & 0x1007108) != 0)
        {
          v11 = v8;

          v5 = v11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemValueAndUnitFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKSelectedRangeLabel attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:](HKSelectedRangeLabel, "attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v5, v12, v13, v14, 0, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HKSelectedRangeFormatter *v16;
  HKOverlayPillValue *v17;
  void *v18;
  void *v19;
  HKOverlayPillValue *v20;
  void *v21;
  HKOverlayPillValue *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  id v43;
  id v44;
  HKSelectedRangeFormatter *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a7;
  if (objc_msgSend(v11, "count"))
  {
    -[HKOverlayRoomPillValueProviderCurrentValue selectedRangeFormatter](self, "selectedRangeFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v43 = v13;
    v44 = v12;
    if (v14)
      v16 = v14;
    else
      v16 = -[HKSelectedRangeFormatter initWithUnitPreferenceController:]([HKSelectedRangeFormatter alloc], "initWithUnitPreferenceController:", v13);
    v45 = v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v24 = v11;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v51 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "userInfo");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "conformsToProtocol:", &unk_1F0170730))
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v26);
    }

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemValueAndUnitFont");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemValueAndUnitFont");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v44;
    -[HKSelectedRangeFormatter selectedRangeDataWithChartData:majorFont:minorFont:displayType:timeScope:context:](v45, "selectedRangeDataWithChartData:majorFont:minorFont:displayType:timeScope:context:", v23, v30, v31, v44, a6, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HKOverlayRoomPillValueProviderCurrentValue _contextStatisticsTypeString:](self, "_contextStatisticsTypeString:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      objc_msgSend(v33, "addObject:", v34);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v35 = v32;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v47 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "attributedString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v40);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v37);
    }

    HKUIJoinAttributedStringsForLocaleWithSeparator(v33, CFSTR(" "));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HKOverlayPillValue initWithAttributedValue:]([HKOverlayPillValue alloc], "initWithAttributedValue:", v41);

    v13 = v43;
  }
  else
  {
    v17 = [HKOverlayPillValue alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v17;
    v21 = v12;
    v22 = -[HKOverlayPillValue initWithValueString:unitString:](v20, "initWithValueString:unitString:", v19, &stru_1E9C4C428);

  }
  return v22;
}

- (HKSelectedRangeFormatter)selectedRangeFormatter
{
  return self->_selectedRangeFormatter;
}

- (int64_t)interfaceLayout
{
  return self->_interfaceLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRangeFormatter, 0);
}

@end
