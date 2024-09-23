@implementation HKWorkoutActivityViewController

- (HKWorkoutActivityViewController)initWithWorkout:(id)a3 activity:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 healthStore:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKWorkoutActivityViewController *v17;
  HKWorkoutActivityViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  NSMutableArray *sections;
  id v27;
  objc_super v28;

  v27 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HKWorkoutActivityViewController;
  v17 = -[HKTableViewController init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_workout, a3);
    objc_storeStrong((id *)&v18->_activity, a4);
    objc_storeStrong((id *)&v18->_displayTypeController, a5);
    objc_storeStrong((id *)&v18->_unitPreferenceController, a6);
    objc_storeStrong((id *)&v18->_healthStore, a7);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB6DD0];
    objc_msgSend(v13, "workoutConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_stringFromWorkoutActivityType:", objc_msgSend(v21, "activityType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v22, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKWorkoutActivityViewController setTitle:](v18, "setTitle:", v23);
    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sections = v18->_sections;
    v18->_sections = v24;

    -[HKWorkoutActivityViewController _loadSections](v18, "_loadSections");
  }

  return v18;
}

- (void)_addSectionIfNotNil:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_sections, "addObject:");
}

- (void)finishedAggregateQuery
{
  id v2;

  -[HKWorkoutActivityViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (id)defaultPredicateForSampleType:(id)a3
{
  return 0;
}

- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5
{
  return 0;
}

- (id)viewControllerForSampleSelected:(id)a3
{
  id v4;
  HKDataMetadataViewController *v5;

  v4 = a3;
  v5 = -[HKDataMetadataViewController initWithSample:usingInsetStyling:profileName:delegate:]([HKDataMetadataViewController alloc], "initWithSample:usingInsetStyling:profileName:delegate:", v4, 1, 0, self);

  return v5;
}

- (id)unitController
{
  return self->_unitPreferenceController;
}

- (void)_loadSections
{
  HKDataMetadataDetailSection *v3;
  HKDataMetadataSubsampleSection *v4;
  HKDataMetadataSubsampleSection *v5;

  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  v3 = -[HKDataMetadataDetailSection initWithWorkoutActivity:displayTypeController:unitController:]([HKDataMetadataDetailSection alloc], "initWithWorkoutActivity:displayTypeController:unitController:", self->_activity, self->_displayTypeController, self->_unitPreferenceController);
  -[HKWorkoutActivityViewController _addSectionIfNotNil:](self, "_addSectionIfNotNil:", v3);

  v4 = [HKDataMetadataSubsampleSection alloc];
  v5 = -[HKDataMetadataSubsampleSection initWithSample:workoutActivity:subSampleTypes:showOnlyExertion:healthStore:displayTypeController:unitController:subsampleDelegate:](v4, "initWithSample:workoutActivity:subSampleTypes:showOnlyExertion:healthStore:displayTypeController:unitController:subsampleDelegate:", self->_workout, self->_activity, MEMORY[0x1E0C9AA60], 1, self->_healthStore, self->_displayTypeController, self->_unitPreferenceController, self);
  -[HKWorkoutActivityViewController _addSectionIfNotNil:](self, "_addSectionIfNotNil:", v5);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_sections, "count", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInSection");

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "cellForIndex:tableView:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "row");

  -[HKWorkoutActivityViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectCellForIndex:navigationController:animated:", v7, v8, 1);

}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
  objc_storeStrong((id *)&self->_workout, a3);
}

- (HKWorkoutActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeController, a3);
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
  objc_storeStrong((id *)&self->_unitPreferenceController, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
