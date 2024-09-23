@implementation MUTransitLineIncidentsViewController

- (MUTransitLineIncidentsViewController)initWithLineItem:(id)a3
{
  id v5;
  MUTransitLineIncidentsViewController *v6;
  MUTransitLineIncidentsViewController *v7;
  uint64_t v8;
  MKTransitItemReferenceDateUpdater *itemUpdater;
  uint64_t v10;
  MKTransitItemIncidentsController *incidentsController;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MUTransitLineIncidentsViewController;
  v6 = -[MUTransitLineIncidentsViewController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lineItem, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC19C0]), "initWithDelegate:", v7);
    itemUpdater = v7->_itemUpdater;
    v7->_itemUpdater = (MKTransitItemReferenceDateUpdater *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC19B8]), "initWithLineItem:", v5);
    incidentsController = v7->_incidentsController;
    v7->_incidentsController = (MKTransitItemIncidentsController *)v10;

    -[MUTransitLineIncidentsViewController referenceDate](v7, "referenceDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitItemIncidentsController setReferenceDate:](v7->_incidentsController, "setReferenceDate:", v12);

    -[MUTransitLineIncidentsViewController _incidents](v7, "_incidents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") != 0;
    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPlaceCardTransitAdvisoryBanner:", v14);

    -[MUTransitLineIncidentsViewController updateTransitLineItemIfNeeded](v7, "updateTransitLineItemIfNeeded");
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUTransitLineIncidentsViewController;
  -[MUTransitLineIncidentsViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[MUTransitLineIncidentsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setTopPadding:", 0.0);
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUTransitLineIncidentsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[MUTransitLineIncidentsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreservesSuperviewLayoutMargins:", 1);

}

- (void)updateTransitLineItemIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if ((-[GEOTransitLineItem isIncidentsTTLExpired](self->_lineItem, "isIncidentsTTLExpired") & 1) != 0
    || (-[GEOTransitLineItem hasIncidentComponent](self->_lineItem, "hasIncidentComponent") & 1) == 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0CC1830]);
    -[GEOTransitLineItem identifier](self->_lineItem, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithGEOMapItemIdentifier:", v4);

    if (v5)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ticketForTransitLines:traits:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __69__MUTransitLineIncidentsViewController_updateTransitLineItemIfNeeded__block_invoke;
      v9[3] = &unk_1E2E02BC0;
      objc_copyWeak(&v11, &location);
      v10 = v5;
      objc_msgSend(v8, "submitWithHandler:networkActivity:", v9, 0);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

  }
}

void __69__MUTransitLineIncidentsViewController_updateTransitLineItemIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "identifier", (_QWORD)v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 32));

          if (v12)
          {
            v13 = v10;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

    v14 = (void *)*((_QWORD *)WeakRetained + 130);
    *((_QWORD *)WeakRetained + 130) = v13;
    v15 = v13;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC19B8]), "initWithLineItem:", v15);
    v17 = (void *)*((_QWORD *)WeakRetained + 127);
    *((_QWORD *)WeakRetained + 127) = v16;

    objc_msgSend(WeakRetained, "referenceDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 127), "setReferenceDate:", v18);

    if (objc_msgSend(WeakRetained, "isViewLoaded"))
    {
      objc_msgSend(WeakRetained, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reloadData");

    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUTransitLineIncidentsViewController;
  -[MUTransitLineIncidentsViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[MUTransitLineIncidentsViewController itemUpdater](self, "itemUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUTransitLineIncidentsViewController;
  -[MUTransitLineIncidentsViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[MUTransitLineIncidentsViewController itemUpdater](self, "itemUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

}

- (void)transitUIReferenceTimeUpdated:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_referenceDate, a3);
  if (-[MUTransitLineIncidentsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[MUTransitLineIncidentsViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUTransitLineIncidentsViewController;
  -[MUTransitLineIncidentsViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[MUTransitLineIncidentsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  -[MUTransitLineIncidentsViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (NSDate)referenceDate
{
  NSDate *referenceDate;
  NSDate *v4;
  NSDate *v5;

  referenceDate = self->_referenceDate;
  if (!referenceDate)
  {
    objc_msgSend(MEMORY[0x1E0CC19C0], "referenceDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_referenceDate;
    self->_referenceDate = v4;

    referenceDate = self->_referenceDate;
  }
  return referenceDate;
}

- (id)_incidents
{
  MKTransitItemIncidentsController *incidentsController;
  void *v3;
  void *v4;

  incidentsController = self->_incidentsController;
  -[MUTransitLineIncidentsViewController lineItem](self, "lineItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentsController incidentsForLine:](incidentsController, "incidentsForLine:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_incidentCellForRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  -[MUTransitLineIncidentsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_mapkit_dequeueReusableCellWithIdentifier:", CFSTR("kIncidentCellIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC19A0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("kIncidentCellIdentifier"));
  -[MUTransitLineIncidentsViewController _incidents](self, "_incidents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 < 0)
  {
    v9 = 0;
  }
  else
  {
    if (objc_msgSend(v7, "count") > (unint64_t)a3)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a3)
        goto LABEL_10;
LABEL_9:
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3 - 1);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v9 = 0;
    if (a3)
      goto LABEL_9;
  }
LABEL_10:
  v10 = 0;
LABEL_11:
  v11 = objc_msgSend((id)v10, "isBlockingIncident");
  v12 = v11 ^ objc_msgSend(v9, "isBlockingIncident");
  if (v10)
    v13 = v12;
  else
    v13 = 1;
  -[MUTransitLineIncidentsViewController referenceDate](self, "referenceDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithIncident:referenceDate:shouldShowImage:inSiri:", v9, v14, v13, 0);

  if (a3 < -1 || (v15 = a3 + 1, v15 >= objc_msgSend(v8, "count")))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend((id)v16, "isBlockingIncident");
  v18 = v17 ^ objc_msgSend(v9, "isBlockingIncident");
  if (!v16 || v18)
  {
    objc_msgSend(v6, "setSeparatorHidden:", 1);
    if (v16)
      v20 = 0;
    else
      v20 = v12;
    v21 = 3;
    if ((_DWORD)v13)
      v21 = 1;
    if (((v10 != 0) & v20) != 0)
      v22 = 0;
    else
      v22 = v21;
    if (v10 | v16)
      v19 = v22;
    else
      v19 = 0;
  }
  else
  {
    objc_msgSend(v6, "setSeparatorHidden:", 0);
    objc_msgSend(v6, "setTrailingSeparatorInset:", 0.0);
    if ((_DWORD)v13)
      v19 = 1;
    else
      v19 = 2;
  }
  objc_msgSend(v6, "setCellPosition:", v19);
  if (v16)
    v23 = v18;
  else
    v23 = 0;
  objc_msgSend(v6, "setPadBottom:", v23);

  return v6;
}

- (void)_showIncidentDetails
{
  void *v3;
  id v4;

  -[MUTransitLineIncidentsViewController incidentsDelegate](self, "incidentsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUTransitLineIncidentsViewController _incidents](self, "_incidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitLineIncidentsViewController:didSelectDetailsForIncidents:", self, v3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[MUTransitLineIncidentsViewController _incidents](self, "_incidents", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[MUTransitLineIncidentsViewController _incidents](self, "_incidents", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return -[MUTransitLineIncidentsViewController _incidentCellForRow:](self, "_incidentCellForRow:", objc_msgSend(a4, "row", a3));
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 35.0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a4;
  objc_msgSend(v5, "clearColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[MUTransitLineIncidentsViewController _showIncidentDetails](self, "_showIncidentDetails");
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_storeStrong((id *)&self->_referenceDate, a4);
  -[MKTransitItemIncidentsController setReferenceDate:](self->_incidentsController, "setReferenceDate:", v7);
  if (-[MUTransitLineIncidentsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[MUTransitLineIncidentsViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
}

- (MUTransitLineIncidentsViewControllerDelegate)incidentsDelegate
{
  return (MUTransitLineIncidentsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_incidentsDelegate);
}

- (void)setIncidentsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_incidentsDelegate, a3);
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (MKTransitItemReferenceDateUpdater)itemUpdater
{
  return self->_itemUpdater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemUpdater, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_destroyWeak((id *)&self->_incidentsDelegate);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_incidentsController, 0);
}

@end
