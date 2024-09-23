@implementation WDHeadphoneAudioExposureEventListDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "headphoneAudioExposureEventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)cellStyle
{
  return 2;
}

- (double)customCellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (double)customEstimatedCellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  id v7;
  WDDataTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a3;
  objc_msgSend(a5, "dequeueReusableCellWithIdentifier:", CFSTR("CellIdentifier"));
  v8 = (WDDataTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = -[WDDataTableViewCell initWithStyle:reuseIdentifier:]([WDDataTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("CellIdentifier"));
  objc_msgSend(v7, "sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider unitController](self, "unitController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_formatPrimaryMetadataValueForObject:unitPreferencesController:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v7;
      -[WDSampleListDataProvider displayTypeController](self, "displayTypeController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sampleType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayTypeForObjectType:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hk_enumeratedValueLabels");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x24BDD16E0];
      v18 = objc_msgSend(v12, "value");

      objc_msgSend(v17, "numberWithInteger:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  -[WDDataTableViewCell setDisplayValue:](v8, "setDisplayValue:", v11);
  -[WDDataTableViewCell setAccessoryType:](v8, "setAccessoryType:", 1);
  objc_msgSend(v7, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringForDate();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell setDateString:](v8, "setDateString:", v21);

  return v8;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  -[WDSampleListDataProvider samples](self, "samples", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 1)
  {
    v9 = &stru_24D38E7C8;
  }
  else
  {
    -[WDSampleListDataProvider samples](self, "samples");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sampleAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sampleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_localizedName");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

@end
