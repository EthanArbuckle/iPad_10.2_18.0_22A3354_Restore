@implementation WDMedicalRecordDisplayItemGroup

+ (id)displayItemGroupWithDaySummary:(id)a3
{
  id v3;
  WDMedicalRecordDisplayItemGroup *v4;

  v3 = a3;
  v4 = objc_alloc_init(WDMedicalRecordDisplayItemGroup);
  -[WDMedicalRecordDisplayItemGroup setDaySummary:](v4, "setDaySummary:", v3);

  return v4;
}

+ (id)displayItemGroupWithDisplayItems:(id)a3
{
  id v3;
  WDMedicalRecordDisplayItemGroup *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(WDMedicalRecordDisplayItemGroup);
  v5 = (void *)objc_msgSend(v3, "copy");

  -[WDMedicalRecordDisplayItemGroup setItems:](v4, "setItems:", v5);
  return v4;
}

- (id)displayItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[WDMedicalRecordDisplayItemGroup daySummary](self, "daySummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WDMedicalRecordDisplayItemGroup daySummary](self, "daySummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayItemAtIndex:", a3);
  }
  else
  {
    -[WDMedicalRecordDisplayItemGroup items](self, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfDisplayItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[WDMedicalRecordDisplayItemGroup daySummary](self, "daySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WDMedicalRecordDisplayItemGroup daySummary](self, "daySummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfDisplayItems");
  }
  else
  {
    -[WDMedicalRecordDisplayItemGroup items](self, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
  }
  v6 = v5;

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (WDMedicalRecordDaySummary)daySummary
{
  return self->_daySummary;
}

- (void)setDaySummary:(id)a3
{
  objc_storeStrong((id *)&self->_daySummary, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_daySummary, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
