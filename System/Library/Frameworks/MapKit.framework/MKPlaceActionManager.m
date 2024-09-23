@implementation MKPlaceActionManager

- (MKPlaceActionManager)initWithDataProvider:(id)a3
{
  id v5;
  MKPlaceActionManager *v6;
  MKPlaceActionManager *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKPlaceActionManager;
  v6 = -[MKPlaceActionManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataProvider, a3);
    objc_initWeak(&location, v7);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__MKPlaceActionManager_initWithDataProvider___block_invoke;
    v9[3] = &unk_1E20DAA08;
    objc_copyWeak(&v10, &location);
    -[MKPlaceActionManager _canMakeCalls:](v7, "_canMakeCalls:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __45__MKPlaceActionManager_initWithDataProvider___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 10, a2);
    objc_msgSend(v5, "callActionItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v13 != 0);

    objc_msgSend(v5, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeViewControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v5, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "placeViewControllerDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "placeViewControllerDidUpdateCallProvider:", v12);

    }
  }

}

- (id)actionItemForButtonType:(int)a3
{
  void *v4;
  void *v5;
  int v6;

  v4 = 0;
  switch(a3)
  {
    case 1:
      -[MKPlaceActionManager collectionActionItem](self, "collectionActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[MKPlaceActionManager reportAProblemFooterAction](self, "reportAProblemFooterAction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[MKPlaceActionManager shareActionItem](self, "shareActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[MKPlaceActionManager callActionItem](self, "callActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[MKPlaceActionManager messageActionItem](self, "messageActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MKPlaceActionManager websiteActionItem](self, "websiteActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[MKPlaceActionManager flyoverActionItem](self, "flyoverActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      if (!GEOSupportsOfflineMaps())
        goto LABEL_16;
      +[MKPlaceCardActionItem actionItemWithType:](MKPlaceCardActionItem, "actionItemWithType:", 34);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[MKPlaceActionManager dataProvider](self, "dataProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "supportsAddingPhotos");

      if (v6)
      {
        +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 9, self, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_16:
        v4 = 0;
      }
      break;
    case 12:
      -[MKPlaceActionManager homeActionItem](self, "homeActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[MKPlaceActionManager libraryActionItem](self, "libraryActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[MKPlaceActionManager noteActionItem](self, "noteActionItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)actionItemForButtonItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[MKPlaceActionManager createRowActionsWithStyle:](self, "createRowActionsWithStyle:", 0);
  v6 = objc_msgSend(v4, "buttonType");

  return -[MKPlaceActionManager actionItemForButtonType:](self, "actionItemForButtonType:", v6);
}

- (unint64_t)placeMUIDForAppearance:(id)a3
{
  void *v3;
  unint64_t v4;

  -[MKPlaceActionManager mapItem](self, "mapItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_muid");

  return v4;
}

- (void)setPlaceInBookmarks:(BOOL)a3
{
  self->_placeInBookmarks = a3;
  -[MKPlaceCardActionItem setSelected:](self->_favoriteActionItem, "setSelected:");
  -[MKPlaceCardActionItem setEnabled:](self->_favoriteActionItem, "setEnabled:", 1);
}

- (void)setPlaceInCollections:(BOOL)a3
{
  self->_placeInCollections = a3;
  -[MKPlaceCardActionItem setSelected:](self->_collectionActionItem, "setSelected:");
  -[MKPlaceCardActionItem setEnabled:](self->_collectionActionItem, "setEnabled:", 1);
}

- (void)setPlaceInShortcuts:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_placeInShortcuts = a3;
  -[MKPlaceActionManager homeActionItem](self, "homeActionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

  -[MKPlaceActionManager homeActionItem](self, "homeActionItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

}

- (void)setPlaceInLibrary:(unint64_t)a3
{
  id v3;

  self->_placeInLibrary = a3;
  -[MKPlaceActionManager libraryActionItem](self, "libraryActionItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

}

- (void)setPlaceHasNote:(unint64_t)a3
{
  id v3;

  self->_placeHasNote = a3;
  -[MKPlaceActionManager noteActionItem](self, "noteActionItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_placeCardDelegate);
}

- (id)contact
{
  void *v2;
  void *v3;

  -[MKPlaceActionManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mapItem
{
  void *v2;
  void *v3;

  -[MKPlaceActionManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)placeItem
{
  void *v2;
  void *v3;

  -[MKPlaceActionManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)options
{
  void *v2;
  unint64_t v3;

  -[MKPlaceActionManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "options");

  return v3;
}

- (BOOL)showContactActions
{
  return self->_showContactActions && (-[MKPlaceActionManager options](self, "options") & 0x800) == 0;
}

- (BOOL)_showMapItemIdentifier
{
  void *v3;
  unint64_t v4;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_muid"))
    v4 = (-[MKPlaceActionManager options](self, "options") >> 24) & 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)_canShowReportAProblem
{
  return (_MKRAPIsAvailable() & 1) != 0 || (-[MKPlaceActionManager options](self, "options") & 0x20000000) == 0;
}

- (BOOL)_showReportAProblem
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  void *v8;

  if (-[MKPlaceActionManager _canShowReportAProblem](self, "_canShowReportAProblem"))
  {
    -[MKPlaceActionManager placeItem](self, "placeItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "options") & 4) != 0)
      goto LABEL_8;
    -[MKPlaceActionManager placeItem](self, "placeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "options");

    if ((v5 & 8) == 0)
    {
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        if ((-[MKPlaceActionManager options](self, "options") & 0x40) != 0)
        {
          -[MKPlaceActionManager placeItem](self, "placeItem");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v8, "hasContactOnly");

        }
        else
        {
          v6 = 1;
        }
        goto LABEL_9;
      }
LABEL_8:
      v6 = 0;
LABEL_9:

      return v6;
    }
  }
  return 0;
}

- (BOOL)_showReportAProblemFooterAction
{
  _BOOL4 v3;

  v3 = -[MKPlaceActionManager _showReportAProblem](self, "_showReportAProblem");
  if (v3)
    LOBYTE(v3) = !-[MKPlaceActionManager _isCurrentLocationOrDroppedPin](self, "_isCurrentLocationOrDroppedPin");
  return v3;
}

- (BOOL)_showAddPlaceFooterAction
{
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  int v12;

  v3 = -[MKPlaceActionManager _showReportAProblem](self, "_showReportAProblem");
  if (v3)
  {
    -[MKPlaceActionManager placeItem](self, "placeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "options");

    -[MKPlaceActionManager placeItem](self, "placeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "options") & 8) != 0)
    {
      v10 = 0;
    }
    else
    {
      -[MKPlaceActionManager placeItem](self, "placeItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "options") & 4) != 0)
      {
        v10 = 0;
      }
      else
      {
        -[MKPlaceActionManager placeItem](self, "placeItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "contact");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == 0;

      }
    }

    -[MKPlaceActionManager mapItem](self, "mapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_isMapItemTypeAddress");

    return (v12 | (v5 >> 1)) & v10;
  }
  return v3;
}

- (BOOL)_showWebsite
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 2)
  {
    -[MKPlaceActionManager contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[MKPlaceActionManager placeItem](self, "placeItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_msgSend(v6, "options") & 8) == 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_showCollectionItem
{
  void *v3;
  char v4;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isMapItemTypeBrand");

  return (v4 & 1) == 0 && (-[MKPlaceActionManager options](self, "options") & 0x8000) != 0 && !self->_isCurrentLocation;
}

- (BOOL)_canShowLibraryAction
{
  void *v3;
  char v4;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isMapItemTypeBrand");

  return (v4 & 1) == 0
      && (-[MKPlaceActionManager options](self, "options") & 0x10000000000) != 0
      && !self->_isCurrentLocation;
}

- (BOOL)_canShowAddOrEditNoteAction
{
  void *v3;
  char v4;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isMapItemTypeBrand");

  return (v4 & 1) == 0
      && (-[MKPlaceActionManager options](self, "options") & 0x20000000000) != 0
      && !self->_isCurrentLocation;
}

- (BOOL)_canShowCreateCustomRouteAction
{
  void *v3;
  int v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MKPlaceActionManager dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInSupportedCustomRouteRegion");

  if (!v4)
    return 0;
  if (-[MKPlaceActionManager _isCurrentLocationOrDroppedPin](self, "_isCurrentLocationOrDroppedPin"))
  {
    v5 = 1;
  }
  else
  {
    -[MKPlaceActionManager placeItem](self, "placeItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "_isMapItemTypeAddress");

  }
  -[MKPlaceActionManager mapItem](self, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_geoMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_tooltip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v6 = 1;
  else
    v6 = v5;

  return v6;
}

- (BOOL)_showHomeShortcutItem
{
  void *v3;
  char v4;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isMapItemTypeBrand");

  return (v4 & 1) == 0
      && (-[MKPlaceActionManager options](self, "options") & 0x10000000) != 0
      && !self->_isCurrentLocation;
}

- (id)favoriteItemForFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 6, self, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGlyphColor:", v4);

  +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 5, self, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedItem:", v3);
  -[MKPlaceActionManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", objc_msgSend(v6, "placeInBookmarks"));

  return v5;
}

- (id)addToHomeItem
{
  void *v3;
  void *v4;
  void *v5;

  if (-[MKPlaceActionManager _showHomeShortcutItem](self, "_showHomeShortcutItem"))
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 23, self, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 22, self, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectedItem:", v3);
    -[MKPlaceActionManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelected:", objc_msgSend(v5, "placeInShortcuts"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MKPlaceCardActionItem)callActionItem
{
  MKPlaceCardActionItem *callActionItem;
  MKPlaceCardActionItem *v4;
  MKPlaceCardActionItem *v5;
  MKPlaceCardActionItem *v6;

  if (-[MKPlaceActionManager _canShowCallAction](self, "_canShowCallAction"))
  {
    callActionItem = self->_callActionItem;
    if (!callActionItem)
    {
      +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 10, self, 0);
      v4 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_callActionItem;
      self->_callActionItem = v4;

      callActionItem = self->_callActionItem;
    }
    -[MKPlaceCardActionItem setEnabled:](callActionItem, "setEnabled:", self->_callProvider != 0);
    v6 = self->_callActionItem;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MKPlaceCardActionItem)websiteActionItem
{
  MKPlaceCardActionItem *websiteActionItem;
  MKPlaceCardActionItem *v4;
  MKPlaceCardActionItem *v5;
  MKPlaceCardActionItem *v6;

  if (-[MKPlaceActionManager _showWebsite](self, "_showWebsite"))
  {
    websiteActionItem = self->_websiteActionItem;
    if (!websiteActionItem)
    {
      +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 13, self, 1);
      v4 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_websiteActionItem;
      self->_websiteActionItem = v4;

      websiteActionItem = self->_websiteActionItem;
    }
    v6 = websiteActionItem;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)createMenuActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceActionManager createRowActionsWithStyle:](self, "createRowActionsWithStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[MKPlaceActionManager createFooterActions](self, "createFooterActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)createRowActionsWithStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  char v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  MKPlaceCardActionItem *brandStoreActionItem;
  MKPlaceCardActionItem *v32;
  void *v33;
  MKPlaceCardActionItem *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_isMapItemTypeBrand") & 1) == 0)
  {
    -[MKPlaceActionManager placeItem](self, "placeItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "options");

    if ((v9 & 2) == 0)
      goto LABEL_5;
    -[MKPlaceActionManager removeMarkerItem](self, "removeMarkerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);
  }

LABEL_5:
  -[MKPlaceActionManager dataProvider](self, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportsMessagesForBusiness");

  if (v11)
  {
    -[MKPlaceActionManager messageActionItem](self, "messageActionItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  if (-[MKPlaceActionManager _canShowCallAction](self, "_canShowCallAction"))
  {
    -[MKPlaceActionManager callActionItem](self, "callActionItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MKPlaceActionManager callActionItem](self, "callActionItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

    }
  }
  if (-[MKPlaceActionManager _showWebsite](self, "_showWebsite"))
  {
    -[MKPlaceActionManager websiteActionItem](self, "websiteActionItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[MKPlaceActionManager websiteActionItem](self, "websiteActionItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

    }
  }
  if (-[MKPlaceActionManager _canShowLibraryAction](self, "_canShowLibraryAction"))
  {
    -[MKPlaceActionManager libraryActionItem](self, "libraryActionItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[MKPlaceActionManager libraryActionItem](self, "libraryActionItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

    }
  }
  if (-[MKPlaceActionManager _canShowAddOrEditNoteAction](self, "_canShowAddOrEditNoteAction"))
  {
    -[MKPlaceActionManager noteActionItem](self, "noteActionItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[MKPlaceActionManager noteActionItem](self, "noteActionItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v20);

    }
  }
  if (-[MKPlaceActionManager _showCollectionItem](self, "_showCollectionItem"))
  {
    -[MKPlaceActionManager collectionActionItem](self, "collectionActionItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[MKPlaceActionManager collectionActionItem](self, "collectionActionItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v22);

    }
  }
  v23 = v6 != 2 && self->_isCurrentLocation;
  -[MKPlaceActionManager mapItem](self, "mapItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "_isMapItemTypeBrand");
  if (v23 || (v25 & 1) != 0)
    goto LABEL_29;
  v26 = -[MKPlaceActionManager options](self, "options");

  if ((v26 & 0x200000) == 0)
  {
    -[MKPlaceActionManager shareActionItem](self, "shareActionItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);
LABEL_29:

  }
  if (v6 == 2 && self->_isCurrentLocation)
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 28, self, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v27);

  }
  -[MKPlaceActionManager mapItem](self, "mapItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "_isMapItemTypeBrand") & 1) != 0)
  {
    -[MKPlaceActionManager mapItem](self, "mapItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "_isStandAloneBrand");

    if ((v30 & 1) == 0)
    {
      brandStoreActionItem = self->_brandStoreActionItem;
      if (!brandStoreActionItem)
      {
        +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 20, self, 0);
        v32 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObserver:selector:name:object:", self, sel__enableStoreAction, CFSTR("MKPlaceActionManagerBrandStoresEnableNotification"), 0);

        v34 = self->_brandStoreActionItem;
        self->_brandStoreActionItem = v32;

        brandStoreActionItem = self->_brandStoreActionItem;
      }
      objc_msgSend(v4, "addObject:", brandStoreActionItem);
    }
  }
  else
  {

  }
  if (v6 == 2)
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 29, self, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v35);
    v36 = (void *)MEMORY[0x1E0D27178];
    -[MKPlaceActionManager mapItem](self, "mapItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_geoMapItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "coordinate");
    if ((objc_msgSend(v36, "isLocationShiftRequiredForCoordinate:") & 1) != 0)
    {
      v39 = 0;
    }
    else
    {
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_geoMapItem");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v41, "referenceFrame") != 2;

    }
    -[MKPlaceActionManager mapItem](self, "mapItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_coordinate");
    v44 = v43;
    v46 = v45;

    if (v46 >= -180.0 && v46 <= 180.0 && v44 >= -90.0 && v44 <= 90.0 && v39)
    {
      +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 27, self, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v47);

    }
  }
  v48 = (void *)objc_msgSend(v4, "copy");

  return v48;
}

- (void)_enableStoreAction
{
  -[MKPlaceCardActionItem setEnabled:](self->_brandStoreActionItem, "setEnabled:", 1);
}

- (id)createSearchAlongRouteActions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!-[MKPlaceActionManager _canShowCallAction](self, "_canShowCallAction"))
    return MEMORY[0x1E0C9AA60];
  -[MKPlaceActionManager callActionItem](self, "callActionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x1E0C9AA60];
  -[MKPlaceActionManager callActionItem](self, "callActionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addLayoutInfoIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  MKPlaceCardActionItem *v6;
  void *v7;
  void *v8;
  void *v9;
  MKPlaceCardActionItem *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (GEOConfigGetBOOL())
  {
    if (GEOConfigGetBOOL())
    {
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_placecardLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = [MKPlaceCardActionItem alloc];
        -[MKPlaceActionManager mapItem](self, "mapItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_placecardLayout");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "debugName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MKPlaceCardActionItem initWithType:displayString:glyph:enabled:](v6, "initWithType:displayString:glyph:enabled:", 0, v9, 0, 0);

        objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceCardActionItem setGlyphColor:](v10, "setGlyphColor:", v11);

        objc_msgSend(v12, "addObject:", v10);
      }
    }
  }

}

- (id)createFooterActions
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_placeDisplayStyle");

  if (v4 == 2)
  {
    -[MKPlaceActionManager shortPlacecardFooterActions](self, "shortPlacecardFooterActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_isCurrentLocation)
    {
      if (-[MKPlaceActionManager _showHomeShortcutItem](self, "_showHomeShortcutItem"))
      {
        -[MKPlaceActionManager homeActionItem](self, "homeActionItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
      if ((-[MKPlaceActionManager options](self, "options") & 0x80000) != 0)
      {
        +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 25, self, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

      }
      if ((-[MKPlaceActionManager options](self, "options") & 0x40000) != 0)
      {
        +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 24, self, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

      }
      objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "countryCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("KR"));

      if (((-[MKPlaceActionManager options](self, "options") & 0x80000) != 0
         || (-[MKPlaceActionManager options](self, "options") & 0x40000) != 0)
        && ((_MKRAPIsAvailable() ^ 1 | v19) & 1) == 0)
      {
        -[MKPlaceActionManager reportAProblemFooterAction](self, "reportAProblemFooterAction");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v20);

      }
    }
    -[MKPlaceActionManager createContactActions](self, "createContactActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", v7);
    if (-[MKPlaceActionManager _showAddPlaceFooterAction](self, "_showAddPlaceFooterAction"))
    {
      -[MKPlaceActionManager reportAProblemAddPlaceFooterAction](self, "reportAProblemAddPlaceFooterAction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

    }
    if (-[MKPlaceActionManager _canShowCreateCustomRouteAction](self, "_canShowCreateCustomRouteAction"))
    {
      -[MKPlaceActionManager createCustomRouteActionItem](self, "createCustomRouteActionItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[MKPlaceActionManager createCustomRouteActionItem](self, "createCustomRouteActionItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

      }
    }
    if (-[MKPlaceActionManager _showReportAProblemFooterAction](self, "_showReportAProblemFooterAction"))
    {
      -[MKPlaceActionManager reportAProblemFooterAction](self, "reportAProblemFooterAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

    }
    if (-[MKPlaceActionManager _canClaimThisBusiness](self, "_canClaimThisBusiness"))
    {
      -[MKPlaceActionManager claimBusinessActionItem](self, "claimBusinessActionItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v12);

    }
    -[MKPlaceActionManager _addInternalOnlyActions:](self, "_addInternalOnlyActions:", v6);
    v5 = (void *)objc_msgSend(v6, "copy");

  }
  return v5;
}

- (id)createContactActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  if (-[MKPlaceActionManager showContactActions](self, "showContactActions"))
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 4, self, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 18, self, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (MKPlaceCardActionItem)claimBusinessActionItem
{
  return +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 31, self, 1);
}

- (MKPlaceCardActionItem)flyoverActionItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKPlaceActionManager placeItem](self, "placeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_flyover");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (-[MKPlaceActionManager options](self, "options") & 0x20000000) != 0)
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 17, self, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return (MKPlaceCardActionItem *)v6;
}

- (MKPlaceCardActionItem)messageActionItem
{
  void *v3;

  if (-[MKPlaceActionDataProvider supportsMessagesForBusiness](self->_dataProvider, "supportsMessagesForBusiness"))
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 11, self, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (MKPlaceCardActionItem *)v3;
}

- (MKPlaceCardActionItem)shareActionItem
{
  return +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 16, self, 1);
}

- (MKPlaceCardActionItem)collectionActionItem
{
  MKPlaceCardActionItem *collectionActionItem;
  MKPlaceCardActionItem *v4;
  MKPlaceCardActionItem *v5;
  MKPlaceCardActionItem *v6;

  if (-[MKPlaceActionManager _showCollectionItem](self, "_showCollectionItem"))
  {
    collectionActionItem = self->_collectionActionItem;
    if (!collectionActionItem)
    {
      +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 21, self, 1);
      v4 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_collectionActionItem;
      self->_collectionActionItem = v4;

      -[MKPlaceCardActionItem setSelected:](self->_collectionActionItem, "setSelected:", self->_placeInCollections);
      collectionActionItem = self->_collectionActionItem;
    }
    v6 = collectionActionItem;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_canClaimThisBusiness
{
  void *v2;
  char v3;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canBeClaimed");

  return v3;
}

- (BOOL)_canShowCallAction
{
  return -[MKPlaceActionDataProvider canShowCallAction](self->_dataProvider, "canShowCallAction");
}

- (void)_addInternalOnlyActions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[MKPlaceActionManager options](self, "options") & 0x2000) != 0)
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 42, self, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
  -[MKPlaceActionManager addLayoutInfoIfNeeded:](self, "addLayoutInfoIfNeeded:", v8);
  if (-[MKPlaceActionManager _showMapItemIdentifier](self, "_showMapItemIdentifier"))
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 43, self, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);

  }
  if (GEOConfigGetBOOL())
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 44, self, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v6);
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 45, self, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
}

- (MKPlaceCardActionItem)homeActionItem
{
  MKPlaceCardActionItem *homeActionItem;
  MKPlaceCardActionItem *v4;
  MKPlaceCardActionItem *v5;

  homeActionItem = self->_homeActionItem;
  if (!homeActionItem)
  {
    -[MKPlaceActionManager addToHomeItem](self, "addToHomeItem");
    v4 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
    v5 = self->_homeActionItem;
    self->_homeActionItem = v4;

    homeActionItem = self->_homeActionItem;
  }
  return homeActionItem;
}

- (MKPlaceCardActionItem)favoriteActionItem
{
  MKPlaceCardActionItem *favoriteActionItem;
  MKPlaceCardActionItem *v4;
  MKPlaceCardActionItem *v5;

  favoriteActionItem = self->_favoriteActionItem;
  if (!favoriteActionItem)
  {
    -[MKPlaceActionManager favoriteItemForFooter](self, "favoriteItemForFooter");
    v4 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
    v5 = self->_favoriteActionItem;
    self->_favoriteActionItem = v4;

    favoriteActionItem = self->_favoriteActionItem;
  }
  return favoriteActionItem;
}

- (MKPlaceCardActionItem)libraryActionItem
{
  MKPlaceCardActionItem *libraryActionItem;
  MKPlaceCardActionItem *v4;
  MKPlaceCardActionItem *v5;
  void *v6;
  void *v7;
  MKPlaceCardActionItem *v8;

  if (-[MKPlaceActionManager _canShowLibraryAction](self, "_canShowLibraryAction"))
  {
    libraryActionItem = self->_libraryActionItem;
    if (!libraryActionItem)
    {
      +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 37, self, 1);
      v4 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_libraryActionItem;
      self->_libraryActionItem = v4;

      +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 38, self, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGlyphColor:", v7);

      -[MKPlaceCardActionItem setSelectedItem:](self->_libraryActionItem, "setSelectedItem:", v6);
      libraryActionItem = self->_libraryActionItem;
    }
    -[MKPlaceCardActionItem setSelected:](libraryActionItem, "setSelected:", self->_placeInLibrary == 1);
    v8 = self->_libraryActionItem;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (MKPlaceCardActionItem)noteActionItem
{
  MKPlaceCardActionItem *noteActionItem;
  void *v4;
  MKPlaceCardActionItem *v5;
  MKPlaceCardActionItem *v6;
  MKPlaceCardActionItem *v7;

  if (-[MKPlaceActionManager _canShowAddOrEditNoteAction](self, "_canShowAddOrEditNoteAction"))
  {
    noteActionItem = self->_noteActionItem;
    if (!noteActionItem)
    {
      +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 40, self, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 39, self, 1);
      v5 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceCardActionItem setSelectedItem:](v5, "setSelectedItem:", v4);
      v6 = self->_noteActionItem;
      self->_noteActionItem = v5;

      noteActionItem = self->_noteActionItem;
    }
    -[MKPlaceCardActionItem setSelected:](noteActionItem, "setSelected:", self->_placeHasNote == 1);
    v7 = self->_noteActionItem;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)createCustomRouteActionItem
{
  MKPlaceCardActionItem *createCustomRouteActionItem;
  MKPlaceCardActionItem *v4;
  MKPlaceCardActionItem *v5;
  MKPlaceCardActionItem *v6;

  if (-[MKPlaceActionManager _canShowCreateCustomRouteAction](self, "_canShowCreateCustomRouteAction"))
  {
    createCustomRouteActionItem = self->_createCustomRouteActionItem;
    if (!createCustomRouteActionItem)
    {
      +[MKPlaceCardActionItem actionItemWithType:](MKPlaceCardActionItem, "actionItemWithType:", 41);
      v4 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_createCustomRouteActionItem;
      self->_createCustomRouteActionItem = v4;

      createCustomRouteActionItem = self->_createCustomRouteActionItem;
    }
    v6 = createCustomRouteActionItem;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)shortPlacecardFooterActions
{
  void *v3;
  void *v4;
  void *v5;

  if (-[MKPlaceActionManager _showReportAProblemFooterAction](self, "_showReportAProblemFooterAction"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceActionManager reportAProblemFooterAction](self, "reportAProblemFooterAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    -[MKPlaceActionManager addLayoutInfoIfNeeded:](self, "addLayoutInfoIfNeeded:", v3);
    v5 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MKPlaceCardActionItem)reportAProblemFooterAction
{
  return +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 1, self, -[MKPlaceActionManager _canShowReportAProblem](self, "_canShowReportAProblem"));
}

- (MKPlaceCardActionItem)reportAProblemAddPlaceFooterAction
{
  return +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 2, self, _MKRAPIsAvailable());
}

- (id)developerPlaceCardGetDirectionsFooterAction
{
  void *v2;
  MKPlaceCardActionItem *v3;

  _MKLocalizedStringFromThisBundle(CFSTR("[Developer Place Card] Get Directions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MKPlaceCardActionItem initWithType:displayString:glyph:enabled:]([MKPlaceCardActionItem alloc], "initWithType:displayString:glyph:enabled:", 30, v2, CFSTR("arrow.triangle.turn.up.right.circle.fill"), 1);

  return v3;
}

- (id)developerPlaceCardOpenInMapsFooterAction
{
  void *v2;
  MKPlaceCardActionItem *v3;

  _MKLocalizedStringFromThisBundle(CFSTR("[Developer Place Card] Open in Apple Maps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MKPlaceCardActionItem initWithType:displayString:glyph:enabled:]([MKPlaceCardActionItem alloc], "initWithType:displayString:glyph:enabled:", 15, v2, CFSTR("map.fill"), 1);

  return v3;
}

- (void)_launchMaps
{
  id v2;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openInMapsWithLaunchOptions:completionHandler:", 0, &__block_literal_global_45);

}

void __35__MKPlaceActionManager__launchMaps__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  id v3;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Couldn't launch Maps from Place Card in %@"), v2);

  }
}

- (void)_canMakeCalls:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  if (v3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__MKPlaceActionManager__canMakeCalls___block_invoke;
    block[3] = &unk_1E20D7EF8;
    v6 = v3;
    dispatch_async(v4, block);

  }
}

void __38__MKPlaceActionManager__canMakeCalls___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v2 = (void *)_MergedGlobals_146;
  v22 = _MergedGlobals_146;
  v3 = MEMORY[0x1E0C809B0];
  if (!_MergedGlobals_146)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getTUCallCapabilitiesClass_block_invoke;
    v17 = &unk_1E20D8078;
    v18 = &v19;
    __getTUCallCapabilitiesClass_block_invoke((uint64_t)&v14);
    v2 = (void *)v20[3];
  }
  v4 = v2;
  _Block_object_dispose(&v19, 8);
  if (objc_msgSend(v4, "supportsTelephonyCalls"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v5 = (void *)qword_1ECE2DA18;
    v22 = qword_1ECE2DA18;
    if (!qword_1ECE2DA18)
    {
      v14 = v3;
      v15 = 3221225472;
      v16 = __getTUCallProviderManagerClass_block_invoke;
      v17 = &unk_1E20D8078;
      v18 = &v19;
      __getTUCallProviderManagerClass_block_invoke((uint64_t)&v14);
      v5 = (void *)v20[3];
    }
    v6 = v5;
    _Block_object_dispose(&v19, 8);
    v7 = objc_alloc_init((Class)v6);
    objc_msgSend(v7, "defaultProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __38__MKPlaceActionManager__canMakeCalls___block_invoke_2;
  block[3] = &unk_1E20D7F70;
  v9 = *(id *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __38__MKPlaceActionManager__canMakeCalls___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_isCurrentLocationOrDroppedPin
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  -[MKPlaceActionManager placeItem](self, "placeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "options") & 2) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[MKPlaceActionManager placeItem](self, "placeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "options") & 1;

  }
  return v5;
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  MKPlaceActionEnvironment *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  char v81;
  uint64_t v82;
  void *v83;
  void *v84;
  char v85;
  uint64_t v86;
  void *v87;
  void *v88;
  char v89;
  uint64_t v90;
  void *v91;
  void *v92;
  MKPlaceActionManager *v93;
  MKPlaceActionEnvironment *v94;
  uint64_t v95;
  void *v96;
  MKPlaceActionManager *v97;
  MKPlaceActionEnvironment *v98;
  uint64_t v99;
  void *v100;
  char v101;
  void *v102;
  void *v103;
  char v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  char v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  char v125;
  void *v126;
  void *v127;
  void *v128;
  char v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  _QWORD v166[2];

  v166[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = -[MKPlaceActionEnvironment initWithOptions:]([MKPlaceActionEnvironment alloc], "initWithOptions:", v9);
  -[MKPlaceActionEnvironment analyticsModuleMetadata](v11, "analyticsModuleMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MKPlaceActionEnvironment isQuickAction](v11, "isQuickAction");
  if ((_DWORD)v13)
    v14 = 30;
  else
    v14 = 201;
  switch(objc_msgSend(v8, "type"))
  {
    case 1:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 5013, v14, 0, v12, 62, 0);

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceActionManager delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "placeCardActionControllerDidSelectReportAProblem:fromView:isQuickAction:", 0, v16, v13);
      goto LABEL_71;
    case 2:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 222, v14, 0, v12, 62, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectReportAProblemAddNewPlace:isQuickAction:", 0, v13);
      goto LABEL_69;
    case 3:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 290, v14, CFSTR("Unresolved"), v12, 62, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectReportAProblemViewReport:", 0);
      goto LABEL_69;
    case 4:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6016, v14, 0, v12, 5, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "placeActionManager:didSelectAddToContactsUsingEnvironment:", self, v11);
      goto LABEL_72;
    case 7:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 0, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager openURL:](self, "openURL:", v8);
      goto LABEL_73;
    case 8:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6023, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectViewAllPhotos:presentingViewController:", 0, 0);
      goto LABEL_69;
    case 9:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6025, v14, 0, v12, 174, 0);

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceActionManager delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "placeCardActionControllerDidSelectAddPhoto:presentingViewController:sourceView:", 0, 0, v16);
      goto LABEL_71;
    case 10:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6009, v14, 0, v12, 2, 0);

      if (!self->_callProvider)
        goto LABEL_73;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CNLabeledValue"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        v28 = v26;
      }
      else
      {
        -[MKPlaceActionManager contact](self, "contact");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "phoneNumbers");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "objectAtIndexedSubscript:", 0);
        v28 = (id)objc_claimAutoreleasedReturnValue();

      }
      v164 = v28;

      objc_msgSend(v28, "value");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = (void *)objc_msgSend(objc_alloc((Class)getTUDialRequestClass()), "initWithProvider:", self->_callProvider);
      v134 = objc_alloc((Class)getTUHandleClass());
      objc_msgSend(v160, "stringValue");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      mk_TUConvertDestinationIDToLatinNumbers(v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = (void *)objc_msgSend(v134, "initWithType:value:", 2, v136);

      objc_msgSend(v133, "setHandle:", v137);
      objc_msgSend(v133, "setShowUIPrompt:", 1);
      -[MKPlaceActionManager contact](self, "contact");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "identifier");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "setContactIdentifier:", v139);

      +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "placeDialRequest:completionHandler:", v133, 0);

LABEL_86:
      goto LABEL_73;
    case 11:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6045, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager mapItem](self, "mapItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_messageURLString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_73;
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_messageURLString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v166[0] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKAppLaunchController launchAttributionURLs:withAttribution:completionHandler:](MKAppLaunchController, "launchAttributionURLs:withAttribution:completionHandler:", v33, 0, 0);

      goto LABEL_69;
    case 12:
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CNLabeledValue"));
      v163 = v12;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0C99E98];
      v36 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v34, "value");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("mailto:%@"), v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "URLWithString:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v34;
      v12 = v163;
      goto LABEL_89;
    case 13:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6010, v14, 0, v12, 3, 0);

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CNLabeledValue"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v42)
      {
        v164 = v42;
      }
      else
      {
        -[MKPlaceActionManager contact](self, "contact");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "urlAddresses");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "objectAtIndexedSubscript:", 0);
        v164 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[MKPlaceActionManager delegate](self, "delegate");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "placeViewControllerDelegate");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_opt_respondsToSelector();

      if ((v125 & 1) != 0)
      {
        -[MKPlaceActionManager delegate](self, "delegate");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "placeViewControllerDelegate");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceActionManager delegate](self, "delegate");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = objc_msgSend(v127, "placeViewController:shouldOpenHomePage:", v128, v164);

        if ((v129 & 1) == 0)
          goto LABEL_86;
      }
      v130 = (void *)MEMORY[0x1E0C99E98];
      v40 = v164;
      objc_msgSend(v164, "value");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "URLWithString:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_89;
    case 14:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6008, v14, 0, v12, 201, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "placeViewControllerDelegate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_opt_respondsToSelector();

      if ((v47 & 1) != 0)
      {
        -[MKPlaceActionManager delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "placeViewControllerDelegate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceActionManager delegate](self, "delegate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "placeViewControllerDidSelectDisplayedAddress:", v49);
LABEL_38:

LABEL_72:
      }
      else
      {
        -[MKPlaceActionManager mapItem](self, "mapItem");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v116, "_isEmptyContactMapItem");

        if ((v117 & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CNLabeledValue"));
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = v118;
          if (v118)
          {
            v120 = v118;
          }
          else
          {
            -[MKPlaceActionManager contact](self, "contact");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "urlAddresses");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
            v120 = (id)objc_claimAutoreleasedReturnValue();

          }
          v165 = v120;

          objc_msgSend(v120, "value");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v161 = (void *)MEMORY[0x1E0C97280];
          -[MKPlaceActionManager contact](self, "contact");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = *MEMORY[0x1E0C970B8];
          objc_msgSend(v165, "identifier");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v143, v144, v145);
          v159 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", v37, 0);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "stringByAddingPercentEncodingWithAllowedCharacters:", v147);
          v162 = (void *)objc_claimAutoreleasedReturnValue();

          v157 = (void *)MEMORY[0x1E0C99E98];
          v155 = (void *)MEMORY[0x1E0CB3940];
          -[MKPlaceActionManager contact](self, "contact");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = objc_msgSend(v158, "iOSLegacyIdentifier");
          v148 = objc_msgSend(v159, "multiValueIdentifier");
          -[MKPlaceActionManager contact](self, "contact");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "identifier");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "identifier");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "stringWithFormat:", CFSTR("maps:?address=%@&abPersonID=%d&abAddressID=%d&cncontactidentifier=%@&cnaddressidentifier=%@"), v162, v153, v148, v154, v149);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "URLWithString:", v150);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = v165;
LABEL_89:

          if (v39)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("view"));
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKPlaceActionManager placeCardDelegate](self, "placeCardDelegate");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "placeCardActionController:openURL:fromView:", 0, v39, v151);

          }
        }
        else
        {
LABEL_79:
          -[MKPlaceActionManager _launchMaps](self, "_launchMaps");
        }
      }
LABEL_73:
      if (v10)
        v10[2](v10);

      return;
    case 15:
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "_isEmptyContactMapItem");

      if ((v51 & 1) == 0)
        goto LABEL_79;
      goto LABEL_73;
    case 16:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6013, v14, 0, v12, 6, 0);

      goto LABEL_25;
    case 17:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6004, v14, 0, v12, 127, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "placeViewControllerDelegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceActionManager delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "placeViewControllerDidSelectFlyover:", v49);
      goto LABEL_38;
    case 18:
      -[MKPlaceActionManager delegate](self, "delegate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_opt_respondsToSelector();

      if ((v55 & 1) == 0)
        goto LABEL_73;
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6016, v14, CFSTR("Add to Existing Contact"), v12, 124, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "placeActionManager:didSelectAddToExistingContactWithEnvironment:", self, v11);
      goto LABEL_72;
    case 19:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6005, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectRemoveMarker:", 0);
      goto LABEL_69;
    case 20:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 6046, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager mapItem](self, "mapItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_launchActivityForBrandItem");
      goto LABEL_69;
    case 21:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 0, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "placeActionManager:didSelectAddToGuidesWithEnvironment:", self, v11);
      goto LABEL_72;
    case 22:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 2059, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 17099, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectAddToMapsHome:", 0);
      goto LABEL_69;
    case 23:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 2060, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 17099, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectRemoveFromMapsHome:", 0);
      goto LABEL_69;
    case 24:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 2063, 253, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectRefineLocation:", 0);
      goto LABEL_69;
    case 25:
      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectChangeAddress:", 0);
      goto LABEL_69;
    case 27:
      v65 = (void *)MEMORY[0x1E0CB3940];
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "_coordinate");
      v68 = v67;
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "_coordinate");
      objc_msgSend(v65, "stringWithFormat:", CFSTR("%.6lf, %.6lf"), v68, v70);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setString:", v16);
      goto LABEL_71;
    case 28:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 1030, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "placeViewControllerDelegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceActionManager delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "placeViewControllerDidSelectDropPin:", v49);
      goto LABEL_38;
    case 30:
      -[MKPlaceActionManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "placeActionManager:didSelectDirectionsWithEnvironment:", self, v11);
      goto LABEL_72;
    case 31:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 288, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager mapItem](self, "mapItem");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "_poiClaim");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "claimURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_69;
      +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "openURL:completionHandler:", v19, 0);
      goto LABEL_68;
    case 32:
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (void *)MEMORY[0x1E0CB3940];
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v78, "_muid"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 282, v14, v79, v12, 62, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectPlaceEnrichementReportAProblem");
      goto LABEL_69;
    case 33:
LABEL_25:
      -[MKPlaceActionManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "placeActionManager:didSelectShareWithEnvironment:", self, v11);
      goto LABEL_72;
    case 34:
      -[MKPlaceActionManager placeItem](self, "placeItem");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "options");

      if ((v81 & 8) != 0)
        v82 = 394;
      else
        v82 = 381;
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v82, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectDownloadOffline:isQuickAction:", 0, v13);
      goto LABEL_69;
    case 35:
      -[MKPlaceActionManager placeItem](self, "placeItem");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "options");

      if ((v85 & 8) != 0)
        v86 = 394;
      else
        v86 = 381;
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v86, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectPauseOfflineDownload:", 0);
      goto LABEL_69;
    case 36:
      -[MKPlaceActionManager placeItem](self, "placeItem");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "options");

      if ((v89 & 8) != 0)
        v90 = 394;
      else
        v90 = 381;
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v90, v14, 0, v12, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectOfflineManagement:", 0);
      goto LABEL_69;
    case 37:
      -[MKPlaceActionManager delegate](self, "delegate");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v92;
      v93 = self;
      v94 = v11;
      v95 = 1;
      goto LABEL_57;
    case 38:
      -[MKPlaceActionManager delegate](self, "delegate");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v92;
      v93 = self;
      v94 = v11;
      v95 = 0;
LABEL_57:
      objc_msgSend(v92, "placeActionManager:didSelectAddOrRemoveFromLibraryWithEnvironment:selectedAdd:", v93, v94, v95);
      goto LABEL_72;
    case 39:
      -[MKPlaceActionManager delegate](self, "delegate");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v96;
      v97 = self;
      v98 = v11;
      v99 = 1;
      goto LABEL_60;
    case 40:
      -[MKPlaceActionManager delegate](self, "delegate");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v96;
      v97 = self;
      v98 = v11;
      v99 = 0;
LABEL_60:
      objc_msgSend(v96, "placeActionManager:didSelectAddOrEditNoteWithEnvironment:selectedAdd:", v97, v98, v99);
      goto LABEL_72;
    case 41:
      -[MKPlaceActionManager delegate](self, "delegate");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_opt_respondsToSelector();

      if ((v101 & 1) == 0)
        goto LABEL_73;
      -[MKPlaceActionManager analyticsDelegate](self, "analyticsDelegate");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 465, v14, 0, 0, 0);

      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectCreateCustomRoute:", 0);
      goto LABEL_69;
    case 42:
      -[MKPlaceActionManager delegate](self, "delegate");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_opt_respondsToSelector();

      if ((v104 & 1) == 0)
        goto LABEL_73;
      -[MKPlaceActionManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeCardActionControllerDidSelectSimulateLocation:", 0);
LABEL_69:

      goto LABEL_73;
    case 43:
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v105, "_muid");

      if (!v106)
        goto LABEL_73;
      objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = (void *)MEMORY[0x1E0CB3940];
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v17, "_muid"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setString:", v108);

LABEL_71:
      goto LABEL_72;
    case 44:
      v109 = (void *)MEMORY[0x1E0D271E8];
      -[MKPlaceActionManager mapItem](self, "mapItem");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "_geoMapItem");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "mapItemStorageForGEOMapItem:", v111);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "jsonRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v75, 1, 0);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      NSTemporaryDirectory();
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "stringByAppendingPathComponent:", CFSTR("SavedMapItem.json"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v112, "writeToFile:options:error:", v114, 0, 0);
LABEL_68:

      goto LABEL_69;
    case 45:
      NSTemporaryDirectory();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "stringByAppendingPathComponent:", CFSTR("SavedMapItem.json"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeItemAtPath:error:", v16, 0);
      goto LABEL_71;
    default:
      goto LABEL_73;
  }
}

- (MKPlaceCardActionItem)removeMarkerItem
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 19, self, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlyphColor:", v6);

  }
  return (MKPlaceCardActionItem *)v5;
}

- (BOOL)placeInBookmarks
{
  return self->_placeInBookmarks;
}

- (BOOL)placeInCollections
{
  return self->_placeInCollections;
}

- (BOOL)placeInShortcuts
{
  return self->_placeInShortcuts;
}

- (void)setShowContactActions:(BOOL)a3
{
  self->_showContactActions = a3;
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  self->_isCurrentLocation = a3;
}

- (unint64_t)placeInLibrary
{
  return self->_placeInLibrary;
}

- (unint64_t)placeHasNote
{
  return self->_placeHasNote;
}

- (id)placeCardDelegate
{
  return objc_loadWeakRetained(&self->_placeCardDelegate);
}

- (void)setPlaceCardDelegate:(id)a3
{
  objc_storeWeak(&self->_placeCardDelegate, a3);
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  return (_MKInfoCardAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (MKPlaceActionDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (MKPlaceCardActionItem)deleteFromLibraryActionItem
{
  return self->_deleteFromLibraryActionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteFromLibraryActionItem, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak(&self->_placeCardDelegate);
  objc_storeStrong((id *)&self->_callProvider, 0);
  objc_storeStrong((id *)&self->_createCustomRouteActionItem, 0);
  objc_storeStrong((id *)&self->_noteActionItem, 0);
  objc_storeStrong((id *)&self->_libraryActionItem, 0);
  objc_storeStrong((id *)&self->_brandStoreActionItem, 0);
  objc_storeStrong((id *)&self->_websiteActionItem, 0);
  objc_storeStrong((id *)&self->_callActionItem, 0);
  objc_storeStrong((id *)&self->_collectionActionItem, 0);
  objc_storeStrong((id *)&self->_homeActionItem, 0);
  objc_storeStrong((id *)&self->_favoriteActionItem, 0);
}

@end
