@implementation WDAtrialFibrillationEventListDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "atrialFibrillationEventType");
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
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "dequeueReusableCellWithIdentifier:", CFSTR("CellIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("CellIdentifier"));
  WDBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_EVENT_CELL_LABEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v9, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  HKLocalizedStringForDateAndTemplate();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  v19 = -[WDSampleListDataProvider hasDetailViewController](self, "hasDetailViewController");
  if (v19)
    v20 = 3;
  else
    v20 = 0;
  objc_msgSend(v10, "setAccessoryType:", v19);
  objc_msgSend(v10, "setSelectionStyle:", v20);
  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = objc_msgSend(v8, "item");

  objc_msgSend(v21, "stringWithFormat:", CFSTR("AFibEvent.%ld"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 2, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", v24);

  return v10;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  WDAtrialFibrillationEventMetadataViewController *v6;

  v4 = a3;
  if (-[WDSampleListDataProvider hasDetailViewController](self, "hasDetailViewController"))
  {
    -[WDSampleListDataProvider objectAtIndex:forSection:](self, "objectAtIndex:forSection:", objc_msgSend(v4, "row"), objc_msgSend(v4, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WDAtrialFibrillationEventMetadataViewController initWithEvent:delegate:]([WDAtrialFibrillationEventMetadataViewController alloc], "initWithEvent:delegate:", v5, self);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
