@implementation WDCardioFitnessEventListDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "lowCardioFitnessEventType");
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
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  objc_msgSend(a5, "dequeueReusableCellWithIdentifier:", CFSTR("CellIdentifier"));
  v8 = (WDDataTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = -[WDDataTableViewCell initWithStyle:reuseIdentifier:]([WDDataTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("CellIdentifier"));
  -[WDSampleListDataProvider displayType](self, "displayType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_enumeratedValueLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell setDisplayValue:](v8, "setDisplayValue:", v12);

  objc_msgSend(v7, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HKFormattedStringForDate();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell setDateString:](v8, "setDateString:", v14);

  -[WDDataTableViewCell setAccessoryType:](v8, "setAccessoryType:", 1);
  return v8;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[WDSampleListDataProvider samples](self, "samples", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") < 1)
  {
    v5 = &stru_24D38E7C8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD3990], "lowCardioFitnessEventType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_localizedName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
