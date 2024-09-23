@implementation HKDataMetadataViewController

- (HKDataMetadataViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 delegate:(id)a6
{
  return -[HKDataMetadataViewController initWithSample:usingInsetStyling:profileName:regulatedFeatureInfoProvider:delegate:](self, "initWithSample:usingInsetStyling:profileName:regulatedFeatureInfoProvider:delegate:", a3, a4, a5, 0, a6);
}

- (HKDataMetadataViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 regulatedFeatureInfoProvider:(id)a6 delegate:(id)a7
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  HKDataMetadataViewController *v17;
  HKDataMetadataViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *subSampleTypes;
  NSMutableArray *v26;
  NSMutableArray *sections;
  void *v28;
  void *v29;
  objc_super v31;

  v10 = a4;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)HKDataMetadataViewController;
  v17 = -[HKTableViewController initWithUsingInsetStyling:](&v31, sel_initWithUsingInsetStyling_, v10);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sample, a3);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataViewController setTitle:](v18, "setTitle:", v20);

    if (v14)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("METADATA_TITLE_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringWithFormat:", v23, v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDataMetadataViewController setTitle:](v18, "setTitle:", v24);

    }
    subSampleTypes = v18->_subSampleTypes;
    v18->_subSampleTypes = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_storeStrong((id *)&v18->_regulatedFeatureInfoProvider, a6);
    objc_storeStrong((id *)&v18->_delegate, a7);
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sections = v18->_sections;
    v18->_sections = v26;

    -[HKDataMetadataViewController _fetchWorkoutRouteLocations](v18, "_fetchWorkoutRouteLocations");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v18, sel__localeOrDisplayTypeChange_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v18, sel__localeOrDisplayTypeChange_, CFSTR("HKDisplayTypeControllerDisplayTypeStringValuesChangedNotification"), 0);

  }
  return v18;
}

- (void)setSample:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_sample, a3);
  -[HKDataMetadataViewController _loadSections](self, "_loadSections");
  -[HKDataMetadataViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKDataMetadataViewController;
  -[HKDataMetadataViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HKDataMetadataViewController;
  -[HKTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[HKDataMetadataViewController _fetchSubSampleTypes](self, "_fetchSubSampleTypes");
  -[HKDataMetadataViewController _loadSections](self, "_loadSections");
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA6B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", v3);

  objc_initWeak(&location, self);
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HKDataMetadataViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E9C45448;
  objc_copyWeak(&v8, &location);
  v6 = (id)-[HKDataMetadataViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __43__HKDataMetadataViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateWorkoutRouteSize");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKDataMetadataViewController;
  -[HKDataMetadataViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (!self->_sample)
  {
    -[HKDataMetadataViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
}

- (BOOL)_addSectionIfNonNull:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_sections, "addObject:", a3);
  return a3 != 0;
}

- (void)_loadSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  HKDataMetadataReportSection *v11;
  HKDataMetadataReportAccessSection *v12;
  HKDataMetadataDetailSection *v13;
  HKDataMetadataDetailSection *v14;
  HKDataMetadataDeviceSection *v15;
  HKDataMetadataDeviceSection *v16;
  HKDataMetadataViewAllQuantitySeriesSection *v17;
  HKDataMetadataSubsampleSection *v18;
  HKDataMetadataAudiogramFrequenciesSection *v19;
  HKDataMetadataAudiogramFrequenciesSection *v20;
  NSMutableArray *sections;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  -[HKDataMetadataViewControllerDelegate healthStore](self->_delegate, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataViewControllerDelegate displayTypeController](self->_delegate, "displayTypeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataViewControllerDelegate unitController](self->_delegate, "unitController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataViewControllerDelegate prependedSectionsForSample:](self->_delegate, "prependedSectionsForSample:", self->_sample);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v9)
              objc_enumerationMutation(v7);
            -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v8);
      }
    }

  }
  v11 = -[HKDataMetadataReportSection initWithSample:healthStore:]([HKDataMetadataReportSection alloc], "initWithSample:healthStore:", self->_sample, v3);
  -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v11);

  v12 = -[HKDataMetadataReportAccessSection initWithSample:healthStore:delegate:]([HKDataMetadataReportAccessSection alloc], "initWithSample:healthStore:delegate:", self->_sample, v3, self);
  -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v12);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataViewControllerDelegate detailSectionForSample:](self->_delegate, "detailSectionForSample:", self->_sample);
    v13 = (HKDataMetadataDetailSection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = -[HKDataMetadataDetailSection initWithSample:displayTypeController:unitController:]([HKDataMetadataDetailSection alloc], "initWithSample:displayTypeController:unitController:", self->_sample, v4, v5);
  }
  v14 = v13;
  -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v13);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataViewControllerDelegate deviceSectionForSample:](self->_delegate, "deviceSectionForSample:", self->_sample);
    v15 = (HKDataMetadataDeviceSection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = -[HKDataMetadataDeviceSection initWithSample:regulatedFeatureInfoProvider:]([HKDataMetadataDeviceSection alloc], "initWithSample:regulatedFeatureInfoProvider:", self->_sample, self->_regulatedFeatureInfoProvider);
  }
  v16 = v15;
  -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v15);

  v17 = -[HKDataMetadataViewAllQuantitySeriesSection initWithSample:delegate:]([HKDataMetadataViewAllQuantitySeriesSection alloc], "initWithSample:delegate:", self->_sample, self->_delegate);
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__HKDataMetadataViewController__loadSections__block_invoke;
  v25[3] = &unk_1E9C45470;
  objc_copyWeak(&v26, &location);
  -[HKDataMetadataViewAllQuantitySeriesSection setReloadMetaDataVC:](v17, "setReloadMetaDataVC:", v25);
  -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v17);
  v18 = -[HKDataMetadataSubsampleSection initWithSample:workoutActivity:subSampleTypes:showOnlyExertion:healthStore:displayTypeController:unitController:subsampleDelegate:]([HKDataMetadataSubsampleSection alloc], "initWithSample:workoutActivity:subSampleTypes:showOnlyExertion:healthStore:displayTypeController:unitController:subsampleDelegate:", self->_sample, 0, self->_subSampleTypes, 0, v3, v4, v5, self);
  -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v18);

  v19 = -[HKDataMetadataAudiogramFrequenciesSection initWithSample:leftEar:unitController:]([HKDataMetadataAudiogramFrequenciesSection alloc], "initWithSample:leftEar:unitController:", self->_sample, 1, v5);
  -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v19);

  v20 = -[HKDataMetadataAudiogramFrequenciesSection initWithSample:leftEar:unitController:]([HKDataMetadataAudiogramFrequenciesSection alloc], "initWithSample:leftEar:unitController:", self->_sample, 0, v5);
  -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v20);

  -[HKDataMetadataViewController _addWorkoutRouteSection](self, "_addWorkoutRouteSection");
  sections = self->_sections;
  -[HKSample hk_additionalMetadataSectionsWithHealthStore:displayTypeController:unitController:subsampleDelegate:](self->_sample, "hk_additionalMetadataSectionsWithHealthStore:displayTypeController:unitController:subsampleDelegate:", v3, v4, v5, self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](sections, "addObjectsFromArray:", v22);

  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[HKDataMetadataViewControllerDelegate shareDocumentUsingSample:](self->_delegate, "shareDocumentUsingSample:", self->_sample))
  {
    -[HKDataMetadataViewController navigationItem](self, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__exportButtonAction_);
    objc_msgSend(v23, "setRightBarButtonItem:", v24);

  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __45__HKDataMetadataViewController__loadSections__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__HKDataMetadataViewController__loadSections__block_invoke_2;
  v5[3] = &unk_1E9C412F0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __45__HKDataMetadataViewController__loadSections__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSample:", v1);

}

- (void)_exportButtonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[12];

  v19[11] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKDataMetadataViewControllerDelegate healthStore](self->_delegate, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample dataForSharingWithHealthStore:](self->_sample, "dataForSharingWithHealthStore:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *MEMORY[0x1E0D96DE8];
    v19[0] = *MEMORY[0x1E0D96DD0];
    v19[1] = v7;
    v8 = *MEMORY[0x1E0D96E00];
    v19[2] = *MEMORY[0x1E0D96DF8];
    v19[3] = v8;
    v9 = *MEMORY[0x1E0D96E08];
    v19[4] = *MEMORY[0x1E0D96D90];
    v19[5] = v9;
    v10 = *MEMORY[0x1E0D96DD8];
    v19[6] = *MEMORY[0x1E0D96D80];
    v19[7] = v10;
    v11 = *MEMORY[0x1E0D96DE0];
    v19[8] = *MEMORY[0x1E0D96DF0];
    v19[9] = v11;
    v19[10] = CFSTR("com.apple.Health.ShareExtension");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0D96D28]);
    v18 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithActivityItems:applicationActivities:", v14, 0);

    objc_msgSend(v15, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSourceItem:", v4);

    objc_msgSend(v15, "setExcludedActivityTypes:", v12);
    -[HKDataMetadataViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentViewController:animated:completion:", v15, 1, 0);

  }
}

- (void)_fetchSubSampleTypes
{
  void *v3;
  HKSample *sample;
  _QWORD v5[5];

  -[HKDataMetadataViewControllerDelegate healthStore](self->_delegate, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HKDataMetadataViewController__fetchSubSampleTypes__block_invoke;
  v5[3] = &unk_1E9C44988;
  v5[4] = self;
  -[HKSample fetchSubSampleTypesWithHealthStore:completion:](sample, "fetchSubSampleTypesWithHealthStore:completion:", v3, v5);

}

void __52__HKDataMetadataViewController__fetchSubSampleTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HKDataMetadataViewController__fetchSubSampleTypes__block_invoke_2;
    block[3] = &unk_1E9C3FB90;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __52__HKDataMetadataViewController__fetchSubSampleTypes__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSubSampleTypes:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_updateSubSampleTypes:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    objc_storeStrong((id *)&self->_subSampleTypes, a3);
    -[HKDataMetadataViewController _loadSections](self, "_loadSections");
  }
  else if (v8)
  {
    v10 = objc_msgSend(v8, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5378];
    v12 = *MEMORY[0x1E0CB5378];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[HKDataMetadataViewController _updateSubSampleTypes:error:].cold.1((uint64_t)v9, v11);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[HKDataMetadataViewController _updateSubSampleTypes:error:].cold.2((uint64_t)v9, v11);
    }
  }

}

- (CGSize)_adjustedTableViewSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[HKDataMetadataViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[HKDataMetadataViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_marginWidth");
  v8 = v5 + v7 * -2.0;

  -[HKDataMetadataViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  v12 = fmax(v8, 0.0);
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_updateWorkoutRouteSize
{
  -[HKDataMetadataViewController _adjustedTableViewSize](self, "_adjustedTableViewSize");
  -[HKDataMetadataWorkoutRouteSection setTableViewSize:](self->_workoutRouteSection, "setTableViewSize:");
}

- (void)_addWorkoutRouteSection
{
  double v3;
  double v4;
  HKDataMetadataWorkoutRouteSection *v5;
  HKDataMetadataWorkoutRouteSection *workoutRouteSection;
  id v7;

  if (self->_workoutRouteSection)
  {
    -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:");
  }
  else
  {
    -[HKDataMetadataViewController _adjustedTableViewSize](self, "_adjustedTableViewSize");
    v5 = -[HKDataMetadataWorkoutRouteSection initWithLocationReadings:tableViewSize:]([HKDataMetadataWorkoutRouteSection alloc], "initWithLocationReadings:tableViewSize:", self->_locationReadings, v3, v4);
    workoutRouteSection = self->_workoutRouteSection;
    self->_workoutRouteSection = v5;

    if (-[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", self->_workoutRouteSection))
    {
      -[HKDataMetadataViewController tableView](self, "tableView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadData");

    }
  }
}

- (void)_fetchWorkoutRouteLocations
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__HKDataMetadataViewController__fetchWorkoutRouteLocations__block_invoke;
    v3[3] = &unk_1E9C45498;
    objc_copyWeak(&v4, &location);
    -[HKDataMetadataViewController _fetchRoutesWithSamplesHandler:](self, "_fetchRoutesWithSamplesHandler:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __59__HKDataMetadataViewController__fetchWorkoutRouteLocations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "sample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_1D7813000, v5, OS_LOG_TYPE_DEFAULT, "[routes] Finished fetching data for workout %@", buf, 0xCu);

  }
  v9 = (id *)(a1 + 32);
  v10 = objc_loadWeakRetained(v9);
  objc_msgSend(v10, "setLocationReadings:", v3);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HKDataMetadataViewController__fetchWorkoutRouteLocations__block_invoke_243;
  block[3] = &unk_1E9C40600;
  objc_copyWeak(&v12, v9);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v12);
}

void __59__HKDataMetadataViewController__fetchWorkoutRouteLocations__block_invoke_243(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadSections");

}

- (void)_fetchRoutesWithSamplesHandler:(id)a3
{
  id v4;
  HKLocationFetcher *v5;
  void *v6;
  HKLocationFetcher *v7;
  HKLocationFetcher *locationFetcher;
  id v9;

  v4 = a3;
  v5 = [HKLocationFetcher alloc];
  -[HKDataMetadataViewControllerDelegate healthStore](self->_delegate, "healthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKLocationFetcher initWithHealthStore:](v5, "initWithHealthStore:", v6);
  locationFetcher = self->_locationFetcher;
  self->_locationFetcher = v7;

  -[HKDataMetadataViewController locationFetcher](self, "locationFetcher");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchLocationsFromWorkout:applyThreshold:withSamplesHandler:", self->_sample, 0, v4);

}

- (void)finishedAggregateQuery
{
  id v2;

  -[HKDataMetadataViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (id)defaultPredicateForSampleType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataViewControllerDelegate defaultPredicateForSampleType:](self->_delegate, "defaultPredicateForSampleType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataViewControllerDelegate viewControllerForSampleType:subSamplePredicate:title:](self->_delegate, "viewControllerForSampleType:subSamplePredicate:title:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)accessViewControllerForSample:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKDataMetadataViewControllerDelegate accessViewControllerForSample:healthStore:](self->_delegate, "accessViewControllerForSample:healthStore:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
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

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  double v5;

  -[HKDataMetadataViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = *MEMORY[0x1E0DC53D8];
  else
    v5 = 0.5;

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  NSMutableArray *sections;
  id v6;
  void *v7;
  void *v8;

  sections = self->_sections;
  v6 = a3;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionFooterViewInTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

  -[HKDataMetadataViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectCellForIndex:navigationController:animated:", v7, v8, 1);

}

- (double)cellHeight
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v4 = (void *)MEMORY[0x1E0DC3428];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __68__HKDataMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_1E9C40D30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HKDataMetadataViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __68__HKDataMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HKDataMetadataViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (HKSample)sample
{
  return self->_sample;
}

- (NSArray)subSampleTypes
{
  return self->_subSampleTypes;
}

- (HKDataMetadataViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (HKLocationFetcher)locationFetcher
{
  return self->_locationFetcher;
}

- (void)setLocationFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_locationFetcher, a3);
}

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
  objc_storeStrong((id *)&self->_locationReadings, a3);
}

- (HKDataMetadataDeviceSectionRegulatedFeatureInfoProvider)regulatedFeatureInfoProvider
{
  return self->_regulatedFeatureInfoProvider;
}

- (void)setRegulatedFeatureInfoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_regulatedFeatureInfoProvider, a3);
}

- (HKDataMetadataWorkoutRouteSection)workoutRouteSection
{
  return self->_workoutRouteSection;
}

- (void)setWorkoutRouteSection:(id)a3
{
  objc_storeStrong((id *)&self->_workoutRouteSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutRouteSection, 0);
  objc_storeStrong((id *)&self->_regulatedFeatureInfoProvider, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
  objc_storeStrong((id *)&self->_locationFetcher, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_subSampleTypes, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

- (void)_updateSubSampleTypes:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D7813000, a2, OS_LOG_TYPE_DEBUG, "Error from subsample sample type query: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateSubSampleTypes:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Error from subsample sample type query: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
