@implementation HKWorkoutRouteTableViewController

- (HKWorkoutRouteTableViewController)initWithWorkoutRoute:(id)a3 healthStore:(id)a4 usingInsetStyling:(BOOL)a5 profileName:(id)a6 delegate:(id)a7
{
  _BOOL8 v9;
  id v12;
  HKWorkoutRouteTableViewController *v13;
  HKWorkoutRouteTableViewController *v14;
  id v15;
  objc_super v17;

  v9 = a5;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKWorkoutRouteTableViewController;
  v13 = -[HKDataMetadataViewController initWithSample:usingInsetStyling:profileName:delegate:](&v17, sel_initWithSample_usingInsetStyling_profileName_delegate_, a3, v9, a6, a7);
  v14 = v13;
  if (v13)
  {
    -[HKWorkoutRouteTableViewController setHealthStore:](v13, "setHealthStore:", v12);
    v15 = objc_alloc_init(MEMORY[0x1E0CB6FC0]);
    -[HKWorkoutRouteTableViewController setLocationShifter:](v14, "setLocationShifter:", v15);

  }
  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKWorkoutRouteTableViewController;
  -[HKDataMetadataViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[HKWorkoutRouteTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[HKMapRouteTableViewCell defaultReuseIdentifier](HKMapRouteTableViewCell, "defaultReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

}

- (HKWorkoutRouteTableViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 delegate:(id)a6
{
  _BOOL8 v7;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  HKWorkoutRouteTableViewController *v15;

  v7 = a4;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99778];
  v12 = a6;
  v13 = a5;
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "raise:format:", v11, CFSTR("The -%@ method is not available on %@"), v14, objc_opt_class());

  v15 = -[HKWorkoutRouteTableViewController initWithWorkoutRoute:healthStore:usingInsetStyling:profileName:delegate:](self, "initWithWorkoutRoute:healthStore:usingInsetStyling:profileName:delegate:", 0, 0, v7, v13, v12);
  return v15;
}

- (HKWorkoutRoute)workoutRoute
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[HKDataMetadataViewController sample](self, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKDataMetadataViewController sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (HKWorkoutRoute *)v5;
}

- (void)loadRoute
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0CB6E70]);
  -[HKWorkoutRouteTableViewController workoutRoute](self, "workoutRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HKWorkoutRouteTableViewController_loadRoute__block_invoke;
  v7[3] = &unk_1E9C427B8;
  v7[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithRoute:dataHandler:", v4, v7);

  -[HKWorkoutRouteTableViewController healthStore](self, "healthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:", v5);

}

uint64_t __46__HKWorkoutRouteTableViewController_loadRoute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRouteData:hasFinishedQuery:");
}

- (void)addRouteData:(id)a3 hasFinishedQuery:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HKWorkoutRouteTableViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[HKWorkoutRouteTableViewController routeData](v7, "routeData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkoutRouteTableViewController setRouteData:](v7, "setRouteData:", v9);

  }
  -[HKWorkoutRouteTableViewController routeData](v7, "routeData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v6);

  objc_sync_exit(v7);
  if (v4)
  {
    -[HKWorkoutRouteTableViewController routeData](v7, "routeData");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11
      && (v12 = (void *)v11,
          v13 = (void *)MEMORY[0x1E0CB6FC0],
          -[HKWorkoutRouteTableViewController routeData](v7, "routeData"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v13) = objc_msgSend(v13, "isShiftRequiredForLocations:", v14),
          v14,
          v12,
          (_DWORD)v13))
    {
      -[HKWorkoutRouteTableViewController locationShifter](v7, "locationShifter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKWorkoutRouteTableViewController routeData](v7, "routeData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __67__HKWorkoutRouteTableViewController_addRouteData_hasFinishedQuery___block_invoke;
      v17[3] = &unk_1E9C427E0;
      v17[4] = v7;
      objc_msgSend(v15, "shiftLocations:withCompletion:", v16, v17);

    }
    else
    {
      -[HKWorkoutRouteTableViewController parseAndDisplayRouteData](v7, "parseAndDisplayRouteData");
    }
  }

}

uint64_t __67__HKWorkoutRouteTableViewController_addRouteData_hasFinishedQuery___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseAndDisplayRouteData");
}

- (void)parseAndDisplayRouteData
{
  void *v3;
  char *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  HKWorkoutRouteTableViewController *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CLLocationCoordinate2D v34;

  -[HKWorkoutRouteTableViewController routeData](self, "routeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (char *)malloc_type_malloc(16 * objc_msgSend(v3, "count"), 0x1000040451B5BE8uLL);

  -[HKWorkoutRouteTableViewController routeData](self, "routeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = v4 + 8;
    do
    {
      -[HKWorkoutRouteTableViewController routeData](self, "routeData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "coordinate");
      *(MKMapPoint *)(v8 - 8) = MKMapPointForCoordinate(v34);

      ++v7;
      -[HKWorkoutRouteTableViewController routeData](self, "routeData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      v8 += 16;
    }
    while (v7 < v12);
  }
  v13 = (void *)MEMORY[0x1E0CC1928];
  -[HKWorkoutRouteTableViewController routeData](self, "routeData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "polylineWithPoints:count:", v4, objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "boundingMapRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = self;
  objc_sync_enter(v24);
  -[HKWorkoutRouteTableViewController setRouteData:](v24, "setRouteData:", 0);
  objc_sync_exit(v24);

  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__HKWorkoutRouteTableViewController_parseAndDisplayRouteData__block_invoke;
  v27[3] = &unk_1E9C42808;
  v27[4] = v24;
  v28 = v15;
  v29 = v4;
  v30 = v17;
  v31 = v19;
  v32 = v21;
  v33 = v23;
  v26 = v15;
  objc_msgSend(v25, "addOperationWithBlock:", v27);

}

void __61__HKWorkoutRouteTableViewController_parseAndDisplayRouteData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mapRouteTableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOverlay:level:", *(_QWORD *)(a1 + 40), 0);

  free(*(void **)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "mapRouteTableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisibleMapRect:edgePadding:animated:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), 50.0, 20.0, 50.0, 20.0);

}

- (id)_convertIndexPathToSuper:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB36B0];
  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  return (id)objc_msgSend(v3, "indexPathForRow:inSection:", v5, v6 - 1);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKWorkoutRouteTableViewController;
  return -[HKDataMetadataViewController numberOfSectionsInTableView:](&v4, sel_numberOfSectionsInTableView_, a3) + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5;

  if (!a4)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutRouteTableViewController;
  return -[HKDataMetadataViewController tableView:numberOfRowsInSection:](&v5, sel_tableView_numberOfRowsInSection_, a3, a4 - 1);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    -[HKWorkoutRouteTableViewController _convertIndexPathToSuper:](self, "_convertIndexPathToSuper:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)HKWorkoutRouteTableViewController;
    -[HKDataMetadataViewController tableView:cellForRowAtIndexPath:](&v14, sel_tableView_cellForRowAtIndexPath_, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKWorkoutRouteTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMapRouteTableViewCell defaultReuseIdentifier](HKMapRouteTableViewCell, "defaultReuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableCellWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkoutRouteTableViewController setMapRouteTableViewCell:](self, "setMapRouteTableViewCell:", v12);

    -[HKWorkoutRouteTableViewController loadRoute](self, "loadRoute");
    -[HKWorkoutRouteTableViewController mapRouteTableViewCell](self, "mapRouteTableViewCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  if (a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)HKWorkoutRouteTableViewController;
    -[HKDataMetadataViewController tableView:titleForHeaderInSection:](&v7, sel_tableView_titleForHeaderInSection_, a3, a4 - 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ROUTE_MAP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  objc_super v5;

  if (!a4)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutRouteTableViewController;
  -[HKDataMetadataViewController tableView:viewForFooterInSection:](&v5, sel_tableView_viewForFooterInSection_, a3, a4 - 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v5;

  if (!a4)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutRouteTableViewController;
  -[HKDataMetadataViewController tableView:titleForFooterInSection:](&v5, sel_tableView_titleForFooterInSection_, a3, a4 - 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    -[HKWorkoutRouteTableViewController _convertIndexPathToSuper:](self, "_convertIndexPathToSuper:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9.receiver = self;
    v9.super_class = (Class)HKWorkoutRouteTableViewController;
    -[HKDataMetadataViewController tableView:didSelectRowAtIndexPath:](&v9, sel_tableView_didSelectRowAtIndexPath_, v6, v8);
    v7 = (id)v8;
  }
  else
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  }

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKMapRouteTableViewCell)mapRouteTableViewCell
{
  return self->_mapRouteTableViewCell;
}

- (void)setMapRouteTableViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_mapRouteTableViewCell, a3);
}

- (NSMutableArray)routeData
{
  return self->_routeData;
}

- (void)setRouteData:(id)a3
{
  objc_storeStrong((id *)&self->_routeData, a3);
}

- (_HKLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_mapRouteTableViewCell, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
