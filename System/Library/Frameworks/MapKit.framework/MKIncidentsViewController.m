@implementation MKIncidentsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MKIncidentsViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKIncidentsViewController;
  return -[MKIncidentsViewController initWithStyle:](&v3, sel_initWithStyle_, 1);
}

- (MKIncidentsViewController)initWithTransitIncidents:(id)a3
{
  id v5;
  MKIncidentsViewController *v6;
  MKIncidentsViewController *v7;

  v5 = a3;
  v6 = -[MKIncidentsViewController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitIncidents, a3);
    -[MKIncidentsViewController reloadDataSource](v7, "reloadDataSource");
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MKIncidentsViewController;
  -[MKIncidentsViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[MKIncidentsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("MKIncidentsView"));

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[MKIncidentsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setDrawsSeparatorAtTopOfSections:", 0);

  -[MKIncidentsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setTopPadding:", 0.0);

  -[MKIncidentsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setBottomPadding:", 0.0);

  -[MKIncidentsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSectionHeaderHeight:", 0.0);

  -[MKIncidentsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSectionFooterHeight:", 0.0);

  -[MKIncidentsViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorInset:", 0.0, 16.0, 0.0, 0.0);

  -[MKIncidentsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forHeaderFooterViewReuseIdentifier:", v13, v15);

  -[_MKTableViewController separatorColor](self, "separatorColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentsViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSeparatorColor:", v16);

  -[MKIncidentsViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPreservesSuperviewLayoutMargins:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__localeDidChange, *MEMORY[0x1E0C99720], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKIncidentsViewController;
  -[MKIncidentsViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[MKIncidentsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKIncidentsViewController;
  -[UIViewController infoCardThemeChanged](&v5, sel_infoCardThemeChanged);
  -[_MKTableViewController separatorColor](self, "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeparatorColor:", v3);

}

- (void)_updateTitle
{
  void *v3;
  NSString *v4;
  id v5;
  NSString *incidentsTitle;
  NSString *v7;
  void *v8;
  id v9;

  _MKLocalizedStringFromThisBundle(CFSTR("Advisories_MapKit_Incidents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%d"), &v9, -[MKIncidentsViewController _incidentsCount](self, "_incidentsCount"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  incidentsTitle = self->_incidentsTitle;
  self->_incidentsTitle = v4;

  v7 = self->_incidentsTitle;
  -[MKIncidentsViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

}

- (void)setTransitIncidents:(id)a3
{
  NSArray *v4;
  NSArray *transitIncidents;
  GEOComposedRouteAdvisory *advisory;
  GEOAdvisoriesInfo *advisoriesInfo;

  if (self->_transitIncidents != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    transitIncidents = self->_transitIncidents;
    self->_transitIncidents = v4;

    advisory = self->_advisory;
    self->_advisory = 0;

    advisoriesInfo = self->_advisoriesInfo;
    self->_advisoriesInfo = 0;

    -[MKIncidentsViewController reloadDataSource](self, "reloadDataSource");
  }
}

- (void)setAdvisoriesInfo:(id)a3
{
  id v4;
  GEOAdvisoriesInfo *advisoriesInfo;
  id v6;
  char v7;
  GEOAdvisoriesInfo *v8;
  GEOAdvisoriesInfo *v9;
  NSArray *transitIncidents;
  GEOComposedRouteAdvisory *advisory;
  unint64_t v12;

  v4 = a3;
  advisoriesInfo = self->_advisoriesInfo;
  v12 = (unint64_t)v4;
  v6 = advisoriesInfo;
  if (v12 | (unint64_t)v6)
  {
    v7 = objc_msgSend((id)v12, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = (GEOAdvisoriesInfo *)objc_msgSend((id)v12, "copy");
      v9 = self->_advisoriesInfo;
      self->_advisoriesInfo = v8;

      transitIncidents = self->_transitIncidents;
      self->_transitIncidents = 0;

      advisory = self->_advisory;
      self->_advisory = 0;

      -[MKIncidentsViewController reloadDataSource](self, "reloadDataSource");
    }
  }

}

- (void)setAdvisory:(id)a3
{
  id v4;
  GEOComposedRouteAdvisory *advisory;
  id v6;
  char v7;
  GEOComposedRouteAdvisory *v8;
  GEOComposedRouteAdvisory *v9;
  NSArray *transitIncidents;
  GEOAdvisoriesInfo *advisoriesInfo;
  unint64_t v12;

  v4 = a3;
  advisory = self->_advisory;
  v12 = (unint64_t)v4;
  v6 = advisory;
  if (v12 | (unint64_t)v6)
  {
    v7 = objc_msgSend((id)v12, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = (GEOComposedRouteAdvisory *)objc_msgSend((id)v12, "copy");
      v9 = self->_advisory;
      self->_advisory = v8;

      transitIncidents = self->_transitIncidents;
      self->_transitIncidents = 0;

      advisoriesInfo = self->_advisoriesInfo;
      self->_advisoriesInfo = 0;

      -[MKIncidentsViewController reloadDataSource](self, "reloadDataSource");
    }
  }

}

- (void)reloadDataSource
{
  id v3;

  -[MKIncidentsViewController _updateTitle](self, "_updateTitle");
  -[MKIncidentsViewController _compileSections](self, "_compileSections");
  if (-[MKIncidentsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[MKIncidentsViewController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)_localeDidChange
{
  id v2;

  -[MKIncidentsViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MKIncidentsViewController;
  -[MKIncidentsViewController dealloc](&v4, sel_dealloc);
}

- (id)_cellForRow:(int64_t)a3 inSection:(int64_t)a4
{
  int64_t v7;
  uint64_t v8;
  void *v9;
  MKTableViewCell *v10;
  objc_class *v11;
  void *v12;
  MKTableViewCell *v13;

  v7 = -[MKIncidentsViewController _sectionForSectionIndex:](self, "_sectionForSectionIndex:", a4);
  if (v7 == 1)
  {
    -[MKIncidentsViewController advisoriesInfo](self, "advisoriesInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[MKIncidentsViewController _advisoriesInfoCellForIndex:](self, "_advisoriesInfoCellForIndex:", a3);
    else
      -[MKIncidentsViewController _advisoryItemCellForIndex:](self, "_advisoryItemCellForIndex:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v7)
  {
    -[MKIncidentsViewController _transitCellForIndex:inSection:](self, "_transitCellForIndex:inSection:", a3, a4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v13 = (MKTableViewCell *)v8;
    goto LABEL_10;
  }
  v10 = [MKTableViewCell alloc];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MKTableViewCell initWithStyle:reuseIdentifier:](v10, "initWithStyle:reuseIdentifier:", 0, v12);

LABEL_10:
  -[MKTableViewCell set_mapkit_separatorStyleOverride:](v13, "set_mapkit_separatorStyleOverride:", 0);
  return v13;
}

- (id)_transitCellForIndex:(int64_t)a3 inSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[MKIncidentsViewController extendedDetailCell](self, "extendedDetailCell", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_transitIncidents, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastUpdated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKIncidentDetailCell lastUpdateDisplayString:](MKIncidentDetailCell, "lastUpdateDisplayString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _MKTransitIncidentImage(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithTitle:subtitle:body:image:", v8, v10, v11, v12);

  return v6;
}

- (id)_advisoryItemCellForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[GEOComposedRouteAdvisory advisoryItems](self->_advisory, "advisoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKIncidentsViewController extendedDetailCell](self, "extendedDetailCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "configureWithAdvisoryItem:", v6);

  return v7;
}

- (id)_advisoriesInfoCellForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[GEOAdvisoriesInfo genericAdvisorys](self->_advisoriesInfo, "genericAdvisorys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "advisoryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKIncidentsViewController extendedDetailCell](self, "extendedDetailCell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v6, "noticeArtwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithAdvisories:artwork:", v8, v10);

  return v9;
}

- (void)cellDidTapDownloadForLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MKIncidentsViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didTapDownloadForLocation:", v4);

}

- (id)accessoryFooterView
{
  return 0;
}

- (unint64_t)_incidentsCount
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  if (-[NSArray count](self->_transitIncidents, "count"))
    return -[NSArray count](self->_transitIncidents, "count");
  -[MKIncidentsViewController advisoriesInfo](self, "advisoriesInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "genericAdvisorys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MKIncidentsViewController advisoriesInfo](self, "advisoriesInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "genericAdvisorys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    return v8;
  }
  else
  {
    -[GEOComposedRouteAdvisory advisoryItems](self->_advisory, "advisoryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    return v10;
  }
}

- (unint64_t)_transitIncidentsCount
{
  return -[NSArray count](self->_transitIncidents, "count");
}

- (int64_t)_transitIncidentIndexForRow:(int64_t)a3 section:(int64_t)a4
{
  if (a3 < 0)
    return -1;
  if (-[MKIncidentsViewController _transitIncidentsCount](self, "_transitIncidentsCount") <= a3)
    return -1;
  return a3;
}

- (void)_compileSections
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *sections;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MKIncidentsViewController transitIncidents](self, "transitIncidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    objc_msgSend(v11, "addObject:", &unk_1E2158BF0);
  -[MKIncidentsViewController advisory](self, "advisory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "advisoryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

LABEL_6:
    objc_msgSend(v11, "addObject:", &unk_1E2158C08);
    v8 = v11;
    goto LABEL_7;
  }
  -[MKIncidentsViewController advisoriesInfo](self, "advisoriesInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v7)
    goto LABEL_6;
LABEL_7:
  v9 = (NSArray *)objc_msgSend(v8, "copy");
  sections = self->_sections;
  self->_sections = v9;

}

- (int64_t)_sectionForSectionIndex:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)detailCellInSection:(int64_t)a3
{
  void *v3;
  MKIncidentDetailCell *v4;

  -[MKIncidentsViewController tableView](self, "tableView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_dequeueReusableCellWithIdentifier:", CFSTR("kIncidentDetailCellIdentifier"));
  v4 = (MKIncidentDetailCell *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = -[MKIncidentDetailCell initWithReuseIdentifier:]([MKIncidentDetailCell alloc], "initWithReuseIdentifier:", CFSTR("kIncidentDetailCellIdentifier"));
  return v4;
}

- (id)extendedDetailCell
{
  void *v2;
  MKIncidentExtendedDetailCell *v3;

  -[MKIncidentsViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_dequeueReusableCellWithIdentifier:", CFSTR("kIncidentExtendedDetailCellIdentifier"));
  v3 = (MKIncidentExtendedDetailCell *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    v3 = -[MKIncidentExtendedDetailCell initWithReuseIdentifier:]([MKIncidentExtendedDetailCell alloc], "initWithReuseIdentifier:", CFSTR("kIncidentExtendedDetailCellIdentifier"));
  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[MKIncidentsViewController _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4);
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  int64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = -[MKIncidentsViewController _sectionForSectionIndex:](self, "_sectionForSectionIndex:", a3);
  if (v4 == 1)
  {
    -[MKIncidentsViewController advisoriesInfo](self, "advisoriesInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MKIncidentsViewController advisoriesInfo](self, "advisoriesInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "genericAdvisorys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v5;
    }
    else
    {
      -[MKIncidentsViewController advisory](self, "advisory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
    }
    objc_msgSend(v10, "advisoryItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v11, "count");

    goto LABEL_9;
  }
  if (!v4)
  {
    -[MKIncidentsViewController transitIncidents](self, "transitIncidents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
LABEL_9:

    return v6;
  }
  return 0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 65.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  v7 = objc_msgSend(v5, "section");

  return -[MKIncidentsViewController _cellForRow:inSection:](self, "_cellForRow:inSection:", v6, v7);
}

- (NSArray)transitIncidents
{
  return self->_transitIncidents;
}

- (NSString)incidentsTitle
{
  return self->_incidentsTitle;
}

- (GEOComposedRouteAdvisory)advisory
{
  return self->_advisory;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  return self->_advisoriesInfo;
}

- (IncidentsViewControllerDelegate)delegate
{
  return (IncidentsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_advisory, 0);
  objc_storeStrong((id *)&self->_incidentsTitle, 0);
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
