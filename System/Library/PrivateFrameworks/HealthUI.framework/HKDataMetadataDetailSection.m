@implementation HKDataMetadataDetailSection

- (HKDataMetadataDetailSection)initWithMetadataObject:(id)a3 metadataDataSource:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HKDataMetadataDetailSection *v16;
  HKCalendarCache *v17;
  HKCalendarCache *calendarCache;
  id v20;
  objc_super v21;

  v20 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SAMPLE_DETAILS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HKDataMetadataDetailSection;
  v16 = -[HKDataMetadataSimpleSection initWithTitle:](&v21, sel_initWithTitle_, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_object, a3);
    objc_storeStrong((id *)&v16->_displayTypeController, a5);
    objc_storeStrong((id *)&v16->_unitController, a6);
    objc_storeStrong((id *)&v16->_metadataDataSource, a4);
    v17 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E0CB6360]);
    calendarCache = v16->_calendarCache;
    v16->_calendarCache = v17;

    -[HKDataMetadataDetailSection _addDetailValues](v16, "_addDetailValues");
  }

  return v16;
}

- (HKDataMetadataDetailSection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HKDataMetadataDetailSection *v14;
  HKDataMetadataDataSource *v15;
  HKDataMetadataDataSource *metadataDataSource;
  HKCalendarCache *v17;
  HKCalendarCache *calendarCache;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SAMPLE_DETAILS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HKDataMetadataDetailSection;
  v14 = -[HKDataMetadataSimpleSection initWithTitle:](&v20, sel_initWithTitle_, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_object, a3);
    objc_storeStrong((id *)&v14->_displayTypeController, a4);
    objc_storeStrong((id *)&v14->_unitController, a5);
    v15 = -[HKDataMetadataDataSource initWithSample:unitPreferenceController:]([HKDataMetadataDataSource alloc], "initWithSample:unitPreferenceController:", v9, v11);
    metadataDataSource = v14->_metadataDataSource;
    v14->_metadataDataSource = v15;

    v17 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E0CB6360]);
    calendarCache = v14->_calendarCache;
    v14->_calendarCache = v17;

    -[HKDataMetadataDetailSection _addDetailValues](v14, "_addDetailValues");
  }

  return v14;
}

- (HKDataMetadataDetailSection)initWithWorkoutEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  HKDataMetadataDetailSection *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EVENT_DETAILS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HKDataMetadataDetailSection;
  v8 = -[HKDataMetadataSimpleSection initWithTitle:](&v10, sel_initWithTitle_, v7);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_object, a3);
    -[HKDataMetadataDetailSection _addDetailValues](v8, "_addDetailValues");
  }

  return v8;
}

- (HKDataMetadataDetailSection)initWithWorkoutActivity:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HKDataMetadataDetailSection *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ACTIVITY_DETAILS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HKDataMetadataDetailSection;
  v14 = -[HKDataMetadataSimpleSection initWithTitle:](&v16, sel_initWithTitle_, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_object, a3);
    objc_storeStrong((id *)&v14->_displayTypeController, a4);
    objc_storeStrong((id *)&v14->_unitController, a5);
    -[HKDataMetadataDetailSection _addDetailValues](v14, "_addDetailValues");
  }

  return v14;
}

- (void)_addDetailValues
{
  -[HKDataMetadataDetailSection addSampleDetailValues](self, "addSampleDetailValues");
  -[HKDataMetadataDetailSection _addMetadataDataSourceDetailValues](self, "_addMetadataDataSourceDetailValues");
}

- (void)addSampleDetailValues
{
  -[HKDataMetadataObject addDetailValuesToSection:](self->_object, "addDetailValuesToSection:", self);
}

- (void)_addMetadataDataSourceDetailValues
{
  -[HKDataMetadataDataSource addDetailValuesToSection:](self->_metadataDataSource, "addDetailValuesToSection:", self);
}

- (id)sectionFooter
{
  HKDataMetadataObject *v2;
  void *v3;

  v2 = self->_object;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataObject detailFooter](v2, "detailFooter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (HKDataMetadataObject)object
{
  return self->_object;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (HKCalendarCache)calendarCache
{
  return self->_calendarCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_metadataDataSource, 0);
}

@end
